---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-UrlContent

## SYNOPSIS

To get the HTML content of a specified URL

## SYNTAX

### __AllParameterSets

```
Get-UrlContent [-URL] <String> [-IgnoreSslError] [<CommonParameters>]
```

## DESCRIPTION

To get the HTML content of a specified URL


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-UrlContent -URL "http://www.google.com"
```

Would return:
The HTML content that is found on Google's homepage





### Example 2: EXAMPLE 2

```
Get-UrlContent -URL "https://secureServer"
```

Assuming the computer does not have a valid certificate for secureServer then this would return:
$Null





### Example 3: EXAMPLE 3

```
Get-UrlContent -URL "https://secureServer" -IgnoreSslError
```

Assuming the computer does not have a valid certificate for secureServer and you wish to override the SSL error then this would return:
The HTML content that is found on secureServer's homepage






## PARAMETERS

### -IgnoreSslError

To ignore any SSL errors that are generated

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -URL

The URL string, which should begin with "https://" or "http://"

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### Either $Null if any errors exist or a [string] if successful



## NOTES

This function only exists for PowerShell versions prior to the inclusion of Invoke-WebRequest


## RELATED LINKS

Fill Related Links Here

