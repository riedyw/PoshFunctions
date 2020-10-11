---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# grep

## SYNOPSIS
A simple text filter to search for a string

## SYNTAX

```
grep [[-String] <String[]>] [[-Keyword] <String>] [<CommonParameters>]
```

## DESCRIPTION
A simple text filter to search for a string

## EXAMPLES

### EXAMPLE 1
```
'Hello','There' | grep 'Hello'
```

Would return
Hello

## PARAMETERS

### -String
{{ Fill String Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Keyword
The string searching for

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string]
## NOTES

## RELATED LINKS

[about_Functions]()

