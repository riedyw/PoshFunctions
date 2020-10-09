function Get-BashPath {
<#
.SYNOPSIS
    To take a normal Windows path and convert it to a bash path for things like git bash.
.DESCRIPTION
    To take a normal Windows path and convert it to a bash path for things like git bash.
.PARAMETER Path
    A path to a file or files. Can include wildcards and the wildcards will be resolved to underlying
    files. Can be a single path, an array of paths, or from the pipeline.
.PARAMETER IncludeOriginal
    Describe parameter -IncludeOriginal.
.EXAMPLE
    Get-BashPath -Path 'c:\temp\*.csv'

    /C/temp/Encoding\ Time.csv
.EXAMPLE
    Get-BashPath -Path 'c:\temp\*.csv' -IncludeOriginal

    Posh                      bash
    ----                      ----
    C:\temp\Encoding Time.csv /C/temp/Encoding\ Time.csv
.NOTES
    The file(s) must exist for this function to work
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType('psobject')]
    Param(
        [Parameter(Mandatory, HelpMessage = 'Enter a path to resolve. * and ? are acceptable wildcards',
            Position = 0,  ValueFromPipeline)]
            [string[]] $Path,

        [Parameter()]
            [switch] $IncludeOriginal
        )
    #endregion Parameter

    begin {

    }

    process {
        foreach ($currentPath in $Path) {
            $resolve = [array] (resolve-path -Path $currentPath).Path
            if (-not $resolve) {
                # nothing returned
                return $null
            }
            # .replace(' ','\ ')
            foreach ($r in $resolve) {
                $bash = ('/' + $r.replace('\','/').replace(':','').replace(' ','\ '))
                if ($IncludeOriginal) {
                    new-object -TypeName psobject -Property @{ Posh = $r; bash = $bash}
                }
                else {
                    $bash
                }
            }
        }
    }

    end {

    }
}
