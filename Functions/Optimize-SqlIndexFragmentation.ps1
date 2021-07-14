function Optimize-SqlIndexFragmentation {
    <#
.SYNOPSIS
    Optimize SQL Index Fragmentation
.DESCRIPTION
    Optimize SQL Index Fragmentation, on a database or a table LIKE string. Type can either be 'Rebuild', or 'Reorganize'
.PARAMETER ServerInstance
    Database instance that you wish to connect to. Defaults to $env:COMPUTERNAME
.PARAMETER Database
    String containing text for database name to be LIKE. Wildcards can be used. Defaults to '*'
.PARAMETER Table
    String containing text for table name to be LIKE. Wildcards can be used. Defaults to '*'
.PARAMETER Type
    String value, either 'Rebuild', or 'Reorganize'. Defaults to 'Reorganize'
.PARAMETER Interactive
    Switch whether output should be interactive and provide progress
.PARAMETER IncludeSystemDatabase
    Switch whether to include system databases
.PARAMETER MinFragmentation
    Integer representing the minimum fragmentation percentage level you want to address. Valid range 1-99, defaults to 10
.PARAMETER MinPageCount
    Integer representing the minimum number of pages that must be in index before processing. Must be greater than 0. Default 200.
.EXAMPLE
    Optimize-SqlIndexFragmentation

    Returns index fragmentation on the default database instance on the local computer
.NOTES
    1 - User running this function must have Windows authentication to the database server
    2 - By default system databases are excluded
    3 - outputs a psobject containing:
        DatabaseName, Schema, Table, Index, Avg_Fragmentation_In_Percent, Page_Count
    4 - If edition of SQL is 'Enterprise' it can rebuild index in online mode
    5 - Requires Get-SqlIndexFragmentation function
#>

    [CmdletBinding()]
    [outputtype('psobject')]
    param (
        [string] $ServerInstance = $env:COMPUTERNAME,

        [string] $Database = '*',

        [string] $Table = '*',

        [ValidateSet('Rebuild', 'Reorganize')]
        [string] $Type = 'Reorganize',

        [switch] $Interactive,

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
        Write-Verbose -Message "Type [$Type]"
        Write-Verbose -Message "Interactive [$Interactive]"
        Write-Verbose -Message "IncludeSystemDatabase [$IncludeSystemDatabase]"
        Write-Verbose -Message "MinFragmentation [$MinFragmentation]"
        Write-Verbose -Message "MinPageCount [$MinPageCount]"

        try {
            $SqlDbParam = @{
                ServerInstance = $ServerInstance
                Database       = 'master'
                Query          = "SELECT SERVERPROPERTY('Edition') as 'Edition';"
            }
            $SqlEdition = Invoke-Sqlcmd @SqlDbParam
            if ($SqlEdition.Edition -match 'Enterprise') {
                $Online = ' WITH (ONLINE = ON)'
            } else {
                $Online = ''
            }
        } catch {
            Write-Error -Message "Could not make SQL connection to [$ServerInstance], either server not up, or no permissions to connect."
            return
        }
        $FragParam = @{
            ServerInstance        = $ServerInstance
            Database              = $Database
            Table                 = $Table
            IncludeSystemDatabase = $IncludeSystemDatabase
            MinFragmentation      = $MinFragmentation
            MinPageCount          = $MinPageCount
        }
        Write-Verbose -Message 'Getting SQL Index Fragmentation...'
        [array] $TableList = Get-SqlIndexFragmentation @FragParam
        $TableList = $TableList | Sort-Object -Property DbName, Schema, Table, Index
    }

    process {
        if ($TableList) {
            Write-Verbose -Message "There are [$($TableList.count)] indexes to optimize"
            Write-Verbose -Message 'Creating command list...'
            $CommandsToRun = New-Object -TypeName 'System.Collections.ArrayList'
            $Type = 'Reorganize'
            $TableList | ForEach-Object {
                $Current = $_
                switch ($Current.Schema) {
                    'dbo' {
                        switch ($Type) {
                            'Rebuild' {
                                $CommandsToRun.Add((New-Object -TypeName psobject -Property ([ordered] @{
                                                Database = $Current.Dbname
                                                Query    = "UPDATE STATISTICS [$($Current.Table)]; " + "ALTER INDEX [$($Current.Index)] ON [$($Current.Table)] REBUILD $Online;"
                                            }))) | Out-Null
                            }
                            'Reorganize' {
                                $CommandsToRun.Add( (New-Object -TypeName psobject -Property ([ordered] @{
                                                Database = $Current.Dbname
                                                Query    = "UPDATE STATISTICS [$($Current.Table)]; " + "ALTER INDEX [$($Current.Index)] ON [$($Current.Table)] REORGANIZE;"
                                            }))) | Out-Null
                            }
                        }
                    }
                    default {
                        switch ($Type) {
                            'Rebuild' {
                                $CommandsToRun.Add( (New-Object -TypeName psobject -Property ([ordered] @{
                                                Database = $Current.Dbname
                                                Query    = "UPDATE STATISTICS [$($Current.Schema)].[$($Current.Table)]; " + "ALTER INDEX [$($Current.Index)] ON [$($Current.Schema)].[$($Current.Table)] REBUILD $Online;"
                                            }))) | Out-Null
                            }
                            'Reorganize' {
                                $CommandsToRun.Add( (New-Object -TypeName psobject -Property ([ordered] @{
                                                Database = $Current.Dbname
                                                Query    = "UPDATE STATISTICS [$($Current.Schema)].[$($Current.Table)]; " + "ALTER INDEX [$($Current.Index)] ON [$($Current.Schema)].[$($Current.Table)] REORGANIZE;"
                                            }))) | Out-Null
                            }
                        }
                    }
                }
            }
        } else {
            Write-Error -Message 'No indexes need to be optimized'
            return
        }

#        $CommandsToRun
#        return

        if ($Interactive) {
            $CommandsToRun | Show-Progress -Activity 'Optimizing database table indexes' -PassThru -Id 1 | ForEach-Object {
                Write-Verbose -Message "DB [$($_.Database)] QUERY [$($_.Query)]"
                Invoke-Sqlcmd -ServerInstance $ServerInstance -Database $_.Database -Query $_.Query -QueryTimeout 900 -Verbose:$false | Out-Null
            }
        } else {
            $CommandsToRun | ForEach-Object {
                Write-Verbose -Message "DB [$($_.Database)] QUERY [$($_.Query)]"
                Invoke-Sqlcmd -ServerInstance $ServerInstance -Database $_.Database -Query $_.Query -QueryTimeout 900 -Verbose:$false | Out-Null
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
