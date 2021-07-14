function Optimize-SqlStoredProcedure {
    <#
.SYNOPSIS
    Optimize SQL Stored Procedures
.DESCRIPTION
    Optimize SQL Stored Procedures, on a database LIKE string. Recompiles all stored procedures the next time they are run.
.PARAMETER ServerInstance
    Database instance that you wish to connect to. Defaults to $env:COMPUTERNAME
.PARAMETER Database
    String containing text for database name to be LIKE. Wildcards can be used. Defaults to '*'
.PARAMETER Interactive
    Switch whether output should be interactive and provide progress
.PARAMETER IncludeSystemDatabase
    Switch whether to include system databases
.EXAMPLE
    Optimize-SqlStoredProcedure

    Determine all non system active databases, and issue sp_recompile on all found stored procedures
.NOTES
    1 - User running this function must have Windows authentication to the database server
    2 - By default system databases are excluded
    3 - Requires Get-SqlStoredProcedure function
#>

    [CmdletBinding()]
    [outputtype('psobject')]
    param (
        [string] $ServerInstance = $env:COMPUTERNAME,

        [string] $Database = '*',

        [switch] $Interactive,

        [switch] $IncludeSystemDatabase
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ServerInstance [$ServerInstance]"
        Write-Verbose -Message "Database [$Database]"
        Write-Verbose -Message "Interactive [$Interactive]"
        Write-Verbose -Message "IncludeSystemDatabase [$IncludeSystemDatabase]"
        try {
            $SpParam = @{
                ServerInstance        = $ServerInstance
                Database              = $Database
                IncludeSystemDatabase = $IncludeSystemDatabase
            }
            $SpList = Get-SqlStoredProcedure @SpParam
            $SpList = $SpList | Sort-Object -Property DbName, Schema, Procedure
        } catch {
            Write-Error -Message "Could not make SQL connection to [$ServerInstance], either server not up, or no permissions to connect."
            return
        }
    }

    process {
        if ($Interactive) {
            $SpList | Show-Progress -Activity 'Recompiling all stored procedures' -PassThru -Id 1 | ForEach-Object {
                $CurSp = $_
                $SpQuery = "EXECUTE sp_recompile [$($CurSp.Schema).$($CurSp.Procedure)];`r`n"
                Write-Verbose -Message "DB [$($CurSp.DbName)] SCHEMA [$($CurSp.Schema)] PROCEDURE [$($CurSp.Procedure)]"
                Invoke-Sqlcmd -ServerInstance $ServerInstance -Database $CurSp.DbName -Query $SpQuery -QueryTimeout 300 -Verbose:$false | Out-Null
            }
        } else {
            $SpList | ForEach-Object {
                $CurSp = $_
                $SpQuery = "EXECUTE sp_recompile [$($CurSp.Schema).$($CurSp.Procedure)];`r`n"
                Write-Verbose -Message "DB [$($CurSp.DbName)] SCHEMA [$($CurSp.Schema)] PROCEDURE [$($CurSp.Procedure)]"
                Invoke-Sqlcmd -ServerInstance $ServerInstance -Database $CurSp.DbName -Query $SpQuery -QueryTimeout 300 -Verbose:$false | Out-Null
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
