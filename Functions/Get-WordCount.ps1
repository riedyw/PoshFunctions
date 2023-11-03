function Get-WordCount {
    <#
.SYNOPSIS
    Gets summary statistics of all the words and how many of each there are
.DESCRIPTION
    Gets summary statistics of all the words and how many of each there are
.PARAMETER Path
    The path of the file
.PARAMETER Exclude
    The path to a file containing strings you want excluded from the count
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

    Word                           Frequency
    ----                           -----
    unicorn                        4
    cat                            3
    dog                            2
    fish                           1
.EXAMPLE
    Get-WordCount -Path .\sample.txt -Exclude .\Exclude.txt

    Word                           Frequency
    ----                           -----
    cat                            3
    dog                            2
    fish                           1
.NOTES
    Updated logic around keys to the working hash. If any of the words in the file match PowerShell keywords you'll
    get a bunch of error messages. Workaround stores hash in slightly different manner.
    Forced each word to lower case
    Sorted Word frequency in descending order, then word in ascending order
    Changed properties from (Name, Value) to (Word, Frequency) to better reflect their meanings
#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    param ([Parameter(Mandatory, HelpMessage = 'Please enter a filename so we can count the words', ValueFromPipeline)]
        [string] $Path,

        [string] $Exclude
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message "PATH    = [$($Path)]"
        $textString = $(Get-Content -Path $Path).ToLower() -join ' '
        $textString = $textString -replace "`n", ' '
        $textString = $textString -replace '[^a-z| ]'
        $textWords = $textString -split '\s+'

        $statistic = $textWords | ForEach-Object -Begin { $hash = @{} } -Process {
            $tmp = $_
            $hash."'$tmp'" ++
        } -End { $hash }

        if ( $exclude ) {
            Write-Verbose -Message "EXCLUDE = $Exclude"
            $excludeString = $(Get-Content -Path $exclude) -join ' '
            $excludeString = $excludeString -replace "`n", ' '
            $excludeString = $excludeString -replace '[^a-z| ]'
            $excludeWords = $excludeString -split '\s+'
            $excludeWords | ForEach-Object {
                if ($statistic.ContainsKey($_)) {
                    $statistic.Remove($_)
                }
            }
        }
        Write-Verbose -Message 'Word frequency in descending order, then word in ascending order'

        $statistic.GetEnumerator() |
            Sort-Object -Property @{Expression = { $_.Value }; Descending = $true },
                @{Expression = { $_.Name }; Descending = $false } |
            Select-Object -Property @{Name = 'Word'; Expr = { $_.Key -replace "'" } }, @{Name = 'Frequency'; Expr = {$_.Value}}

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

} #EndFunction Get-WordCount
