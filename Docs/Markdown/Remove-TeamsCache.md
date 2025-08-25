---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Remove-TeamsCache

## SYNOPSIS
Removes the data that is in the Teams cache for the current user

## SYNTAX

```
Remove-TeamsCache [-All] [<CommonParameters>]
```

## DESCRIPTION
Removes the data that is in the Teams cache.
If you are running from an elevated prompt you can remove Teams cache for all users.

## EXAMPLES

### EXAMPLE 1
```
Remove-TeamsCache
```

## PARAMETERS

### -All
A switch to indicate removing the Teams cache for all users

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
Inspired by https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/deleting-microsoft-teams-cache-data

## RELATED LINKS
