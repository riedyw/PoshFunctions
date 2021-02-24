function Test-IsDate {
<#
.SYNOPSIS
    Tests to see if the specified string is a valid [datetime] string
.DESCRIPTION
    Tests to see if the specified string is a valid [datetime] string. Can accept a string or an array of strings. Can also accept pipeline input.
.EXAMPLE
    Test-IsDate

    Would return $null
.EXAMPLE
    Test-IsDate 1/1/19 -Verbose

    Would return:
    VERBOSE: The string you entered is [1/1/19]
    True
.EXAMPLE
    Test-IsDate @('1/1/1965','2/1/19','dne', '3 Feb 2019 17:00') -IncludeInput

    Would return
    Input            Result DateTime
    -----            ------ --------
    1/1/1965           True 1/1/1965 12:00:00 AM
    2/1/19             True 2/1/2019 12:00:00 AM
    dne               False
    3 Feb 2019 17:00   True 2/3/2019 5:00:00 PM
#>

    #region Param
    [CmdletBinding(ConfirmImpact='None')]

    [OutputType('bool')]

    Param (
        [parameter(ValueFromPipeLine,ValueFromPipeLineByPropertyName)]
        [Alias('date')]
        [string[]] $DateString,

        [switch] $IncludeInput
    )
    #endregion Param

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($d in $DateString) {
            try {
                Write-Verbose -Message "The string you entered is [$DateString]"
                [DateTime] $d | Out-Null
                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{Input="$d";Result=$true; DateTime=[DateTime] $d})
                } else {
                    Write-Output -InputObject $True
                }
            } catch {
                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{Input="$d";Result=$false; DateTime=$null})
                } else {
                    Write-Output -InputObject $false
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction Test-IsDate
