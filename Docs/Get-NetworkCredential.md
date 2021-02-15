---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
schema: 2.0.0
---

# Get-NetworkCredential

## SYNOPSIS
Returns a \[System.Net.NetworkCredential\] given a passed \[PSCredential\] parameter

## SYNTAX

```
Get-NetworkCredential [-Credential] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
Returns a \[System.Net.NetworkCredential\] given a passed \[PSCredential\] parameter

## EXAMPLES

### EXAMPLE 1
```
$NetworkCredential = Get-NetworkCredential -Credential $cred
```

## PARAMETERS

### -Credential
A mandatory parameter of type \[PSCredential\]

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### 'PSCredential'
## OUTPUTS

### 'System.Net.NetworkCredential'
## NOTES
Medium to High impact as this function will return the password, albeit hidden from default view

## RELATED LINKS
