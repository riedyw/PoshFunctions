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

    * updated function so Test-Path, Resolve-Path, Get-Item use -LiteralPath vs -Path
.OUTPUTS
    [string[]]
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    param(
        [Parameter(ParameterSetName = 'Path', Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
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
        $FileSystemObject = New-Object -ComObject Scripting.FileSystemObject
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'LiteralPath' {
                foreach ($curPath in $LiteralPath) {
                    if (Test-Path -LiteralPath $curPath) {
                        $Item = Get-Item -LiteralPath $curPath
                        Write-Verbose -Message $Item.PSProvider
                        if ($Item.PSProvider.ToString() -eq 'Microsoft.PowerShell.Core\FileSystem') {
                            if ($Item.PSIsContainer) {
                                $ItemType = 'Folder'
                                $ReturnVal = $FileSystemObject.GetFolder($curPath).ShortPath
                            } else {
                                $ItemType = 'File'
                                $ReturnVal = $FileSystemObject.GetFile($curPath).ShortPath
                            }
                            if ($IncludeInput) {
                                New-Object -TypeName psobject -Property ([ordered] @{
                                        LongName  = $curPath
                                        ShortName = $ReturnVal
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
                            if ($Item.PSProvider.ToString() -eq 'Microsoft.PowerShell.Core\FileSystem') {
                                Write-Verbose -Message "Using item [$curResolve]"
                                if ($Item.PSIsContainer) {
                                    $ItemType = 'Folder'
                                    $ReturnVal = $FileSystemObject.GetFolder($curResolve).ShortPath
                                } else {
                                    $ItemType = 'File'
                                    $ReturnVal = $FileSystemObject.GetFile($curResolve).ShortPath
                                }
                                if ($IncludeInput) {
                                    New-Object -TypeName psobject -Property ([ordered] @{
                                            LongName  = $curResolve
                                            ShortName = $ReturnVal
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
