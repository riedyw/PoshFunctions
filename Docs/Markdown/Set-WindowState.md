---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Set-WindowState

## SYNOPSIS

Sets the window state of a currently running application

## SYNTAX

### InputObject (Default)

```
Set-WindowState [-InputObject] <Object[]> [[-State <String>]] [-SetForegroundWindow] [-SuppressErrors] [<CommonParameters>]
```

## DESCRIPTION

Sets the window state of a currently running application


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-Process notepad | Set-WindowState -State MAXIMIZE -SetForegroundWindow
```

Will take the currently running Notepad.exe process, maximize it, and put it into the foreground






## PARAMETERS

### -InputObject

Describe parameter -InputObject.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -SetForegroundWindow

Determines whether the application will become the foreground (currently selected) application

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -State

Which state you want to place the application into.
Validate set: 'FORCEMINIMIZE', 'HIDE', 'MAXIMIZE', 'MINIMIZE', 'RESTORE',
                 'SHOW', 'SHOWDEFAULT', 'SHOWMAXIMIZED', 'SHOWMINIMIZED',
                 'SHOWMINNOACTIVE', 'SHOWNA', 'SHOWNOACTIVATE', 'SHOWNORMAL'
Defaults to 'SHOW'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: SHOW
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -SuppressErrors

Control error processing

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Most of this code was taken from GitHub.
I added help, put in Write-Verbose, option for pushing the application to the foreground


## RELATED LINKS

[] (https://gist.github.com/Nora-Ballard/11240204)

