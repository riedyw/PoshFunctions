Filter grep {
<#
.SYNOPSIS
    A simple text filter to search for a string
.DESCRIPTION
    A simple text filter to search for a string
.PARAMETER Keyword
    The string searching for
.EXAMPLE
    'Hello','There' | grep 'Hello'
    Would return
    Hello
.OUTPUTS
    [string]
.LINK
    about_Functions
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('string')]
    Param(
        [Parameter(Mandatory = $False, ValueFromPipeline)]
        [string[]] $String,

        [Parameter(Mandatory = $False, ValueFromPipeline = $False)]
        [string] $Keyword

    )
    #endregion Parameter

    Begin {
        write-verbose -Message "String to search for is [$Keyword]"
        $Line = 0
        $Count = 0
    }

    Process {
        foreach ($s in $String) {
            $Line ++
            $Count ++
            write-verbose -Message "Line $Line is [$($s)]"
            if ($s) {
                $s | where-object { $_ -match $keyword }
            }
        }
    }

    End {
        if (-not $Count) {
            write-verbose -Message 'No input'
        }
    }
}
