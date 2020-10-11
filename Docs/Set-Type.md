---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Set-Type

## SYNOPSIS
Sets the data type of a property given the property name and the data type.

## SYNTAX

```
Set-Type [[-TypeHash] <Hashtable>]
```

## DESCRIPTION
Sets the data type of a property given the property name and the data type.
This is needed as cmdlets such as Import-CSV pulls everything in as a string
datatype so you can't sort numerically or date wise.

## EXAMPLES

### EXAMPLE 1
```
$csv = Import-CSV -Path .\test.csv | Set-Type -TypeHash @{ 'LastWriteTime' = 'DateTime'}
```

## PARAMETERS

### -TypeHash
A hashtable of property names and their associated datatype

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Only works properly if there are no separate begin, process, and end blocks

## RELATED LINKS

[about_Properties]()

