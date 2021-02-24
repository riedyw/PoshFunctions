function Test-IsNull {
<#
.SYNOPSIS
    Given a passed [string] tests to determine if .IsNullOrEmpty() or .IsNullOrWhitespace(), with .IsNullOrEmpty() being the default
.DESCRIPTION
    Given a passed [string] tests to determine if .IsNullOrEmpty() or .IsNullOrWhitespace(), with .IsNullOrEmpty() being the default
.PARAMETER String
    A [string] that you wanted tested to see if Null or (Empty or WhiteSpace). In both parameter set names 'Empty' and 'WhiteSpace'
.PARAMETER Empty
    A switch to control if looking for .IsNullOrEmpty()
.PARAMETER WhiteSpace
    A switch to control if looking for .IsNullOrWhitespace()
.EXAMPLE
    Test-IsNull -String ''

    Would return
    $true
.EXAMPLE
    Test-IsNull -String ' '

    Would return
    $false
.EXAMPLE
    Test-IsNull -String " `t " -WhiteSpace

    Would return
    $true
.OUTPUTS
    'bool'
#>

    [CmdletBinding(DefaultParameterSetName = 'Empty', ConfirmImpact = 'Low')]
    [OutputType('bool')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    Param
    (

        [Parameter(Position=0,ParameterSetName = 'Empty')]
        [Parameter(Position=0,ParameterSetName = 'WhiteSpace')]
        [string] $String,

        [Parameter(ParameterSetName = 'Empty')]
        [switch] $Empty,

        [Parameter(ParameterSetName = 'WhiteSpace')]
        [switch] $WhiteSpace

    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'Empty' {
                $ReturnVal = [string]::IsNullOrEmpty($String)
            }
            'WhiteSpace' {
                $ReturnVal = [string]::IsNullOrWhitespace($String)
            }
        }
    }

    end {
        Write-Output -InputObject $ReturnVal
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
