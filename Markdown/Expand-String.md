---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://www.google.com
schema: 2.0.0
---

# Expand-String

## SYNOPSIS
Expanding a string expression.
Can handle Powershell string expressions or Environment variable expansion.

## SYNTAX

### PsString (Default)
```
Expand-String [-String] <String[]> [-PowershellString] [-IncludeInput] [<CommonParameters>]
```

### StrResource
```
Expand-String [-String] <String[]> [-StringResource] [-IncludeInput] [<CommonParameters>]
```

### EnvVar
```
Expand-String [-String] <String[]> [-EnvironmentVariable] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
Expanding a string expression.
Can handle Powershell string expressions or Environment variable expansion.

## EXAMPLES

### EXAMPLE 1
```
# Expanding Powershell string
```

Expand-String '$psculture'

Assuming you have English US as the local installed culture this would return:
en-US

### EXAMPLE 2
```
# Expanding Powershell string including original string in the output
```

Expand-String '$psculture' -PsString -IncludeInput

#Assuming you have English US as the local installed culture this would return:
String     Conversion Expanded
------     ---------- --------
$psculture PsString   en-US

### EXAMPLE 3
```
# Expanding environment variable
```

Expand-String -String '%PROCESSOR_ARCHITECTURE%' -EnvironmentVariable

#Assuming you are a 64 bit machine, the function would return:
AMD64

### EXAMPLE 4
```
# Expanding environment variable including orginal string
```

Expand-String -String '%PROCESSOR_ARCHITECTURE%' -EnvironmentVariable -IncludeInput

#Assuming you are a 64 bit machine, the function would return:
String                   Conversion Expanded
------                   ---------- --------
%PROCESSOR_ARCHITECTURE% EnvVar     AMD64

### EXAMPLE 5
```
# Resource strings are stored within DLL's and are referenced by an ID number. An example would be
```

# @%SystemRoot%\system32\shell32.dll,-21770
# and they are found in Desktop.ini files and also the registry.

$ResourceString = (Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation').DisplayName
Expand-String -String $ResourceString -StringResource -IncludeInput

# Would return the following if your Windows install culture was en-US
String                                 Conversion  Expanded
------                                 ----------  --------
@%systemroot%\system32\wkssvc.dll,-100 StrResource Workstation

## PARAMETERS

### -String
The string that you want expanded.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -PowershellString
A switch to expand the string expression as a Powershell string

```yaml
Type: SwitchParameter
Parameter Sets: PsString
Aliases: PsString

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnvironmentVariable
A switch to expand the string expression as an environment variable.

```yaml
Type: SwitchParameter
Parameter Sets: EnvVar
Aliases: EnvVar

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -StringResource
A switch to expand the string expression as a StringResource which can be found in desktop.ini and registry entries.
An example is '@%SystemRoot%\system32\shell32.dll,-21770'

```yaml
Type: SwitchParameter
Parameter Sets: StrResource
Aliases: StrResource

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
A switch to determine if you want the original string expression to appear in the output.
Aliased to 'IncludeOriginal'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeOriginal

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

### string
## NOTES
The c# source code was found by me on the Internet, but I can't determine where I originally found it.
The ability to expand
a StrResource is thanks to that code.

## RELATED LINKS
