---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
schema: 2.0.0
---

# Get-MacVendor

## SYNOPSIS
Resolve MacAddresses To Vendors

## SYNTAX

```
Get-MacVendor [-MacAddress] <String[]> [<CommonParameters>]
```

## DESCRIPTION
This Function Queries The MacVendors API With Supplied MacAdderess And Returns Manufacturer Information If A Match Is Found

## EXAMPLES

### EXAMPLE 1
```
Get-MacVendor -MacAddress 00:00:00:00:00:00
```

### EXAMPLE 2
```
Warning ! ! This may error due to api limits
```

Get-DhcpServerv4Lease -ComputerName $ComputerName -ScopeId $ScopeId | Select -ExpandProperty ClientId | Foreach-Object {Get-MacVendor -MacAddress $_; sleep 1}

Get-NetAdapter | select -ExpandProperty MacAddress | Foreach-Object {Get-MacVendor -MacAddress $_; sleep 1}

## PARAMETERS

### -MacAddress
MacAddress To Be Resolved

```yaml
Type: String[]
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

## OUTPUTS

## NOTES

## RELATED LINKS
