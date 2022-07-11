function ConvertFrom-HexString {
<#
.SYNOPSIS
    Convert a hex string or array of hex string to text
.DESCRIPTION
    Convert a hex string or array of hex string to text
.PARAMETER HexString
    An array of hex strings that need to be converted back to text. Values can be passed from the pipeline.
.PARAMETER IncludeInput
    Switch indicating that you want the input to be included in the output
.EXAMPLE
    ConvertFrom-HexString -HexString '434241'

    CBA
.EXAMPLE
    414243 | ConvertFrom-HexString

    ABC
.EXAMPLE
    ConvertFrom-HexString -HexString '414243', '434241' -IncludeInput

    HexString String
    --------- ------
    414243    ABC
    434241    CBA
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [OutputType('string')]
    Param(
        [Parameter(Mandatory, HelpMessage='Enter a hex string', Position = 0, ValueFromPipeline)]
        [string[]] $HexString,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($Line in $HexString) {
            $Hexarray = $Line -split '(?<=\G.{2})(?=.)'
            $ReturnVal = ($Hexarray | foreach-object { ([char] ([int] ('0x{0}' -f $_))) }) -join ''
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    HexString = $Line
                    String = $ReturnVal
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
