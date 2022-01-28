---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Split-Line

## SYNOPSIS
To split a string line by line and return a string array

## SYNTAX

```
Split-Line [-String] <String> [<CommonParameters>]
```

## DESCRIPTION
To split a string line by line and force it to return a string array.
Here strings, script EOL character sequence, and system
default NewLine character can muck up parsing a string into lines.
This is an attempt to address this.

## EXAMPLES

### EXAMPLE 1
```
$HereString = @'
```

Server1
Server2
Server3
'@

$Object = Split-Line -String $HereString
$Object.Count

3

### EXAMPLE 2
```
(Split-Line -String 'SimpleString').GetType()
```

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     True     Object\[\]                                 System.Array

## PARAMETERS

### -String
The string that you want split line by line

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

### string[]
## NOTES

## RELATED LINKS
