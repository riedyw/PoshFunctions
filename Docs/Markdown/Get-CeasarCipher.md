---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-CeasarCipher

## SYNOPSIS

Shifts letters in string by a certain number of positions. Default shift is 13 characters or the classic ROT13.

## SYNTAX

### __AllParameterSets

```
Get-CeasarCipher [-Text] <String[]> [[-Key <Int32>]] [-Decode] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Shifts letters in string by a certain number of positions.
Default shift is 13 characters or the classic ROT13.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-CeasarCipher -Text Zoo, human -IncludeInput -Verbose
```

VERBOSE: Starting [Get-CeasarCipher]
VERBOSE: -Key [13] -Decode [False] -IncludeInput [True]
VERBOSE: Processing [Zoo]
VERBOSE: Processing [human]
VERBOSE: Ending [Get-CeasarCipher]
PlainText Key CipherText
--------- --- ----------
Zoo        13 Mbb
human      13 uhzna





### Example 2: EXAMPLE 2

```
Get-CeasarCipher -Text Zoo -Key 10
```

Jyy





### Example 3: EXAMPLE 3

```
Get-CeasarCipher -Text Jyy -Key 10 -Decode
```

Zoo






## PARAMETERS

### -Decode

Switch used if you want to decode cipher text by a certain number of characters.

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

### -IncludeInput

Switch that will include the input in the output

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

### -Key

The number of positions you want to switch.
Defaults to '13', valid range '1' through '25'

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: 13
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Text

A string array of plaintext that you want to run through the cipher.
Aliased to 'String' to provide backward compatibility.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: String
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Inspired by: https://titanwolf.org/Network/Articles/Article?AID=99197fe0-0b0e-4a9c-883e-49f4273a59ad#gsc.tab=0


## RELATED LINKS

Fill Related Links Here

