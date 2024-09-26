---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# New-WifiUri

## SYNOPSIS

To create a WIFI uri that can be used for input to New-QRCode

## SYNTAX

### __AllParameterSets

```
New-WifiUri [-SSID] <String> [-Password] <String> [[-EncryptionType <String>]] [-Hidden] [<CommonParameters>]
```

## DESCRIPTION

To create a WIFI uri that can be used for input to New-QRCode


## EXAMPLES

### Example 1: EXAMPLE 1

```
New-WifiUri -SSID 'Corp WiFi' -Password "It is a secret"
```

WIFI:S:Corp WiFi;T:WPA2;P:It is a secret;H:false;;






## PARAMETERS

### -EncryptionType

The encryption used on the link.
Valid values: 'WPA2', 'WPA', 'WEP'.
Defaults as 'WPA2'

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: WPA2
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Hidden

Switch indicating that the SSID is hidden and not broadcast

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

### -Password

The password.
Mandatory.
It's recommended that it NOT contain "'", '"', ';', ',', '\' as they will need to be escaped and may produce odd results.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 1
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -SSID

The SSID name.
Mandatory.
It's recommended that it NOT contain "'", '"', ';', ',', '\' as they will need to be escaped and may produce odd results.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Information or caveats about the function e.g.
'This function is not supported in Linux'


## RELATED LINKS

[Specify a URI to a help page, this will show when Get-Help -Online is used.] ()

