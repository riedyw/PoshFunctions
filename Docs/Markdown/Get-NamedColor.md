---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-NamedColor

## SYNOPSIS

Gets information on all named colors

## SYNTAX

### __AllParameterSets

```
Get-NamedColor [[-ColorName <String>]] [-ExcludeEmpty] [-Full] [<CommonParameters>]
```

## DESCRIPTION

Gets information on all named colors


## EXAMPLES


## PARAMETERS

### -ColorName

To show the attributes of a single named color.
This parameter has a ValidateSet against it so you can tab through the options.

```yaml
Type: String
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

### -ExcludeEmpty

Will exclude the Empty and Transparent colors

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

### -Full

Switch to indicate if all fields are to be returned

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

## OUTPUTS

### psobject



## NOTES

Added PSTypeName hidden property in object to control formatting of output


## RELATED LINKS

Fill Related Links Here

