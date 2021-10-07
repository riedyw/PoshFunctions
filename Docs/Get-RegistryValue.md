---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: http://code.msdn.microsoft.com/PSRemoteRegistry
schema: 2.0.0
---

# Get-RegistryValue

## SYNOPSIS
Get the values from a specified registry key

## SYNTAX

```
Get-RegistryValue [-RegistryKey] <String> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Get the values from a specified registry key.
Registry keys can begin either
with the 4 letter abbreviations or fully spelled out.
ExpandString (aka REG_EXPAND_SZ)
are NOT expanded.

## EXAMPLES

### EXAMPLE 1
```
Get-RegistryValue -RegistryKey 'HKEY_CURRENT_USER\Environment'
```

Name Type         Value
---- ----         -----
Path ExpandString %USERPROFILE%\AppData\Local\Microsoft\WindowsApps;
TEMP ExpandString %USERPROFILE%\AppData\Local\Temp
TMP  ExpandString %USERPROFILE%\AppData\Local\Temp

### EXAMPLE 2
```
Get-RegistryValue 'HKCU\Control Panel\Cursors' -IncludeInput | Select-Object -Last 4
```

RegistryKey                Name      Type   Value
-----------                ----      ----   -----
HKCU\Control Panel\Cursors SizeWE    String C:\WINDOWS\cursors\aero_ew.cur
HKCU\Control Panel\Cursors UpArrow   String C:\WINDOWS\cursors\aero_up.cur
HKCU\Control Panel\Cursors Wait      String C:\WINDOWS\cursors\aero_busy.ani
HKCU\Control Panel\Cursors (Default) String Windows Default

## PARAMETERS

### -RegistryKey
The full registry key.
Values can actually be copied from regedit.exe in the address bar.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Changed name from -IncludeRegistryKey to be consistent, aliased to 'IncludeRegistryKey' for backward compatibility

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeRegistryKey

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
