---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-Assoc

## SYNOPSIS

Displays file extension associations

## SYNTAX

### __AllParameterSets

```
Get-Assoc [-AsArray] [<CommonParameters>]
```

## DESCRIPTION

Displays file extension associations which can be gotten from cmd.exe


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-Assoc
```

Name                           Value
----                           -----





### Example 2: EXAMPLE 2

```
Get-Assoc -AsArray | Where-Object { $_.Name -match 'xls' } | Select-Object Value, Name
```

Value                            Name
-----                            ----
Excel.Sheet.8                    .xls
Excel.SheetBinaryMacroEnabled.12 .xlsb
Excelhtmlfile                    .xlshtml
Excel.SheetMacroEnabled.12       .xlsm
excelmhtmlfile                   .xlsmhtml
Excel.Sheet.12                   .xlsx






## PARAMETERS

### -AsArray

Switch to return result as an array of objects as opposed to an ordered dictionary

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



## RELATED LINKS

Fill Related Links Here

