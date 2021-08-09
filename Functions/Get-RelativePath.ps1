function Get-RelativePath {
    <#
.SYNOPSIS
    Get a relative path to a specified list of paths relative to a specified path
.DESCRIPTION
    Get a relative path to a specified list of paths relative to a specified path
.PARAMETER FullName
    An array of fullname paths to files or folders. Value can come by the pipeline either by value or by property name. Aliased to 'Path'.
.PARAMETER RelativeTo
    The reference path that you want to compare FullName to
.PARAMETER IncludeInput
    Switch to include both a path to the original file(s) and their associated relative values
.EXAMPLE
    Get-RelativePath -FullName c:\temp\*.css -RelativeTo c:\temp -IncludeInput

    The folder c:\temp has 2 *.css files in that folder, bluetable.css and stylesheet.css
    The function would return:

    Path                   RelativeTo  Relative
    ----                   ----------  --------
    C:\temp\bluetable.css  C:\temp     .\bluetable.css
    C:\temp\stylesheet.css C:\temp     .\stylesheet.css
.EXAMPLE
    Get-RelativePath -FullName c:\temp\*.css -RelativeTo c:\DNE

    The path c:\DNE does not exist. The function would return:

    Get-RelativePath : RelativeTo [c:\DNE] does not seem to be a valid path
    At line:1 char:1
    + Get-RelativePath -FullName c:\temp\*.css -RelativeTo c:\DNE
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorException
        + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,Get-RelativePath
#>

    [CmdletBinding()]
    [OutputType('psobject')]
    param (
        [parameter(Mandatory, HelpMessage = 'Please enter the path to a filesystem object', ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [Alias('Path')]
        [string[]] $FullName,

        [string] $RelativeTo = $pwd,

        [switch] $IncludeInput

    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "IncludeInput [$IncludeInput], RelativeTo [$RelativeTo]"
        if ($RelativeTo -eq '.') {
            $RelativeTo = $pwd
            Write-Verbose -Message "Setting `$RelativeTo to [$RelativeTo]"
        }
        if (-not (Test-Path -Path $RelativeTo)) {
            Write-Error -Message "RelativeTo [$RelativeTo] does not seem to be a valid path"
            break
        } else {
            Push-Location -Path $RelativeTo -ErrorAction Stop
        }
    }

    process {
        foreach ($CurFullName in $FullName) {
            Write-Verbose -Message "Processing [$CurFullName]"
            $ExplicitPath = Resolve-Path -Path $CurFullName
            Foreach ($CurExplicitPath in $ExplicitPath) {
                Resolve-Path -Path $CurExplicitPath -Relative | Foreach-Object {
                    $ReturnVal = $_
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{
                            Path = $CurExplicitPath
                            RelativeTo = $RelativeTo
                            Relative = $ReturnVal
                        })
                    } else {
                        $ReturnVal
                    }
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
        Pop-Location
    }
}
