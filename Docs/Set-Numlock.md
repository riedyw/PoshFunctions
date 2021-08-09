---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Set-Numlock

## SYNOPSIS
Sets the state of the NumLock button.
If you pass $true to function it will turn on NumLock.

## SYNTAX

### On (Default)
```
Set-Numlock [-On] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Off
```
Set-Numlock [-Off] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the state of the NumLock button.
If you pass $true to function it will turn on NumLock.
It first determines the state of the NumLock and then acts accordingly.

## EXAMPLES

### EXAMPLE 1
```
Set-NumLock -On
```

Will turn on the NumLock

### EXAMPLE 2
```
Set-NumLock -Off
```

Will turn off the NumLock

## PARAMETERS

### -On
A switch parameter to determine if you want the NumLock on.

```yaml
Type: SwitchParameter
Parameter Sets: On
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Off
A switch parameter to determine if you want the NumLock off.

```yaml
Type: SwitchParameter
Parameter Sets: Off
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

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

## NOTES
Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c
Changes:     Created function to set on or off the NumLock.
Requires use of helper function Test-IsNumLock

## RELATED LINKS

[Wscript.Shell]()

