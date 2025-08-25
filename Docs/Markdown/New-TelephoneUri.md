---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# New-TelephoneUri

## SYNOPSIS
Creates appropriately formatted text for an Telephone URI that can be embedded in a QR code

## SYNTAX

```
New-TelephoneUri [-Telephone] <String> [<CommonParameters>]
```

## DESCRIPTION
Creates appropriately formatted text for an Telephone URI that can be embedded in a QR code

## EXAMPLES

### EXAMPLE 1
```
New-TelephoneUri -telephone '518.555.1212'
```

TEL:518.555.1212

## PARAMETERS

### -Telephone
The telephone number for the URI text

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Inspired by https://support.seagullscientific.com/hc/en-us/community/posts/4415554566167-QR-Code-SMSTO-multiple-recipients\>

## RELATED LINKS

[New-QRCode]()

