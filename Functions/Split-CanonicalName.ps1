Function Split-CanonicalName {
    <#
.SYNOPSIS
    To split a CanonicalName string line by into its constituent parts which are separated by a /
.DESCRIPTION
    To split a CanonicalName string line by into its constituent parts which are separated by a /. Slashes within
    one of the constituent properties are represented by '\/'
.PARAMETER CanonicalName
    The CanonicalName string you want to parse. Can be single string or array of strings. Values can be passed
    via the pipeline as straight text or via property name. Aliased to 'CN'
.PARAMETER Parent
    Switch to display the parent of the distinguished name. Default parameter
.PARAMETER Leaf
    Switch to display the leaf of the distinguished name
.PARAMETER Token
    Switch to return an array of all the parts
.EXAMPLE
    Split-CanonicalName -CanonicalName 'contosco.com/Users/Mickey Mouse'

    contosco.com/Users
.EXAMPLE
    Split-CanonicalName -CanonicalName 'contosco.com/Users/Mickey Mouse' -Leaf

    Mickey Mouse
.EXAMPLE
    Split-CanonicalName -CanonicalName 'contosco.com/Users/Duck, Daffy' -Leaf

    Duck, Daffy
.EXAMPLE
    'contosco.com/Users/Duck, Daffy' | Split-CanonicalName

    contosco.com/Users
.EXAMPLE
    'contosco.com/Users/Duck, Daffy' | Split-CanonicalName -Leaf

    Duck, Daffy
.EXAMPLE
    Get-AdUser MMouse | Split-CanonicalName -Leaf

    Mickey Mouse
.EXAMPLE
    'contosco.com/Users/Duck, Daffy' | Split-CanonicalName -Token

    contosco.com
    Users
    Duck, Daffy
#>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter','')]
    [CmdletBinding(ConfirmImpact = 'None', DefaultParameterSetName = 'Parent')]
    [OutputType('string[]')]
    param(
        [Parameter(Mandatory, HelpMessage = 'Enter a string composed of tokens separated by a /', Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'Parent')]
        [Parameter(Mandatory, HelpMessage = 'Enter a string composed of tokens separated by a /', Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'Leaf')]
        [Parameter(Mandatory, HelpMessage = 'Enter a string composed of tokens separated by a /', Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName, ParameterSetName = 'Token')]
        [Alias('CN')]
        [string[]] $CanonicalName,

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
        foreach ($Canon in $CanonicalName) {
            $tmpString = $Canon -replace '\\/', ([char] 9)
            $tmpArray = $tmpString -split '/'
            switch ($PsCmdlet.ParameterSetName) {
                'Leaf' {
                    $tmpArray[($tmpArray.Count - 1)] -replace ([char] 9), '\/'
                }
                'Parent' {
                    if ($tmpArray.Count -gt 1) {
                        $tmpArray[0..($tmpArray.Count - 2)] -join '/' -replace ([char] 9), '\/'
                    }
                }
                'Token' {
                    $tmpArray[0..($tmpArray.Count - 1)] -replace ([char] 9), '\/'
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
