function New-RandomPassword {
    <#
.SYNOPSIS
    Creates a new random password
.DESCRIPTION
    Creates a new random password. Parameters can be passed to determine minimum and maximum password lengths, whether to avoid characters that are similar to one another or to limit it to readable words
.PARAMETER MinLength
    Integer representing minimum password length, valid range 8-102 characters
.PARAMETER MaxLength
    Integer representing maximum password length, valid range 8-102 characters
.PARAMETER NonAlphaChars
    Integer representing the number of non alphabetic characters
.PARAMETER Readable
    Switch indicating to use combinations of short English words. Default behavior is to output a truly random string of characters
.PARAMETER AvoidSimilar
    Switch to prevent characters that are similar to one another to be included. For instance 1, l, I
.EXAMPLE
    New-RandomPassword

    e8P!VKyO
.EXAMPLE
    New-RandomPassword -MinLength 16 -AvoidSimilar

    RK##L@qFT5(3BArM
.EXAMPLE
    New-RandomPassword -Readable -MinLength 8

    eLFcUB7;
.EXAMPLE
    New-RandomPassword -MinLength 16 -AvoidSimilar -Readable

    and%6CRaBbuLLwan
.EXAMPLE
    New-RandomPassword -MinLength 16 -MaxLength 20 -Readable -AvoidSimilar

    ViEWpewhead9)chEF
#>

    #region parameter
    [CmdletBinding(DefaultParameterSetName = 'Web', ConfirmImpact = 'None')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType('string')]
    Param (

        [Parameter(ParameterSetName = 'Web')]
        [Parameter(ParameterSetName = 'Readable')]
        [ValidateRange(8, 102)]
        [int] $MinLength = 12,

        [Parameter(ParameterSetName = 'Web')]
        [Parameter(ParameterSetName = 'Readable')]
        [ValidateRange(8, 102)]
        [int] $MaxLength,

        [Parameter(ParameterSetName = 'Web')]
        [int] $NonAlphaChars,

        [Parameter(ParameterSetName = 'Readable')]
        [switch] $Readable,

        [Parameter(ParameterSetName = 'Web')]
        [Parameter(ParameterSetName = 'Readable')]
        [switch] $AvoidSimilar

    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        $SimilarRegex = '\+|''|\-|0|1|I|O|_|`|l|o|t|\|'
        Write-Verbose -Message "SimilarRegex = [$SimilarRegex]"
        if (-not $MaxLength) {
            $MaxLength = $MinLength
        }
        switch ($PsCmdlet.ParameterSetName) {
            'Web' {
            }
            'Readable' {
                $Symbol = Get-PrintableAscii -Verbose:$false | Where-Object { $_.Class -eq 's' }
                $MaxWords = [int] ($MaxLength / 3)
                $MinWords = [int] ($MinLength / 4)
                $TwoOrThree = Get-WordList -Verbose:$false | Where-Object { $_.Length -eq 3 -or $_.Length -eq 4 }
                $Sample = $TwoOrThree | Get-Random -Count ($MinWords * 30) -Verbose:$false | Format-RandomCase -Verbose:$false
            }
        }
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'Web' {
                if (-not $NonAlphaChars) {
                    $NonAlphaChars = 0
                }
                if ($MinLength -eq $MaxLength) {
                    $Length = $MinLength
                } else {
                    $Length = Get-Random -Minimum $MinLength -Maximum ($MaxLength + 1)
                }
                do {
                    if (-not $AvoidSimilar) {
                        $ReturnVal = [System.Web.Security.Membership]::GeneratePassword($Length, $nonAlphaChars)
                        Write-Verbose -Message "PW is [$ReturnVal]"
                    } else {
                        do {
                            Write-Verbose -Message 'in do'
                            $ReturnVal = [System.Web.Security.Membership]::GeneratePassword($Length, $nonAlphaChars)
                            Write-Verbose -Message "PW is [$ReturnVal]"
                        } until (-not ($ReturnVal -cmatch $SimilarRegex))
                    }
                } until (($ReturnVal.Length -ge $MinLength) -and ($ReturnVal.Length -le $MaxLength))
                $ReturnVal
            }
            'Readable' {
                do {
                    if (-not $AvoidSimilar) {
                        $RandomSymbol = $Symbol.Char | Get-Random -Verbose:$false
                        $RandomDigit = 0..9 | Get-Random -Verbose:$false
                        $curWords = Get-Random -Minimum $MinWords -Maximum ($MaxWords + 1) -Verbose:$false
                        Write-Verbose -Message "Symbol [$RandomSymbol] Digit [$RandomDigit]"
                        $ReturnVal = ( @(($Sample | Get-Random -Count $curWords -Verbose:$false), $RandomDigit, $RandomSymbol) | Get-Random -Count ($curWords + 2)) -join ''
                    } else {
                        $RandomSymbol = $Symbol.Char | Where-Object { -not ($_ -cmatch $SimilarRegex) } | Get-Random -Verbose:$false
                        $RandomDigit = 0..9 | Where-Object { -not ($_ -cmatch $SimilarRegex) } | Get-Random -Verbose:$false
                        $curWords = Get-Random -Minimum $MinWords -Maximum ($MaxWords + 1) -Verbose:$false
                        $Sample = $Sample | Where-Object { -not ($_ -cmatch $SimilarRegex) }
                        $ReturnVal = ( @(($Sample | Get-Random -Count $curWords -Verbose:$false), $RandomDigit, $RandomSymbol) | Get-Random -Count ($curWords + 2)) -join ''
                    }
                } until (($ReturnVal.Length -ge $MinLength) -and ($ReturnVal.Length -le $MaxLength))
                $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
