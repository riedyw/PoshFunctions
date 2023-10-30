---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-PrintableAscii

## SYNOPSIS

Gets an array of objects that show printable Ascii characters.

## SYNTAX

### Default (Default)

```
Get-PrintableAscii [-Class <Char>] [<CommonParameters>]
```

### NotSimilar

```
Get-PrintableAscii [-Class <Char>] [-NotSimilar] [<CommonParameters>]
```

### Similar

```
Get-PrintableAscii [-Class <Char>] [-Similar] [<CommonParameters>]
```

## DESCRIPTION

Gets an array of objects that show printable Ascii characters.
It shows the character code in decimal,
in hex, the character itself, and the 'class' of character.

U - Uppercase letters
L - Lowercase letters
N - Numbers
S - Symbols (not U, L, or N)

Will also mark characters that are similar to one another at first glance which you may want to avoid when generating a password.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-PrintableAscii | Select-Object -First 10
```

Would return:
Ascii Hex Char    Class Similar
----- --- ----    ----- -------
   32 20  (Space) S       False
   33 21  !       S       False
   34 22  "       S       False
   35 23  #       S       False
   36 24  $       S       False
   37 25  %       S       False
   38 26  &       S       False
   39 27  '       S        True
   40 28  (       S       False
   41 29  )       S       False





### Example 2: EXAMPLE 2

```
Get-PrintableAscii -Class N
```

Ascii Hex Char Class Similar
----- --- ---- ----- -------
   48 30     0 N        True
   49 31     1 N        True
   50 32     2 N       False
   51 33     3 N       False
   52 34     4 N       False
   53 35     5 N       False
   54 36     6 N       False
   55 37     7 N       False
   56 38     8 N       False
   57 39     9 N       False






## PARAMETERS

### -Class

Single character U, L, N, S indicating you only want that class to be displayed.
Optional.

```yaml
Type: Char
Parameter Sets: NotSimilar, Similar, Default
Aliases: 
Accepted values: 

Required: True (None) False (NotSimilar, Similar, Default)
Position: Named
Default value: 
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -NotSimilar

Switch that will only display characters that are not similar.
Default is to print all.
ParameterSetName = 'NotSimilar'

```yaml
Type: SwitchParameter
Parameter Sets: NotSimilar
Aliases: 
Accepted values: 

Required: True (None) False (NotSimilar)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Similar

Switch that will only display characters that are similar.
Default is to print all.
ParameterSetName = 'Similar'

```yaml
Type: SwitchParameter
Parameter Sets: Similar
Aliases: 
Accepted values: 

Required: True (None) False (Similar)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## NOTES



## RELATED LINKS

Fill Related Links Here

