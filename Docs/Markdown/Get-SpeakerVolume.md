---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-SpeakerVolume

## SYNOPSIS

Gets the current speaker volume.

## SYNTAX

### __AllParameterSets

```
Get-SpeakerVolume [<CommonParameters>]
```

## DESCRIPTION

Gets the current speaker volume.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Set-SpeakerVolume -Volume 80
```

Will display nothing and set the speaker to 80%





### Example 2: EXAMPLE 2

```
Set-SpeakerVolume -Volume 97 -Verbose
```

Will diplay the following while setting the speaker to 96%
VERBOSE: You specified the speaker volume should be 97%
VERBOSE: Rounding down to 96%
VERBOSE: Turning volume down to 0%
VERBOSE: Turning volume up to 96%






## PARAMETERS


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Renamed function from Set-Speaker to Set-SpeakerVolume to be clearer as to the purpose.
Set an alias for the
function to 'Set-Speaker' for backward compatibility.


## RELATED LINKS

Fill Related Links Here

