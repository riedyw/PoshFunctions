---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# sed

## SYNOPSIS
A simple text filter to replace strings

## SYNTAX

```
sed [-Before] <String> [-After] <String> [<CommonParameters>]
```

## DESCRIPTION
A simple text filter to replace strings

## EXAMPLES

### EXAMPLE 1
```
'Hello There' | sed 'Hello' 'Goodbye'
```

Would return
Goodbye There

## PARAMETERS

### -Before
The string searching for

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -After
The string to replace it with

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
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
Author:     Bill Riedy

## RELATED LINKS

[about_Functions]()

