---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Set-Desktop.ini

## SYNOPSIS

Sets the customization attributes for a given folder

## SYNTAX

### __AllParameterSets

```
Set-Desktop.ini [[-Path <String>]] [[-FolderType <String>]] [[-InfoTip <String>]] [[-Icon <String>]] [-CopyIcon] [<CommonParameters>]
```

## DESCRIPTION

Sets the customization attributes for a given folder


## EXAMPLES

### Example 1: EXAMPLE 1

```
Add an example
```








## PARAMETERS

### -CopyIcon

Switch indicating that the icon will be copied to the root of the $Path folder

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

### -FolderType

String value validated against set: ('Generic', 'Documents', 'Pictures', 'Music', 'Videos').
Defaults to 'Generic'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: Generic
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Icon

Path to the icon file.
Optional.
If specified the file must exist

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

### -InfoTip

Text to be displayed if you hover over folder in Windows Explorer.
Maximum of 32 characters

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

### -Path

The path to the folder

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $pwd
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

