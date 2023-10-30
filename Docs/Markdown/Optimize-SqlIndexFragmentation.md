---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Optimize-SqlIndexFragmentation

## SYNOPSIS

Optimize SQL Index Fragmentation

## SYNTAX

### __AllParameterSets

```
Optimize-SqlIndexFragmentation [[-ServerInstance <String>]] [[-Database <String>]] [[-Table <String>]] [[-Type <String>]] [[-MinFragmentation <Int32>]] [[-MinPageCount <Int32>]] [-IncludeSystemDatabase] [-Interactive] [<CommonParameters>]
```

## DESCRIPTION

Optimize SQL Index Fragmentation, on a database or a table LIKE string.
Type can either be 'Rebuild', or 'Reorganize'


## EXAMPLES

### Example 1: EXAMPLE 1

```
Optimize-SqlIndexFragmentation
```

Returns index fragmentation on the default database instance on the local computer






## PARAMETERS

### -Database

String containing text for database name to be LIKE.
Wildcards can be used.
Defaults to '*'

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

Switch whether to include system databases

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

### -Interactive

Switch whether output should be interactive and provide progress

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

Integer representing the minimum fragmentation percentage level you want to address.
Valid range 1-99, defaults to 10

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 4
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -MinPageCount

Integer representing the minimum number of pages that must be in index before processing.
Must be greater than 0.
Default 200.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 5
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
Defaults to '*'

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

### -Type

String value, either 'Rebuild', or 'Reorganize'.
Defaults to 'Reorganize'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 3
Default value: Reorganize
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
2 - By default system databases are excluded
3 - outputs a psobject containing:
    DatabaseName, Schema, Table, Index, Avg_Fragmentation_In_Percent, Page_Count
4 - If edition of SQL is 'Enterprise' it can rebuild index in online mode
5 - Requires Get-SqlIndexFragmentation function
6 - Put in error checking to get around lack of INDEX PAGE LEVEL LOCKING


## RELATED LINKS

Fill Related Links Here

