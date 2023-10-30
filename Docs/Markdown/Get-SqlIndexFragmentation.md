---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-SqlIndexFragmentation

## SYNOPSIS

Get SQL Index Fragmentation

## SYNTAX

### __AllParameterSets

```
Get-SqlIndexFragmentation [[-ServerInstance <String>]] [[-Database <String>]] [[-Table <String>]] [[-MinFragmentation <Int32>]] [[-MinPageCount <Int32>]] [-IncludeSystemDatabase] [<CommonParameters>]
```

## DESCRIPTION

Get SQL Index Fragmentation, on a database or a table LIKE string


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-SqlIndexFragmentation
```

Returns index fragmentation on the default database instance on the local computer






## PARAMETERS

### -Database

String containing text for database name to be LIKE.
Wildcards can be used.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeSystemDatabase

{{ Fill IncludeSystemDatabase Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -MinFragmentation

{{ Fill MinFragmentation Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 3
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -MinPageCount

{{ Fill MinPageCount Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 4
Default value: 200
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -ServerInstance

Database instance that you wish to connect to.
Defaults to $env:COMPUTERNAME

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $env:COMPUTERNAME
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Table

String containing text for table name to be LIKE.
Wildcards can be used.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### psobject



## NOTES

1 - User running this function must have Windows authentication to the database server
2 - tempdb is excluded from the list of tables
3 - outputs a psobject containing:
    DatabaseName, Schema, Table, Index, Avg_Fragmentation_In_Percent, Page_Count


## RELATED LINKS

Fill Related Links Here

