---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-SpecialFolder

## SYNOPSIS

Gets special folder name location

## SYNTAX

### __AllParameterSets

```
Get-SpecialFolder [[-Name <String>]] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION

Gets special folder name location.
Function aliased to 'Show-SpecialFolder' for
backward compatibility.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-SpecialFolder -Name CommonDocuments -IncludeInput
```

Would return
SpecialFolder   Path
-------------   ----
CommonDocuments C:\Users\Public\Documents





### Example 2: EXAMPLE 2

```
Get-SpecialFolder -Name MyDocuments -IncludeInput
```

Would return the following if logged in as 'SampleUser'
SpecialFolder Path
------------- ----
MyDocuments   C:\Users\SampleUser\Documents






## PARAMETERS

### -IncludeInput

Switch to include the input in the output

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

### -Name

The name of the special folder

```yaml
Type: String
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

## NOTES



## RELATED LINKS

Fill Related Links Here

