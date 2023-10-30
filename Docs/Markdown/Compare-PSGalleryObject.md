---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Compare-PSGalleryObject

## SYNOPSIS

Compares the installed module(s) or script(s) that have been installed from PowerShellGallery.com

## SYNTAX

### Module (Default)

```
Compare-PSGalleryObject [-AllowPrerelease] [-Module] [-Name <String>] [-NeedUpgrade] [<CommonParameters>]
```

### Script

```
Compare-PSGalleryObject [-AllowPrerelease] [-Name <String>] [-NeedUpgrade] [-Script] [<CommonParameters>]
```

## DESCRIPTION

Compares the installed module(s) or script(s) that have been installed from PowerShellGallery.com.
You can enter an object name with wildcards.
Optionally you can choose to only see those objects that need to be upgraded.
Defaults to searching for modules.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Compare-PSGalleryObject -Name *Functions
```

Would only return those modules that end with the string 'Functions'





### Example 2: EXAMPLE 2

```
Compare-PSGalleryObject -Name New-TextMenu -Script
```

Would return the state of the installed script 'New-TextMenu'






## PARAMETERS

### -AllowPrerelease

A switch that will search PSGallery for prerelease versions

```yaml
Type: SwitchParameter
Parameter Sets: Script, Module
Aliases: 
Accepted values: 

Required: True (None) False (Script, Module)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Module

A switch indicating the function should just return modules.
This is the default behavior.

```yaml
Type: SwitchParameter
Parameter Sets: Module
Aliases: 
Accepted values: 

Required: True (None) False (Module)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Name

An optional parameter indicating the name of the object you are looking for.
Wildcards are acceptable.

```yaml
Type: String
Parameter Sets: Script, Module
Aliases: 
Accepted values: 

Required: True (None) False (Script, Module)
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -NeedUpgrade

A switch indicating the function should only return those objects that need to be upgraded

```yaml
Type: SwitchParameter
Parameter Sets: Script, Module
Aliases: 
Accepted values: 

Required: True (None) False (Script, Module)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Script

A switch indicating the function should just return scripts.

```yaml
Type: SwitchParameter
Parameter Sets: Script
Aliases: 
Accepted values: 

Required: True (None) False (Script)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### psobject



## NOTES

Does NOT appear to work properly in pwsh

Inspired by Get-ModuleVersionInformation at: https://tfl09.blogspot.com/2018/07/keeping-powershell-modules-up-to-date.html

Changes:
* renamed function to Compare-PSGalleryObject
* switches to search for either Module or Script object types, -Module or -Script
* switch to display only those objects needing to be upgraded, -NeedUpgrade
* comment based help
* write-verbose statements
* added -AllowPrerelease to Find-Module / Find-Script statements


## RELATED LINKS

Fill Related Links Here

