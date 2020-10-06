# Inspiration: https://stackoverflow.com/questions/35116636/bit-shifting-in-powershell-2-0

function Convert-BitShift {
<#
.SYNOPSIS
    Bit shifts an integer either LEFT or RIGHT.
.DESCRIPTION
    Bit shifts an integer either LEFT or RIGHT. Optionally can include original information.
.PARAMETER Integer
    An [int[]] integer, or array of integers to be manipulated. Aliased to 'X'
.PARAMETER Left
    Shifts the bits to the left by [int] positions. Will make Integer larger.
.PARAMETER Right
    Shifts the bits to the right by [int] positions. Will make Integer smaller.
.PARAMETER IncludeOriginal
    If this is specified the function returns an array of custom objects with the following properties
    Input    - The original value
    Shift    - Either 'Left' or 'Right'
    Pos      - The number of positions to shift
    Output   - The result
.NOTES
    Only needed for PowerShell 2
.EXAMPLE
    Convert-BitShift -Integer 36 -Left 2
    144
.EXAMPLE
    Convert-BitShift -x 36 -Right 2
    9
.EXAMPLE
    1..10| Convert-bitshift -IncludeOriginal

    Input Shift Pos Output
    ----- ----- --- ------
        1 Left    1      2
        2 Left    1      4
        3 Left    1      6
        4 Left    1      8
        5 Left    1     10
        6 Left    1     12
        7 Left    1     14
        8 Left    1     16
        9 Left    1     18
       10 Left    1     20
.OUTPUTS
[int[]]
#>
    [CmdletBinding(DefaultParameterSetName = 'Left')]
    [OutputType([int[]])]
    param(
        [Parameter(Mandatory,Position=0, ValueFromPipeline)]
        [Alias('X')]
        [int[]] $Integer,

        [Parameter(ParameterSetName = 'Left')]
        [int] $Left = 1,

        [Parameter(ParameterSetName = 'Right')]
        [int] $Right,

        [Parameter()]
        [Alias('inc','original')]
        [switch] $IncludeOriginal
    )
    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"

        $shift = if($PSCmdlet.ParameterSetName -eq 'Left') {
            $Left
        } else {
            (-1) * $Right
        }
        $report = @()
    } # end begin

    process {
        foreach ($int in $Integer) {
            $returnVal = [math]::Floor($int * [math]::Pow(2,$shift))
            if ($IncludeOriginal) {
                if ($Left) {
                    $prop = @{ Input = $int ; Shift = 'Left'; Pos = $Left; Output = $returnVal }
                }
                else
                {
                    $prop = @{ Input = $int ; Shift = 'Right'; Pos = $Right; Output = $returnVal }
                }
                $obj = new-object -typename psobject -property $prop
                $report += $obj
#                write-output -InputObject (, ($obj | select-object -property Input, Shift, Pos, Output))
            }
            else
            {
                $report += $returnVal
#                write-output -InputObject (,[int] $returnVal)
            }
        }
    } # end process

    end
    {
        write-output -InputObject $report
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
} # EndFunction Convert-BitShift

set-alias -name 'BitShift' -value 'Convert-BitShift' -Description 'Alias for Convert-BitShift'
