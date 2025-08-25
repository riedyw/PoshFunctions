---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
schema: 2.0.0
---

# Get-NamedColor

## SYNOPSIS
Gets information on all named colors

## SYNTAX

```
Get-NamedColor [[-ColorName] <String>] [-ExcludeEmpty] [-Full] [<CommonParameters>]
```

## DESCRIPTION
Gets information on all named colors

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -ColorName
To show the attributes of a single named color.
This parameter has a ValidateSet against it so you can tab through the options.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ExcludeEmpty
Will exclude the Empty and Transparent colors

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

### -Full
Switch to indicate if all fields are to be returned

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
Added PSTypeName hidden property in object to control formatting of output

## RELATED LINKS
