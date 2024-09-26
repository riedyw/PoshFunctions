---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-ErrorInfo

## SYNOPSIS

Returns errors in a concise object

## SYNTAX

### __AllParameterSets

```
Get-ErrorInfo [[-Count <Int32>]] [<CommonParameters>]
```

## DESCRIPTION

Returns errors in a concise object.
Useful when trying to write a catch statement to a particular exception.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-ErrorInfo -Count 20 -Verbose
```

VERBOSE: Starting [Get-ErrorInfo]
VERBOSE: Setting Count to [6]

VERBOSE: Ending [Get-ErrorInfo]
Index ExceptionType                                                    ErrorText
----- -------------                                                    ---------
    0 System.Management.Automation.ParameterBindingValidationException Cannot validate argument on parameter 'Count'.
The 0 argument is less than the m...
    1 System.Management.Automation.ParameterBindingValidationException Cannot validate argument on parameter 'Count'.
The 200 argument is greater than ...
    2 System.ArgumentException                                         Illegal characters in path.
    3 System.ArgumentException                                         Illegal characters in path.
    4 System.ArgumentException                                         Illegal characters in path.
    5 System.Management.Automation.ItemNotFoundException               Cannot find path 'C:\Git\PoshFunctions\Pester\dne' because it does not exist.





### Example 2: EXAMPLE 2

```
Get-ErrorInfo -Count 20 -Verbose
```

Index ExceptionType                                                    ErrorText
----- -------------                                                    ---------
    0 System.Management.Automation.ParameterBindingValidationException Cannot validate argument on parameter 'Count'.
The 0 argument is less than the m...
    1 System.Management.Automation.ParameterBindingValidationException Cannot validate argument on parameter 'Count'.
The 200 argument is greater than ...
    2 System.ArgumentException                                         Illegal characters in path.
    3 System.ArgumentException                                         Illegal characters in path.
    4 System.ArgumentException                                         Illegal characters in path.
    5 System.Management.Automation.ItemNotFoundException               Cannot find path 'C:\Git\PoshFunctions\Pester\dne' because it does not exist.






## PARAMETERS

### -Count

Number of error entries you would like.
Valid range 1-100.
If you specify a number greater than $Error.Count is sets Count to $Error.Count

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $Error.Count
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.Management.Automation.PSObject



## NOTES



## RELATED LINKS

Fill Related Links Here

