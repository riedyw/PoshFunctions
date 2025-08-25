---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Set-Desktop.ini

## SYNOPSIS
Sets the customization attributes for a given folder

## SYNTAX

```
Set-Desktop.ini [[-Path] <String>] [[-FolderType] <String>] [[-InfoTip] <String>] [[-Icon] <String>]
 [-CopyIcon] [<CommonParameters>]
```

## DESCRIPTION
Sets the customization attributes for a given folder

## EXAMPLES

### EXAMPLE 1
```
Add an example
```

## PARAMETERS

### -Path
The path to the folder

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $pwd
Accept pipeline input: False
Accept wildcard characters: False
```

### -FolderType
String value validated against set: ('Generic', 'Documents', 'Pictures', 'Music', 'Videos').
Defaults to 'Generic'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Generic
Accept pipeline input: False
Accept wildcard characters: False
```

### -InfoTip
Text to be displayed if you hover over folder in Windows Explorer.
Maximum of 32 characters

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

### -Icon
Path to the icon file.
Optional.
If specified the file must exist

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

### -CopyIcon
Switch indicating that the icon will be copied to the root of the $Path folder

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

## RELATED LINKS
