function Measure-Char {
<#
.SYNOPSIS
    To count the number of times a character appears in a string, or an array of strings.
.DESCRIPTION
    To count the number of times a character appears in a string, or an array of strings.
    By default the function is case sensitive, but can be controlled with the $IgnoreCase switch.
    Can also optionally include the command line parameters passed to the program with the $IncludeInput switch
.PARAMETER String
    A string, or an array of strings to count character against. Can accept pipeline input.
.PARAMETER Char
    The individual character that you wish to count occurrences of.
.PARAMETER IgnoreCase
    By default this function is case sensitive and this switch makes the function case insensitive.
.PARAMETER IncludeInput
    A switch to display the parameters specified when the function was called and the resulting count. Aliased to 'IncludeOriginal'
.EXAMPLE
    Measure-Char -String 'Password' -Char 'S' -IgnoreCase -IncludeInput

    Would return
    String   Char IgnoreCase Count
    ------   ---- ---------- -----
    Password    S True           2
.EXAMPLE
    Measure-Char -String 'Password' -Char 'S'

    Would return
    0
    as the function by default is case sensitive.
#>

    # todo Change += to System.Collections.Arraylist

    [cmdletbinding()]
    param(
        [parameter(Mandatory, HelpMessage='Enter the string you wish to search for a particular character', ValueFromPipeline, Position = 0)]
        [string[]] $String,

        [parameter(Mandatory, HelpMessage='The character you want to search for', Position = 1)]
        [char] $Char,

        [switch] $IgnoreCase,

        [Alias('IncludeOriginal')]
        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        [char[]] $CharArray = @()
        [string] $DisplayString = ''
    }

    process {
        foreach ($CurrentString in $String) {
            $CharArray += ([char[]] $CurrentString)
            if ($DisplayString -eq '') {
                $DisplayString = $CurrentString
            } else {
                $DisplayString = @($DisplayString, $CurrentString) -join ' '
            }
        }
    }

    end {
        if ($IgnoreCase) {
            $ReturnValue = ($CharArray | Where-Object { $_ -match $Char } | Measure-Object ).count
        } else {
            $ReturnValue = ($CharArray | Where-Object { $_ -cmatch $Char } | Measure-Object ).count
        }

        if ($IncludeInput) {
            New-Object -TypeName 'pscustomobject' -Property ([ordered] @{
                    String     = $DisplayString
                    Char       = $Char
                    IgnoreCase = $IgnoreCase
                    Count      = $ReturnValue
                })
        } else {
            Write-Output -InputObject $ReturnValue
        }
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
