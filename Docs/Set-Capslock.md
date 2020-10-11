---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Set-Capslock

## SYNOPSIS
Sets the state of the CapsLock button.

## SYNTAX

### On (Default)
```
Set-Capslock [-On] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Off
```
Set-Capslock [-Off] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the state of the CapsLock button.
It first determines the state of the CapsLock and then acts accordingly.

## EXAMPLES

### EXAMPLE 1
```
Set-CapsLock
```

Will turn on the CapsLock

### EXAMPLE 2
```
Set-CapsLock -Off
```

Will turn off the CapsLock

## PARAMETERS

### -On
A switch parameter to determine if you want the CapsLock on.

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
A switch parameter to determine if you want the CapsLock off.

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
Changes:     Created function to set on or off the CapsLock.
Requires use of helper function Test-IsCapsLock

## RELATED LINKS

[New-Object]()

[Wscript.Shell]()

