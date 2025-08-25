function Format-TitleCase {
<#
.SYNOPSIS
    Takes a string like 'happy birthday' and changes it to 'Happy Birthday'
.DESCRIPTION
    Takes a string like 'happy birthday' and changes it to 'Happy Birthday'. Can optionally convert all to lower case first.
.PARAMETER String
    String or string array that you want to be put into your cultures title case
.PARAMETER ToLowerFirst
    Switch to first put the string to lower case then put to title case
.PARAMETER IncludeInput
    Switch to include the input in the output
.EXAMPLE
    Format-TitleCase -String 'hello THERE'
    Hello THERE
.EXAMPLE
    Format-TitleCase -String 'hello THERE' -ToLowerFirst
    Hello There
.EXAMPLE
    Format-TitleCase -String 'hello THERE' -ToLowerFirst -IncludeInput

    Original    ToLowerFirst TitleCase
    --------    ------------ ---------
    hello THERE True         Hello There
.NOTES
    Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/title-casing-strings-capital-letter-starts-each-word
#>

    [cmdletbinding()]
    [OutputType('string')]
    param(
        [parameter(Mandatory, HelpMessage = 'Please enter a string that you want to put in Title Case', ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]] $String,

        [switch] $ToLowerFirst,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $TextInfo = (Get-Culture).TextInfo
    }

    process {
        foreach ($curString in $String) {
            if ($ToLowerFirst) {
                $ReturnVal = $TextInfo.ToTitleCase($curString.ToLower())
            } else {
                $ReturnVal = $TextInfo.ToTitleCase($curString)
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    Original = $curString
                    ToLowerFirst = $ToLowerFirst
                    TitleCase = $ReturnVal
                })
            } else {
                Write-Output -InputObject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
