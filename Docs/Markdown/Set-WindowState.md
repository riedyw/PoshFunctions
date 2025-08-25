---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://gist.github.com/Nora-Ballard/11240204
schema: 2.0.0
---

# Set-WindowState

## SYNOPSIS
Sets the window state of a currently running application

## SYNTAX

```
Set-WindowState [-InputObject] <Object[]> [[-State] <String>] [-SuppressErrors] [-SetForegroundWindow]
 [<CommonParameters>]
```

## DESCRIPTION
Sets the window state of a currently running application

## EXAMPLES

### EXAMPLE 1
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

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
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

Required: False
Position: 2
Default value: SHOW
Accept pipeline input: False
Accept wildcard characters: False
```

### -SuppressErrors
Control error processing

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetForegroundWindow
Determines whether the application will become the foreground (currently selected) application

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

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
Most of this code was taken from GitHub.
I added help, put in Write-Verbose, option for pushing the application to the foreground

## RELATED LINKS

[https://gist.github.com/Nora-Ballard/11240204](https://gist.github.com/Nora-Ballard/11240204)

