---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Remove-BlankOrComment

## SYNOPSIS

A simple text filter to remove blank lines or lines that begin with a comment character.

## SYNTAX

### __AllParameterSets

```
Remove-BlankOrComment [[-String <String[]>]] [-BeginComment <String>] [<CommonParameters>]
```

## DESCRIPTION

A simple text filter to remove blank lines or lines that begin with a comment character.
By default the begin comment token is '#'.
The comment character could be preceded by zero or more whitespace characters (space, tab)


## EXAMPLES

### Example 1: EXAMPLE 1

```
'#Hello','','There' | Remove-BlankOrComment
```

Would return:
There





### Example 2: EXAMPLE 2

```
Remove-BlankOrComment -verbose
```

Would return:
VERBOSE: No input





### Example 3: EXAMPLE 3

```
'#Hello','','There' | Remove-BlankOrComment -verbose
```

VERBOSE: Line 1 is [#Hello]
VERBOSE: Line 2 is []
VERBOSE: Line 3 is [There]
There
VERBOSE: Ending Remove-BlankOrComment





### Example 4: EXAMPLE 4

```
get-content $env:appdata\code\user\settings.json | Remove-BlankOrComment -BeginComment '//' | convertfrom-json
```

To create a psobject of your VsCode settings.json file






## PARAMETERS

### -BeginComment

The token indicating the beginning of a single line comment.
Defaults to '#'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: #
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -String

The input string array

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string[]]



## NOTES

Changed logic to regex escape on the begin comment token.


## RELATED LINKS

[about_Functions] ()

