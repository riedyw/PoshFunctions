---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Export-FontSample

## SYNOPSIS

Exports an HTML file containing sample text formatted in all the fonts installed on the current system.

## SYNTAX

### __AllParameterSets

```
Export-FontSample [[-Path <String>]] [[-Text <String[]>]] [-Quiet] [-Show] [<CommonParameters>]
```

## DESCRIPTION

Exports an HTML file containing sample text formatted in all the fonts installed on the current system.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Export-FontSample
```








## PARAMETERS

### -Path

The path to the file that you want the font sample exported to.
If the file does not end in either '.htm', or '.html' then an extension of '.htm' will be added to the file.

```yaml
Type: String
Parameter Sets: (All)
Aliases: FileName
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: .\FontSample.htm
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Quiet

Switch to produce no output to the PowerShell session

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

### -Show

Switch to open the produced HTML file with the default browser

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
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: @(
               'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
               'abcdefghijklmnopqrstuvwxyz',
               '1234567890',
                '!@#$%^&*()[]{}-_=+ ??'
            )
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

