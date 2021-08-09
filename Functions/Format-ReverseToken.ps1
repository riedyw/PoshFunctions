Function Format-ReverseToken {
<#
.SYNOPSIS
    To reverse a string that is broken into tokens by a delimiter
.DESCRIPTION
    To reverse a string that is broken into tokens by a delimiter
.PARAMETER String
    The string you wish to be reversed. Can be a string or an array of strings.
    Can be passed from the pipeline
.PARAMETER Delimiter
    The delimiter character that separates the tokens. Defaults to '.'
.PARAMETER IncludeInput
    Switch to display the input parameters with the output
.PARAMETER Trim
    Switch to trim each token
.EXAMPLE
    Format-ReverseToken -String 'google.com'

    Would return
    com.google
.EXAMPLE
    Format-ReverseToken -String 'monster.us .google.com'

    Would return
    com.google.us .monster
.EXAMPLE
    Format-ReverseToken -String 'monster.us .google.com' -Trim -IncludeInput

    Would return
    Original               Delimiter Trim ReverseToken
    --------               --------- ---- ------------
    monster.us .google.com .         True com.google.us.monster
.EXAMPLE
    'yahoo.com','google.com' | Format-ReverseToken

    Would return
    com.yahoo
    com.google
.EXAMPLE
    Format-ReverseToken -String 'monster;google;com' -Trim -Delimiter ';'

    Would return
    com;google;monster
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('string')]
    param(
        [Parameter(Mandatory, HelpMessage='Enter a string composed of tokens',Position=0,ValueFromPipeline)]
        [string[]] $String,

        [string] $Delimiter = '.',

        [switch] $IncludeInput,

        [switch] $Trim
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($currentString in $String) {
            if ($Trim) {
                $currentString = $currentString.Trim()
            }
            $tmpArray = $currentString.split($Delimiter)
            if ($Trim) {
                for ($i=0; $i -lt $tmpArray.Count; $i++) {
                    $tmpArray[$i] = $tmpArray[$i].Trim()
                }
            }
            $ReturnVal = $tmpArray[($tmpArray.Count-1)..0] -join $Delimiter
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                    Original     = $currentString
                    Delimiter    = $Delimiter
                    Trim         = $Trim
                    ReverseToken = $ReturnVal
                })
            } else {
                write-output -InputObject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}

