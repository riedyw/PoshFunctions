---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-RandomPassword

## SYNOPSIS

Creates a new random password

## SYNTAX

### ReadableTitleCase (Default)

```
New-RandomPassword [-AvoidSimilar] [-FullWordList] [-MaxLength <Int32>] [-MinLength <Int32>] [-Readable] [-TitleCase] [<CommonParameters>]
```

### ReadableRandomCase

```
New-RandomPassword [-AvoidSimilar] [-FullWordList] [-MaxLength <Int32>] [-MinLength <Int32>] [-RandomCase] [-Readable] [<CommonParameters>]
```

### Web

```
New-RandomPassword [-AvoidSimilar] [-MaxLength <Int32>] [-MinLength <Int32>] [-NonAlphaChars <Int32>] [-Web] [<CommonParameters>]
```

## DESCRIPTION

Creates a new random password.
Parameters can be passed to determine minimum and maximum password lengths, whether to avoid characters that are similar to one another or to limit it to readable words.
Please read .NOTES section.


## EXAMPLES

### Example 1: EXAMPLE 1

```
New-RandomPassword -Web
```







### Example 2: EXAMPLE 2

```
New-RandomPassword -MinLength 16 -AvoidSimilar
```







### Example 3: EXAMPLE 3

```
New-RandomPassword -Readable -MinLength 8 -RandomCase
```







### Example 4: EXAMPLE 4

```
New-RandomPassword -MinLength 16 -AvoidSimilar -Web
```







### Example 5: EXAMPLE 5

```
New-RandomPassword -MinLength 16 -MaxLength 20 -Readable -AvoidSimilar
```








## PARAMETERS

### -AvoidSimilar

Switch to prevent characters that are similar to one another to be included.
For instance 1, l, I.
ParameterSetName: ReadableTitleCase, ReadableRandomCase, Web

```yaml
Type: SwitchParameter
Parameter Sets: ReadableRandomCase, ReadableTitleCase, Web
Aliases: 
Accepted values: 

Required: True (None) False (ReadableRandomCase, ReadableTitleCase, Web)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -FullWordList

Switch to use full word list of 370,103 words vs.
38,000 words

```yaml
Type: SwitchParameter
Parameter Sets: ReadableRandomCase, ReadableTitleCase
Aliases: 
Accepted values: 

Required: True (None) False (ReadableRandomCase, ReadableTitleCase)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -MaxLength

Integer representing maximum password length, valid range 8-102 characters.
ParameterSetName: ReadableTitleCase, ReadableRandomCase, Web

```yaml
Type: Int32
Parameter Sets: ReadableRandomCase, ReadableTitleCase, Web
Aliases: 
Accepted values: 

Required: True (None) False (ReadableRandomCase, ReadableTitleCase, Web)
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -MinLength

Integer representing minimum password length, valid range 8-102 characters.
ParameterSetName: ReadableTitleCase, ReadableRandomCase, Web

```yaml
Type: Int32
Parameter Sets: ReadableTitleCase, ReadableRandomCase, Web
Aliases: 
Accepted values: 

Required: True (None) False (ReadableTitleCase, ReadableRandomCase, Web)
Position: Named
Default value: 12
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -NonAlphaChars

Integer representing the number of non alphabetic characters.
ParameterSetName: Web

```yaml
Type: Int32
Parameter Sets: Web
Aliases: 
Accepted values: 

Required: True (None) False (Web)
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -RandomCase

Switch to randomly capitalize letters in each word.
ParameterSetName: ReadableRandomCase

```yaml
Type: SwitchParameter
Parameter Sets: ReadableRandomCase
Aliases: 
Accepted values: 

Required: True (None) False (ReadableRandomCase)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Readable

Switch indicating to use combinations of English words.
Default behavior is to output a words that are title cased.
ParameterSetName: ReadableTitleCase, ReadableRandomCase

```yaml
Type: SwitchParameter
Parameter Sets: ReadableRandomCase, ReadableTitleCase
Aliases: 
Accepted values: 

Required: True (None) False (ReadableRandomCase, ReadableTitleCase)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -TitleCase

Switch to capitalize each word.
ParameterSetName: ReadableTitleCase

```yaml
Type: SwitchParameter
Parameter Sets: ReadableTitleCase
Aliases: 
Accepted values: 

Required: True (None) False (ReadableTitleCase)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Web

Switch to use web algorithm.
ParameterSetName: Web

```yaml
Type: SwitchParameter
Parameter Sets: Web
Aliases: 
Accepted values: 

Required: True (None) False (Web)
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

Changes:

Added -TitleCase switch so that each word is capitalized
Added -RandomCase switch so that each letter is randomly capitalized
Added -Web switch so that web algorithm is used
Changed parameter set names to more accurately reflect what they do
Updated help comments
DefaultParameterSetName is 'ReadableTitleCase'
Added 'Q' to similar regex given closeness to 'O'


## RELATED LINKS

Fill Related Links Here

