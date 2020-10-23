---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Test-IsAdmin

## SYNOPSIS
Determines if you are running elevated (as Administrator)

## SYNTAX

```
Test-IsAdmin [<CommonParameters>]
```

## DESCRIPTION
Determines if you are running elevated (as Administrator)

## EXAMPLES

### EXAMPLE 1
```
Test-IsAdmin
```

Would return the following if the prompt was elevated.
$True

### EXAMPLE 2
```
Test-IsAdmin -Verbose
```

Would return the following if the prompt was elevated.
VERBOSE: You have Administrator rights.
True

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### bool
## NOTES

## RELATED LINKS
