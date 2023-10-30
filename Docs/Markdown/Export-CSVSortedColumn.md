---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Export-CSVSortedColumn

## SYNOPSIS

Sorts the column names alphabetically and exports to csv

## SYNTAX

### __AllParameterSets

```
Export-CSVSortedColumn [[-InputObject <Object[]>]] [[-Delimiter <Char>]] [[-Encoding <String>]] [[-LiteralPath <String>]] [[-Path <String>]] [-Append] [-Confirm] [-Descending] [-Force] [-NoClobber] [-NoTypeInformation] [-UseCulture] [<CommonParameters>]
```

## DESCRIPTION

Sorts the column names alphabetically and exports to csv


## EXAMPLES


## PARAMETERS

### -Append

Optional parameter matches parameter in Export-CSV

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

### -Confirm

Optional parameter matches parameter in Export-CSV

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

### -Delimiter

Optional parameter matches parameter in Export-CSV

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

### -Descending

Switch if you want the columns to be in reverse alphabetical order.

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

### -Encoding

Optional parameter matches parameter in Export-CSV

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Force

Optional parameter matches parameter in Export-CSV

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

### -InputObject

The object that will be exported

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -LiteralPath

Optional parameter matches parameter in Export-CSV

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 3
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -NoClobber

Optional parameter matches parameter in Export-CSV

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

### -NoTypeInformation

Optional parameter matches parameter in Export-CSV

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

### -Path

Optional parameter matches parameter in Export-CSV

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 4
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -UseCulture

Optional parameter matches parameter in Export-CSV

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

Inspired by https://stackoverflow.com/questions/3281999/format-list-sort-properties-by-name

Made following changes
* added all parameters from Export-CSV


## RELATED LINKS

[Export-CSV] ()

