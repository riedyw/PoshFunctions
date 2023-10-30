---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-SqlStoredProcedure

## SYNOPSIS

Get SQL Stored Procedures

## SYNTAX

### __AllParameterSets

```
Get-SqlStoredProcedure [[-ServerInstance <String>]] [[-Database <String>]] [-IncludeSystemDatabase] [<CommonParameters>]
```

## DESCRIPTION

Get SQL Stored Procedures, on a database or a table LIKE string


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-SqlStoredProcedure
```

Returns all stored procedures for non-system databases that are active






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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### psobject



## NOTES

1 - User running this function must have Windows authentication to the database server
2 - outputs a psobject containing:
    DatabaseName, Schema, Procedure


## RELATED LINKS

Fill Related Links Here

