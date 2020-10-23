---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# ConvertFrom-Base64

## SYNOPSIS
Convert from a Base64 string to normal string

## SYNTAX

```
ConvertFrom-Base64 [-StringFrom] <String> [<CommonParameters>]
```

## DESCRIPTION
Convert from a Base64 string to normal string

## EXAMPLES

### EXAMPLE 1
```
ConvertFrom-Base64 "SABlAGwAbABvAA=="
```

Would return
Hello

## PARAMETERS

### -StringFrom
A base64 encoded string

```yaml
Type: String
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

### [string]
## NOTES

## RELATED LINKS

[about_Properties]()

