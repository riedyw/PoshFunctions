---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Get-Type

## SYNOPSIS
Get exported types in the current session

## SYNTAX

```
Get-Type [[-Module] <String>] [[-Assembly] <String>] [[-FullName] <String>] [[-Namespace] <String>]
 [[-BaseType] <String>] [-IsEnum] [<CommonParameters>]
```

## DESCRIPTION
Get exported types in the current session

## EXAMPLES

### EXAMPLE 1
```
#List the full name of all Enums in the current session
```

Get-Type -IsEnum $true | Select -ExpandProperty FullName | Sort -Unique

### EXAMPLE 2
```
#Connect to a web service and list all the exported types
```

#Connect to the web service, give it a namespace we can search on
    $weather = New-WebServiceProxy -uri "http://www.webservicex.net/globalweather.asmx?wsdl" -Namespace GlobalWeather

#Search for the namespace
    Get-Type -NameSpace GlobalWeather

    IsPublic IsSerial Name                                     BaseType
    -------- -------- ----                                     --------
    True     False    MyClass1ex_net_globalweather_asmx_wsdl   System.Object
    True     False    GlobalWeather                            System.Web.Services.Protocols.SoapHttpClientProtocol
    True     True     GetWeatherCompletedEventHandler          System.MulticastDelegate
    True     False    GetWeatherCompletedEventArgs             System.ComponentModel.AsyncCompletedEventArgs
    True     True     GetCitiesByCountryCompletedEventHandler  System.MulticastDelegate
    True     False    GetCitiesByCountryCompletedEventArgs     System.ComponentModel.AsyncCompletedEventArgs

## PARAMETERS

### -Module
Filter on Module. 
Accepts wildcard

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Assembly
Filter on Assembly. 
Accepts wildcard

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -FullName
Filter on FullName. 
Accepts wildcard

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Namespace
Filter on Namespace. 
Accepts wildcard

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -BaseType
Filter on BaseType. 
Accepts wildcard

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsEnum
Filter on IsEnum.

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
