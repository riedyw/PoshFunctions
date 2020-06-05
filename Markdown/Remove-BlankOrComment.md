---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Remove-BlankOrComment

## SYNOPSIS
A simple text filter to remove blank lines or lines that begin with a comment character.

## SYNTAX

```
Remove-BlankOrComment [[-String] <String[]>] [-BeginComment <String>] [<CommonParameters>]
```

## DESCRIPTION
A simple text filter to remove blank lines or lines that begin with a comment character.
By default the begin comment toke is '#'.

## EXAMPLES

### EXAMPLE 1
```
'#Hello','','There' | Remove-BlankOrComment
```

Would return:
There

### EXAMPLE 2
```
Remove-BlankOrComment -verbose
```

Would return:
VERBOSE: No input

### EXAMPLE 3
```
'#Hello','','There' | Remove-BlankOrComment -verbose
```

VERBOSE: Line 1 is \[#Hello\]
VERBOSE: Line 2 is \[\]
VERBOSE: Line 3 is \[There\]
There
VERBOSE: Ending Remove-BlankOrComment

### EXAMPLE 4
```
get-content $env:appdata\code\user\settings.json | Remove-BlankOrComment -BeginComment '//' | convertfrom-json
```

To create a psobject of your VsCode settings.json file

## PARAMETERS

### -String
The input string array

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

### -BeginComment
The token indicating the beginning of a single line comment.
Defaults to '#'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: #
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string[]]
## NOTES
Author:     Bill Riedy

## RELATED LINKS

[about_Functions]()

