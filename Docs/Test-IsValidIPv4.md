---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Test-IsValidIPv4

## SYNOPSIS
Verifies if passed parameter is a valid IP v4 address

## SYNTAX

```
Test-IsValidIPv4 [[-IPAddress] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Verifies if passed parameter is a valid IP v4 address.
Can take single string or array of strings.
Can also accept input from the pipeline.
Function aliased to 'Test-IsValidIP'

## EXAMPLES

### EXAMPLE 1
```
Test-IsValidIPv4 '10.0.0.1'
```

### EXAMPLE 2
```
Test-IsValidIPv4 '10.0.0.1' -Verbose
```

VERBOSE: The string being tested if a valid IPv4 address is \[10.0.0.1\]
True

### EXAMPLE 3
```
'192.168.1.1','invalid' | Test-IsValidIPv4 -IncludeInput
```

Input       Result
-----       ------
192.168.1.1   True
invalid      False

## PARAMETERS

### -IPAddress
{{ Fill IPAddress Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: IP

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -IncludeInput
{{ Fill IncludeInput Description }}

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

### bool
## NOTES

## RELATED LINKS
