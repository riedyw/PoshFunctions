function Get-WordList {
<#
.SYNOPSIS
    Returns a list of over 38,000 words.
.DESCRIPTION
    Returns a list of over 38,000 words.
.NOTES
    Originally taken from a Linux distribution and original file name was linuxwords
    Over 38,000 words appear in the file WordList.txt found in the installation folder of this module.
.EXAMPLE
    # Desire to get a list the first 2 palindromes

    Get-WordList | where-object { $_ -eq (format-reversestring $_)} | Select-object -First 2 | Tee-Object -Variable Palindrome    
    
    Would return
    bib
    bob
.OUTPUTS
    [string[]]
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType([string[]])]
    Param()
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        $Script:WordList
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
