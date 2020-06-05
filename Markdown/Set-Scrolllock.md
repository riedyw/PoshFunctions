---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Set-Scrolllock

## SYNOPSIS
Sets the state of the ScrollLock button.

## SYNTAX

### On (Default)
```
Set-Scrolllock [-On] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Off
```
Set-Scrolllock [-Off] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the state of the ScrollLock button.
It first determines the state of the ScrollLock and then acts accordingly.

## EXAMPLES

### EXAMPLE 1
```
Set-ScrollLock
```

Will turn on the ScrollLock

### EXAMPLE 2
```
Set-ScrollLock -Off
```

Will turn off the ScrollLock

## PARAMETERS

### -On
A switch parameter to determine if you want the ScrollLock on.

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
A switch parameter to determine if you want the ScrollLock off.

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
Author:      Bill Riedy
Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c
Changes:     Created function to set on or off the ScrollLock.
Requires use of helper function Test-IsScrollLock

## RELATED LINKS

[New-Object]()

[Wscript.Shell]()

