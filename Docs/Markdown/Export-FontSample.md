---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Export-FontSample

## SYNOPSIS
Exports an HTML file containing sample text formatted in all the fonts installed on the current system.

## SYNTAX

```
Export-FontSample [[-Path] <String>] [[-Text] <String[]>] [-Quiet] [-Show] [<CommonParameters>]
```

## DESCRIPTION
Exports an HTML file containing sample text formatted in all the fonts installed on the current system.

## EXAMPLES

### EXAMPLE 1
```
Export-FontSample
```

## PARAMETERS

### -Path
The path to the file that you want the font sample exported to.
If the file does not end in either '.htm', or '.html' then an extension of '.htm' will be added to the file.
Defaults to the filename FontSample.htm in the path specified by $env:TEMP

```yaml
Type: String
Parameter Sets: (All)
Aliases: FileName

Required: False
Position: 1
Default value: (Join-Path -Path $env:TEMP -ChildPath 'FontSample.htm')
Accept pipeline input: False
Accept wildcard characters: False
```

### -Text
Sample text that you want to displayed in the HTML file.
Defaults to the string array:
@( 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
   'abcdefghijklmnopqrstuvwxyz',
   '1234567890',
    '!@#$%^&*()&#91;&#93;&#123;&#125;-_=+ &cent;&pound;',
    '&gamma;&delta;&theta;&lambda;&xi;&pi;&sigma;&upsilon;&psi;&omega;'
)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: @(
               'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
               'abcdefghijklmnopqrstuvwxyz',
               '1234567890',
               '!@#$%^&*()&#91;&#93;&#123;&#125;-_=+ &cent;&pound;',
               '&gamma;&delta;&theta;&lambda;&xi;&pi;&sigma;&upsilon;&psi;&omega;'
            )
Accept pipeline input: False
Accept wildcard characters: False
```

### -Quiet
Switch to produce no output to the PowerShell session

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

### -Show
Switch to open the produced HTML file with the default browser

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

## RELATED LINKS
