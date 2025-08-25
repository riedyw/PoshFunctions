---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-Fortune

## SYNOPSIS
Display a short quote

## SYNTAX

```
Get-Fortune [[-Path] <String>] [[-Delimiter] <String>] [-Speak] [<CommonParameters>]
```

## DESCRIPTION
Display a short quote from a file which defaults to: 'c:\scripts\wisdom.txt') but can be changed with parameter -Path.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Path
A path to a filename containing the fortunes.
Defaults to: (Get-Module -Name PoshFunctions).Path + '\Resources\Wisdom.txt'
Aliased to 'FileName' and 'Fortune'

```yaml
Type: String
Parameter Sets: (All)
Aliases: FileName, Fortune

Required: False
Position: 1
Default value: $script:FortuneFile
Accept pipeline input: False
Accept wildcard characters: False
```

### -Delimiter
Indicates delimiter between the individual fortunes.
Defaults to "\`n%\`n" (newline percent newline)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: %
Accept pipeline input: False
Accept wildcard characters: False
```

### -Speak
{{ Fill Speak Description }}

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

### [string]
## NOTES
When this function reads in the file it will replace CRLF ("\`r\`n") with LF ("\`n") so as to simplify the Delimiter parameter

## RELATED LINKS

[Get-Content
Get-Random
Split-Path]()

