function Get-SqlIndexFragmentation {
    <#
.SYNOPSIS
    Get SQL Index Fragmentation
.DESCRIPTION
    Get SQL Index Fragmentation, on a database or a table LIKE string
.PARAMETER ServerInstance
    Database instance that you wish to connect to. Defaults to $env:COMPUTERNAME
.PARAMETER Database
    String containing text for database name to be LIKE. Wildcards can be used.
.PARAMETER Table
    String containing text for table name to be LIKE. Wildcards can be used.
.EXAMPLE
    Get-SqlIndexFragmentation

    Returns index fragmentation on the default database instance on the local computer
.NOTES
    1 - User running this function must have Windows authentication to the database server
    2 - tempdb is excluded from the list of tables
    3 - outputs a psobject containing:
        DatabaseName, Schema, Table, Index, Avg_Fragmentation_In_Percent, Page_Count
#>

    [CmdletBinding()]
    [OutputType('psobject')]
    param (
        [string] $ServerInstance = $env:COMPUTERNAME,

        [string] $Database = '*',

        [string] $Table = '*',

        [switch] $IncludeSystemDatabase,

        [ValidateRange(1, 99)]
        [int] $MinFragmentation = 10,

        [ValidateScript( { ($_ -gt 0) })]
        [int] $MinPageCount = 200
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ServerInstance [$ServerInstance]"
        Write-Verbose -Message "Database [$Database]"
        Write-Verbose -Message "Table [$Table]"
        Write-Verbose -Message "IncludeSystemDatabase [$IncludeSystemDatabase]"
        Write-Verbose -Message "MinFragmentation [$MinFragmentation]"
        Write-Verbose -Message "MinPageCount [$MinPageCount]"
        $Table = $Table.Replace('*', '%')
        $Table = $Table.Replace('?', '_')
        try {
            $DatabaseList = Get-SqlDatabase -ServerInstance $ServerInstance -Database $Database -IncludeSystemDatabase:$IncludeSystemDatabase
            if (-not $DatabaseList) {
                Write-Error -Message "No databases that match [$Database]"
                break
            }
        } catch {
            Write-Error -Message "Could not make SQL connection to [$ServerInstance], either server not up, or no permissions to connect."
            break
        }
        $FragQuery = "
SELECT
    db_name() AS 'DBName',
    S.name AS 'Schema',
    T.name AS 'Table',
    I.name AS 'Index',
    DDIPS.avg_fragmentation_in_percent,
    DDIPS.page_count
FROM
    sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS DDIPS
INNER JOIN
    sys.tables T on T.object_id = DDIPS.object_id
INNER JOIN
    sys.schemas S on T.schema_id = S.schema_id
INNER JOIN
    sys.indexes I ON I.object_id = DDIPS.object_id
    AND DDIPS.index_id = I.index_id
WHERE
    T.name LIKE '$Table'
AND
    DDIPS.database_id = DB_ID()
AND
    DDIPS.avg_fragmentation_in_percent >= $MinFragmentation
AND
    DDIPS.page_count >= $MinPageCount
AND
    I.name IS NOT NULL
ORDER BY
    'DBName', 'Schema', 'Table', 'Index'
"
    }

    process {
        $DatabaseList | ForEach-Object -Begin { } -Process {
            $CurDatabase = $_
            Invoke-Sqlcmd -ServerInstance $ServerInstance -Database $CurDatabase.Name -Query $FragQuery -QueryTime 900 |
            Select-Object -Property DbName, Schema, Table, Index,
            @{Name = 'Avg_Fragmentation_In_Percent'; Expr = { ([float] ('{0:f2}' -f $_.avg_fragmentation_in_percent)) } }, Page_Count
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
