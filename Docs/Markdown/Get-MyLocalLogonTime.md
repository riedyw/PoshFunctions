---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-MyLocalLogonTime

## SYNOPSIS

Gets local logon time for the current user

## SYNTAX

### __AllParameterSets

```
Get-MyLocalLogonTime [-Detail] [<CommonParameters>]
```

## DESCRIPTION

Gets local logon time for the current user


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-MyLocalLogonTime
```

Friday, July 30, 2021 7:54:36 AM





### Example 2: EXAMPLE 2

```
Get-MyLocalLogonTime -Detail
```

User               ComputerName LocalLogonTime
----               ------------ --------------
contosco\testuser  demolaptop   7/30/2021 7:54:36 AM






## PARAMETERS

### -Detail

Switch to include detail in output.
If not specified just the logon time is returned.

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


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Inspired by: https://community.idera.com/database-tools/powershell/script_library/m/local-accounts/30450


## RELATED LINKS

Fill Related Links Here

