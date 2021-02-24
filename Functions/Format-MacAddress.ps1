function Format-MacAddress {
<#
.SYNOPSIS
    Function to cleanup a MACAddress string
.DESCRIPTION
    Function to clean up a MACAddress string and optionally format it with separators
.PARAMETER MacAddress
    Specifies the MacAddress. Either a single string or an array of strings. Aliased to 'Address'
.PARAMETER Separator
    Specifies the separator every X characters. Aliased to 'Delimiter'. Validated against set(':', 'None', '.', "-", ' ', 'Space', ';')
.PARAMETER Case
    Specifies if the output is to be set in a particular case
    Upper       Sets to upper case, 'a' becomes 'A'
    Uppercase   Sets to upper case, 'a' becomes 'A'
    Lower       Sets to lower case, 'A' becomes 'a'
    Lowercase   Sets to lower case, 'A' becomes 'a'
    Ignore      Does nothing to the case of the letters 'aB', so remains as 'aB'
.Parameter Split
    Specifies how many characters to split the MacAddress on. Valid values are 2,3,4,6
.EXAMPLE
    Format-MacAddress -MacAddress 1234567890ab
    12:34:56:78:90:ab
.EXAMPLE
    Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Upper
    00:11:22:DD:EE:FF
.EXAMPLE
    Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Lowercase
    001122ddeeff
.EXAMPLE
    Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Lowercase -Separator '-'
    00-11-22-dd-ee-ff
.EXAMPLE
    Format-MacAddress -MacAddress '00:11:22:dD:ee:FF' -Case Lowercase -Separator '.'
    00.11.22.dd.ee.ff
.EXAMPLE
    Format-MacAddress -Address '00:11:22:dD:ee:FF', '10005a123456' -case Uppercase -Delimiter '-'
    00-11-22-DD-EE-FF
    10-00-5A-12-34-56

    Showing how function can take an array of MacAddress using the alias 'Address' and the alias 'Delimiter' for the 'Separator' parameter
.EXAMPLE
    '00:11:22:dD:ee:FF', '10005a123456' | Format-MacAddress  -case Lowercase -Separator '.'
    00.11.22.dd.ee.ff
    10.00.5a.12.34.56

    Showing how the values for MacAddress can be received from the pipeline
.EXAMPLE
    Format-MacAddress '10005a123456' -case Lowercase -Separator ':'
    10:00:5a:12:34:56

    Showing how MacAddress can be unnamed positional parameter
.EXAMPLE
    '00:11:22:dD:ee:FF' | Format-MacAddress  -Separator None -Case Ignore

    001122dDeeFF
.EXAMPLE
    '00:11:22:dD:ee:FF', '10005a123456' | Format-MacAddress  -case Lowercase -Separator '.' -Split 4
    0011.22dd.eeff
    1000.5a12.3456
.EXAMPLE
    '00:11:22:dD:ee:FF', '10005a123456' | Format-MacAddress  -case Lowercase -Separator '.' -Split 4 -IncludeOriginal

    OriginalMac       FormattedMac
    -----------       ------------
    00:11:22:dD:ee:FF 0011.22dd.eeff
    10005a123456      1000.5a12.3456
.EXAMPLE
    Format-MacAddress -MacAddress (Get-RandomMacAddress) -Separator '.'

    95.4a.e6.39.05.aa
.OUTPUTS
    System.String
.NOTES
    # Inspired and based on Clean-MacAddress.ps1 by
    # Francois-Xavier Cat
    # www.lazywinadmin.com
    # @lazywinadm

    Modified:
    1. Changed MacAddress to allow for pipeline input
    2. Changed MacAddress to be a positional parameter
    3. Changed MacAddress to be aliased to 'Address'
    4. Changed MacAddress to accept an array of addresses if need be
    5. Changed Separator to be aliased to 'Delimiter'
    6. Added the space and semicolon to the set of valid separator values
    7. Changed the switches Upper and Lower to be a string parameter Case which accepts as valid input Upper, Uppercase, Lower, Lowercase, Ignore
    8. Added -Split parameter that can split the address every X characters. Valid values are 2,3,4,6
    9. Added IncludeOriginal switch to be able to compare original with formatted.

#>

    #region Parameter
    [OutputType('String')]
    [CmdletBinding()]
    param
    (
        [Parameter(Position=0,HelpMessage='Please enter a MAC address (12 hex)',Mandatory,ValueFromPipeline)]
        [Alias('Address')]
        [String[]] $MacAddress,

        [ValidateSet(':', 'None', '.', '-', ' ', 'Space', ';')]
        [Alias('Delimiter')]
        [string] $Separator = ':',

        [ValidateSet('Ignore', 'Upper', 'Uppercase', 'Lower', 'Lowercase')]
        [string] $Case = 'Lower',

        [ValidateSet(2,3,4,6)]
        [int] $Split = 2,

        [switch] $IncludeOriginal
    )
    #endregion Parameter

    begin {
        if ($Separator -eq 'Space') { $Separator = ' ' }
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($Mac in $MacAddress)
        {
            $oldMac = $Mac
            $Mac = $Mac -replace '-', '' #Replace Dash
            $Mac = $Mac -replace ':', '' #Replace Colon
            $Mac = $Mac -replace ';', '' #Replace semicolon
            $Mac = $Mac -replace '/s', '' #Remove whitespace
            $Mac = $Mac -replace ' ', '' #Remove whitespace
            $Mac = $Mac -replace '\.', '' #Remove dots
            $Mac = $Mac.trim() #Remove space at the beginning
            $Mac = $Mac.trimend() #Remove space at the end
            switch ($Case) {
                'Upper'     { $Mac = $mac.toupper() }
                'Uppercase' { $Mac = $mac.toupper() }
                'Lower'     { $Mac = $mac.tolower() }
                'Lowercase' { $Mac = $mac.tolower() }
                'Ignore'    { }
                Default     { }
            }

            if ($Separator -ne 'None') {
                switch ($Split) {
                    2       { $Mac = $Mac -replace '(..(?!$))', "`$1$Separator" }
                    3       { $Mac = $Mac -replace '(...(?!$))', "`$1$Separator" }
                    4       { $Mac = $Mac -replace '(....(?!$))', "`$1$Separator" }
                    6       { $Mac = $Mac -replace '(......(?!$))', "`$1$Separator" }
                    default { $Mac = $Mac -replace '(..(?!$))', "`$1$Separator" }
                }
            }

            if ( -not ($IncludeOriginal) ) {
                write-output -InputObject $Mac
            } else {
                $prop = ([ordered] @{ OriginalMac = $oldMac ; FormattedMac = $mac   })
                $obj = new-object -TypeName psobject -Property $prop
                write-output -InputObject $obj
            }
        }
    } #EndBlock Process

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction Format-MacAddress
