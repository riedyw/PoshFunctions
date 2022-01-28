---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Use-Stopwatch

## SYNOPSIS
Uses a stopwatch datatype found in module.
Can get stopwatch status, start, stop, reset, or restart.

## SYNTAX

### Status (Default)
```
Use-Stopwatch [-Status] [<CommonParameters>]
```

### Reset
```
Use-Stopwatch [-Reset] [-IncludeStatus] [<CommonParameters>]
```

### Restart
```
Use-Stopwatch [-Restart] [-IncludeStatus] [<CommonParameters>]
```

### Start
```
Use-Stopwatch [-Start] [-IncludeStatus] [<CommonParameters>]
```

### Stop
```
Use-Stopwatch [-Stop] [-IncludeStatus] [<CommonParameters>]
```

## DESCRIPTION
Uses a stopwatch datatype found in module.
Can get stopwatch status, start, stop, reset, or restart.

## EXAMPLES

### EXAMPLE 1
```
Use-Stopwatch -Verbose
```

When you first run this command the stopwatch will exist but has not been started.
The function would return:
VERBOSE: Starting \[Use-Stopwatch\]
VERBOSE: ParameterSetName \[Status\]
VERBOSE: IncludeStatus \[False\]

VERBOSE: Ending \[Use-Stopwatch\]
IsRunning Elapsed  ElapsedMilliseconds ElapsedTicks
--------- -------  ------------------- ------------
    False 00:00:00                   0            0

### EXAMPLE 2
```
Use-Stopwatch -Start -IncludeStatus
```

Would start the stopwatch and display the stopwatch and would return something similar to the following:
IsRunning Elapsed          ElapsedMilliseconds ElapsedTicks
--------- -------          ------------------- ------------
     True 00:00:00.0011733                   1        11933

### EXAMPLE 3
```
Use-Stopwatch -Stop -IncludeStatus
```

Would stop the stopwatch and display the stopwatch and return something similar to the following:
IsRunning Elapsed          ElapsedMilliseconds ElapsedTicks
--------- -------          ------------------- ------------
    False 00:01:21.2577089               81257    812577089

### EXAMPLE 4
```
Use-Stopwatch -Reset -IncludeStatus
```

IsRunning Elapsed  ElapsedMilliseconds ElapsedTicks
--------- -------  ------------------- ------------
    False 00:00:00                   0            0

## PARAMETERS

### -Status
Switch to just display the current status of the stopwatch.
Default.

```yaml
Type: SwitchParameter
Parameter Sets: Status
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Reset
Switch to stop the stopwatch and reset the counter to 0.

```yaml
Type: SwitchParameter
Parameter Sets: Reset
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Restart
Switch to reset the counter to 0 and restart the stopwatch.

```yaml
Type: SwitchParameter
Parameter Sets: Restart
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start
Switch to start the stopwatch.

```yaml
Type: SwitchParameter
Parameter Sets: Start
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Stop
Switch to stop the stopwatch.

```yaml
Type: SwitchParameter
Parameter Sets: Stop
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeStatus
Switch to include the status when you specify -Start, -Stop, -Reset, -Restart

```yaml
Type: SwitchParameter
Parameter Sets: Reset, Restart, Start, Stop
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

### System.Diagnostics.Stopwatch
## NOTES
Inspired by: https://mcpmag.com/articles/2017/10/19/using-a-stopwatch-in-powershell.aspx

The module manifest contains the following line that this function relies on:

$Script:Stopwatch =  \[System.Diagnostics.Stopwatch\]::New()

## RELATED LINKS
