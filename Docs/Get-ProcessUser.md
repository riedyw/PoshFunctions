---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Get-ProcessUser

## SYNOPSIS
Get a list of processes and the user context that they run under.
By default excluded system tasks

## SYNTAX

```
Get-ProcessUser [-Name] <String[]> [[-UserName] <String>] [-IncludeSystem] [<CommonParameters>]
```

## DESCRIPTION
Get a list of processes and the user context that they run under.
By default excluded system tasks

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Name
Please enter the name of a computer

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: ComputerName, CN, Server

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -UserName
A -like search string to compare process username context.
Defaults to '*'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeSystem
Switch to include the system scheduled tasks.
Aliased to 'IS'

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

### psobject
## NOTES
Unless the -IncludeSystem switch is specified the following will be excluded from the output:
    'NT Authority\System',
    'NT Authority\Local Service',
    'NT Authority\Network Service'

## RELATED LINKS
