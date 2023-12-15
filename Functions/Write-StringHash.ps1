function Write-StringHash {
    <#
.SYNOPSIS
    Takes [hashtable] input and writes the code that would create a hashtable with that information.
.DESCRIPTION
    Takes [hashtable] input and writes the code that would create a hashtable with that information.
.PARAMETER Hash
    The hash to be defined. Can either by [System.Collections.Hashtable] or [System.Collections.Specialized.OrderedDictionary]
.PARAMETER VariableName
    The name of the hash table variable
.PARAMETER Ordered
    Switch to use [ordered] when created hash, will sort entries by value
.PARAMETER QuoteField
    Switch to enclose the name and value attributes in single quotes
.EXAMPLE
    @{ A =1; B=2; C=3} | Write-StringHash

    $StringHash = @{
        C = 3
        B = 2
        A = 1
    }
.EXAMPLE
    @{ A =1; B=2; C=3} | Write-StringHash -QuoteField

    $StringHash = @{
        'C' = '3'
        'B' = '2'
        'A' = '1'
    }
.EXAMPLE
    @{ A =1; B=2; C=3} | Write-StringHash -Ordered

    $StringHash = ([ordered] @{
        A = 1
        B = 2
        C = 3
    })
.EXAMPLE
    @{A =1; C=3; B=2} | Write-StringHash -Ordered -VariableName MyHashTable

    $MyHashTable = ([ordered] @{
        A = 1
        B = 2
        C = 3
    })
.OUTPUTS
    [string[]]
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('string')]
    Param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [psobject] $Hash,

        [string] $VariableName = 'StringHash',

        [switch] $Ordered,

        [switch] $QuoteField
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $ReturnVal = [System.Collections.ArrayList]::new()
        if (-not (($Hash -is [System.Collections.Hashtable]) -or
            ($Hash -is [System.Collections.Specialized.OrderedDictionary])))
        {
            Write-Error '$Hash needs to be either [System.Collections.Hashtable] or [System.Collections.Specialized.OrderedDictionary]'
            break
        }
    }

    process {
        if ($Ordered) {
            $null = $ReturnVal.Add("`$$VariableName = ([ordered] @{")
            $WorkingHash = $Hash.GetEnumerator() | Select-Object -Property Name, Value
        } else {
            $null = $ReturnVal.Add("`$$VariableName = @{")
            $WorkingHash = $Hash.GetEnumerator() | Select-Object -Property Name, Value
        }
        foreach ($CurEntry in $WorkingHash) {
            if ($QuoteField) {
                $null = $ReturnVal.Add(($CurEntry | ForEach-Object { "    '{0}' = '{1}'" -f $_.Name, $_.value }))
            } else {
                $null = $ReturnVal.Add(($CurEntry | ForEach-Object { "    {0} = '{1}'" -f $_.Name, $_.value }))
            }
        }
        if ($Ordered) {
            $null = $ReturnVal.Add('})')
        } else {
            $null = $ReturnVal.Add('}')
        }
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
