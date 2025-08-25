---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Remove-TemporaryFile

## SYNOPSIS
Cleans user profiles of temporary files and folders that are greater than 3 days

## SYNTAX

```
Remove-TemporaryFile [[-Days] <Int32>] [-All] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Gets list of all local profiles, ignoring those belonging to 'NT Authority'.
It then searches that profiles %TEMP% folder and
removes top level files and folders older than $Days day old.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Days
Integer value of days back in time looking for candidate files and folders.
Valid range 1-7
Defaults to 3

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 3
Accept pipeline input: False
Accept wildcard characters: False
```

### -All
{{ Fill All Description }}

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Designed to run in a Remote System Powershell prompt

Should be run as administrator

Author:  Bill Riedy
Moddate: 4/29/2025
Ver:     1.0

## RELATED LINKS
