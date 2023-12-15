function Test-MultipleBool {
    <#
.SYNOPSIS
    Takes multiple bool values and applies a boolean operator against them to get an answer
.DESCRIPTION
    Takes multiple bool values and applies a boolean operator against them to get an answer. Default parameter set name 'And'
.PARAMETER Bool
    An array of boolean values. Accepts values from the pipeline. Valid parameter set names 'And', 'Or'
.PARAMETER TestAnd
    Switch to perform boolean AND. Parameter set name 'And'
.PARAMETER TestOr
    Switch to perform boolean OR. Parameter set name 'Or'
.PARAMETER IncludeInput
    Switch to include the input in the output. Valid parameter set names 'And', 'Or'
.EXAMPLE
$true, $false | Test-MultipleBool -IncludeInput -TestAnd -Verbose
VERBOSE: Starting [Test-MultipleBool]
VERBOSE: ParameterSetName [And]
VERBOSE: TestOr [False] TestAnd [True] IncludeInput [True]

VERBOSE: Ending [Test-MultipleBool]
Values     Operator Result
------     -------- ------
True,False AND       False
.EXAMPLE
$true, $false | Test-MultipleBool -IncludeInput -TestOr

Values     Operator Result
------     -------- ------
True,False OR         True
.EXAMPLE
$true, $false, $true | Test-MultipleBool -IncludeInput -TestOr

Values          Operator Result
------          -------- ------
True,False,True OR         True
.EXAMPLE
$true, $false, $true | Test-MultipleBool -IncludeInput -TestAnd

Values          Operator Result
------          -------- ------
True,False,True AND       False
#>

    [CmdletBinding(DefaultParameterSetName = 'And')]
    [OutputType('bool')]
    [alias('Test-MultiBool')] #FunctionAlias
    param(
        [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = 'And')]
        [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = 'Or')]
        [bool[]] $Bool,

        [Parameter(ParameterSetName = 'And')]
        [switch] $TestAnd,

        [Parameter(ParameterSetName = 'Or')]
        [switch] $TestOr,

        [Parameter(ParameterSetName = 'And')]
        [Parameter(ParameterSetName = 'Or')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        Write-Verbose -Message "TestOr [$TestOr] TestAnd [$TestAnd] IncludeInput [$IncludeInput]"
        $BoolArg = [System.Collections.ArrayList]::new()
        switch ($PsCmdlet.ParameterSetName) {
            'And' {
                $Answer = $true
                $Booloperator = 'AND'
            }
            'Or' {
                $Answer = $false
                $Booloperator = 'OR'
            }
        }
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'And' {
                foreach ($CurBool in $Bool) {
                    $null = $BoolArg.Add($CurBool)
                    $CurBool | ForEach-Object { $Answer = $Answer -and $_ }
                }
            }
            'Or' {
                foreach ($CurBool in $Bool) {
                    $null = $BoolArg.Add($CurBool)
                    $CurBool | ForEach-Object { $Answer = $Answer -or $_ }
                }
            }
        }
    }

    end {
        if ($IncludeInput) {
            New-Object -TypeName psobject -Property ([ordered] @{
                    Values   = $BoolArg -join ','
                    Operator = $Booloperator
                    Result   = $Answer
                })
        } else {
            Write-Output -InputObject $Answer
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
