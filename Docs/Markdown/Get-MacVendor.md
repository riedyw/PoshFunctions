---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-MacVendor

## SYNOPSIS

Resolve MacAddresses To Vendors

## SYNTAX

### __AllParameterSets

```
Get-MacVendor [-MacAddress] <String[]> [<CommonParameters>]
```

## DESCRIPTION

This Function Queries The MacVendors API With Supplied MacAdderess And Returns Manufacturer Information If A Match Is Found


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-MacVendor -MacAddress 00:00:00:00:00:00
```







### Example 2: EXAMPLE 2

```
Warning ! ! This may error due to api limits
```

Get-DhcpServerv4Lease -ComputerName $ComputerName -ScopeId $ScopeId | Select -ExpandProperty ClientId | Foreach-Object {Get-MacVendor -MacAddress $_; sleep 1}

Get-NetAdapter | select -ExpandProperty MacAddress | Foreach-Object {Get-MacVendor -MacAddress $_; sleep 1}





### Example 3: EXAMPLE 3

```
Get-MacVendor -MacAddress 00-09-0F-AA-00-01, B8-31-B5-3D-75-D1, 00-09-0F-FE-00-01, F0-6E-0B-DA-B6-A7, F0-6E-0B-DA-B6-A8
```

Would return
MacAddress        Vendor
----------        ------
00-09-0F-AA-00-01 Fortinet Inc.
B8-31-B5-3D-75-D1 Microsoft Corporation
00-09-0F-FE-00-01 Fortinet Inc.
F0-6E-0B-DA-B6-A7 Microsoft Corporation
F0-6E-0B-DA-B6-A8 Microsoft Corporation






## PARAMETERS

### -MacAddress

MacAddress To Be Resolved

```yaml
Type: String[]
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

Originally published as script Get-MacVendor.ps1 on PSGallery
* added write-verbose
* removed a-f in regex as case insensitive by default
* added example
* moved validate regex further into script and used Format-MacAddress to clean up addresses that don't match pattern like those seen on switches (ex.
34fcb9-c08bce)


## RELATED LINKS

Fill Related Links Here

