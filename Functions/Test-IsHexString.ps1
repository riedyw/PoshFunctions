function Test-IsHexString {
<#
.SYNOPSIS
    Tests to determine if a string is a valid hexadecimal number. Can optionally include a prefix of '0x' or '#'
.DESCRIPTION
    Tests to determine if a string is a valid hexadecimal number. Can optionally include a prefix of '0x' or '#'. Can accept a string, an array of strings, or pipeline input.
.PARAMETER HexString
    A string or string array that you want tested to determine if is a valid hexadecimal string
.PARAMETER IncludeInput
    Switch that will include the input parameters in the output
.PARAMETER AllowPrefix
    Switch that accepts '#' or '0x' as valid characters that can begin the HexString
.EXAMPLE
    Test-IsHexString '123abc'

    True
.EXAMPLE
    Test-IsHexString 'lmnop'

    False
.EXAMPLE
    Test-IsHexString @('0x1','#1abcdef','3c') -IncludeInput  -AllowPrefix

    Input    AllowPrefix Result
    -----    ----------- ------
    0x1             True   True
    #1abcdef        True   True
    3c              True   True
.EXAMPLE
    Test-IsHexString '123abc' -Verbose

    VERBOSE: $h is [123abc]
    True
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param (
        [parameter(ValueFromPipeLine,ValueFromPipeLineByPropertyName)]
        [Alias('Hex')]
        [string[]] $HexString,
        [switch] $IncludeInput,
        [switch] $AllowPrefix
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $regexPrefix = '^(#|0x)?[0-9,a-f]*$'
        $regexNoPrefix = '^[0-9,a-f]*$'
        Write-Verbose -Message "`$regexPrefix is [$regexPrefix]"
        Write-Verbose -Message "`$regexNoPrefix is [$regexNoPrefix]"
        Write-Verbose -Message "`$AllowPrefix is $AllowPrefix"
        Write-Verbose -Message "`$IncludeInput is $IncludeInput"
    }

    process {
        foreach ($h in $HexString) {
            $h = $h.Trim()
            Write-Verbose -Message "`$h is [$h]"
            if ($AllowPrefix) {
                if ($h -match $regexPrefix) {
                    Write-Verbose -Message 'match'
                    $n = [convert]::ToInt32(($h -replace '^(0x|#)', ''),16)
                    Write-Verbose -Message "`$n is [$n]"
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{Input="$h"; AllowPrefix=$true; Result=$true; Decimal=$n})
                    } else {
                        Write-Output -InputObject $true
                    }
                } else {
                    Write-Verbose -Message 'no match'
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property @{Input="$h"; AllowPrefix=$true; Result=$false; Decimal=$null} | select-object -Property Input, AllowPrefix, Result, Decimal
                    } else {
                        Write-Output -InputObject $false
                    }
                }
            } else {
                if ($h -match $regexNoPrefix) {
                    Write-Verbose -Message 'match'
                    $n = [convert]::ToInt32(($h -replace '^(0x|#)', ''),16)
                    Write-Verbose -Message "`$n is [$n]"
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property @{Input="$h"; AllowPrefix=$false; Result=$true; Decimal=$n} | select-object -Property Input, AllowPrefix, Result, Decimal
                    } else {
                        Write-Output -InputObject $true
                    }
                } else {
                    Write-Verbose -Message 'no match'
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property @{Input="$h"; AllowPrefix=$false; Result=$false; Decimal = $null} | select-object -Property Input, AllowPrefix, Result, Decimal
                    } else {
                        Write-Output -InputObject  $false
                    }
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
