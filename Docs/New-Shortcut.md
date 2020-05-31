---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# New-Shortcut

## SYNOPSIS
This script is used to create a  shortcut.

## SYNTAX

```
New-Shortcut [-Path] <String> [-TargetPath] <String> [[-Arguments] <String>] [[-Description] <String>]
 [[-HotKey] <String>] [[-WorkDir] <String>] [[-WindowStyle] <Int32>] [[-Icon] <String>] [-Admin] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This script uses a Com Object to create a shortcut.

## EXAMPLES

### EXAMPLE 1
```
New-Shortcut -Path c:\temp\notepad.lnk -TargetPath c:\windows\notepad.exe
```

Creates a simple shortcut to Notepad at c:\temp\notepad.lnk

### EXAMPLE 2
```
New-Shortcut "$($env:Public)\Desktop\Notepad" c:\windows\notepad.exe -WindowStyle 3 -admin
```

Creates a shortcut named Notepad.lnk on the Public desktop to notepad.exe that launches maximized after prompting for
admin credentials.

### EXAMPLE 3
```
New-Shortcut "$($env:USERPROFILE)\Desktop\Notepad.lnk" c:\windows\notepad.exe -icon "c:\windows\system32\shell32.dll,99"
```

Creates a shortcut named Notepad.lnk on the user's desktop to notepad.exe that has a pointy finger icon (on Windows 7).

### EXAMPLE 4
```
New-Shortcut "$($env:USERPROFILE)\Desktop\Notepad.lnk" c:\windows\notepad.exe C:\instructions.txt
```

Creates a shortcut named Notepad.lnk on the user's desktop to notepad.exe that opens C:\instructions.txt

### EXAMPLE 5
```
New-Shortcut "$($env:USERPROFILE)\Desktop\ADUC" %SystemRoot%\system32\dsa.msc -admin
```

Creates a shortcut named ADUC.lnk on the user's desktop to Active Directory Users and Computers that launches after
prompting for admin credentials

region Parameters

## PARAMETERS

### -Path
The path to the shortcut file. 
.lnk will be appended if not specified. 
If the folder name doesn't exist, it will be created.

```yaml
Type: String
Parameter Sets: (All)
Aliases: File, Shortcut

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TargetPath
Full path of the target executable or file.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Target

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Arguments
Arguments for the executable or file.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Args, Argument

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Description
Description of the shortcut.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Desc

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -HotKey
Hotkey combination for the shortcut. 
Valid values are SHIFT+F7, ALT+CTRL+9, etc. 
An invalid entry will cause the
function to fail.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WorkDir
Working directory of the application. 
An invalid directory can be specified, but invoking the application from the
shortcut could fail.

```yaml
Type: String
Parameter Sets: (All)
Aliases: WorkingDirectory, WorkingDir

Required: False
Position: 6
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WindowStyle
Windows style of the application, Normal (1), Maximized (3), or Minimized (7). 
Invalid entries will result in Normal
behavior.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Icon
Full path of the icon file. 
Executables, DLLs, etc with multiple icons need the number of the icon to be specified,
otherwise the first icon will be used, i.e.:  c:\windows\system32\shell32.dll,99

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Admin
Used to create a shortcut that prompts for admin credentials when invoked, equivalent to specifying runas.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Strings and Integer

## OUTPUTS

### True or False, and a shortcut

## NOTES
Author        : Rhys Edwards
Email        : powershell@nolimit.to

## RELATED LINKS

[Script posted over:  N/A]()

