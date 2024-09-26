---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Set-Scrolllock

## SYNOPSIS

Sets the state of the ScrollLock button.

## SYNTAX

### On (Default)

```
Set-Scrolllock [-Confirm] [-On] [-WhatIf] [<CommonParameters>]
```

### Off

```
Set-Scrolllock [-Confirm] [-Off] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION

Sets the state of the ScrollLock button.
It first determines the state of the ScrollLock and then acts accordingly.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Set-ScrollLock
```

Will turn on the ScrollLock





### Example 2: EXAMPLE 2

```
Set-ScrollLock -Off
```

Will turn off the ScrollLock






## PARAMETERS

### -Confirm

{{ Fill Confirm Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Off

A switch parameter to determine if you want the ScrollLock off.

```yaml
Type: SwitchParameter
Parameter Sets: Off
Aliases: 
Accepted values: 

Required: True (None) False (Off)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -On

A switch parameter to determine if you want the ScrollLock on.

```yaml
Type: SwitchParameter
Parameter Sets: On
Aliases: 
Accepted values: 

Required: True (None) False (On)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -WhatIf

{{ Fill WhatIf Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### 



## NOTES

Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c
Changes:     Created function to set on or off the ScrollLock.
Requires use of helper function Test-IsScrollLock


## RELATED LINKS

[Wscript.Shell] ()

