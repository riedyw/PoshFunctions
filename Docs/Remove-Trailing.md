---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Remove-Trailing

## SYNOPSIS
Removes trailing spaces from a string or array of strings.

## SYNTAX

```
Remove-Trailing [-String] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes trailing spaces from a string or array of strings.

## EXAMPLES

### EXAMPLE 1
```
"[$(Remove-Trailing -String 'This has trailing spaces    ')]"
```

\[This has trailing spaces\]

## PARAMETERS

### -String
A string or array of strings that may have trailing spaces.
Can also accept input from the pipeline.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String[]
## NOTES

## RELATED LINKS
