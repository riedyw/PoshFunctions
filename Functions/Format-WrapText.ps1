Function Format-WrapText {
<#
.SYNOPSIS
    Wraps text at a particular column width
.DESCRIPTION
    Wraps text at a particular column width (Default=80)
.PARAMETER Text
    The text to be formatted
.PARAMETER Width
    Column width to wrap at. Default = 80
.PARAMETER Screen
    A switch indicating that the wrap should occur at the width of the current Powershell window.
.NOTES
    Author:     Bill Riedy
.EXAMPLE
    Format-WrapText -Text "word1 word2 word3 word4 word5" -Width 10

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
    [CmdletBinding(ConfirmImpact='Low',DefaultParameterSetName='Width')]
    [OutputType('string')]
    Param(
        [Parameter(Mandatory,HelpMessage = 'Enter a long string of text',Position = 0,ValueFromPipeline,ParameterSetName='Width')]
        [Parameter(Mandatory,HelpMessage = 'Enter a long string of text',Position = 0,ValueFromPipeline,ParameterSetName='Screen')]
        [string] $Text,

        [Parameter(ParameterSetName='Width')]
        [int] $Width = 80,

        [Parameter(ParameterSetName='Screen')]
        [switch] $Screen
        )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        if ($PsCmdlet.ParameterSetName -eq 'Screen') {
            $Width = $host.UI.RawUI.WindowSize.Width - 1
            Write-Verbose -Message "Setting width to $Width"
        }
    }

    process
    {
    #    [string] $text = $text
        $Words = $Text -split '\s+'
        $Col = 0
        [string] $Line = $null
        foreach ( $Word in $Words ) {
            $Col += $Word.Length + 1
            if ( $Col -gt $Width ) {
                Write-output -inputobject "$line"
                [string] $line = $null
                $Line += "$word "
                $Col = 0 + $word.Length + 1
            } else {
                $Line += "$word "
            }
        }
        if ($null -ne $line) {
            write-output -inputobject "$line"
        }
    }
    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
} #EndFunction Format-WrapText

Set-Alias -Name 'WrapText' -Value 'Format-WrapText'
