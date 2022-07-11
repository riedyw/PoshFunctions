function ConvertTo-HexString {
<#
.SYNOPSIS
    Convert a string or array of string to hex strings
.DESCRIPTION
    Convert a string or array of string to hex strings
.PARAMETER String
    An array of hex strings that need to be converted back to text. Values can be passed from the pipeline.
.PARAMETER IncludeInput
    Switch indicating that you want the input to be included in the output
.EXAMPLE
    ConvertTo-HexString -String 'CBA'

    434241
.EXAMPLE
    'ABC' | ConvertTo-HexString

    414243
.EXAMPLE
    'ABC', 'abc' | ConvertTo-HexString  -IncludeInput

    String HexString
    ------ ---------
    ABC    414243
    abc    616263
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [OutputType('string')]
    Param(
        [Parameter(Mandatory, HelpMessage='Enter a string', Position = 0, ValueFromPipeline)]
        [string[]] $String,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($Line in $String) {
            $chararray = $Line.ToCharArray()
            $ReturnVal = ($chararray | foreach-object { '{0:x2}' -f ([byte] [char] $_) }) -join ''
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    String = $Line
                    HexString = $ReturnVal
                })
            } else {
                $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
