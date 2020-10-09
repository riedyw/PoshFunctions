Function Get-WordCount {
<#
.SYNOPSIS
    Gets summary statistics of all the words and how many of each there are
.DESCRIPTION
    Gets summary statistics of all the words and how many of each there are
.PARAMETER Path
    The path of the file
.PARAMETER Exclude
    A string or array of strings that should be excluded.
.EXAMPLE
    For all the examples assume you have a file called Sample.txt that contains the following:
    unicorn unicorn unicorn unicorn
    cat cat cat
    dog dog
    fish

    Assume further you have another file called Exclude.txt that contains the following:
    unicorn
.EXAMPLE
    Get-WordCount -Path .\Sample.txt

    Name                           Value
    ----                           -----
    unicorn                        4
    cat                            3
    dog                            2
    fish                           1
.EXAMPLE
    Get-WordCount -Path .\sample.txt -Exclude .\Exclude.txt

    Name                           Value
    ----                           -----
    cat                            3
    dog                            2
    fish                           1
#>

    [CmdletBinding()]
    param ([Parameter(Mandatory,HelpMessage='Please enter a filename so we can count the words',ValueFromPipeline)]
        [string] $Path,

        [string[]] $Exclude
    )

    begin {

    }

    process {
        write-verbose -message "PATH    = [$($Path)]"
        $textString = $(get-content -path $Path) -join ' '
        $textString = $textString -replace "`n", ' '
        $textString = $textString -replace '[^a-z| ]'
        $textWords = $textString -split '\s+'

        $statistic = $textWords | foreach-object -Begin {$hash=@{}} -Process {$hash.$_ ++} -End {$hash}

        if ( $exclude ) {
            write-verbose -message "EXCLUDE = $Exclude"
            $excludeString = $(get-content -path $exclude) -join ' '
            $excludeString = $excludeString -replace "`n", ' '
            $excludeString = $excludeString -replace '[^a-z| ]'
            $excludeWords = $excludeString -split '\s+'
            $excludeWords | foreach-object {
                if ($statistic.ContainsKey($_)) {
                    $statistic.Remove($_)
                }
            }
        }
        write-verbose -message 'Word frequency in descending order'
        $statistic.GetEnumerator() | sort-object -Property value -Descending
    }

    end {

    }

} #EndFunction Get-WordCount
