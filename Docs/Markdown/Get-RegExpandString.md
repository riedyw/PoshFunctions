---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-RegExpandString

## SYNOPSIS

Retrieves a null-terminated string that contains unexpanded references to environment variables (REG_EXPAND_SZ) from local or remote computers.

## SYNTAX

### __AllParameterSets (Default)

```
Get-RegExpandString [[-ComputerName <String[]>]] [[-Hive <String>]] [-Key] <String> [-Value] <String> [-ExpandEnvironmentNames] [-Ping] [<CommonParameters>]
```

## DESCRIPTION

Use Get-RegExpandString to retrieve a null-terminated string that contains unexpanded references to environment variables (REG_EXPAND_SZ) from local or remote computers.


## EXAMPLES

### Example 1: EXAMPLE 1

```
$Key = "SOFTWARE\Microsoft\Windows\CurrentVersion"
```

Get-RegExpandString -Key $Key -Value ProgramFilesPath

ComputerName Hive         Value            Key                                       Data                   Type
------------ ----         -----            ---                                       ----                   ----
DemoLaptop   LocalMachine ProgramFilesPath SOFTWARE\Microsoft\Windows\CurrentVersion %ProgramFiles% ExpandString

Description
-----------
The command gets the registry ProgramFilesPath ExpandString value from the local computer.
The returned value contains unexpanded references to environment variables.





### Example 2: EXAMPLE 2

```
Get-RegExpandString -Key $Key -Value ProgramFilesPath -ComputerName server1, server2 -ExpandEnvironmentNames -Ping
```

ComputerName Hive         Value            Key                                       Data                     Type
------------ ----         -----            ---                                       ----                     ----
server1      LocalMachine ProgramFilesPath SOFTWARE\Microsoft\Windows\CurrentVersion C:\Program Files ExpandString
server2      LocalMachine ProgramFilesPath SOFTWARE\Microsoft\Windows\CurrentVersion C:\Program Files ExpandString

Description
-----------
The command gets the registry ProgramFilesPath ExpandString value from three remote computers.
When the ExpandEnvironmentNames Switch parameter is used, the data of the value is expnaded based on the environment variables data from the local environment.
When the Switch parameter Ping is specified the command issues a ping test to each computer.
If the computer is not responding to the ping request a warning message is written to the console and the computer is not processed.






## PARAMETERS

### -ComputerName

An array of computer names.
The default is the local computer.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: CN,Server,__SERVER,IPAddress
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: $env:COMPUTERNAME
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -ExpandEnvironmentNames

Expands values containing references to environment variables using data from the local environment.

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

### -Hive

The HKEY to open, from the RegistryHive enumeration.
The default is 'LocalMachine'.
Possible values:

- ClassesRoot
- CurrentUser
- LocalMachine
- Users
- PerformanceData
- CurrentConfig
- DynData

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 1
Default value: LocalMachine
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Key

The path of the registry key to open.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 2
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```

### -Ping

Use ping to test if the machine is available before connecting to it.
If the machine is not responding to the test a warning message is output.

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

### -Value

The name of the registry value.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 3
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### PSFanatic.Registry.RegistryValue (PSCustomObject)



## NOTES

Author: Shay Levy
Blog : http://blogs.microsoft.co.il/blogs/ScriptFanatic/

# source: https://www.powershellgallery.com/packages/RemoteRegistry/1.0.3/Content/Public%5CGet-RegExpandString.ps1

* notes for remote servers you need administrative privileges to that remote computername
* added write-verbose statements
* corrected some spelling
* commented out return for ping that fails
* modified statement for new-object -typename psobject, changed -Property @{} to -Property ([ordered] @{}) so columns come out in order desired
* updated examples


## RELATED LINKS

[] (http://code.msdn.microsoft.com/PSRemoteRegistry)

[Set-RegExpandString
Get-RegValue
Remove-RegValue
Test-RegValue] ()

