---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-DNSHostEntryAsync

## SYNOPSIS

Performs a DNS Get Host asynchronously

## SYNTAX

### __AllParameterSets

```
Get-DNSHostEntryAsync [[-ComputerName <String[]>]] [<CommonParameters>]
```

## DESCRIPTION

Performs a DNS Get Host asynchronously


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-DNSHostEntryAsync -Computername google.com,prox-hyperv,bing.com, github.com, powershellgallery.com, powershell.org
```







### Example 2: EXAMPLE 2

```
Get-DNSHostEntryAsync -ComputerName 8.8.8.8, ibm.com
```

Would return:
ComputerName Result
------------ ------
8.8.8.8      dns.google
ibm.com      129.42.38.10






## PARAMETERS

### -ComputerName

{{ Fill ComputerName Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: CN,Server
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### Net.AsyncGetHostResult



## NOTES

Inspired by: Get-DNSHostEntryAsync by Boe Prox

Changes:
* added example to comment based help
* slight formatting changes


## RELATED LINKS

Fill Related Links Here

