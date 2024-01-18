Function Split-DistinguishedName {
    <#
.SYNOPSIS
    To split a DistinguishedName string line by into its constituent parts which are separated by a comma
.DESCRIPTION
    To split a DistinguishedName string line by into its constituent parts which are separated by a comma. Commas within
    one of the constituent properties are represented by '\,'
.PARAMETER DistinguishedName
    The DistinguishedName string you want to parse. Can be single string or array of strings. Values can be passed
    via the pipeline as straight text or via property name. Aliased to 'DN'
.PARAMETER Parent
    Switch to display the parent of the distinguished name. Default parameter
.PARAMETER Leaf
    Switch to display the leaf of the distinguished name
.PARAMETER Token
    Switch to return an array of all the parts
.EXAMPLE
    Split-DistinguishedName -DistinguishedName 'CN=Duck\, Daffy,DC=contosco,DC=com' -Leaf

    CN=Duck\, Daffy
.EXAMPLE
    Split-DistinguishedName -DistinguishedName 'CN=Duck\, Daffy,DC=contosco,DC=com' -Parent

    DC=contosco,DC=com
.EXAMPLE
    Split-DistinguishedName -DistinguishedName 'CN=Mickey Mouse,DC=contosco,DC=com' -Leaf

    CN=Mickey Mouse
.EXAMPLE
    'CN=Duck\, Daffy,DC=contosco,DC=com' | Split-DistinguishedName

    DC=contosco,DC=com
.EXAMPLE
    'CN=Duck\, Daffy,DC=contosco,DC=com' | Split-DistinguishedName -Leaf

    CN=Duck\, Daffy
.EXAMPLE
    Split-DistinguishedName -DistinguishedName 'CN=Mickey Mouse,DC=contosco,DC=com', 'CN=Duck\, Daffy,DC=contosco,DC=com' -Leaf

    CN=Mickey Mouse
    CN=Duck\, Daffy
.EXAMPLE
    'CN=Duck\, Daffy,DC=contosco,DC=com' | Split-DistinguishedName -Token

    CN=Duck\, Daffy
    DC=contosco
    DC=com
#>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    [CmdletBinding(ConfirmImpact = 'None', DefaultParameterSetName = 'Parent')]
    [OutputType('string[]')]
    param(
        [Parameter(Mandatory, HelpMessage = 'Enter a string composed of tokens separated by a comma', Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'Parent')]
        [Parameter(Mandatory, HelpMessage = 'Enter a string composed of tokens separated by a comma', Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'Leaf')]
        [Parameter(Mandatory, HelpMessage = 'Enter a string composed of tokens separated by a comma', Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'Token')]
        [Alias('DN')]
        [string[]] $DistinguishedName,

        [Parameter(ParameterSetName = 'Parent')]
        [switch] $Parent,

        [Parameter(ParameterSetName = 'Leaf')]
        [switch] $Leaf,

        [Parameter(ParameterSetName = 'Token')]
        [switch] $Token
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($DN in $DistinguishedName) {
            $tmpString = $DN -replace '\\,', ([char] 9)
            $tmpArray = $tmpString -split ','
            switch ($PsCmdlet.ParameterSetName) {
                'Leaf' {
                    $tmpArray[0] -replace ([char] 9), '\,'
                }
                'Parent' {
                    if ($tmpArray.Count -gt 1) {
                        $tmpArray[1..($tmpArray.Count - 1)] -join ',' -replace ([char] 9), '\,'
                    }
                }
                'Token' {
                    $tmpArray[0..($tmpArray.Count - 1)] -replace ([char] 9), '\,'
                }
            }

        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
