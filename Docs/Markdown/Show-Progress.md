---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Show-Progress

## SYNOPSIS
Show progress as items pass through a section of the pipline

## SYNTAX

```
Show-Progress [-InputObject] <PSObject[]> [-Activity <String>] [-UpdatePercentage <Int32>] [-PassThru]
 [-Id <Int32>] [-SecondsRemaining] [<CommonParameters>]
```

## DESCRIPTION
This function allows you to show progress from the pipeline.
It's intentionally written for efficiency/speed so some compromises on readability were made

## EXAMPLES

### EXAMPLE 1
```
# This runs through the numbers 1 through 1000 and displays a progress bar based on how many have gone through the pipeline
```

1..1000 | Show-Progress

### EXAMPLE 2
```
# Showing progress with a specific activity message and only updating at 10%, 20% etc
```

1..10000 | Show-Progress -Activity "doin stuff" -UpdatePercentage 10

### EXAMPLE 3
```
# Showing progress displaying estimated seconds remaining.
```

1..50 | show-progress  -PassThru -SecondsRemaining | foreach { start-sleep  -Milliseconds (get-random -min 100 -max 1000) }

### EXAMPLE 4
```
1..1000 | show-progress -SecondsRemaining -PassThru -Activity 'Performing activity'  | foreach { start-sleep -mil (get-random -min 100 -max 1000)}
```

Will display a progress bar at the top that will look similar to:

Performing activity
    Working - 2%
    \[ooo                                                                                                           \]
    00:09:20 remaining.

## PARAMETERS

### -InputObject
The items on the pipeline being processed.
Can also accept this input from the pipeline, which is how this parameter
is normally used.

```yaml
Type: PSObject[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Activity
A decription of the activity being measured.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Processing items
Accept pipeline input: False
Accept wildcard characters: False
```

### -UpdatePercentage
The percentage of time to update the progress bar.
Write-Progress is a slow cmdlet so this is used for performance
reasons with larger data sets.
Defaults to 1.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Controls whether data is passed along the pipeline.
Normally this switch should be used.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: PassThrough

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
Allows you to have multiple progress bars running simultaneously.
Defaults to 1.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecondsRemaining
Switch that will control the display of estimated number of seconds remaining based upon current progress.

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
# Inspired by: https://www.powershellgallery.com/packages/Show-Progress/0.0.1
# Added \[switch\] parameter $PassThru to pass items through the pipeline
# Added \[switch\] parameter $SecondsRemaining
# Added \[int\] parameter $Id to enable multiple progress bars

## RELATED LINKS
