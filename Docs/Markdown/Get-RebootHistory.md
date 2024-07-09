---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-RebootHistory

## SYNOPSIS

This will output who initiated a reboot or shutdown event.

## SYNTAX

### __AllParameterSets

```
Get-RebootHistory [[-ComputerName <String[]>]] [[-DaysFromToday <Int32>]] [[-MaxEvents <Int32>]] [<CommonParameters>]
```

## DESCRIPTION

This will output who initiated a reboot or shutdown event.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-RebootHistory -ComputerName Server01, Server02
```







### Example 2: EXAMPLE 2

```
Get-RebootHistory -DaysFromToday 30 -MaxEvents 1
```








## PARAMETERS

### -ComputerName

Specify a computer name you would like to check.
 Default: $env:COMPUTERNAME

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $env:COMPUTERNAME
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -DaysFromToday

Specify the amount of days in the past you would like to search for.
Default: 90

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: 90
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -MaxEvents

Specify the number of events you would like to search for (from newest to oldest).
Default 9999

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 2
Default value: 9999
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES

Name: Get-RebootHistory
Author: theSysadminChannel
Version: 1.0
DateCreated: 2020-Aug-5
Source: https://thesysadminchannel.com/get-reboot-history-using-powershell/

Added  @{PSTypeName   = 'PFGetRebootHistory'; ComputerName = $Computer; LogName = 'System'; EventId} to object returned


## RELATED LINKS

[] (https://thesysadminchannel.com/get-reboot-history-using-powershell)

