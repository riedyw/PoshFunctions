function Test-IsValidIPv4 {
<#
.SYNOPSIS
    Verifies if passed parameter is a valid IP v4 address
.DESCRIPTION
    Verifies if passed parameter is a valid IP v4 address. Can take single string or array of strings.
    Can also accept input from the pipeline. Function aliased to 'Test-IsValidIP'
.EXAMPLE
    Test-IsValidIPv4 '10.0.0.1'
.EXAMPLE
    Test-IsValidIPv4 '10.0.0.1' -Verbose

    VERBOSE: The string being tested if a valid IPv4 address is [10.0.0.1]
    True
.EXAMPLE
    '192.168.1.1','invalid' | Test-IsValidIPv4 -IncludeInput

    Input       Result
    -----       ------
    192.168.1.1   True
    invalid      False
#>

    #region Param
    [CmdletBinding(ConfirmImpact='None')]
    [Outputtype('bool')]
    [alias('Test-IsValidIP')] #FunctionAlias
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
            Try {
                Write-Verbose -Message "The string being tested if a valid IPv4 address is [$i]"
                $check = [ipaddress] $i
                # added check below to cover issue if enter only 3 octets
                # [ipaddress] "10.1.4" resolves to "10.1.0.4"
                if ($i -eq $check) {
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{Input = "$i"; Result = $true })
                    } else {
                        Write-Output -InputObject $true
                    }
                } else {
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{Input = "$i"; Result = $false })
                    } else {
                        Write-Output -InputObject $false
                    }
                }
            } Catch {
                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{Input = "$i"; Result = $false })
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
