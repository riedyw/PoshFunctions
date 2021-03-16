function Get-ShortName {
<#
.SYNOPSIS
    To get the shortname 8.3 of a file or folder
.DESCRIPTION
    To get the shortname 8.3 of a file or folder. If the path resolves to 2 or more objects the function will generate an error
.PARAMETER Path
    A string or string array of files and folders
.PARAMETER IncludeInput
    Switch to include the input parameters in the output
.EXAMPLE
    Get-ShortName -Path 'C:\temp\This is a really long filename.txt'

    C:\temp\THISIS~1.TXT
.EXAMPLE
    Get-ShortName -Path c:\temp\th* -IncludeInput

    LongName                                   ShortName            ItemType
    --------                                   ---------            --------
    C:\temp\This is a really long filename.txt C:\temp\THISIS~1.TXT File
.EXAMPLE
    Get-ShortName -Path c:\temp\Really-long-folder-name\

    C:\temp\REALLY~1
.EXAMPLE
    Get-ShortName -Path c:\temp\Really-long-folder-name\ -IncludeInput

    LongName                         ShortName        ItemType
    --------                         ---------        --------
    C:\temp\Really-long-folder-name\ C:\temp\REALLY~1 Folder
.NOTES
    Inspired by https://devblogs.microsoft.com/scripting/use-powershell-to-display-short-file-and-folder-names/

    Changes
    * allow for accepting the -Path from the pipeline
    * test for existence of path, if does not exist throw an error
    * resolve to list of paths and if it resolves to more than one throw an error
    * use get-item to determine if folder or file
    * use Scripting.FileSystemObject comobject to get the shortname of the item
    * if switch -IncludeInput output an object with the LongName, ShortName and ItemType (File or Folder)
.OUTPUTS
    [string[]]
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]] $Path,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $FileSystemObject = New-Object -ComObject Scripting.FileSystemObject
    }

    process {
        foreach ($curPath in $Path) {
            if (Test-Path -Path $curPath) {
                $ResolveFile = Resolve-Path -Path $curPath
                if ($ResolveFile.count -gt 1) {
                    Write-Error -Message "ERROR: File specification [$curPath] resolves to more than 1 file."
                } else {
                    $Item = Get-Item -Path $ResolveFile
                    if ($Item.PSProvider.ToString() -eq 'Microsoft.PowerShell.Core\FileSystem') {
                        Write-Verbose -Message "Using item [$ResolveFile]"
                        if ($Item.PSIsContainer) {
                            $ItemType = 'Folder'
                            $ReturnVal = $FileSystemObject.GetFolder($ResolveFile).ShortPath
                        } else {
                            $ItemType = 'File'
                            $ReturnVal = $FileSystemObject.GetFile($ResolveFile).ShortPath
                        }
                        if ($IncludeInput) {
                            New-Object -Type psobject -Property ([ordered] @{
                                    LongName  = $ResolveFile
                                    ShortName = $ReturnVal
                                    ItemType  = $ItemType
                                })
                        } else {
                            Write-Output -InputObject $ReturnVal
                        }
                    } else {
                        Write-Error 'Only works against filesystem objects'
                    }

                }
            } else {
                Write-Error -Message "ERROR: File [$curPath] does not exist"
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
