function Get-LongName {
<#
.SYNOPSIS
    To get the longname of a provided shortname (8.3) of a file or folder
.DESCRIPTION
    To get the longname of a provided shortname (8.3) of a file or folder. If the path resolves to 2 or more objects the function will generate an error
.PARAMETER Path
    A string or string array of files and folders
.PARAMETER IncludeInput
    Switch to include the input parameters in the output
.EXAMPLE
    Get-LongName -Path C:\temp\THISIS~1.TXT

    C:\temp\This is a really long filename.txt
.EXAMPLE
    Get-LongName -Path C:\temp\THISIS~1.TXT -IncludeInput

    ShortName            LongName                                   ItemType
    ---------            --------                                   --------
    C:\temp\THISIS~1.TXT C:\temp\This is a really long filename.txt File
.EXAMPLE
    Get-LongName -Path C:\temp\REALLY~1

    C:\temp\Really-long-folder-name
.EXAMPLE
    Get-LongName -Path C:\temp\REALLY~1 -IncludeInput

    ShortName        LongName                        ItemType
    ---------        --------                        --------
    C:\temp\REALLY~1 C:\temp\Really-long-folder-name Folder
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
    }

    process {
        foreach ($curPath in $Path) {
            if (Test-Path -Path $curPath) {
                $ResolveFile = Resolve-Path -Path $curPath
                if ($ResolveFile.count -gt 1) {
                    Write-Error -Message "ERROR: File specification [$curPath] resolves to more than 1 file."
                } else {
                    $Item = Get-Item -Path $ResolveFile
                    Write-Verbose $Item.PSProvider
                    if ($Item.PSProvider.ToString() -eq 'Microsoft.PowerShell.Core\FileSystem') {
                        Write-Verbose -Message "Using item [$ResolveFile]"
                        $ReturnVal = $Item.Fullname
                        if ($Item.PSIsContainer) {
                            $ItemType = 'Folder'
                        } else {
                            $ItemType = 'File'
                        }
                        if ($IncludeInput) {
                            New-Object -Type psobject -Property ([ordered] @{
                                    ShortName = $ResolveFile
                                    LongName  = $ReturnVal
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
