---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# New-WifiUri

## SYNOPSIS
To create a WIFI uri that can be used for input to New-QRCode

## SYNTAX

```
New-WifiUri [-SSID] <String> [-Password] <String> [[-EncryptionType] <String>] [-Hidden] [<CommonParameters>]
```

## DESCRIPTION
To create a WIFI uri that can be used for input to New-QRCode

## EXAMPLES

### EXAMPLE 1
```
New-WifiUri -SSID 'Corp WiFi' -Password "It is a secret"
```

WIFI:S:Corp WiFi;T:WPA2;P:It is a secret;H:false;;

## PARAMETERS

### -SSID
The SSID name.
Mandatory.
It's recommended that it NOT contain "'", '"', ';', ',', '\' as they will need to be escaped and may produce odd results.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
The password.
Mandatory.
It's recommended that it NOT contain "'", '"', ';', ',', '\' as they will need to be escaped and may produce odd results.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EncryptionType
The encryption used on the link.
Valid values: 'WPA2', 'WPA', 'WEP'.
Defaults as 'WPA2'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: WPA2
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hidden
Switch indicating that the SSID is hidden and not broadcast

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
Information or caveats about the function e.g.
'This function is not supported in Linux'

## RELATED LINKS

[Specify a URI to a help page, this will show when Get-Help -Online is used.]()

