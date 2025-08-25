---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: http://code.google.com/apis/chart/infographics/docs/qr_codes.html
schema: 2.0.0
---

# New-RandomPassword

## SYNOPSIS
Creates a new random password

## SYNTAX

### ReadableTitleCase (Default)
```
New-RandomPassword [-MinLength <Int32>] [-MaxLength <Int32>] [-Readable] [-AvoidSimilar] [-TitleCase]
 [-FullWordList] [-NumeralCount <Int32>] [-SymbolCount <Int32>] [<CommonParameters>]
```

### ReadableRandomCase
```
New-RandomPassword [-MinLength <Int32>] [-MaxLength <Int32>] [-Readable] [-AvoidSimilar] [-RandomCase]
 [-FullWordList] [-NumeralCount <Int32>] [-SymbolCount <Int32>] [<CommonParameters>]
```

### Web
```
New-RandomPassword [-MinLength <Int32>] [-MaxLength <Int32>] [-NonAlphaChars <Int32>] [-AvoidSimilar] [-Web]
 [<CommonParameters>]
```

## DESCRIPTION
Creates a new random password.
Parameters can be passed to determine minimum and maximum password lengths, whether to avoid characters that are similar to one another or to limit it to readable words.
Please read .NOTES section.

## EXAMPLES

### EXAMPLE 1
```
New-RandomPassword -Web
```

### EXAMPLE 2
```
New-RandomPassword -MinLength 16 -AvoidSimilar
```

### EXAMPLE 3
```
New-RandomPassword -Readable -MinLength 8 -RandomCase
```

### EXAMPLE 4
```
New-RandomPassword -MinLength 16 -AvoidSimilar -Web
```

### EXAMPLE 5
```
New-RandomPassword -MinLength 16 -MaxLength 20 -Readable -AvoidSimilar
```

### EXAMPLE 6
```
New-RandomPassword -MinLength 16 -Readable -NumeralCount 2 -SymbolCount 2
```

Tonics39Sue@Joy(

## PARAMETERS

### -MinLength
Integer representing minimum password length, valid range 8-102 characters.
ParameterSetName: ReadableTitleCase, ReadableRandomCase, Web

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 12
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxLength
Integer representing maximum password length, valid range 8-102 characters.
ParameterSetName: ReadableTitleCase, ReadableRandomCase, Web

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -NonAlphaChars
Integer representing the number of non alphabetic characters.
ParameterSetName: Web

```yaml
Type: Int32
Parameter Sets: Web
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Readable
Switch indicating to use combinations of English words.
Default behavior is to output a words that are title cased.
ParameterSetName: ReadableTitleCase, ReadableRandomCase

```yaml
Type: SwitchParameter
Parameter Sets: ReadableTitleCase, ReadableRandomCase
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AvoidSimilar
Switch to prevent characters that are similar to one another to be included.
For instance 1, l, I.
ParameterSetName: ReadableTitleCase, ReadableRandomCase, Web

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

### -TitleCase
Switch to capitalize each word.
ParameterSetName: ReadableTitleCase

```yaml
Type: SwitchParameter
Parameter Sets: ReadableTitleCase
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -RandomCase
Switch to randomly capitalize letters in each word.
ParameterSetName: ReadableRandomCase

```yaml
Type: SwitchParameter
Parameter Sets: ReadableRandomCase
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Web
Switch to use web algorithm.
ParameterSetName: Web

```yaml
Type: SwitchParameter
Parameter Sets: Web
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FullWordList
Switch to use full word list of 370,103 words vs.
38,000 words

```yaml
Type: SwitchParameter
Parameter Sets: ReadableTitleCase, ReadableRandomCase
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NumeralCount
Integer representing the number of digits.
Valid range 1-2, default is 1

```yaml
Type: Int32
Parameter Sets: ReadableTitleCase, ReadableRandomCase
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -SymbolCount
Integer representing the number of symbol characters.
Valid range 1-2, default is 1

```yaml
Type: Int32
Parameter Sets: ReadableTitleCase, ReadableRandomCase
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### string
## NOTES
Changes:

Added -TitleCase switch so that each word is capitalized
Added -RandomCase switch so that each letter is randomly capitalized
Added -Web switch so that web algorithm is used
Changed parameter set names to more accurately reflect what they do
Updated help comments
DefaultParameterSetName is 'ReadableTitleCase'
Added 'Q' to similar regex given closeness to 'O'
Added NumeralCount and SymbolCount to increase complexity

## RELATED LINKS
