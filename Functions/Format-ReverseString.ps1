Function Format-ReverseString {
<#
.SYNOPSIS
    To reverse a string, or an array of strings
.DESCRIPTION
    To reverse a string, or an array of strings. Function aliased to 'Reverse'
.PARAMETER String
    The string you wish to be reversed. Can be a string or an array of strings.
    Can be passed from the pipeline
.PARAMETER IncludeInput
    Switch to include the input along with the output. Aliased to 'IncludeOriginal' for
    backward compatibility
.EXAMPLE
    Format-ReverseString -String 'Hello'

    olleH
.EXAMPLE
    Format-ReverseString -String 'Hello' -IncludeInput

    Original Reverse
    -------- -------
    Hello    olleH
.EXAMPLE
    '758', '129' | Format-ReverseString -IncludeInput

    Original Reverse
    -------- -------
    758      857
    129      921
#>

    [CmdletBinding(ConfirmImpact='None')]
    [alias('ReverseString')] #FunctionAlias
    [OutputType('string')]
    param(
        [Parameter(Mandatory, HelpMessage='Enter a string you wish to be reversed',Position=0,ValueFromPipeline)]
        [string[]] $String,

        [Alias('IncludeOriginal')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($currentString in $String) {
            $ReturnVal = [string]::Join('', $currentString[($currentString.Length-1)..0])
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                    Original = $currentString
                    Reverse  = $ReturnVal
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
