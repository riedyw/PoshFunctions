---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://en.wikipedia.org/wiki/ROT13
schema: 2.0.0
---

# Convert-ROT13

## SYNOPSIS
Shifts letters in string by 13 positions.

## SYNTAX

```
Convert-ROT13 [-String] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Shifts letters in string by 13 positions.
'A' becomes 'N' and so on.

## EXAMPLES

### EXAMPLE 1
```
Convert-ROT13 -String 'Hello World!'
```

Would return
Uryyb Jbeyq!

### EXAMPLE 2
```
Convert-ROT13 -String 'Uryyb Jbeyq!'
```

Would return
Hello World!

### EXAMPLE 3
```
Convert-ROT13 -String 'This is a secret'
```

Would return
Guvf vf n frperg

### EXAMPLE 4
```
Convert-ROT13 -String 'one', 'two' -verbose
```

Would return
VERBOSE: String is \[one|two\]
VERBOSE: Current line is \[one\]
bar
VERBOSE: Current line is \[two\]
gjb

## PARAMETERS

### -String
A simple string or array of strings that you want Convert-ROT13 run against.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Text

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### [string[]]
## OUTPUTS

### [string[]]
## NOTES
Link:       https://en.wikipedia.org/wiki/ROT13

## RELATED LINKS

[https://en.wikipedia.org/wiki/ROT13](https://en.wikipedia.org/wiki/ROT13)

