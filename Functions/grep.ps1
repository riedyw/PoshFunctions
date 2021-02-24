filter grep {
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

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "String to search for is [$Keyword]"
        $Line = 0
        $Count = 0
    }

    process {
        foreach ($s in $String) {
            $Line ++
            $Count ++
            Write-Verbose -Message "Line $Line is [$($s)]"
            if ($s) {
                $s | Where-Object { $_ -match $keyword }
            }
        }
    }

    End {
        if (-not $Count) {
            Write-Verbose -Message 'No input'
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
