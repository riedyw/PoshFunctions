---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Remove-QuotesFromCsv

## SYNOPSIS
Removes quotes from a CSV data set.
Can optionally set $Delimiter to another character.

## SYNTAX

```
Remove-QuotesFromCsv [-csv] <String[]> [[-Delimiter] <Char>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Removes quotes from a CSV data set.
Can optionally set $Delimiter to another character.

## EXAMPLES

### EXAMPLE 1
```
'"f1","f2"' | Remove-QuotesFromCsv
```

Will return
f1,f2

### EXAMPLE 2
```
"`"f1`"`t`"f2`"" | Remove-QuotesFromCsv -Delimiter "`t" -verbose
```

Will return
VERBOSE: Starting Remove-QuotesFromCsv
f1      f2
VERBOSE: Ending Remove-QuotesFromCsv

### EXAMPLE 3
```
$array | ConvertTo-Csv -NoTypeInformation | Remove-QuotesFromCsv
```

Will return
blah,blah,blah

## PARAMETERS

### -csv
The CSV string data.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Delimiter
A single \[char\] delimiter.
Defaults to ','.
Can be set to tab character "\`t", or any other

```yaml
Type: Char
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: ,
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### [string[]]
## NOTES

## RELATED LINKS

[ConvertFrom-Csv]()

