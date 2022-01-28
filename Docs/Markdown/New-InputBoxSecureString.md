---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://github.com/iRon7/Join-Object
schema: 2.0.0
---

# New-InputBoxSecureString

## SYNOPSIS
Provides a GUI text entry box to enter a string and convert it to a securestring

## SYNTAX

### Default (Default)
```
New-InputBoxSecureString [-Title <String>] [-DisableInputMask] [-Description <String>]
 [-EntryBoxLabel <String>] [<CommonParameters>]
```

### Validate
```
New-InputBoxSecureString [-Title <String>] [-DisableValidation] [-DisableInputMask] [-Description <String>]
 [-EntryBoxLabel <String>] [-ValidateBoxLabel <String>] [<CommonParameters>]
```

## DESCRIPTION
Provides a GUI text entry box to enter a string and convert it to a securestring.
Function validates input and provides an input mask, both of which can be disabled.

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
VERBOSE: Title \[New SecureString\]
VERBOSE: Description \[Please enter the plain text you wish to be converted to a securestring\]
VERBOSE: EntryBoxLabel \[Please enter the value\]
VERBOSE: ValidateBoxLabel \[Please re-enter the value\]
VERBOSE: DisableValidation \[False\], DisableInputMask \[False\]
System.Security.SecureString
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
Position: Named
Default value: New SecureString
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableValidation
Switch that will turn off the second entry box which ensures that data is input correctly.

```yaml
Type: SwitchParameter
Parameter Sets: Validate
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
Position: Named
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
Position: Named
Default value: Please enter the value
Accept pipeline input: False
Accept wildcard characters: False
```

### -ValidateBoxLabel
The label block of the entry text input box.
Defaults to 'Please re-enter the value'

```yaml
Type: String
Parameter Sets: Validate
Aliases:

Required: False
Position: Named
Default value: Please re-enter the value
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
