---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Format-ReverseToken

## SYNOPSIS

To reverse a string that is broken into tokens by a delimiter

## SYNTAX

### __AllParameterSets

```
Format-ReverseToken [-String] <String[]> [-Delimiter <String>] [-IncludeInput] [-Trim] [<CommonParameters>]
```

## DESCRIPTION

To reverse a string that is broken into tokens by a delimiter


## EXAMPLES

### Example 1: EXAMPLE 1

```
Format-ReverseToken -String 'google.com'
```

Would return
com.google





### Example 2: EXAMPLE 2

```
Format-ReverseToken -String 'monster.us .google.com'
```

Would return
com.google.us .monster





### Example 3: EXAMPLE 3

```
Format-ReverseToken -String 'monster.us .google.com' -Trim -IncludeInput
```

Would return
Original               Delimiter Trim ReverseToken
--------               --------- ---- ------------
monster.us .google.com .
        True com.google.us.monster





### Example 4: EXAMPLE 4

```
'yahoo.com','google.com' | Format-ReverseToken
```

Would return
com.yahoo
com.google





### Example 5: EXAMPLE 5

```
Format-ReverseToken -String 'monster;google;com' -Trim -Delimiter ';'
```

Would return
com;google;monster






## PARAMETERS

### -Delimiter

The delimiter character that separates the tokens.
Defaults to '.'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: .
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch to display the input parameters with the output

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

### -String

The string you wish to be reversed.
Can be a string or an array of strings.
Can be passed from the pipeline

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

### -Trim

Switch to trim each token

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### string



## NOTES



## RELATED LINKS

Fill Related Links Here

