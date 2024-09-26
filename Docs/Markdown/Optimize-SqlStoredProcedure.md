---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Optimize-SqlStoredProcedure

## SYNOPSIS

Optimize SQL Stored Procedures

## SYNTAX

### __AllParameterSets

```
Optimize-SqlStoredProcedure [[-ServerInstance <String>]] [[-Database <String>]] [-IncludeSystemDatabase] [-Interactive] [<CommonParameters>]
```

## DESCRIPTION

Optimize SQL Stored Procedures, on a database LIKE string.
Recompiles all stored procedures the next time they are run.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Optimize-SqlStoredProcedure
```

Determine all non system active databases, and issue sp_recompile on all found stored procedures






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
2 - By default system databases are excluded
3 - Requires Get-SqlStoredProcedure function


## RELATED LINKS

Fill Related Links Here

