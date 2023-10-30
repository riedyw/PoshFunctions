---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://wonkysoftware.appspot.com
schema: 2.0.0
---

# Get-CeasarCipher

## SYNOPSIS
Shifts letters in string by a certain number of positions.
Default shift is 13 characters or the classic ROT13.

## SYNTAX

```
Get-CeasarCipher [-Text] <String[]> [[-Key] <Int32>] [-Decode] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Shifts letters in string by a certain number of positions.
Default shift is 13 characters or the classic ROT13.

## EXAMPLES

### EXAMPLE 1
```
Get-CeasarCipher -Text Zoo, human -IncludeInput -Verbose
```

VERBOSE: Starting \[Get-CeasarCipher\]
VERBOSE: -Key \[13\] -Decode \[False\] -IncludeInput \[True\]
VERBOSE: Processing \[Zoo\]
VERBOSE: Processing \[human\]
VERBOSE: Ending \[Get-CeasarCipher\]
PlainText Key CipherText
--------- --- ----------
Zoo        13 Mbb
human      13 uhzna

### EXAMPLE 2
```
Get-CeasarCipher -Text Zoo -Key 10
```

Jyy

### EXAMPLE 3
```
Get-CeasarCipher -Text Jyy -Key 10 -Decode
```

Zoo

## PARAMETERS

### -Text
A string array of plaintext that you want to run through the cipher.
Aliased to 'String' to provide backward compatibility.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: String

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Key
The number of positions you want to switch.
Defaults to '13', valid range '1' through '25'

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 13
Accept pipeline input: False
Accept wildcard characters: False
```

### -Decode
Switch used if you want to decode cipher text by a certain number of characters.

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

### -IncludeInput
Switch that will include the input in the output

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

## NOTES
Inspired by: https://titanwolf.org/Network/Articles/Article?AID=99197fe0-0b0e-4a9c-883e-49f4273a59ad#gsc.tab=0

## RELATED LINKS
