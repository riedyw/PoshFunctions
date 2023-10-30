---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-Fortune

## SYNOPSIS

Display a short quote

## SYNTAX

### __AllParameterSets

```
Get-Fortune [[-Path <String>]] [[-Delimiter <String>]] [-Speak] [<CommonParameters>]
```

## DESCRIPTION

Display a short quote from a file which defaults to: 'c:\scripts\wisdom.txt') but can be changed with parameter -Path.


## EXAMPLES


## PARAMETERS

### -Delimiter

Indicates delimiter between the individual fortunes.
Defaults to "`n%`n" (newline percent newline)

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: %
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

A path to a filename containing the fortunes.
Defaults to: ((Split-Path -path $profile)+'\wisdom.txt')
Aliased to 'FileName' and 'Fortune'

```yaml
Type: String
Parameter Sets: (All)
Aliases: FileName,Fortune
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $script:FortuneFile
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Speak

{{ Fill Speak Description }}

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [string]



## NOTES

# Sample wisdom.txt file with 3 entries.
 Each 'fortune' is delimited by a line consisting of just the pct sign
# The last fortune in the file should NOT be terminated with a pct sign
%
This too will pass.
   - Attar
%
Don't think, just do.
   - Horace
%
Time is money.
   - Benjamin Franklin


## RELATED LINKS

[Get-Content
Get-Random
Split-Path] ()

