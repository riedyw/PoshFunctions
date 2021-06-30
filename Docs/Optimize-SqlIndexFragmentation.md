---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Optimize-SqlIndexFragmentation

## SYNOPSIS
Optimize SQL Index Fragmentation

## SYNTAX

```
Optimize-SqlIndexFragmentation [[-ServerInstance] <String>] [[-Database] <String>] [[-Table] <String>]
 [[-Type] <String>] [-Interactive] [-IncludeSystemDatabase] [[-MinFragmentation] <Int32>]
 [[-MinPageCount] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Optimize SQL Index Fragmentation, on a database or a table LIKE string.
Type can either be 'Rebuild', or 'Reorganize'

## EXAMPLES

### EXAMPLE 1
```
Optimize-SqlIndexFragmentation
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
Defaults to '*'

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
Defaults to '*'

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

### -Type
String value, either 'Rebuild', or 'Reorganize'.
Defaults to 'Reorganize'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Reorganize
Accept pipeline input: False
Accept wildcard characters: False
```

### -Interactive
Switch whether output should be interactive and provide progress

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

### -IncludeSystemDatabase
Switch whether to include system databases

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
Position: 5
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
Position: 6
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
2 - By default system databases are excluded
3 - outputs a psobject containing:
    DatabaseName, Schema, Table, Index, Avg_Fragmentation_In_Percent, Page_Count
4 - If edition of SQL is 'Enterprise' it can rebuild index in online mode
5 - Requires Get-SqlIndexFragmentation function

## RELATED LINKS
