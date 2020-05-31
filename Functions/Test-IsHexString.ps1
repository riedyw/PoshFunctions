Function Test-IsHexString {
<#
.SYNOPSIS
    Tests to determine if a string is a valid hexadecimal number. Can optionally include a prefix of '0x' or '#'
.DESCRIPTION
    Tests to determine if a string is a valid hexadecimal number. Can optionally include a prefix of '0x' or '#'. Can accept a string, an array of strings, or pipeline input.
.EXAMPLE
    Test-IsHexString '123abc'

    True
.EXAMPLE
    Test-IsHexString 'lmnop'

    False
.EXAMPLE
    test-ishexstring @('0x1','#1abcdef','3c') -IncludeInput  -AllowPrefix

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
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
        $regexPrefix = '^(#|0x)?[0-9,a-f]*$'
        $regexNoPrefix = '^[0-9,a-f]*$'
        write-verbose -Message "`$regexPrefix is [$regexPrefix]"
        write-verbose -Message "`$regexNoPrefix is [$regexNoPrefix]"
        write-verbose -Message "`$AllowPrefix is $AllowPrefix"
        write-verbose -Message "`$IncludeInput is $IncludeInput"
    }

    Process {
        foreach ($h in $HexString) {
            $h = $h.Trim()
            write-verbose -Message "`$h is [$h]"
            if ($AllowPrefix) {
                if ($h -match $regexPrefix) {
                    write-verbose -Message 'match'
                    $n = [convert]::ToInt32(($h -replace '^(0x|#)', ''),16)
                    write-verbose -Message "`$n is [$n]"
                    if ($IncludeInput) {
                        new-object -TypeName psobject -Property @{Input="$h"; AllowPrefix=$true; Result=$true; Decimal=$n} | select-object -Property Input, AllowPrefix, Result, Decimal
                    } else {
                        Write-Output -inputobject $true
                    }
                } else {
                    write-verbose -Message 'no match'
                    if ($IncludeInput) {
                        new-object -TypeName psobject -Property @{Input="$h"; AllowPrefix=$true; Result=$false; Decimal=$null} | select-object -Property Input, AllowPrefix, Result, Decimal
                    } else {
                        Write-Output -inputobject $false
                    }
                }
            } else {
                if ($h -match $regexNoPrefix) {
                    write-verbose -Message 'match'
                    $n = [convert]::ToInt32(($h -replace '^(0x|#)', ''),16)
                    write-verbose -Message "`$n is [$n]"
                    if ($IncludeInput) {
                        new-object -TypeName psobject -Property @{Input="$h"; AllowPrefix=$false; Result=$true; Decimal=$n} | select-object -Property Input, AllowPrefix, Result, Decimal
                    } else {
                        Write-Output -inputobject $true
                    }
                } else {
                    write-verbose -Message 'no match'
                    if ($IncludeInput) {
                        new-object -TypeName psobject -Property @{Input="$h"; AllowPrefix=$false; Result=$false; Decimal = $null} | select-object -Property Input, AllowPrefix, Result, Decimal
                    } else {
                        Write-Output -inputobject $false
                    }
                }
            }
        }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
}
