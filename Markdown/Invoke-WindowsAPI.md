---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Invoke-WindowsAPI

## SYNOPSIS
Describe purpose of "Invoke-WindowsAPI" in 1-2 sentences.

## SYNTAX

```
Invoke-WindowsAPI [[-DllName] <String>] [[-ReturnType] <Type>] [[-MethodName] <String>]
 [[-ParameterTypes] <Type[]>] [[-Parameters] <Object[]>] [<CommonParameters>]
```

## DESCRIPTION
Add a more complete description of what the function does.

## EXAMPLES

### EXAMPLE 1
```
[void] (Invoke-WindowsApi -DllName 'kernel32.dll' -ReturnType ([UInt32]) -MethodName 'WritePrivateProfileString' -ParameterTypes $ParameterTypes -Parameters $Parameters)
```

The function as used in the Set-PrivateProfileString function.

## PARAMETERS

### -DllName
The name of the DLL file to be referenced.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReturnType
The datatype that will be returned by the invoking of the API.

```yaml
Type: Type
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MethodName
The name of the method within the DLL that will be used.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ParameterTypes
Describe parameter -ParameterTypes.

```yaml
Type: Type[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Parameters
The parameters to be passed to the API.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### List of input types that are accepted by this function.
## OUTPUTS

### List of output types produced by this function.
## NOTES
##############################################################################
##
## Invoke-WindowsApi.ps1
##
## From PowerShell Cookbook (O'Reilly)
## by Lee Holmes (http://www.leeholmes.com/guide)
##
## Invoke a native Windows API call that takes and returns simple data types.
##
## ie:
##
## ## Prepare the parameter types and parameters for the
## CreateHardLink function
## $ParameterTypes = \[string\], \[string\], \[IntPtr\]
## $Parameters = \[string\] $filename, \[string\] $existingFilename, \[IntPtr\]::Zero
##
## ## Call the CreateHardLink method in the Kernel32 DLL
## $result = Invoke-WindowsApi "kernel32" (\[bool\]) "CreateHardLink" $ParameterTypes $Parameters
##
##############################################################################

## RELATED LINKS

[URLs to related sites
The first link is opened by Get-Help -Online Invoke-WindowsAPI]()

