---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-RegistryValue

## SYNOPSIS

Get the values from a specified registry key

## SYNTAX

### __AllParameterSets

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

### Example 1: EXAMPLE 1

```
Get-RegistryValue -RegistryKey 'HKEY_CURRENT_USER\Environment'
```

Name Type         Value
---- ----         -----
Path ExpandString %USERPROFILE%\AppData\Local\Microsoft\WindowsApps;
TEMP ExpandString %USERPROFILE%\AppData\Local\Temp
TMP  ExpandString %USERPROFILE%\AppData\Local\Temp





### Example 2: EXAMPLE 2

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

### -IncludeInput

Changed name from -IncludeRegistryKey to be consistent, aliased to 'IncludeRegistryKey' for backward compatibility

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeRegistryKey
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -RegistryKey

The full registry key.
Values can actually be copied from regedit.exe in the address bar.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

