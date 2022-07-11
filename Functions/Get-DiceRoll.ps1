function Get-DiceRoll {
<#
.SYNOPSIS
    Simulates rolling gaming dice
.DESCRIPTION
    Simulates rolling gaming dice. You can specify the number and type of a particular die.
.PARAMETER Dice
    A [string] array that you use to specify the type of and number of that type of dice that you want to roll. Takes the form of [#]D[Type] where # is blank or 1-9, and Type is 4, 6, 8, 10, %, 12, 20

    TYPE    DESCRIPTION
    4       4 sided die with face values of 1-4
    6       6 sided die with face values of 1-6
    8       8 sided die with face values of 1-8
    10      10 sided die with face values of 0-9
    %       10 sided die with face values of 0,10,20,30,40,50,60,70,80,90
    12      12 sided die with face values of 1-12
    20      20 sided die with face values of 1-20
.PARAMETER ShowRoll
    A switch to show the results of each individual dice roll
.EXAMPLE
    # Rolling 3 standard six sided dice and showing the result of each die. The total would be between 3 and 18

    Get-DiceRoll -Dice 3d6 -ShowRoll

    Example return
    DiceType Roll
    -------- ----
    D6       6, 3, 3
    TOTAL    12
.EXAMPLE
    Get-DiceRoll -Dice 3d4

    Would return a value between 3 and 12
.EXAMPLE
    Get-DiceRoll -Dice d%,d10 -ShowRoll

    Sample return
    DiceType Roll
    -------- ----
    D10      5
    D%       30
    TOTAL    35
.EXAMPLE
    'd12','d4' | Get-DiceRoll -ShowRoll

    Sample return
    DiceType Roll
    -------- ----
    D12      3
    D4       1
    TOTAL    4
.NOTES
    If you need to specify 10 or more of a particular type of dice use several entries of that dice type that add up to the value you want.

    You want to know results of rolling ten 6-sided dice

    Get-DiceRoll -Dice 2d6,8d6
.OUTPUTS
    'int'

    or

    'psobject'
#>

    # todo Change += to System.Collections.Arraylist

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'Low')]
    [OutputType('int')]
    Param
    (

        [Parameter(Mandatory, HelpMessage='Please enter the number and type of dice you wish to roll (ex. 3D6)', Position=0, ValueFromPipeLine)]
        [string[]] $Dice,

        [switch] $ShowRoll

    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $Total = 0
        $ValidDice = $true
        $Roll = @{}
        $ReturnVal = @()
        $DiceCharacteristics = ([ordered] @{
            '4' = @{ Side = 4; Face = 1..4}
            '6' = @{ Side = 6; Face = 1..6}
            '8' = @{ Side = 8; Face = 1..8}
            '10' = @{ Side = 10; Face = 0..9}
            '%' = @{ Side = 10; Face = (0..9 | Foreach-Object { $_ * 10 }) }
            '12' = @{ Side = 12; Face = 1..12}
            '20' = @{ Side = 20; Face = 1..20}
        })
    }

    process {
        foreach ($Die in $Dice) {
            if ($Die -match '^([1-9]?)d(4|6|8|10|%|12|20)$') {
                $DieType = $matches[2]
                $NumDie  = $matches[1]
                if (Test-IsNull $NumDie -Verbose:$false) {
                    $NumDie = 1
                }
                for ($i = 1; $i -le $NumDie; $i++) {
                    if (-not ($Roll.ContainsKey($DieType))) {
                        $Roll.$DieType = @()
                    }
                    $Roll.$DieType += Get-Random $DiceCharacteristics.$DieType.Face
                }
            } else {
                $ValidDice = $false
            }
        }
    }

    end {
        if (-not $ValidDice) {
            Write-Error -Message  'Invalid dice specified'
        } else {
            foreach ($R in $Roll.GetEnumerator()) {
                Write-Verbose -Message  "`$R.Value is [$($R.Value -join ', ')]"
                $Total += ($R.Value | Measure-Object -Sum).Sum
                [string] $CurrentRoll = ($R.Value | Sort-Object -Descending) -join ', '
                $ReturnVal += New-Object -TypeName PSObject -Property ([ordered] @{DiceType = ('D' + $R.Name); Roll = $CurrentRoll })
            }
            if ($ShowRoll) {
                $ReturnVal += New-Object -TypeName PSObject -Property ([ordered] @{DiceType = 'TOTAL'; Roll = $Total })
                $ReturnVal
            } else {
                Write-Output -InputObject  $Total
            }
        }

        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
