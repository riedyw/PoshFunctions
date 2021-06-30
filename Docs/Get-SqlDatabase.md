---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://social.msdn.microsoft.com/Forums/vstudio/en-US/0221d962-26e6-4a7e-be7a-72cd669a0dfc/why-systemmathround0251-2?forum=vbgeneral

Talks about Visual Basic but the same info applies to Powershell.
schema: 2.0.0
---

# Get-SqlDatabase

## SYNOPSIS
Get list of SQL databases

## SYNTAX

```
Get-SqlDatabase [[-ServerInstance] <String>] [[-Database] <String>] [-IncludeSystemDatabase]
 [<CommonParameters>]
```

## DESCRIPTION
Get list of SQL databases.
Can optionally look for a particular database and can optionally include system databases which are excluded by default

## EXAMPLES

### EXAMPLE 1
```
Get-SqlDatabase
```

Returns list of databases that match the criteria

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

### -IncludeSystemDatabase
Switch to include system databases: 'master', 'model', 'msdb', 'tempdb'

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
2 - outputs a psobject containing:
    Name

## RELATED LINKS
