function Get-SqlDatabase {
    <#
.SYNOPSIS
    Get list of SQL databases
.DESCRIPTION
    Get list of SQL databases. Can optionally look for a particular database and can optionally include system databases which are excluded by default
.PARAMETER ServerInstance
    Database instance that you wish to connect to. Defaults to $env:COMPUTERNAME
.PARAMETER Database
    String containing text for database name to be LIKE. Wildcards can be used.
.PARAMETER IncludeSystemDatabase
    Switch to include system databases: 'master', 'model', 'msdb', 'tempdb'
.EXAMPLE
    Get-SqlDatabase

    Returns list of databases that match the criteria
.NOTES
    1 - User running this function must have Windows authentication to the database server
    2 - outputs a psobject containing:
        Name
#>

    # todo Change += to System.Collections.Arraylist

    [CmdletBinding()]
    [OutputType('psobject')]
    param (
        [string] $ServerInstance = $env:COMPUTERNAME,

        [string] $Database = '*',

        [switch] $IncludeSystemDatabase
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        # replace normal wildcards with SQL wildcards.
        # Need to use .Replace() method as it will do straight character replacement
        # -replace method uses regular expressions and it will barf on trying to replace '?' as that is special character in regex
        $Database = $Database.Replace('*', '%')
        $Database = $Database.Replace('?', '_')
        $Query = "SELECT Name FROM sys.databases WHERE state = 0 AND Name LIKE '$Database'"
        if (-not $IncludeSystemDatabase) {
            $Query += " AND Name NOT IN ('master', 'model', 'msdb', 'tempdb')"
        }
        $Query += ' ORDER BY Name'

    }

    process {
        try {
            $SqlDbParam = @{
                ServerInstance = $ServerInstance
                Database       = 'master'
                Query          = $Query
            }
            $DatabaseList = Invoke-Sqlcmd @SqlDbParam
            if (-not $DatabaseList) {
                Write-Error -Message "No databases that match [$Database]"
                break
            } else {
                Write-Output -InputObject $DatabaseList
            }
        } catch {
            Write-Error -Message "Could not make SQL connection to [$ServerInstance], either server not up, or SQL not running, or no permissions to connect."
            break
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
