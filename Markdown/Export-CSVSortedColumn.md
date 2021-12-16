---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Export-CSVSortedColumn

## SYNOPSIS
Sorts the column names alphabetically and exports to csv

## SYNTAX

```
Export-CSVSortedColumn [[-InputObject] <Object[]>] [-Descending] [-Append] [-Confirm] [[-Delimiter] <Char>]
 [[-Encoding] <String>] [-Force] [[-LiteralPath] <String>] [-NoClobber] [-NoTypeInformation] [[-Path] <String>]
 [-UseCulture] [<CommonParameters>]
```

## DESCRIPTION
Sorts the column names alphabetically and exports to csv

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -InputObject
The object that will be exported

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Descending
Switch if you want the columns to be in reverse alphabetical order.

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

### -Append
Optional parameter matches parameter in Export-CSV

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

### -Confirm
Optional parameter matches parameter in Export-CSV

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

### -Delimiter
Optional parameter matches parameter in Export-CSV

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

### -Encoding
Optional parameter matches parameter in Export-CSV

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Optional parameter matches parameter in Export-CSV

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

### -LiteralPath
Optional parameter matches parameter in Export-CSV

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoClobber
Optional parameter matches parameter in Export-CSV

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

### -NoTypeInformation
Optional parameter matches parameter in Export-CSV

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

### -Path
Optional parameter matches parameter in Export-CSV

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseCulture
Optional parameter matches parameter in Export-CSV

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

## NOTES
Inspired by https://stackoverflow.com/questions/3281999/format-list-sort-properties-by-name

Made following changes
* added all parameters from Export-CSV

## RELATED LINKS

[Export-CSV]()

