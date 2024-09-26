---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Test-NtpDateVsNow

## SYNOPSIS

To test whether local time and NTP time fall within a particular tolerance

## SYNTAX

### __AllParameterSets

```
Test-NtpDateVsNow [[-ComputerName <String>]] [-IncludeInput] [-Tolerance <Int32>] [<CommonParameters>]
```

## DESCRIPTION

To test whether local time and NTP time fall within a particular tolerance.
The NTP protocol allows for an acceptable drift between local and NTP time.
Will return a [Boolean] and accepts the -Verbose parameter


## EXAMPLES

### Example 1: EXAMPLE 1

```
Test-NtpDateVsNow $DC
```

Assuming $DC holds the name of the domain controller then would return the boolean
$True





### Example 2: EXAMPLE 2

```
Test-NtpDateVsNow "DoesNotExist"
```

Assuming "DoesNotExist" doesn't actually exist as a computer name then would return the boolean
$False





### Example 3: EXAMPLE 3

```
Test-NtpDateVsNow -ComputerName server01 -IncludeInput
```

Example result
LocalDate            NTPDate              Tolerance Difference Result NTPServer
---------            -------              --------- ---------- ------ ---------
2/23/2021 2:18:02 PM 2/23/2021 2:18:02 PM       300  0.4763647   True server01






## PARAMETERS

### -ComputerName

The name or IPv4 address of the computer running NTP.
If left blank uses the Get-ADDomainController command to find domain controller which runs NTP.
Aliased
to 'CN', 'Server', 'NtpServer'

```yaml
Type: String
Parameter Sets: (All)
Aliases: NtpServer,CN,Server
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: (Get-ADDomainController).HostName
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -IncludeInput

Switch indicating whether to include the input parameters in the output

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

### -Tolerance

The acceptable number of seconds difference between local and NTP time.
Default = 300.
Valid range 1-3600 seconds (1 hour)

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: 300
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### A boolean $true or $false indicating if comparing local time to NTP time falls within a tolerance



## NOTES

Will return a value of $False if either: a) the time difference is greater than the $Tolerance; or b) the time server does not reply to the NTP time request being sent by this function


## RELATED LINKS

[NTP - Network Time Protocol] ()

[w32tm.exe] ()

[] (http://www.pool.ntp.org/en/)

