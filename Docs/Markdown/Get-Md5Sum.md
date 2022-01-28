---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
schema: 2.0.0
---

# Get-Md5Sum

## SYNOPSIS
To calculate an Md5Sum for a file

## SYNTAX

```
Get-Md5Sum [[-Path] <String[]>] [-IncludeInput] [<CommonParameters>]
```

## DESCRIPTION
To calculate an Md5Sum for a file

## EXAMPLES

### EXAMPLE 1
```
Assume you have a file that has 4 lines of text in it as follows
```

unicorn unicorn unicorn unicorn
cat cat cat
dog dog
fish

### EXAMPLE 2
```
Get-Md5Sum -Path .\sample.txt
```

351a0b1fd339ec74e3ddd2ddde694d82

### EXAMPLE 3
```
Get-Md5Sum -Path .\sample.txt -IncludeInput
```

File         Md5Sum
----         ------
.\sample.txt 351a0b1fd339ec74e3ddd2ddde694d82

## PARAMETERS

### -Path
The path to the file you wish to calculate the Md5Sum.
Can be a single string or an array of strings.
Can also accept pipeline input.
Aliased to 'File' and 'FileName'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: FileName, File

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -IncludeInput
Switch to include input in the output stream.
Aliased to 'IncludeFile'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeFile

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
