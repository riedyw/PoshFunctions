---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-IsScrollLock

## SYNOPSIS

Sets the state of the ScrollLock button. If you pass $true to function it will turn on ScrollLock.

## SYNTAX

### __AllParameterSets

```
Test-IsScrollLock [<CommonParameters>]
```

## DESCRIPTION

Sets the state of the ScrollLock button.
If you pass $true to function it will turn on
ScrollLock.
It first determines the state of the ScrollLock and then acts accordingly.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Set-ScrollLock -State
```

Will turn on the ScrollLock





### Example 2: EXAMPLE 2

```
Set-ScrollLock -State:$false
```

Will turn off the ScrollLock






## PARAMETERS


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None



## OUTPUTS

### bool



## NOTES

Inspiration: # Inspired by https://gallery.technet.microsoft.com/on-off-keyboad-lock-keys-6ba9885c


## RELATED LINKS

Fill Related Links Here

