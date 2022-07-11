function Get-Enum {
<#
.SYNOPSIS
    To get the static values of enum datatypes
.DESCRIPTION
    To get the static values of enum datatypes
.PARAMETER TypeName
    A typename or array of typenames that you wish to enumerate the enum values.
    Can accept input from the pipeline.
.PARAMETER Binary
    A switch that will also display the value in binary form.
.PARAMETER Hex
    A switch that will also display the value in hexadecimal form.
.PARAMETER IncludeInput
    A switch determining if you want the TypeName to appear in the output. Aliased to 'IncludeType'
.EXAMPLE
    Get-Enum -TypeName 'System.Windows.Forms.DialogResult'

    Name   Value
    ----   -----
    None       0
    OK         1
    Cancel     2
    Abort      3
    Retry      4
    Ignore     5
    Yes        6
    No         7
.EXAMPLE
    Get-Enum -TypeName 'System.Windows.Forms.MessageBoxButtons' -Hex -IncludeInput

    TypeName                               Name             Value Hex
    --------                               ----             ----- ---
    System.Windows.Forms.MessageBoxButtons OK                   0 0x0
    System.Windows.Forms.MessageBoxButtons OKCancel             1 0x1
    System.Windows.Forms.MessageBoxButtons AbortRetryIgnore     2 0x2
    System.Windows.Forms.MessageBoxButtons YesNoCancel          3 0x3
    System.Windows.Forms.MessageBoxButtons YesNo                4 0x4
    System.Windows.Forms.MessageBoxButtons RetryCancel          5 0x5
.EXAMPLE
    Get-Enum -TypeName 'System.Windows.Forms.MessageBoxButtons' -Binary

    Name             Value Binary
    ----             ----- ------
    OK                   0 0
    OKCancel             1 1
    AbortRetryIgnore     2 10
    YesNoCancel          3 11
    YesNo                4 100
    RetryCancel          5 101
#>

    # todo Change += to System.Collections.Arraylist

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('psobject')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingInvokeExpression','')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseProcessBlockForPipelineCommand','')]
    param (
        [Parameter(Mandatory, HelpMessage='Please enter a .Net typename',Position=0,ValueFromPipeline)]
        [type[]] $TypeName,

        [switch] $Binary,

        [switch] $Hex,

        [Alias('IncludeType')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($Binary) {
            Write-Verbose -Message 'Binary included in output.'
        }
        if ($Hex) {
            Write-Verbose -Message 'Hex included in output.'
        }
        if ($IncludeInput) {
            Write-Verbose -Message 'TypeName included in output.'
        }
    }

    process {
        foreach ($currentType in $TypeName) {
            Write-Verbose -Message "currentType [$currentType]"
            if ($currentType.BaseType.FullName -ne 'System.Enum')
            {
                Write-Error -message "Type '$curExpandType' is not an enum"
                break
            }
            if ($IncludeInput) {
                $props = @(
                    @{ Name = 'TypeName' ; Expression = { Invoke-Expression  "write-output $($currenttype)" }}
                    @{ Name = 'Name'     ; Expression = { [string] $_ } }
                    @{ Name = 'Value'    ; Expression = {  [int32](Invoke-Expression -Command "[$($currentType.FullName)]'$_'") }}
                )
            } else {
                $props = @(
                    @{ Name = 'Name'     ; Expression = { [string] $_ } }
                    @{ Name = 'Value'    ; Expression = { [int32](Invoke-Expression -Command "[$($currentType.FullName)]'$_'") }}
                )
            }
            if ($Binary) {
                $props += @{ Name = 'Binary'; Expression={[Convert]::ToString([int32](Invoke-Expression -Command "[$($currentType.FullName)]'$_'"), 2)}}
            }
            if ($Hex) {
                $props += @{ Name = 'Hex'; Expression={'0x{0}' -f ([Convert]::ToString([int32](Invoke-Expression -Command "[$($currentType.FullName)]'$_'"), 16))}}
            }
            [enum]::GetNames($currentType) | Select-Object -Property $props
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
