---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Format-ReverseToken

## SYNOPSIS
To reverse a string that is broken into tokens by a delimiter

## SYNTAX

```
Format-ReverseToken [-String] <String[]> [-Delimiter <String>] [-IncludeInput] [-Trim] [<CommonParameters>]
```

## DESCRIPTION
To reverse a string that is broken into tokens by a delimiter

## EXAMPLES

### EXAMPLE 1
```
Format-ReverseToken -String 'google.com'
```

Would return
com.google

### EXAMPLE 2
```
Format-ReverseToken -String 'monster.us .google.com'
```

Would return
com.google.us .monster

### EXAMPLE 3
```
Format-ReverseToken -String 'monster.us .google.com' -Trim -IncludeInput
```

Would return
Original               Delimiter Trim ReverseToken
--------               --------- ---- ------------
monster.us .google.com . 
True com.google.us.monster

### EXAMPLE 4
```
'yahoo.com','google.com' | Format-ReverseToken
```

Would return
com.yahoo
com.google

### EXAMPLE 5
```
Format-ReverseToken -String 'monster;google;com' -Trim -Delimiter ';'
```

Would return
com;google;monster

## PARAMETERS

### -String
The string you wish to be reversed.
Can be a string or an array of strings.
Can be passed from the pipeline

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

### -Delimiter
The delimiter character that separates the tokens.
Defaults to '.'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: .
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Switch to display the input parameters with the output

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Trim
Switch to trim each token

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### string
## NOTES

## RELATED LINKS
