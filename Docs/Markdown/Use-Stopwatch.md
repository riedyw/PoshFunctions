---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Use-Stopwatch

## SYNOPSIS

Uses a stopwatch datatype found in module. Can get stopwatch status, start, stop, reset, or restart.

## SYNTAX

### Status (Default)

```
Use-Stopwatch [-Status] [<CommonParameters>]
```

### Reset

```
Use-Stopwatch [-IncludeStatus] [-Reset] [<CommonParameters>]
```

### Restart

```
Use-Stopwatch [-IncludeStatus] [-Restart] [<CommonParameters>]
```

### Start

```
Use-Stopwatch [-IncludeStatus] [-Start] [<CommonParameters>]
```

### Stop

```
Use-Stopwatch [-IncludeStatus] [-Stop] [<CommonParameters>]
```

## DESCRIPTION

Uses a stopwatch datatype found in module.
Can get stopwatch status, start, stop, reset, or restart.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Use-Stopwatch -Verbose
```

When you first run this command the stopwatch will exist but has not been started.
The function would return:
VERBOSE: Starting [Use-Stopwatch]
VERBOSE: ParameterSetName [Status]
VERBOSE: IncludeStatus [False]

VERBOSE: Ending [Use-Stopwatch]
IsRunning Elapsed  ElapsedMilliseconds ElapsedTicks
--------- -------  ------------------- ------------
    False 00:00:00                   0            0





### Example 2: EXAMPLE 2

```
Use-Stopwatch -Start -IncludeStatus
```

Would start the stopwatch and display the stopwatch and would return something similar to the following:
IsRunning Elapsed          ElapsedMilliseconds ElapsedTicks
--------- -------          ------------------- ------------
     True 00:00:00.0011733                   1        11933





### Example 3: EXAMPLE 3

```
Use-Stopwatch -Stop -IncludeStatus
```

Would stop the stopwatch and display the stopwatch and return something similar to the following:
IsRunning Elapsed          ElapsedMilliseconds ElapsedTicks
--------- -------          ------------------- ------------
    False 00:01:21.2577089               81257    812577089





### Example 4: EXAMPLE 4

```
Use-Stopwatch -Reset -IncludeStatus
```

IsRunning Elapsed  ElapsedMilliseconds ElapsedTicks
--------- -------  ------------------- ------------
    False 00:00:00                   0            0






## PARAMETERS

### -IncludeStatus

Switch to include the status when you specify -Start, -Stop, -Reset, -Restart

```yaml
Type: SwitchParameter
Parameter Sets: Stop, Start, Restart, Reset
Aliases: 
Accepted values: 

Required: True (None) False (Stop, Start, Restart, Reset)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Reset

Switch to stop the stopwatch and reset the counter to 0.

```yaml
Type: SwitchParameter
Parameter Sets: Reset
Aliases: 
Accepted values: 

Required: True (None) False (Reset)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Restart

Switch to reset the counter to 0 and restart the stopwatch.

```yaml
Type: SwitchParameter
Parameter Sets: Restart
Aliases: 
Accepted values: 

Required: True (None) False (Restart)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Start

Switch to start the stopwatch.

```yaml
Type: SwitchParameter
Parameter Sets: Start
Aliases: 
Accepted values: 

Required: True (None) False (Start)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Status

Switch to just display the current status of the stopwatch.
Default.

```yaml
Type: SwitchParameter
Parameter Sets: Status
Aliases: 
Accepted values: 

Required: True (None) False (Status)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Stop

Switch to stop the stopwatch.

```yaml
Type: SwitchParameter
Parameter Sets: Stop
Aliases: 
Accepted values: 

Required: True (None) False (Stop)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.Diagnostics.Stopwatch



## NOTES

Inspired by: https://mcpmag.com/articles/2017/10/19/using-a-stopwatch-in-powershell.aspx

The module manifest contains the following line that this function relies on:

$Script:Stopwatch =  [System.Diagnostics.Stopwatch]::New()


## RELATED LINKS

Fill Related Links Here

