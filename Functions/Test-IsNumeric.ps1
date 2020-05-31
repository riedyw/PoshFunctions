Function Test-IsNumeric {
<#
.SYNOPSIS
    Determines if specified string can be parsed to a number
.DESCRIPTION
    Determines if specified string can be parsed to a number. Can specify a string, an array of strings, or input from the pipeline
.EXAMPLE
    Test-IsNumeric '1.2'

    True
.EXAMPLE
    Test-IsCapsLock -Verbose
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param (
        [parameter(ValueFromPipeLine,ValueFromPipeLineByPropertyName)]
        [Alias('Number')]
        [string[]] $NumString,
        [switch] $IncludeInput
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        foreach ($n in $NumString) {
            $n = $n.Trim()
            if (($n -eq '') -or ($null -eq $n)) {
                if ($IncludeInput) {
                    new-object -TypeName psobject -Property @{Input="$n";Result=$false}
                } else {
                    Write-Output -inputobject $false
                }
            } else {
                Try {
                    0 + $n | Out-Null
                    if ($IncludeInput) {
                        new-object -TypeName psobject -Property @{Input="$n";Result=$true}
                    } else {
                        Write-Output -inputobject $true
                    }
                } Catch {
                    if ($IncludeInput) {
                        new-object -TypeName psobject -Property @{Input="$n";Result=$false}
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
} #EndFunction Test-IsNumeric
