---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Set-Numlock

## SYNOPSIS
Sets the state of the NumLock button.
If you pass $true to function it will turn on NumLock.

## SYNTAX

```
Set-Numlock [[-State] <Boolean>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the state of the NumLock button.
If you pass $true to function it will turn on NumLock.
It first determines the state of the NumLock and then acts accordingly.

## EXAMPLES

### EXAMPLE 1
```
Set-NumLock -State
```

Will turn on the NumLock

### EXAMPLE 2
```
Set-NumLock -State:$false
```

Will turn off the NumLock

## PARAMETERS

### -State
A switch parameter to determine if you want the NumLock to be $true or $false.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: True
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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES
Author:      Bill Riedy
Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c
Changes:     Created function to set on or off the NumLock.
Requires use of helper function Test-IsNumLock

## RELATED LINKS

[New-Object]()

[Wscript.Shell]()

