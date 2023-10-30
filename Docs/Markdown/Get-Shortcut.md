---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-Shortcut

## SYNOPSIS

Get information about a Shortcut (.lnk file)

## SYNTAX

### __AllParameterSets

```
Get-Shortcut [[-Path <String>]] [<CommonParameters>]
```

## DESCRIPTION

Get information about a Shortcut (.lnk file)


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-Shortcut -path C:\portable\test2.lnk
```

LinkPath     : C:\portable\test2.lnk
Link         : test2.lnk
TargetPath   : C:\Windows\System32\ncpa.cpl
Target       : ncpa.cpl
Arguments    :
Hotkey       :
WindowStyle  : Normal
IconLocation : %SystemRoot%\system32\ncpa.cpl,0
RunAsAdmin   : False






## PARAMETERS

### -Path

Path to .lnk file

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Updates:
* added code to determine RunAsAdmin status
* added code to display WindowStyle as text as opposed to an integer

Main function inspired by:
https://stackoverflow.com/questions/484560/editing-shortcut-lnk-properties-with-powershell

Checking for RunAsAdmin inspired by:
https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/managing-shortcut-files-part-3


## RELATED LINKS

Fill Related Links Here

