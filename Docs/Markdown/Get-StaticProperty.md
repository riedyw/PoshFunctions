---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-StaticProperty

## SYNOPSIS

To list the static properties of a .NET class

## SYNTAX

### __AllParameterSets

```
Get-StaticProperty [[-TypeName <String[]>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

To list the static properties of a .NET class


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-StaticProperty -TypeName 'Microsoft.Win32.RegistryValueKind'
```

Name         Value
----         -----
Binary           3
DWord            4
ExpandString     2
MultiString      7
None            -1
QWord           11
String           1
Unknown          0





### Example 2: EXAMPLE 2

```
Get-StaticProperty -TypeName 'datetime' -IncludeInput
```

SpecifiedType ExpandedType    Name     Value
------------- ------------    ----     -----
datetime      System.DateTime MaxValue 12/31/9999 11:59:59 PM
datetime      System.DateTime MinValue 1/1/0001 12:00:00 AM
datetime      System.DateTime Now      4/9/2020 8:47:49 AM
datetime      System.DateTime Today    4/9/2020 12:00:00 AM
datetime      System.DateTime UtcNow   4/9/2020 12:47:49 PM





### Example 3: EXAMPLE 3

```
Get-StaticProperty -TypeName 'math' -IncludeInput
```

SpecifiedType ExpandedType Name            Value
------------- ------------ ----            -----
math          System.Math  E    2.71828182845905
math          System.Math  PI   3.14159265358979






## PARAMETERS

### -IncludeInput

A switch to determine if the typename and expanded full type name will be included in the output.
Aliased to 'IncludeTypeName' for backward compatibility

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeTypeName
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -TypeName

The name of a .Net typename or class

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### System.Collections.ArrayList



## NOTES



## RELATED LINKS

Fill Related Links Here

