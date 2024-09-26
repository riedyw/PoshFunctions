---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Remove-QuotesFromCsv

## SYNOPSIS

Removes quotes from a CSV data set. Can optionally set $Delimiter to another character.

## SYNTAX

### __AllParameterSets

```
Remove-QuotesFromCsv [-csv] <String[]> [[-Delimiter <Char>]] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION

Removes quotes from a CSV data set.
Can optionally set $Delimiter to another character.


## EXAMPLES

### Example 1: EXAMPLE 1

```
'"f1","f2"' | Remove-QuotesFromCsv
```

Will return
f1,f2





### Example 2: EXAMPLE 2

```
"`"f1`"`t`"f2`"" | Remove-QuotesFromCsv -Delimiter "`t" -verbose
```

Will return
VERBOSE: Starting Remove-QuotesFromCsv
f1      f2
VERBOSE: Ending Remove-QuotesFromCsv





### Example 3: EXAMPLE 3

```
$array | ConvertTo-Csv -NoTypeInformation | Remove-QuotesFromCsv
```

Will return
blah,blah,blah






## PARAMETERS

### -Confirm

{{ Fill Confirm Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -csv

The CSV string data.

```yaml
Type: String[]
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

### -Delimiter

A single [char] delimiter.
Defaults to ','.
Can be set to tab character "`t", or any other

```yaml
Type: Char
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: ,
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -WhatIf

{{ Fill WhatIf Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None



## OUTPUTS

### [string[]]



## NOTES



## RELATED LINKS

[ConvertFrom-Csv] ()

