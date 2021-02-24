function Test-IsValidIPv6 {
<#
.SYNOPSIS
    Verifies if passed parameter is a valid IP v6 address
.DESCRIPTION
    Verifies if passed parameter is a valid IP v6 address. Can take single string or array of strings. Can also accept input from the pipeline.
.EXAMPLE
    Test-IsValidIPv6 '::1'

    Would return
    True
.EXAMPLE
    Test-IsValidIPv6 -IPAddress '::1' -Verbose

    Would return
    VERBOSE: Starting Test-IsValidIPv6
    VERBOSE: The string being tested if a valid IPv6 address is [::1]
    True
    VERBOSE: Ending Test-IsValidIPv6
.EXAMPLE
    '::1','invalid' | Test-IsValidIPv6 -IncludeInput

    Input   Result
    -----   ------
    ::1       True
    invalid  False
#>

    #region Param
    [CmdletBinding(ConfirmImpact = 'None')]
    [Outputtype('bool')]
    Param (
        [parameter(ValueFromPipeLine, ValueFromPipeLineByPropertyName)]
        [Alias('IP')]
        [string[]] $IPAddress,

        [switch] $IncludeInput
    )
    #endregion Param

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($i in $IPAddress) {
            try {
                Write-Verbose -Message "The string being tested if a valid IPv6 address is [$i]"
                $check = [ipaddress] $i
                # added check below to cover issue if enter only 3 octets
                # [ipaddress] "10.1.4" resolves to "10.1.0.4"
                if (($i -eq $check) -and ($check.AddressFamily -eq 'InterNetworkV6')) {
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{Input = $i; Result = $true })
                    } else {
                        Write-Output -InputObject $true
                    }
                } else {
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{Input = $i; Result = $false })
                    } else {
                        Write-Output -InputObject $false
                    }
                }
            } catch {
                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{Input = $i; Result = $false })
                } else {
                    Write-Output -InputObject $false
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
