---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-InstalledModuleVersion

## SYNOPSIS
Get version information on installed modules and most recent version on PSGallery

## SYNTAX

```
Get-InstalledModuleVersion [<CommonParameters>]
```

## DESCRIPTION
Get version information on installed modules and most recent version on PSGallery

## EXAMPLES

### EXAMPLE 1
```
$ModuleVersions = Get-InstalledModuleVersion
```

$NeedToUpgrade = $ModuleVersions | Where-Object { $_.Version -ne $_.GalVersion }
Write-Host 'The following modules need to be updated'
$NeedToUpgrade

# To update the modules remove comment from following line
# $NeedToUpgrade | ForEach-Object { Update-Module -Name $_.Name }

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Inspired by https://tfl09.blogspot.com/2018/07/keeping-powershell-modules-up-to-date.html

* Added comment help
* Changed to use Get-InstalledModule for 2 reasons:
    1.
Shows only installed modules
    2.
Shows only most recent version of installed module on PSGallery

## RELATED LINKS
