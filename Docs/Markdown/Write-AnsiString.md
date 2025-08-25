---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Write-AnsiString

## SYNOPSIS
Mimics the functionality of Write-Host with -ForegroundColor, -BackgroundColor, and -NoNewLine parameter and
converts it to a string with Ansi escape sequences to achieve the same colors

## SYNTAX

```
Write-AnsiString [-Object] <String> [-NoNewline] [-ForegroundColor <ConsoleColor>]
 [-BackgroundColor <ConsoleColor>] [<CommonParameters>]
```

## DESCRIPTION
Mimics the functionality of Write-Host with -ForegroundColor, -BackgroundColor, and -NoNewLine parameter and
converts it to a string with Ansi escape sequences to achieve the same colors

## EXAMPLES

### EXAMPLE 1
```
Write-AnsiString -ForegroundColor DarkBlue -BackgroundColor DarkYellow -Object 'Hello there'
```

Woud return
\[34m\[43mHello there\[0m

Which is the words 'Hello there' in DarkBlue on a DarkYellow background

## PARAMETERS

### -Object
{{ Fill Object Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoNewline
{{ Fill NoNewline Description }}

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

### -ForegroundColor
{{ Fill ForegroundColor Description }}

```yaml
Type: ConsoleColor
Parameter Sets: (All)
Aliases:
Accepted values: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BackgroundColor
{{ Fill BackgroundColor Description }}

```yaml
Type: ConsoleColor
Parameter Sets: (All)
Aliases:
Accepted values: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String
## NOTES
Inspired by my annoyance with my multi-statement colored prompt appearing as multiple lines in a transcript
of my PowerShell session.

## RELATED LINKS
