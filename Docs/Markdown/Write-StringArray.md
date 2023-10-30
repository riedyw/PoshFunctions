---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Write-StringArray

## SYNOPSIS

Takes [string] or [string[]] input and writes the code that would create a string array with that information.

## SYNTAX

### __AllParameterSets

```
Write-StringArray [-Text] <String[]> [-ExcludeDollarSign] [-VariableName <String>] [<CommonParameters>]
```

## DESCRIPTION

Takes [string] or [string[]] input and writes the code that would create a string array with that information.
Encloses strings in single quotes replacing any existing single quotes with 2 x single quotes.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Write-StringArray -Text Hello,World,"it's me"
```

Would return
$StringArray = @(
    'Hello',
    'World',
    'it''s me'
)





### Example 2: EXAMPLE 2

```
1,2,99 | Write-StringArray -VariableName MyVariable
```

Would return
$MyVariable = @(
    '1',
    '2',
    '99'
)





### Example 3: EXAMPLE 3

```
1,2,99 | Write-StringArray -VariableName MyVariable -ExcludeDollarSign
```

Would return
MyVariable = @(
    '1',
    '2',
    '99'
)






## PARAMETERS

### -ExcludeDollarSign

Switch to exclude the dollar sign in front of the variable name.
Useful when trying to create string array for *.psd1 files

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

### -Text

The text to be included in the string array

```yaml
Type: String[]
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

### -VariableName

The name of the string array variable

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: StringArray
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string[]]



## NOTES



## RELATED LINKS

Fill Related Links Here

