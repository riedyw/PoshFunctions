Function Test-IsDate {
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

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    #region Main
    Process {
        foreach ($d in $DateString) {
            Try {
                write-verbose -Message "The string you entered is [$DateString]"
                [DateTime] $d | Out-Null
                if ($IncludeInput) {
                    new-object -TypeName psobject -Property @{Input="$d";Result=$true; DateTime=[DateTime] $d}
                } else {
                    Write-Output -inputobject $True
                }
            } Catch {
                if ($IncludeInput) {
                    new-object -TypeName psobject -Property @{Input="$d";Result=$false; DateTime=$null}
                } else {
                    Write-Output -inputobject $false
                }
            }
        }
    }
    #endregion Main

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Test-IsDate
