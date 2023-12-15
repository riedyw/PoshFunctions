function ConvertTo-Bool {
<#
.SYNOPSIS
    Parse a string and convert it to a Boolean
.DESCRIPTION
    Parse a string and convert it to a Boolean. Function aliased to 'Parse-Bool'.
.PARAMETER InputVal
    The string or array of strings to be evaluated. Accepts from the pipeline
.PARAMETER TrueString
    The string or array of strings that are considered as $true values.
    Defaults to 'true', 'yes', 'on', 'enabled', 't', 'y'
.PARAMETER IncludeInput
    Determines if you wish to see the original in the output, aliased to 'IncludeOriginal'
.NOTES
    ConvertTo-Bool will .Trim() the InputVal before trying to parse it.
.EXAMPLE
    ConvertTo-Bool 'true'
    True
.EXAMPLE
    ConvertTo-Bool 't'
    True
.EXAMPLE
    ConvertTo-Bool 'on'
    True
.EXAMPLE
    ConvertTo-Bool 0
    False
.EXAMPLE
    ConvertTo-Bool 1

    Any NON-zero numeric would return
    True
.EXAMPLE
    ConvertTo-Bool 'nonsense'
    False
.EXAMPLE
    ConvertTo-Bool 'radical' -TrueString 'radical', 'cool'
    True
.EXAMPLE
    '0',1,2,'t','enabled','darn','on' | ConvertTo-Bool -IncludeInput


    Original  Bool TrueString
    --------  ---- ----------
    0        False true, yes, on, enabled, t, y
    1         True true, yes, on, enabled, t, y
    2         True true, yes, on, enabled, t, y
    t         True true, yes, on, enabled, t, y
    enabled   True true, yes, on, enabled, t, y
    darn     False true, yes, on, enabled, t, y
    on        True true, yes, on, enabled, t, y
.OUTPUTS
    [bool]
.LINK
    about_Properties
#>

    [CmdletBinding()]
    [alias('Parse-Bool')] #FunctionAlias
    [OutputType('bool')]
    param(
        [Parameter(Position = 0,ValueFromPipeline)]
        [string[]] $InputVal,

        [string[]] $TrueString = @('true', 'yes', 'on', 'enabled', 't', 'y'),

        [Alias('IncludeOriginal')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $TrueRegex = '^(' + ($TrueString -join '|') + ')$'
        $TrueVerbose = $TrueString -join ', '
        Write-Verbose -Message "TrueString is [$TrueVerbose]"
    }

    process {
        foreach ($currentInput in $InputVal) {
            $currentInput = $currentInput.Trim()
            if (($currentInput -eq '') -or ($null -eq $currentInput)) {
                $ReturnVal = $false
            } else {
                if (Test-IsNumeric -NumString $currentInput) {
                    if ($currentInput -eq 0) {
                        $ReturnVal = $false
                    }
                    else {
                        $ReturnVal = $true
                    }
                }
                else {
                    switch -regex ($currentInput) {
                        $TrueRegex { $ReturnVal = $true }
                        # '^(true|yes|on|enabled|t|y)$' { $true }
                        default { $ReturnVal = $false }
                    }
                }
            }
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                    Original = $currentInput
                    Bool = $ReturnVal
                    TrueString = $TrueString -join ', '
                })
            } else {
                $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} # endfunction ConvertTo-Bool
