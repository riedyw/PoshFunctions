---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-IsAdmin

## SYNOPSIS

Determines if you are running elevated (as Administrator)

## SYNTAX

### __AllParameterSets

```
Test-IsAdmin [<CommonParameters>]
```

## DESCRIPTION

Determines if you are running elevated (as Administrator)


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-IsAdmin
```

Would return the following if the prompt was elevated.
$True





### Example 2: EXAMPLE 2

```
Test-IsAdmin -Verbose
```

Would return the following if the prompt was elevated.
VERBOSE: You have Administrator rights.
True






## PARAMETERS


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### bool



## NOTES

#source https://blogs.technet.microsoft.com/heyscriptingguy/2015/07/29/use-function-to-determine-elevation-of-powershell-console/
# inspired by above, made some minor modifications like proving more output, making it an advanced function.


## RELATED LINKS

Fill Related Links Here

