---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Use-CallerPreference

## SYNOPSIS
Sets the PowerShell preference variables in a module's function based on the callers preferences.

## SYNTAX

```
Use-CallerPreference [-Cmdlet] <Object> [-SessionState] <SessionState> [<CommonParameters>]
```

## DESCRIPTION
Script module functions do not automatically inherit their caller's variables, including preferences set by common parameters.
This means if you call a script with switches like \`-Verbose\` or \`-WhatIf\`, those that parameter don't get passed into any function that belongs to a module.

When used in a module function, \`Use-CallerPreference\` will grab the value of these common parameters used by the function's caller:

 * ErrorAction
 * Debug
 * Confirm
 * InformationAction
 * Verbose
 * WarningAction
 * WhatIf

This function should be used in a module's function to grab the caller's preference variables so the caller doesn't have to explicitly pass common parameters to the module function.

This function is adapted from the \[\`Get-CallerPreference\` function written by David Wyatt\](https://gallery.technet.microsoft.com/scriptcenter/Inherit-Preference-82343b9d).

There is currently a \[bug in PowerShell\](https://connect.microsoft.com/PowerShell/Feedback/Details/763621) that causes an error when \`ErrorAction\` is implicitly set to \`Ignore\`.
If you use this function, you'll need to add explicit \`-ErrorAction $ErrorActionPreference\` to every function/cmdlet call in your function.
Please vote up this issue so it can get fixed.

## EXAMPLES

### EXAMPLE 1
```
Use-CallerPreference -Cmdlet $PSCmdlet -SessionState $ExecutionContext.SessionState
```

Demonstrates how to set the caller's common parameter preference variables in a module function.

## PARAMETERS

### -Cmdlet
\[Management.Automation.PSScriptCmdlet\]
 The module function's \`$PSCmdlet\` object.
Requires the function be decorated with the \`\[CmdletBinding()\]\` attribute.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SessionState
The module function's \`$ExecutionContext.SessionState\` object.
Requires the function be decorated with the \`\[CmdletBinding()\]\` attribute.

Used to set variables in its callers' scope, even if that caller is in a different script module.

```yaml
Type: SessionState
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[about_Preference_Variables]()

[about_CommonParameters]()

[https://gallery.technet.microsoft.com/scriptcenter/Inherit-Preference-82343b9d](https://gallery.technet.microsoft.com/scriptcenter/Inherit-Preference-82343b9d)

[http://powershell.org/wp/2014/01/13/getting-your-script-module-functions-to-inherit-preference-variables-from-the-caller/](http://powershell.org/wp/2014/01/13/getting-your-script-module-functions-to-inherit-preference-variables-from-the-caller/)

