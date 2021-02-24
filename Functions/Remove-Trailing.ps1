filter Remove-Trailing {
<#
.SYNOPSIS
    Removes trailing spaces from a string or array of strings.
.DESCRIPTION
    Removes trailing spaces from a string or array of strings.
.PARAMETER String
    A string or array of strings that may have trailing spaces. Can also accept input from the pipeline.
.EXAMPLE
    "[$(Remove-Trailing -String 'This has trailing spaces    ')]"

    [This has trailing spaces]
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType([string[]])]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    Param(
        [Parameter(Mandatory, HelpMessage = 'Enter a string, even with trailing spaces', Position = 0, ValueFromPipeline)]
        [string[]] $String
        )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($s in $String) {
            $s | out-string | foreach-object { ($_).TrimEnd() }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
