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

### Web (Default)
```
New-RandomPassword [-MinLength <Int32>] [-MaxLength <Int32>] [-NonAlphaChars <Int32>] [-AvoidSimilar]
 [<CommonParameters>]
```

### Readable
```
New-RandomPassword [-MinLength <Int32>] [-MaxLength <Int32>] [-Readable] [-AvoidSimilar] [<CommonParameters>]
```

## DESCRIPTION
Creates a new random password.
Parameters can be passed to determine minimum and maximum password lengths, whether to avoid characters that are similar to one another or to limit it to readable words

## EXAMPLES

### EXAMPLE 1
```
New-RandomPassword
```

e8P!VKyO

### EXAMPLE 2
```
New-RandomPassword -MinLength 16 -AvoidSimilar
```

RK##L@qFT5(3BArM

### EXAMPLE 3
```
New-RandomPassword -Readable -MinLength 8
```

eLFcUB7;

### EXAMPLE 4
```
New-RandomPassword -MinLength 16 -AvoidSimilar -Readable
```

and%6CRaBbuLLwan

### EXAMPLE 5
```
New-RandomPassword -MinLength 16 -MaxLength 20 -Readable -AvoidSimilar
```

ViEWpewhead9)chEF

## PARAMETERS

### -MinLength
Integer representing minimum password length, valid range 8-102 characters

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
Integer representing maximum password length, valid range 8-102 characters

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
Integer representing the number of non alphabetic characters

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
Switch indicating to use combinations of short English words.
Default behavior is to output a truly random string of characters

```yaml
Type: SwitchParameter
Parameter Sets: Readable
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AvoidSimilar
Switch to prevent characters that are similar to one another to be included.
For instance 1, l, I

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
