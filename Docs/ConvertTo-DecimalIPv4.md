---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# ConvertTo-DecimalIPv4

## SYNOPSIS
Converts a Dotted Decimal IP address into a 32-bit unsigned integer.

## SYNTAX

```
ConvertTo-DecimalIPv4 [-IPAddress] <IPAddress> [<CommonParameters>]
```

## DESCRIPTION
ConvertTo-DecimalIP takes a dotted decimal IP and uses the \[ipaddress\] accelerator to determine 32 bit decimal value

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -IPAddress
An IP Address to convert.

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS
