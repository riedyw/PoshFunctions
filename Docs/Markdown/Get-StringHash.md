---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version: https://social.msdn.microsoft.com/Forums/vstudio/en-US/0221d962-26e6-4a7e-be7a-72cd669a0dfc/why-systemmathround0251-2?forum=vbgeneral

Talks about Visual Basic but the same info applies to Powershell.
schema: 2.0.0
---

# Get-StringHash

## SYNOPSIS
To calculate a hash for provided strings

## SYNTAX

```
Get-StringHash [[-String] <String[]>] [[-Algorithm] <String>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
To calculate a hash for provided strings

## EXAMPLES

### EXAMPLE 1
```
Get-StringHash -String 123, hello -IncludeInput -Algorithm SHA1
```

Algorithm Hash                                     String
--------- ----                                     ------
SHA1      40BD001563085FC35165329EA1FF5C5ECBDBBEEF 123
SHA1      AAF4C61DDCC5E8A2DABEDE0F3B482CD9AEA9434D hello

### EXAMPLE 2
```
123, 'hello' | Get-StringHash -IncludeInput
```

Algorithm Hash                             String
--------- ----                             ------
MD5       202CB962AC59075B964B07152D234B70 123
MD5       5D41402ABC4B2A76B9719D911017C592 hello

### EXAMPLE 3
```
Get-StringHash -String hello
```

5D41402ABC4B2A76B9719D911017C592

## PARAMETERS

### -String
A string or array of strings that you want to send through a hashing function.
Accepts input from the pipeline

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Algorithm
The hashing algorithm to run against the string.
Valid entries are: 'SHA1', 'SHA256', 'SHA384', 'SHA512', 'MACTripleDES', 'MD5', 'RIPEMD160'
Defaults to 'MD5'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: MD5
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInput
Switch to include input in the output stream.

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

### string
## NOTES

## RELATED LINKS
