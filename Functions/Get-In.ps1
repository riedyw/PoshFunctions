Function Get-In {
<#
.SYNOPSIS
    To mimic the behavior of -in and -notin which are not present in Powershell version 2
.DESCRIPTION
    To mimic the behavior of -in and -notin which are not present in Powershell version 2
.PARAMETER ItemToFind
    The string that you are looking for in the list
.PARAMETER ListToSearch
    The single string, or array of strings that you are comparing to
.PARAMETER In
    A boolean to indicate whether -in ($true) or -notin ($false)
.NOTES
    Is necessary only for PowerShell 2 as PowerShell 3 introduced -in and -not in operators
.EXAMPLE
    Get-In -ItemToFind "Hello" -ListToSearch @("Hello","Goodbye")
    Would return:
    Hello
.EXAMPLE
    Get-In -ItemToFind "Hello" -ListToSearch @("Hello","Goodbye") -in:$FALSE
    Would return:
    $null
.EXAMPLE
    Get-In -ItemToFind "Hello" -ListToSearch @("Hello","Goodbye") -Verbose
    Would return:
    VERBOSE: Testing if [Hello] is found IN the list [Hello,Goodbye]
    Hello
.EXAMPLE
    #
    Assuming you have an array $shares which lists all of the shares on the current computer. You have another array $ignoreshares that lists all of the drive letter shares (c$, d$, etc)
    Using a simple check determining the version of Powershell, and if Version 2 run a command. If version 3 or higher save the command string to a variable $command and then issue invoke-expression $command

    if ($PsVersionTable.psversion.major -eq 2) {
        $shares = $shares | where { get-in -ItemToFind ($_.ShareName) -ListToSearch $ignoreshares -in:$false }
    } else {
        $Command = '$shares | Where-Object { $_.ShareName -notin $ignoreShares }'
        invoke-expression $Command
    }

    # Would return the same list whether running on Powershell Version 2 or higher
.OUTPUTS
    A [string] if successful, $null if not
#>
    [CmdletBinding()]
    Param (
        [parameter(Mandatory,HelpMessage='Add help message for user')]
        [string] $ItemToFind,

        [parameter(Mandatory,HelpMessage='Add help message for user')]
        [string[]] $ListToSearch,

        [parameter()]
        [bool] $In = $true

    )
    # Initialize
    if ($In) {
        write-verbose -message "Testing if [$($ItemToFind)] is found IN the list [$($ListToSearch -join ',')]"
        $ListToSearch | Where-object { $_ -eq $ItemToFind }
    } else {
        write-verbose -message "Testing if [$($ItemToFind)] is NOT found IN the list [$($ListToSearch -join ',')]"
        $ItemToFind | foreach-object {
            $curItem = $_  ;
            $found = $false ;
            foreach ($ListItem in $ListToSearch) {
                if ($ListItem -eq $curItem) {
                    $found = $true
                }
            }
            if (-not $found) {
                $curItem
            }
        }
    }
} #EndFunction Get-In
