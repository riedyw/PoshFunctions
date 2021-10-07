---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://code.google.com/apis/chart/infographics/docs/qr_codes.html
schema: 2.0.0
---

# Optimize-SqlStoredProcedure

## SYNOPSIS
Optimize SQL Stored Procedures

## SYNTAX

```
Optimize-SqlStoredProcedure [[-ServerInstance] <String>] [[-Database] <String>] [-Interactive]
 [-IncludeSystemDatabase] [<CommonParameters>]
```

## DESCRIPTION
Optimize SQL Stored Procedures, on a database LIKE string.
Recompiles all stored procedures the next time they are run.

## EXAMPLES

### EXAMPLE 1
```
Optimize-SqlStoredProcedure
```

Determine all non system active databases, and issue sp_recompile on all found stored procedures

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### psobject
## NOTES
1 - User running this function must have Windows authentication to the database server
2 - By default system databases are excluded
3 - Requires Get-SqlStoredProcedure function

## RELATED LINKS
