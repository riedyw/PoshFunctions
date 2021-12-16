---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version: https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
schema: 2.0.0
---

# Get-MyLocalLogonTime

## SYNOPSIS
Gets local logon time for the current user

## SYNTAX

```
Get-MyLocalLogonTime [-Detail] [<CommonParameters>]
```

## DESCRIPTION
Gets local logon time for the current user

## EXAMPLES

### EXAMPLE 1
```
Get-MyLocalLogonTime
```

Friday, July 30, 2021 7:54:36 AM

### EXAMPLE 2
```
Get-MyLocalLogonTime -Detail
```

User               ComputerName LocalLogonTime
----               ------------ --------------
contosco\testuser  demolaptop   7/30/2021 7:54:36 AM

## PARAMETERS

### -Detail
Switch to include detail in output.
If not specified just the logon time is returned.

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

## NOTES
Inspired by: https://community.idera.com/database-tools/powershell/script_library/m/local-accounts/30450

## RELATED LINKS
