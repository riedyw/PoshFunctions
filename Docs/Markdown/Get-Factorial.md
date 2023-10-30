---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-Factorial

## SYNOPSIS

Determine the factorial of a given integer value

## SYNTAX

### __AllParameterSets

```
Get-Factorial [-Value] <Int32[]> [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Recursive function to determine the factorial of a given integer value.
Values must be in range of 0-20


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-Factorial -Value 5
```

120





### Example 2: EXAMPLE 2

```
Get-Factorial -Value (1..5) -IncludeInput
```

Value Factorial
----- ---------
    1         1
    2         2
    3         6
    4        24
    5       120





### Example 3: EXAMPLE 3

```
1..5 | Get-Factorial -IncludeInput
```

Value Factorial
----- ---------
    1         1
    2         2
    3         6
    4        24
    5       120





### Example 4: EXAMPLE 4

```
Get-Factorial -Value 3 -Verbose
```

VERBOSE: Starting [Get-Factorial]
VERBOSE: CurValue is [3]
VERBOSE: Starting [Get-Factorial]
VERBOSE: CurValue is [2]
VERBOSE: Starting [Get-Factorial]
VERBOSE: CurValue is [1]
VERBOSE: Ending [Get-Factorial]
VERBOSE: Ending [Get-Factorial]
6
VERBOSE: Ending [Get-Factorial]





### Example 5: EXAMPLE 5

```
Get-Factorial -Value -1
```

Get-Factorial : CurValue [-1] must be between 0 and 20
At line:1 char:1
+ Get-Factorial -Value -1
+ ~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (:) [Write-Error], WriteErrorException
    + FullyQualifiedErrorId : Microsoft.PowerShell.Commands.WriteErrorException,Get-Factorial






## PARAMETERS

### -IncludeInput

Switch to include the input parameter into the output

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

### -Value

Array of integers each of which should be in the range of 0-20.
Accepts values from the pipeline

```yaml
Type: Int32[]
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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

