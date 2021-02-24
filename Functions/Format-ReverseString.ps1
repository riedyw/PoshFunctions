Function Format-ReverseString {
<#
.SYNOPSIS
    To reverse a string, or an array of strings
.DESCRIPTION
    To reverse a string, or an array of strings
.PARAMETER String
    The string you wish to be reversed. Can be a string or an array of strings.
    Can be passed from the pipeline
.EXAMPLE
    Format-ReverseString -String 'Hello'

    olleH
.EXAMPLE
    Format-ReverseString -String 'Hello' -IncludeOriginal

    Original Reverse
    -------- -------
    Hello    olleH
.EXAMPLE
    '758', '129' | Format-ReverseString -IncludeOriginal

    Original Reverse
    -------- -------
    758      857
    129      921
#>

    [CmdletBinding(ConfirmImpact='None')]
    [outputtype('string')]
    param(
        [Parameter(Mandatory,Position=0,ValueFromPipeline)]
        [string[]] $String,

        [switch] $IncludeOriginal
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($currentString in $String) {
            $ReturnVal = [string]::Join('', $currentString[($currentString.Length-1)..0])
            if ($IncludeOriginal) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                    Original = $currentString
                    Reverse  = $ReturnVal
                })
            } else {
                write-output $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}

Set-Alias -Name 'ReverseString' -Value 'Format-ReverseString'
