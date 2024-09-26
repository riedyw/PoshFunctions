---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Convert-SecureStringToString

## SYNOPSIS

Converts a SecureString value back to a plaintext string

## SYNTAX

### __AllParameterSets

```
Convert-SecureStringToString [-SecureString] <SecureString> [<CommonParameters>]
```

## DESCRIPTION

Converts a SecureString value back to a plaintext string


## EXAMPLES

### Example 1: EXAMPLE 1

```
$SecureString = Read-Host -Prompt 'Enter a string' -AsSecureString
```

#Let's say you entered the string 'Password' without quotes

Convert-SecureStringToString -SecureString $SecureString

Password






## PARAMETERS

### -SecureString

The SecureString that you want to get back to being plaintext

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### string



## NOTES

# inspired by: https://gallery.technet.microsoft.com/Execute-PowerShell-Script-38881dce


## RELATED LINKS

Fill Related Links Here

