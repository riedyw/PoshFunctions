---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://www.google.com
schema: 2.0.0
---

# Convert-UserFlag

## SYNOPSIS
Converts a userflag enumeration to a human readable list of attributes about an AD object.

## SYNTAX

```
Convert-UserFlag [-UserFlag] <Int32> [<CommonParameters>]
```

## DESCRIPTION
Converts a userflag enumeration to a human readable list of attributes about an AD object.

## EXAMPLES

### EXAMPLE 1
```
Convert-UserFlag -UserFlag (0x0200 + 0x0010 + 0x800000)
```

Would return
LOCKOUT, NORMAL_ACCOUNT, PASSWORD_EXPIRED

### EXAMPLE 2
```
Convert-UserFlag -UserFlag (0x0200 +  0x800000)
```

Would return
NOT_LOCKOUT, NORMAL_ACCOUNT, PASSWORD_EXPIRED

## PARAMETERS

### -UserFlag
A integer value providing attributes about an AD object.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### [int]
## OUTPUTS

### [string]
## NOTES

## RELATED LINKS

[https://www.google.com](https://www.google.com)

