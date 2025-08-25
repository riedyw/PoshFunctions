---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://github.com/iRon7/Join-Object
schema: 2.0.0
---

# New-InputBoxSecureString

## SYNOPSIS
Provides a GUI text entry box to enter a string and convert it to a securestring

## SYNTAX

```
New-InputBoxSecureString [[-Title] <String>] [-DisableValidation] [-DisableInputMask] [[-Description] <String>]
 [[-EntryBoxLabel] <String>] [[-ValidateBoxLabel] <String>] [-OutputAsPlainText] [-Force] [<CommonParameters>]
```

## DESCRIPTION
Provides a GUI text entry box to enter a string and convert it to a securestring.
Function validates input and provides an input mask, both of which can be disabled.
Optionally can output a plain text string with the $OutputAsPlainText parameter

## EXAMPLES

### EXAMPLE 1
```
$SecureString = New-InputBoxSecureString
```

Will display a form with 2 text entry fields that are masked with '*', and will verify the values match before converting to a securestring

### EXAMPLE 2
```
$SecureString = New-InputBoxSecureString -Verbose
```

VERBOSE: Starting \[New-InputBoxSecureString\]
VERBOSE: Title \[New SecureString\], Description \[Please enter the plain text you wish to be converted to a securestring\]
VERBOSE: EntryBoxLabel \[Please enter the value\], ValidateBoxLabel \[Please re-enter the value\]
VERBOSE: DisableValidation \[False\], DisableInputMask \[False\]
VERBOSE: OutputAsPlainText \[False\], Force \[False\]
VERBOSE: Ending \[New-InputBoxSecureString\]

Will display a form with 2 text entry fields that are masked with '*', and will verify the values match before converting to a securestring

## PARAMETERS

### -Title
The title of the form.
Defaults to 'New SecureString'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: New SecureString
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableValidation
Switch that will turn off the second entry box which ensures that data is input correctly.

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

### -DisableInputMask
Switch that will disable the input mask character which defaults to '*'

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

### -Description
The description block of the form.
Defaults to 'Please enter the plain text you wish to be converted to a securestring'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Please enter the plain text you wish to be converted to a securestring
Accept pipeline input: False
Accept wildcard characters: False
```

### -EntryBoxLabel
The label block of the entry text input box.
Defaults to 'Please enter the value'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Please enter the value
Accept pipeline input: False
Accept wildcard characters: False
```

### -ValidateBoxLabel
The label block of the entry text input box.
Defaults to 'Please re-enter the value'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Please re-enter the value
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputAsPlainText
Switch that will output plain text as opposed to a secure string
You would use this if you wanted validation logic but wanted the output to be a string

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

### -Force
Switch that will determine behavior if -OutputAsPlainText is specified

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
