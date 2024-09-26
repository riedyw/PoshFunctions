---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-IsValidIPv4

## SYNOPSIS

Verifies if passed parameter is a valid IP v4 address

## SYNTAX

### __AllParameterSets

```
Test-IsValidIPv4 [[-IPAddress <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Verifies if passed parameter is a valid IP v4 address.
Can take single string or array of strings.
Can also accept input from the pipeline.
Function aliased to 'Test-IsValidIP'


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-IsValidIPv4 '10.0.0.1'
```







### Example 2: EXAMPLE 2

```
Test-IsValidIPv4 '10.0.0.1' -Verbose
```

VERBOSE: The string being tested if a valid IPv4 address is [10.0.0.1]
True





### Example 3: EXAMPLE 3

```
'192.168.1.1','invalid' | Test-IsValidIPv4 -IncludeInput
```

Input       Result
-----       ------
192.168.1.1   True
invalid      False






## PARAMETERS

### -IncludeInput

{{ Fill IncludeInput Description }}

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

### -IPAddress

{{ Fill IPAddress Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: IP
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### bool



## NOTES



## RELATED LINKS

Fill Related Links Here

