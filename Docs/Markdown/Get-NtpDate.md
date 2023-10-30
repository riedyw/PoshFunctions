---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-NtpDate

## SYNOPSIS

To get the time from an NTP server

## SYNTAX

### __AllParameterSets

```
Get-NtpDate [-ComputerName] <String> [-Port <Int32>] [<CommonParameters>]
```

## DESCRIPTION

To get the time from an NTP server.

Will return a [DateTime] and accepts the -Verbose parameter.
If request fails it will return "1/1/1900"


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-NtpDate $DC
```

Assuming $DC holds the name of the domain controller then would return a datetime similar to
Monday, March 05, 2018 9:52:57 AM






## PARAMETERS

### -ComputerName

The name or IPv4 address of the computer running NTP.
Aliased to 'CN', 'Server', 'NtpServer'

```yaml
Type: String
Parameter Sets: (All)
Aliases: CN,Server,NtpServer
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Port

The port number NTP is listening to.
Defaults to 123

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 123
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### [datetime]



## NOTES



## RELATED LINKS

Fill Related Links Here

