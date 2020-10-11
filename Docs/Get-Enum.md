---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Get-Enum

## SYNOPSIS
To get the static values of enum datatypes

## SYNTAX

```
Get-Enum [-TypeName] <Type[]> [-Binary] [-Hex] [-IncludeType] [<CommonParameters>]
```

## DESCRIPTION
To get the static values of enum datatypes

## EXAMPLES

### EXAMPLE 1
```
Get-Enum -TypeName 'System.Windows.Forms.DialogResult'
```

Name   Value
----   -----
None       0
OK         1
Cancel     2
Abort      3
Retry      4
Ignore     5
Yes        6
No         7

### EXAMPLE 2
```
Get-Enum -TypeName 'System.Windows.Forms.MessageBoxButtons' -Hex -IncludeType
```

TypeName                               Name             Value Hex
--------                               ----             ----- ---
System.Windows.Forms.MessageBoxButtons OK                   0 0x0
System.Windows.Forms.MessageBoxButtons OKCancel             1 0x1
System.Windows.Forms.MessageBoxButtons AbortRetryIgnore     2 0x2
System.Windows.Forms.MessageBoxButtons YesNoCancel          3 0x3
System.Windows.Forms.MessageBoxButtons YesNo                4 0x4
System.Windows.Forms.MessageBoxButtons RetryCancel          5 0x5

### EXAMPLE 3
```
Get-Enum -TypeName 'System.Windows.Forms.MessageBoxButtons' -Binary
```

Name             Value Binary
----             ----- ------
OK                   0 0
OKCancel             1 1
AbortRetryIgnore     2 10
YesNoCancel          3 11
YesNo                4 100
RetryCancel          5 101

## PARAMETERS

### -TypeName
A typename or array of typenames that you wish to enumerate the enum values.
Can accept input from the pipeline.

```yaml
Type: Type[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Binary
A switch that will also display the value in binary form.

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

### -Hex
A switch that will also display the value in hexadecimal form.

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

### -IncludeType
A switch determining if you want the TypeName to appear in the output.

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

### psobject
## NOTES

## RELATED LINKS
