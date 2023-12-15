function Format-WrapText {
<#
.SYNOPSIS
    Wraps text at a particular column width
.DESCRIPTION
    Wraps text at a particular column width (Default=80). Function aliased to 'WrapText'.
.PARAMETER Text
    The text to be formatted
.PARAMETER Width
    Column width to wrap at. Default = 80
.PARAMETER Screen
    A switch indicating that the wrap should occur at the width of the current Powershell window.
.EXAMPLE
    Format-WrapText -Text "word1 word2 word3 word4 word5" -Width 12

    Would return
    word1 word2
    word3 word4
    word5
.OUTPUTS
    [String]
.LINK
    Format-Table
    Format-List
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low', DefaultParameterSetName = 'Width')]
    [alias('WrapText')] #FunctionAlias
    [OutputType('string')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    Param(
        [Parameter(Mandatory, HelpMessage = 'Enter a long string of text', Position = 0, ValueFromPipeline, ParameterSetName = 'Width')]
        [Parameter(Mandatory, HelpMessage = 'Enter a long string of text', Position = 0, ValueFromPipeline, ParameterSetName = 'Screen')]
        [string[]] $Text,

        [Parameter(ParameterSetName = 'Width')]
        [int] $Width = 80,

        [Parameter(ParameterSetName = 'Screen')]
        [switch] $Screen
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        if ($PsCmdlet.ParameterSetName -eq 'Screen') {
            $Width = $host.UI.RawUI.WindowSize.Width - 1
            Write-Verbose -Message "Setting width to $Width"
        }
        $NewText = ''
    }

    process {
        foreach ($CurLine in $Text) {
            $NewText = @($NewText, $CurLine) -join ' '
        }
    }

    end {
        $NewText = $NewText.TrimStart().TrimEnd()
        Write-Verbose -Message "NewText is [$NewText]"
        $Words = $NewText -split '\s+'
        $Col = 0
        [string] $Line = $null
        foreach ( $Word in $Words ) {

            $Col += $Word.Length + 1
            Write-Verbose -Message "Currently on word [$Word], col [$Col]"
            if ( $Col -gt $Width ) {
                Write-Output -InputObject $Line
                [string] $Line = $null
                $Line += "$Word "
                $Col = 0 + $Word.Length + 1
            } else {
                $Line += "$Word "
            }
        }
        if ($null -ne $Line) {
            Write-Output -InputObject "$Line"
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
} # EndFunction Format-WrapText
