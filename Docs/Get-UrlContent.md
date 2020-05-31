---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Get-UrlContent

## SYNOPSIS
To get the HTML content of a specified URL

## SYNTAX

```
Get-UrlContent [-URL] <String> [-IgnoreSslError] [<CommonParameters>]
```

## DESCRIPTION
To get the HTML content of a specified URL

## EXAMPLES

### EXAMPLE 1
```
Get-UrlContent -URL "http://www.google.com"
```

Would return:
The HTML content that is found on Google's homepage

### EXAMPLE 2
```
Get-UrlContent -URL "https://secureServer"
```

Assuming the computer does not have a valid certificate for secureServer then this would return:
$Null

### EXAMPLE 3
```
Get-UrlContent -URL "https://secureServer" -IgnoreSslError
```

Assuming the computer does not have a valid certificate for secureServer and you wish to override the SSL error then this would return:
The HTML content that is found on secureServer's homepage

## PARAMETERS

### -URL
The URL string, which should begin with "https://" or "http://"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -IgnoreSslError
To ignore any SSL errors that are generated

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

### Either $Null if any errors exist or a [string] if successful

## NOTES
Author:     Bill Riedy
Version:    1.0
Date:       2018/03/13
Notes:      Assumes that the computer specified in the URL is up and running and listening to the appropriate TCP port

## RELATED LINKS
