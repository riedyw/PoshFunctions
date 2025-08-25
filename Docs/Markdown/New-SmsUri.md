---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# New-SmsUri

## SYNOPSIS
Creates appropriately formatted text for an SMS URI that can be embedded in a QR code

## SYNTAX

```
New-SmsUri [-Telephone] <String> [-Message <String>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Creates appropriately formatted text for an SMS URI that can be embedded in a QR code.
If it is embedded in a QR code
the resulting QR code will begin writing an SMS text in the default messaging app on your smart phone addressed to
the Telephone parameter.
Optionally if Message is specified it puts that in the message portion of the text.
This will be
in draft mode on your smart phone, the user has to press Send

## EXAMPLES

### EXAMPLE 1
```
New-SmsUri -Telephone 212-555-8600
```

SMSTO:212-555-8600

### EXAMPLE 2
```
New-SmsUri -Telephone 212-555-8500 -Message 'Please text back'
```

SMSTO:212-555-8500:Please text back

### EXAMPLE 3
```
$QRCodeData = New-SmsUri -Telephone 212-555-8500 -Message 'Please text back'
```

New-QRCode -Data $QRCodeData -Show

And attempting to take a picture on your smart phone will begin composing an SMS message to Telephone containing
Message in the message block.

### EXAMPLE 4
```
New-SmsUri -Telephone '518 555 1212' -IncludeInput -Message 'Hello there'
```

Telephone    Message     SmsUri
---------    -------     ------
518 555 1212 Hello there SMSTO:518 555 1212:Hello there

## PARAMETERS

### -Telephone
The telephone number.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Message
An optional message

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
{{ Fill IncludeInput Description }}

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
Inspired by https://support.seagullscientific.com/hc/en-us/community/posts/4415554566167-QR-Code-SMSTO-multiple-recipients\>

## RELATED LINKS

[New-QRCode]()

