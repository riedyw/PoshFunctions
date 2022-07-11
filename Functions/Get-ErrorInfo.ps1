function Get-ErrorInfo {
    <#
.SYNOPSIS
Returns errors in a concise object
.DESCRIPTION
Returns errors in a concise object. Useful when trying to write a catch statement to a particular exception.
.PARAMETER Count
Number of error entries you would like. Valid range 1-100. If you specify a number greater than $Error.Count is sets Count to $Error.Count
.EXAMPLE
Get-ErrorInfo -Count 20 -Verbose
VERBOSE: Starting [Get-ErrorInfo]
VERBOSE: Setting Count to [6]

VERBOSE: Ending [Get-ErrorInfo]
Index ExceptionType                                                    ErrorText
----- -------------                                                    ---------
    0 System.Management.Automation.ParameterBindingValidationException Cannot validate argument on parameter 'Count'. The 0 argument is less than the m...
    1 System.Management.Automation.ParameterBindingValidationException Cannot validate argument on parameter 'Count'. The 200 argument is greater than ...
    2 System.ArgumentException                                         Illegal characters in path.
    3 System.ArgumentException                                         Illegal characters in path.
    4 System.ArgumentException                                         Illegal characters in path.
    5 System.Management.Automation.ItemNotFoundException               Cannot find path 'C:\Git\PoshFunctions\Pester\dne' because it does not exist.
.EXAMPLE
Get-ErrorInfo -Count 20 -Verbose

Index ExceptionType                                                    ErrorText
----- -------------                                                    ---------
    0 System.Management.Automation.ParameterBindingValidationException Cannot validate argument on parameter 'Count'. The 0 argument is less than the m...
    1 System.Management.Automation.ParameterBindingValidationException Cannot validate argument on parameter 'Count'. The 200 argument is greater than ...
    2 System.ArgumentException                                         Illegal characters in path.
    3 System.ArgumentException                                         Illegal characters in path.
    4 System.ArgumentException                                         Illegal characters in path.
    5 System.Management.Automation.ItemNotFoundException               Cannot find path 'C:\Git\PoshFunctions\Pester\dne' because it does not exist.
#>

    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Position = 0)]
        [ValidateRange(1, 100)]
        [int] $Count = $Error.Count
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($Count -gt $Error.Count) {
            $Count = $Error.Count
            Write-Verbose -Message "Setting Count to [$($Error.Count)]"
        }
    }

    process {
        $tmp = foreach ($curError in $Error[0..$($Count - 1)]) {
            $curError
        }
        $result = for ($Index = 0; $Index -lt $Count; $Index++) {
            New-Object psobject -Property ([ordered] @{
                    Index    = $Index
                    ExceptionType = ($tmp[$Index].Exception.gettype()).Fullname
                    ErrorText     = $tmp[$Index].ToString()
                })
        }
        $result
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
