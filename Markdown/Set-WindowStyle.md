---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Set-WindowStyle

## SYNOPSIS
To control the behavior of a window

## SYNTAX

```
Set-WindowStyle [[-Style] <String>] [[-MainWindowHandle] <Object>] [<CommonParameters>]
```

## DESCRIPTION
To control the behavior of a window

## EXAMPLES

### EXAMPLE 1
```
(Get-Process -Name notepad).MainWindowHandle | foreach { Set-WindowStyle MAXIMIZE $_ }
```

## PARAMETERS

### -Style
Describe parameter -Style.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: SHOW
Accept pipeline input: False
Accept wildcard characters: False
```

### -MainWindowHandle
Describe parameter -MainWindowHandle.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (Get-Process -Id $pid).MainWindowHandle
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
