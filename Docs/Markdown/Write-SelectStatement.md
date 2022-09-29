---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Write-SelectStatement

## SYNOPSIS
From a single object with named properties it will write out a select statement that will join array elements.

## SYNTAX

```
Write-SelectStatement [[-InputObject] <Object>] [[-Wrapper] <String>] [[-Delimiter] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
From a single object with named properties it will write out a select statement that will join array elements.
Helpful when attempt to export a complex object to a CSV.
Can optionally enclose the array in different wrapper characters.
Can optionally specify the delimiter between elements in the array.

## EXAMPLES

### EXAMPLE 1
```
Get-ADUser UserID -Properties dSCorePropagationData |
```

Select-Object SamAccountName, DistinguishedName, dsCorePropogationData |
Write-SelectStatement

Would return
Select-Object -Property SamAccountName, DistinguishedName, @{N='dsCorePropogationData';E={'\[' + ($_.dsCorePropogationData -join ';') + '\]'}}

Because dsCorePropogationData is an array of values

### EXAMPLE 2
```
Get-ADUser UserID -Properties dSCorePropagationData |
```

Select-Object SamAccountName, DistinguishedName, dsCorePropogationData |
Write-SelectStatement -Wrapper Parentheses -Delimiter '|'

Would return
Select-Object -Property SamAccountName, DistinguishedName, @{N='dsCorePropogationData';E={'(' + ($_.dsCorePropogationData -join '|') + ')'}}

## PARAMETERS

### -InputObject
The object that you wish to write the select-object statement against

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Wrapper
A string parameter with one of these values: ('Braces', 'Brackets', 'Chevrons', 'Parentheses', 'None').
Defaults to 'Brackets'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Brackets
Accept pipeline input: False
Accept wildcard characters: False
```

### -Delimiter
A string parameter used to separate the values within the array.
Defaults to ';'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: ;
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
1 - The object has to have named properties
2 - The named properties can NOT have embedded spaces
3 - The function will create a temporary file from New-TemporaryFile and remove it when finished

## RELATED LINKS
