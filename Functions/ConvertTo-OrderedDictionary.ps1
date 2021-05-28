function ConvertTo-OrderedDictionary {
<#
.SYNOPSIS
    Converts a HashTable, Array, or an OrderedDictionary to an OrderedDictionary.
.DESCRIPTION
    ConvertTo-OrderedDictionary takes a HashTable, Array, or an OrderedDictionary
    and returns an ordered dictionary.

    If you enter a hash table, the keys in the hash table are ordered
    alphanumerically in the dictionary. If you enter an array, the keys
    are integers 0 - n.
.PARAMETER  Hash
    Specifies a hash table or an array. Enter the hash table or array,
    or enter a variable that contains a hash table or array. If the input
    is an OrderedDictionary the key order is the same in the copy.
.INPUTS
    System.Collections.Hashtable
    System.Array
    System.Collections.Specialized.OrderedDictionary
.OUTPUTS
    System.Collections.Specialized.OrderedDictionary
.NOTES
    source: https://gallery.technet.microsoft.com/scriptcenter/ConvertTo-OrderedDictionary-cf2404ba
    converted to function and added ability to copy OrderedDictionary

.EXAMPLE
    $myHash = @{a=1; b=2; c=3}
    ConvertTo-OrderedDictionary -Hash $myHash

    Name                           Value
    ----                           -----
    a                              1
    b                              2
    c                              3
.EXAMPLE
    $myHash = @{a=1; b=2; c=3}
    $myHash = .\ConvertTo-OrderedDictionary.ps1 -Hash $myHash
    $myHash

    Name                           Value
    ----                           -----
    a                              1
    b                              2
    c                              3

    $myHash | Get-Member

    TypeName: System.Collections.Specialized.OrderedDictionary
    . . .

.EXAMPLE
    $colors = "red", "green", "blue"
    $colors = .\ConvertTo-OrderedDictionary.ps1 -Hash $colors
    $colors

    Name                           Value
    ----                           -----
    0                              red
    1                              green
    2                              blue
.LINK
    about_hash_tables
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('System.Collections.Specialized.OrderedDictionary')]
    Param (
        [parameter(Mandatory, ValueFromPipeline)]
        [hashtable] $Hash
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message ($Hash.gettype())
        if ($Hash -is [System.Collections.Hashtable]) {
            Write-Verbose -Message '$Hash is a HashTable'
            $dictionary = [ordered] @{}
            $keys = $Hash.keys | Sort-Object
            foreach ($key in $keys) {
                $dictionary.add($key, $Hash[$key])
            }
            $dictionary
        } elseif ($Hash -is [System.Array]) {
            Write-Verbose -Message '$Hash is an Array'
            $dictionary = [ordered] @{}
            for ($i = 0; $i -lt $hash.count; $i++) {
                $dictionary.add($i, $hash[$i])
            }
            $dictionary
        } elseif ($Hash -is [System.Collections.Specialized.OrderedDictionary]) {
            Write-Verbose -Message '$Hash is an OrderedDictionary'
            $dictionary = [ordered] @{}
            $keys = $Hash.keys
            foreach ($key in $keys) {
                $dictionary.add($key, $Hash[$key])
            }
            $dictionary
        } else {
            Write-Error -Message 'Enter a hash table, an array, or an ordered dictionary.'
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
