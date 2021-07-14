---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Convert-ObjectToHashtable

## SYNOPSIS
Takes a single object and converts its properties and values into a hashtable.

## SYNTAX

```
Convert-ObjectToHashtable [-object] <Object> [-ExcludeEmpty] [<CommonParameters>]
```

## DESCRIPTION
Takes a single object and converts its properties and values into a hashtable.

## EXAMPLES

### EXAMPLE 1
```
Convert-ObjectToHashtable -object Value -ExcludeEmpty
```

## PARAMETERS

### -object
The Object to turn into a hashtable

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ExcludeEmpty
Switch to exclude empty properties

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

### System.Collections.Hashtable[]
## NOTES
Source: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/turning-objects-into-hash-tables-2

## RELATED LINKS
