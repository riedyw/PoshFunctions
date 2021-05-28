function Get-BashPath {
<#
.SYNOPSIS
    To take a normal Windows path and convert it to a bash path for things like git bash.
.DESCRIPTION
    To take a normal Windows path and convert it to a bash path for things like git bash.
.PARAMETER Path
    A path to a file or files. Can include wildcards and the wildcards will be resolved to underlying
    files. Can be a single path, an array of paths, or from the pipeline.
.PARAMETER IncludeInput
    Switch to indicate if input parameters should be included in the output, aliased to 'IncludeOriginal'
.PARAMETER NoResolvePath
    Switch to not resolve the provided path to see if it exists
.EXAMPLE
    Get-BashPath -Path 'c:\temp\*.csv'

    /C/temp/Encoding\ Time.csv
.EXAMPLE
    Get-BashPath -Path 'c:\temp\*.csv' -IncludeInput

    Posh                      bash
    ----                      ----
    C:\temp\Encoding Time.csv /C/temp/Encoding\ Time.csv
.EXAMPLE
    $Special = Show-SpecialFolder -IncludeLocations | Where-Object {$_.Location -and $_.Location -match 'Program Files'}
    $Special | Add-Member -MemberType NoteProperty -Name BashPath -Value 'x'
    foreach ($s in $special) { $s.BashPath = Get-BashPath -Path $s.Location }
    $Special

    Would return
    SpecialFolder         Location                            BashPath
    -------------         --------                            --------
    CommonProgramFiles    C:\Program Files\Common Files       /C/Program\ Files/Common\ Files
    CommonProgramFilesX86 C:\Program Files (x86)\Common Files /C/Program\ Files\ (x86)/Common\ Files
    ProgramFiles          C:\Program Files                    /C/Program\ Files
    ProgramFilesX86       C:\Program Files (x86)              /C/Program\ Files\ (x86)
.NOTES
    The file(s) must exist for this function to work
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType('psobject')]
    Param(
        [Parameter(Mandatory, HelpMessage = 'Enter a path to resolve. * and ? are acceptable wildcards', Position = 0, ValueFromPipeline)]
        [string[]] $Path,

        [Alias('IncludeOriginal')]
        [switch] $IncludeInput,

        [switch] $NoResolvePath
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($currentPath in $Path) {
            if (-not $NoResolvePath) {
                $resolve = [array] (Resolve-Path -Path $currentPath).Path
                if (-not $resolve) {
                    # nothing returned
                    return $null
                }
                # .replace(' ','\ ')
                foreach ($r in $resolve) {
                    $bash = ('/' + $r.replace('\','/').replace(':','').replace(' ','\ '))
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{ Posh = $r; bash = $bash})
                    } else {
                        $bash
                    }
                }
            } else {
                $bash = ('/' + $currentPath.replace('\','/').replace(':','').replace(' ','\ '))
                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{ Posh = $r; bash = $bash})
                } else {
                    $bash
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
