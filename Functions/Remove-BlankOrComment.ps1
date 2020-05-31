Filter Remove-BlankOrComment {
<#
.SYNOPSIS
    A simple text filter to remove blank lines or lines that begin with a comment character.
.DESCRIPTION
    A simple text filter to remove blank lines or lines that begin with a comment character. By default the begin comment toke is '#'.
.PARAMETER String
    The input string array
.PARAMETER BeginComment
    The token indicating the beginning of a single line comment. Defaults to '#'
.NOTES
    Author:     Bill Riedy
.EXAMPLE
    '#Hello','','There' | Remove-BlankOrComment

    Would return:
    There
.EXAMPLE
    Remove-BlankOrComment -verbose
    Would return:
    VERBOSE: No input
.EXAMPLE
    '#Hello','','There' | Remove-BlankOrComment -verbose
    VERBOSE: Line 1 is [#Hello]
    VERBOSE: Line 2 is []
    VERBOSE: Line 3 is [There]
    There
    VERBOSE: Ending Remove-BlankOrComment
.EXAMPLE
    get-content $env:appdata\code\user\settings.json | Remove-BlankOrComment -BeginComment '//' | convertfrom-json

    To create a psobject of your VsCode settings.json file
.OUTPUTS
    [string[]]
.LINK
    about_Functions
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('string[]')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline)]
        [string[]] $String,

        [string] $BeginComment = '#'
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
        $Line = 0
        $Count = 0
    }

    process {
        foreach ($s in $String) {
            $Line ++
            $Count ++
            Write-Verbose -Message "Line $Line is [$($s)]"
            if ($s) {
                $s | Where-Object { $_ -notmatch "^[\s]*$BeginComment" -and $_ -notmatch '^[\s]*$' }
            }
        }
    }

    end {
        if (-not $Count) {
            Write-Verbose -Message 'No input'
        }
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
}
