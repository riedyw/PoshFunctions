function Get-BinaryType {
<#
.SYNOPSIS
    Gets the binary executable type for a given set of files
.DESCRIPTION
    PowerShell wrapper around the GetBinaryType Windows API that inspects file headers
    and reports the binary file type (e.g., 32-bit Windows app, 64-bit Windows app,
    16-bit DOS/Windows app, etc.)

.PARAMETER Path
    File path(s) to inspect
.EXAMPLE
    #Reports the file type of C:\Windows\Explorer.exe:
    Get-BinaryType C:\Windows\Explorer.exe
.EXAMPLE
    #Attempts to get the binary type of all files in the current directory
    Get-ChildItem | where { !$_.PsIsContainer } | Get-BinaryType
.EXAMPLE
    #Attempts to get the binary type of all exe files in the windows directory,
    #ignoring any non-terminating errors
    Get-ChildItem $env:windir -filter *.exe | Get-BinaryType -ErrorAction SilentlyContinue
.EXAMPLE
    #From a 32bit process on a 64 bit Windows install, attempts to get the binary type of all exe files
    #in the windows system32 directory by bypassing filesystem redirection using "sysnative",
    #ignoring any non-terminating errors, and finally showing the file name and binary type
    Get-ChildItem $env:windir\sysnative -filter *.exe | Get-BinaryType -ErrorAction SilentlyContinue -passthrough | select Name,BinaryType
.NOTES
    Author:      Battleship, Aaron Margosis
    Inspiration: http://pinvoke.net/default.aspx/kernel32/GetBinaryType.html
.LINK
    http://wonkysoftware.appspot.com
#>

    [CmdletBinding(ConfirmImpact = 'none')]
    param
    (
        [Parameter(HelpMessage = 'Enter binary file(s) to examine',Position  = 0,
                            Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName )]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({Test-Path -Path ((get-item -path $_).FullName)})]
        [string[]]  $Path,

        [Alias('PassThru')]
        [switch] $PassThrough
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $paths = Resolve-Path -Path $path | Select-Object -ExpandProperty Path
        try
        {
            #add the enum for the binary types
            #Using more user friendly names since they won't likely be used outside this context
            $enumString = @'
                public enum BinaryType
                {
                    BIT32 = 0, // A 32-bit Windows-based application,                       SCS_32BIT_BINARY
                    DOS   = 1, // An MS-DOS - based application,                            SCS_DOS_BINARY
                    WOW   = 2, // A 16-bit Windows-based application,                       SCS_WOW_BINARY
                    PIF   = 3, // A PIF file that executes an MS-DOS based application,     SCS_PIF_BINARY
                    POSIX = 4, // A POSIX based application,                                SCS_POSIX_BINARY
                    OS216 = 5, // A 16-bit OS/2-based application,                          SCS_OS216_BINARY
                    BIT64 = 6  // A 64-bit Windows-based application,                       SCS_64BIT_BINARY
                }
'@

            Add-Type -TypeDefinition $enumString
        }
        catch {
            Write-Verbose -message 'Info'
        } #type already been loaded, do nothing

        try
        {
            # create the win32 signature
            $Signature = @'
                    [DllImport("kernel32.dll")]
                    public static extern bool GetBinaryType(
                                        string lpApplicationName,
                                        ref int lpBinaryType
                    );
'@

            # Create a new type that lets us access the Windows API function
            Add-Type -MemberDefinition $Signature -Name BinaryType -Namespace PFWin32Utils
        } catch {
            Write-Verbose -Message 'Info'
        } #type already been loaded, do nothing
    }

    process {
        foreach ($Item in $Paths)
        {
            $ReturnedType = -1
            Write-Verbose -Message "Attempting to get type for file: $($Item.FullName)"
            $Result = [PFWin32Utils.BinaryType]::GetBinaryType($Item, [ref] $ReturnedType)

            #if the function returned $false, indicating an error, or the binary type wasn't returned
            if (!$Result -or ($ReturnedType -eq -1))
            {
                Write-Error -Message "Failed to get binary type for file $($Item.FullName)"
            }
            else
            {
                $ToReturn = [BinaryType] $ReturnedType
                if ($PassThrough)
                {
                    #get the file object, attach a property indicating the type, and passthru to pipeline
                    Get-Item -Path $Item.FullName -Force |
                        Add-Member -MemberType noteproperty -Name BinaryType -Value $ToReturn -Force -PassThru
                }
                else
                {
                    #Put enum object directly into pipeline
                    $ToReturn
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
