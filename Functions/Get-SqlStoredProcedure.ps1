function Get-SqlStoredProcedure {
    <#
.SYNOPSIS
    Get SQL Stored Procedures
.DESCRIPTION
    Get SQL Stored Procedures, on a database or a table LIKE string
.PARAMETER ServerInstance
    Database instance that you wish to connect to. Defaults to $env:COMPUTERNAME
.PARAMETER Database
    String containing text for database name to be LIKE. Wildcards can be used.
.PARAMETER IncludeSystemDatabase
    Switch whether to include system databases
.EXAMPLE
    Get-SqlStoredProcedure

    Returns all stored procedures for non-system databases that are active
.NOTES
    1 - User running this function must have Windows authentication to the database server
    2 - outputs a psobject containing:
        DatabaseName, Schema, Procedure
#>

    [CmdletBinding()]
    [outputtype('psobject')]
    param (
        [string] $ServerInstance = $env:COMPUTERNAME,

        [string] $Database = '*',

        [switch] $IncludeSystemDatabase
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ServerInstance [$ServerInstance]"
        Write-Verbose -Message "Database [$Database]"
        Write-Verbose -Message "IncludeSystemDatabase [$IncludeSystemDatabase]"
        try {
            $DatabaseList = Get-SqlDatabase -ServerInstance $ServerInstance -Database $Database -IncludeSystemDatabase:$IncludeSystemDatabase
            if (-not $DatabaseList) {
                Write-Error "No databases that match [$Database]"
                return
            }
        } catch {
            Write-Error "Could not make SQL connection to [$ServerInstance], either server not up, or no permissions to connect."
            return
        }
        $SpQuery = "
            SELECT
                DB_NAME() AS 'DBName',
                S.name AS 'Schema',
                P.name AS 'Procedure'
            FROM
                sys.procedures P
            INNER JOIN
                sys.schemas S ON P.schema_id = S.schema_id
            WHERE
                P.Type = 'P'
            ORDER BY
                'DBName', 'Schema', 'Procedure'
        "
    }

    process {
        $DatabaseList | ForEach-Object -Begin { $SpResult = @() } -Process {
            $CurDatabase = $_
            $SpResult += Invoke-Sqlcmd -ServerInstance $ServerInstance -Database $CurDatabase.Name -Query $SpQuery -QueryTime 300
        }
    }

    end {
        $SpResult = $SpResult | Sort-Object DBName, Schema, Procedure
        Write-Output -InputObject $SpResult
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
