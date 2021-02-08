Function Write-StringArray {
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
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('string')]
    Param(
        [Parameter(Mandatory,HelpMessage = 'Enter a long string of text',Position = 0,ValueFromPipeline)]
        [string[]] $Text,
        
        [string] $Variable = 'StringArray'

        )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
        $ReturnVal = "`$$Variable = @(`n"
    }

    process {
        foreach ($CurLine in $Text) {
            $ReturnVal += "    `'$($CurLine -replace "`'", "`'`'")',`n"
        }
    }
    end {
        $ReturnVal = $ReturnVal -replace ",`n$", "`n"
        $ReturnVal += ')'
        write-output $ReturnVal
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
} #EndFunction Format-WrapText

Set-Alias -Name 'WrapText' -Value 'Format-WrapText'
