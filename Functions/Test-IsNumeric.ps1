Function Test-IsNumeric {
<#
.SYNOPSIS
    Determines if specified string can be parsed to a number
.DESCRIPTION
    Determines if specified string can be parsed to a number. Can specify a string, an array of strings, or input from the pipeline
.PARAMETER NumString
    A string or string array to test to determine if they are numeric. Aliased as 'Number'
.PARAMETER IncludeInput
    Switch to include the input parameters in the output
.EXAMPLE
    Test-IsNumeric '1.2'

    True
.EXAMPLE
    Test-IsCapsLock -Verbose
#>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments','')]
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('bool')]
    Param (
        [parameter(ValueFromPipeLine,ValueFromPipeLineByPropertyName)]
        [Alias('Number')]
        [string[]] $NumString,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($n in $NumString) {
            $n = $n.Trim()
            if (($n -eq '') -or ($null -eq $n)) {
                if ($IncludeInput) {
                    New-Object -TypeName psobject -Property ([ordered] @{Input="$n";Result=$false})
                } else {
                    Write-Output -InputObject $false
                }
            } else {
                try {
                    [double] $tmp = 0 + $n
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{Input="$n";Result=$true})
                    } else {
                        Write-Output -InputObject $true
                    }
                } catch {
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{Input="$n";Result=$false})
                    } else {
                        Write-Output -InputObject $false
                    }
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
} #EndFunction Test-IsNumeric
