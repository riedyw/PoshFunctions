---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-MailToUri

## SYNOPSIS

Creates appropriately formatted text for an SMS URI that can be embedded in a QR code

## SYNTAX

### __AllParameterSets

```
New-MailToUri [-To] <String[]> [-BCC <String[]>] [-Body <String[]>] [-CC <String[]>] [-Subject <String>] [<CommonParameters>]
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

### Example 1: EXAMPLE 1

```
New-SmsUri -Telephone 212-555-8600
```

SMSTO:212-555-8600





### Example 2: EXAMPLE 2

```
New-SmsUri -Telephone 212-555-8500 -Message 'Please text back'
```

SMSTO:212-555-8500:Please text back





### Example 3: EXAMPLE 3

```
$QRCodeData = New-SmsUri -Telephone 212-555-8500 -Message 'Please text back'
```

New-QRCode -Data $QRCodeData -Show

And attempting to take a picture on your smart phone will begin composing an SMS message to Telephone containing
Message in the message block.






## PARAMETERS

### -BCC

{{ Fill BCC Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Body

{{ Fill Body Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -CC

{{ Fill CC Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Subject

{{ Fill Subject Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -To

{{ Fill To Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Inspired by https://support.seagullscientific.com/hc/en-us/community/posts/4415554566167-QR-Code-SMSTO-multiple-recipients>


## RELATED LINKS

[New-QRCode] ()

