function Format-RandomCase {
<#
.SYNOPSIS
    Formats a string character by character randomly into upper or lower case.
.DESCRIPTION
    Formats a string character by character randomly into upper or lower case.
.PARAMETER String
    A [string[]] that you want formatted randomly into upper or lower case
.PARAMETER IncludeInput
    Switch that will display input parameters in the output
.EXAMPLE
    Format-RandomCase -String 'HELLO WORLD IT IS ME!'

    Example return
    HelLo worlD It is me!
.EXAMPLE
    Format-RandomCase -String HELLO, WORLD, IT, IS, ME -IncludeInput

    Example return
    Original Return
    -------- ------
    HELLO    hELLo
    WORLD    wORLd
    IT       It
    IS       is
    ME       ME
.OUTPUTS
[string[]]
#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments','')]
    param (
        [parameter(ValueFromPipeline)]
        [string[]] $String,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($CurrentString in $String) {
            $CharArray = [char[]] $CurrentString
            $CharArray | ForEach-Object -Begin { $ReturnVal = '' } -Process {
                $Random = 0,1 | Get-Random
                if ($Random -eq 0) {
                    $ReturnVal += ([string] $_).ToLower()
                } else {
                    $ReturnVal += ([string] $_).ToUpper()
                }
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    Original = $CurrentString
                    Return   = $ReturnVal
                })
            } else {
                Write-Output -InputObject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} # EndFunction Format-RandomCase
