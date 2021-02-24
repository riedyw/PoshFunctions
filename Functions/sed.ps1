Filter sed {
<#
.SYNOPSIS
    A simple text filter to replace strings
.DESCRIPTION
    A simple text filter to replace strings
.PARAMETER Before
    The string searching for
.PARAMETER After
    The string to replace it with
.EXAMPLE
    'Hello There' | sed 'Hello' 'Goodbye'

    Would return
    Goodbye There
.OUTPUTS
    [string]
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('string')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    Param(
        [Parameter(Mandatory, HelpMessage = 'Enter a string to search for', Position = 0, ValueFromPipeline = $False)]
        [string] $Before,

        [Parameter(Mandatory, HelpMessage = 'Enter a string to replace it with', Position = 1, ValueFromPipeline = $False)]
        [string] $After

    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        ForEach-Object {
            $_ -replace $before, $after
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
