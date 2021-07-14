---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://social.msdn.microsoft.com/Forums/vstudio/en-US/0221d962-26e6-4a7e-be7a-72cd669a0dfc/why-systemmathround0251-2?forum=vbgeneral

Talks about Visual Basic but the same info applies to Powershell.
schema: 2.0.0
---

# Get-SqlIndexFragmentation

## SYNOPSIS
Get SQL Index Fragmentation

## SYNTAX

```
Get-SqlIndexFragmentation [[-ServerInstance] <String>] [[-Database] <String>] [[-Table] <String>]
 [-IncludeSystemDatabase] [[-MinFragmentation] <Int32>] [[-MinPageCount] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Get SQL Index Fragmentation, on a database or a table LIKE string

## EXAMPLES

### EXAMPLE 1
```
Get-SqlIndexFragmentation
```

Returns index fragmentation on the default database instance on the local computer

## PARAMETERS

### -ServerInstance
Database instance that you wish to connect to.
Defaults to $env:COMPUTERNAME

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $env:COMPUTERNAME
Accept pipeline input: False
Accept wildcard characters: False
```

### -Database
String containing text for database name to be LIKE.
Wildcards can be used.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Table
String containing text for table name to be LIKE.
Wildcards can be used.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeSystemDatabase
{{ Fill IncludeSystemDatabase Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinFragmentation
{{ Fill MinFragmentation Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinPageCount
{{ Fill MinPageCount Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 200
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### psobject
## NOTES
1 - User running this function must have Windows authentication to the database server
2 - tempdb is excluded from the list of tables
3 - outputs a psobject containing:
    DatabaseName, Schema, Table, Index, Avg_Fragmentation_In_Percent, Page_Count

## RELATED LINKS
