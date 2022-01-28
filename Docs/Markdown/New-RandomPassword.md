---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://code.google.com/apis/chart/infographics/docs/qr_codes.html
schema: 2.0.0
---

# New-RandomPassword

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### ReadableTitleCase (Default)
```
New-RandomPassword [-MinLength <Int32>] [-MaxLength <Int32>] [-Readable] [-AvoidSimilar] [-TitleCase]
 [-FullWordList] [<CommonParameters>]
```

### ReadableRandomCase
```
New-RandomPassword [-MinLength <Int32>] [-MaxLength <Int32>] [-Readable] [-AvoidSimilar] [-RandomCase]
 [-FullWordList] [<CommonParameters>]
```

### Web
```
New-RandomPassword [-MinLength <Int32>] [-MaxLength <Int32>] [-NonAlphaChars <Int32>] [-AvoidSimilar] [-Web]
 [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AvoidSimilar
{{ Fill AvoidSimilar Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FullWordList
{{ Fill FullWordList Description }}

```yaml
Type: SwitchParameter
Parameter Sets: ReadableTitleCase, ReadableRandomCase
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxLength
{{ Fill MaxLength Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinLength
{{ Fill MinLength Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NonAlphaChars
{{ Fill NonAlphaChars Description }}

```yaml
Type: Int32
Parameter Sets: Web
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RandomCase
{{ Fill RandomCase Description }}

```yaml
Type: SwitchParameter
Parameter Sets: ReadableRandomCase
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Readable
{{ Fill Readable Description }}

```yaml
Type: SwitchParameter
Parameter Sets: ReadableTitleCase, ReadableRandomCase
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleCase
{{ Fill TitleCase Description }}

```yaml
Type: SwitchParameter
Parameter Sets: ReadableTitleCase
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Web
{{ Fill Web Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Web
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### string

## NOTES

## RELATED LINKS
