---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# ConvertTo-DecimalIP

## SYNOPSIS
Converts a Dotted Decimal IP address into a 32-bit unsigned integer.

## SYNTAX

## DESCRIPTION
ConvertTo-DecimalIP takes a dotted decimal IP and uses the \[ipaddress\] accelerator to determine 32 bit decimal value

## EXAMPLES

### EXAMPLE 1
```
ConvertTo-DecimalIP -IPAddress 10.20.30.40
```

Would return
673059850

### EXAMPLE 2
```
ConvertTo-DecimalIP -IPAddress 192.168.1.1
```

Would return
16885952

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### string
## NOTES

## RELATED LINKS
