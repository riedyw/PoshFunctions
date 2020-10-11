---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: http://code.msdn.microsoft.com/PSRemoteRegistry
schema: 2.0.0
---

# Get-RegExpandString

## SYNOPSIS
Retrieves a null-terminated string that contains unexpanded references to environment variables (REG_EXPAND_SZ) from local or remote computers.

## SYNTAX

```
Get-RegExpandString [[-ComputerName] <String[]>] [[-Hive] <String>] [-Key] <String> [-Value] <String>
 [-ExpandEnvironmentNames] [-Ping] [<CommonParameters>]
```

## DESCRIPTION
Use Get-RegExpandString to retrieve a null-terminated string that contains unexpanded references to environment variables (REG_EXPAND_SZ) from local or remote computers.

## EXAMPLES

### EXAMPLE 1
```
$Key = "SOFTWARE\Microsoft\Windows\CurrentVersion"
```

Get-RegExpandString -Key $Key -Value ProgramFilesPath

ComputerName Hive Key Value Data Type
------------ ---- --- ----- ---- ----
COMPUTER1 LocalMachine SOFTWARE\Microsof...
ProgramFilesPath %ProgramFiles% ExpandString

Description
-----------
The command gets the registry ProgramFilesPath ExpandString value from the local computer.
The returned value contains unexpanded references to environment variables.

### EXAMPLE 2
```
Get-RegExpandString -Key $Key -Value ProgramFilesPath -ComputerName SERVER1,SERVER2,SERVER3 -ExpandEnvironmentNames -Ping
```

ComputerName Hive Key Value Data Type
------------ ---- --- ----- ---- ----
SERVER1 LocalMachine SOFTWARE\Microsof...
ProgramFilesPath C:\Program Files ExpandString
SERVER2 LocalMachine SOFTWARE\Microsof...
ProgramFilesPath C:\Program Files ExpandString
SERVER3 LocalMachine SOFTWARE\Microsof...
ProgramFilesPath C:\Program Files ExpandString

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
Aliases: CN, __SERVER, IPAddress

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
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

Required: False
Position: 2
Default value: LocalMachine
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Key
The path of the registry key to open.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Value
The name of the registry value.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ExpandEnvironmentNames
Expands values containing references to environment variables using data from the local environment.

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

### -Ping
Use ping to test if the machine is available before connecting to it.
If the machine is not responding to the test a warning message is output.

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSFanatic.Registry.RegistryValue (PSCustomObject)
## NOTES
Author: Shay Levy
Blog : http://blogs.microsoft.co.il/blogs/ScriptFanatic/

## RELATED LINKS

[http://code.msdn.microsoft.com/PSRemoteRegistry](http://code.msdn.microsoft.com/PSRemoteRegistry)

[Set-RegExpandString
Get-RegValue
Remove-RegValue
Test-RegValue]()

