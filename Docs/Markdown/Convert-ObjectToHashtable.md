---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Convert-ObjectToHashtable

## SYNOPSIS

Takes a single object and converts its properties and values into a hashtable.

## SYNTAX

### __AllParameterSets

```
Convert-ObjectToHashtable [-object] <PSObject> [-ExcludeEmpty] [<CommonParameters>]
```

## DESCRIPTION

Takes a single object and converts its properties and values into a hashtable.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Convert-ObjectToHashtable -object Value -ExcludeEmpty
```








## PARAMETERS

### -ExcludeEmpty

Switch to exclude empty properties

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

### -object

The Object to turn into a hashtable

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.Collections.Hashtable[]



## NOTES

Source: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-objects-into-hash-tables-2

# todo - need better example


## RELATED LINKS

Fill Related Links Here

