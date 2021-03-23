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
Get-Shortcut [[-path] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get information about a Shortcut (.lnk file)

## EXAMPLES

### EXAMPLE 1
```
Get-Shortcut -Path 'C:\Portable\Test.lnk'
```

Link         : Test.lnk
TargetPath   : C:\Portable\PortableApps\Notepad++Portable\Notepad++Portable.exe
WindowStyle  : 1
IconLocation : ,0
Hotkey       :
Target       : Notepad++Portable.exe
Arguments    :
LinkPath     : C:\Portable\Test.lnk

## PARAMETERS

### -path
File

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

## RELATED LINKS
