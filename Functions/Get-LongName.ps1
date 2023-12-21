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

    * updated function so Test-Path, Resolve-Path, Get-Item use -LiteralPath vs -Path
.OUTPUTS
    [string[]]
#>

    [CmdletBinding(ConfirmImpact = 'None', DefaultParameterSetName = 'Path')]
    param(
        [Parameter(ParameterSetName = 'Path', ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]] $Path,

        [Parameter(ParameterSetName = 'LiteralPath')]
        [ValidateScript({
                if ($_ -notmatch '[\?\*]') {
                    $true
                } else {
                    throw 'ERROR: Wildcard characters *, ? are not acceptable with -LiteralPath'
                }
            })]
        [string[]] $LiteralPath,

        [Parameter(ParameterSetName = 'Path')]
        [Parameter(ParameterSetName = 'LiteralPath')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'LiteralPath' {
                foreach ($curPath in $LiteralPath) {
                    if (Test-Path -LiteralPath $curPath) {
                        $Item = Get-Item -LiteralPath $curPath
                        Write-Verbose -Message $Item.PSProvider
                        if ($Item.PSProvider.ToString() -eq 'Microsoft.PowerShell.Core\FileSystem') {
                            Write-Verbose -Message "Using item [$curPath]"
                            $ReturnVal = $Item.Fullname
                            if ($Item.PSIsContainer) {
                                $ItemType = 'Folder'
                            } else {
                                $ItemType = 'File'
                            }
                            if ($IncludeInput) {
                                New-Object -TypeName psobject -Property ([ordered] @{
                                        ShortName = $curPath
                                        LongName  = $ReturnVal
                                        ItemType  = $ItemType
                                    })
                            } else {
                                Write-Output -InputObject $ReturnVal
                            }
                        } else {
                            Write-Error -Message 'Only works against filesystem objects'
                        }
                    } else {
                        Write-Error -Message "ERROR: File [$curPath] does not exist"
                    }
                }
            }
            'Path' {
                foreach ($curPath in $Path) {
                    if (Test-Path -Path $curPath) {
                        $ResolveFile = Resolve-Path -Path $curPath
                        foreach ($curResolve in $ResolveFile) {
                            $Item = Get-Item -LiteralPath $curResolve.Path
                            Write-Verbose -Message $Item.PSProvider.ToString()
                            if ($Item.PSProvider.ToString() -eq 'Microsoft.PowerShell.Core\FileSystem') {
                                Write-Verbose -Message "Using item [$curResolve]"
                                $ReturnVal = $Item.Fullname
                                if ($Item.PSIsContainer) {
                                    $ItemType = 'Folder'
                                } else {
                                    $ItemType = 'File'
                                }
                                if ($IncludeInput) {
                                    New-Object -TypeName psobject -Property ([ordered] @{
                                            ShortName = $Item
                                            LongName  = $ReturnVal
                                            ItemType  = $ItemType
                                        })
                                } else {
                                    Write-Output -InputObject $ReturnVal
                                }
                            } else {
                                Write-Error -Message 'Only works against filesystem objects'
                            }
                        }
                    } else {
                        Write-Error -Message "ERROR: File [$curPath] does not exist"
                    }
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
