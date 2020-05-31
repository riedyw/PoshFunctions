---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Set-Speaker

## SYNOPSIS
Sets the speaker volume.

## SYNTAX

```
Set-Speaker [-Volume] <Int32> [<CommonParameters>]
```

## DESCRIPTION
Sets the speaker volume.

## EXAMPLES

### EXAMPLE 1
```
Set-Speaker -Volume 80
```

Will display nothing and set the speaker to 80%

### EXAMPLE 2
```
Set-Speaker -Volume 97 -Verbose
```

Will diplay the following while setting the speaker to 96%
VERBOSE: You specified the speaker volume should be 97%
VERBOSE: Rounding down to 96%
VERBOSE: Turning volume down to 0%
VERBOSE: Turning volume up to 96%

## PARAMETERS

### -Volume
An integer value from 0 to 100 that will set the volume level of the speaker.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
The interface to setting the speaker volume really accepts values 0-50, and displays as 0-100.
Given this oddity, the function will round DOWN to an even number.
So if you run
    Set-Speaker -Volume 99
The icon for the speaker will display 98% if you hover over it.

## RELATED LINKS
