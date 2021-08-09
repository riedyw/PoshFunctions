---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# ConvertFrom-XML

## SYNOPSIS
Convert XML to an object

## SYNTAX

```
ConvertFrom-XML [[-XML] <XmlDocument>] [<CommonParameters>]
```

## DESCRIPTION
Convert XML to an object

## EXAMPLES

### EXAMPLE 1
```
[xml] $xml = @'
```

\<?xml version="1.0" encoding="utf-8"?\>
\<Objects\>
\<Object Type="System.Management.Automation.PSCustomObject"\>
\<Property Name="ComputerName" Type="System.String"\>DemoLaptop\</Property\>
\<Property Name="Path" Type="System.String"\>c:\Temp\</Property\>
\<Property Name="UNCPath" Type="System.String"\>\\\\DemoLaptop\c$\Temp\</Property\>
\</Object\>
\</Objects\>
'@

ConvertFrom-XML -XML $xml

Would return
ComputerName Path    UNCPath
------------ ----    -------
DemoLaptop   c:\Temp \\\\DemoLaptop\c$\Temp

## PARAMETERS

### -XML
The XML that you want converted

```yaml
Type: XmlDocument
Parameter Sets: (All)
Aliases:

Required: False
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
Only tested with single level XML content.
Not tested with hierarchical XML content.

## RELATED LINKS
