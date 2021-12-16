---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://social.msdn.microsoft.com/Forums/vstudio/en-US/0221d962-26e6-4a7e-be7a-72cd669a0dfc/why-systemmathround0251-2?forum=vbgeneral

Talks about Visual Basic but the same info applies to Powershell.
schema: 2.0.0
---

# Get-Shortcut

## SYNOPSIS
Get information about a Shortcut (.lnk file)

## SYNTAX

```
Get-Shortcut [[-Path] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get information about a Shortcut (.lnk file)

## EXAMPLES

### EXAMPLE 1
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

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Updates:
* added code to determine RunAsAdmin status
* added code to display WindowStyle as text as opposed to an integer

Main function inspired by:
https://stackoverflow.com/questions/484560/editing-shortcut-lnk-properties-with-powershell

Checking for RunAsAdmin inspired by:
https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/managing-shortcut-files-part-3

## RELATED LINKS
