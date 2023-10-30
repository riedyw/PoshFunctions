---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Get-BashPath

## SYNOPSIS

To take a normal Windows path and convert it to a bash path for things like git bash.

## SYNTAX

### __AllParameterSets

```
Get-BashPath [-Path] <String[]> [-IncludeInput] [-NoResolvePath] [<CommonParameters>]
```

## DESCRIPTION

To take a normal Windows path and convert it to a bash path for things like git bash.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Get-BashPath -Path 'c:\temp\*.csv'
```

/C/temp/Encoding\ Time.csv





### Example 2: EXAMPLE 2

```
Get-BashPath -Path 'c:\temp\*.csv' -IncludeInput
```

Posh                      bash
----                      ----
C:\temp\Encoding Time.csv /C/temp/Encoding\ Time.csv





### Example 3: EXAMPLE 3

```
$Special = Show-SpecialFolder -IncludeLocations | Where-Object {$_.Location -and $_.Location -match 'Program Files'}
```

$Special | Add-Member -MemberType NoteProperty -Name BashPath -Value 'x'
foreach ($s in $special) { $s.BashPath = Get-BashPath -Path $s.Location }
$Special

Would return
SpecialFolder         Location                            BashPath
-------------         --------                            --------
CommonProgramFiles    C:\Program Files\Common Files       /C/Program\ Files/Common\ Files
CommonProgramFilesX86 C:\Program Files (x86)\Common Files /C/Program\ Files\ (x86)/Common\ Files
ProgramFiles          C:\Program Files                    /C/Program\ Files
ProgramFilesX86       C:\Program Files (x86)              /C/Program\ Files\ (x86)






## PARAMETERS

### -IncludeInput

Switch to indicate if input parameters should be included in the output, aliased to 'IncludeOriginal'

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: IncludeOriginal
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -NoResolvePath

Switch to not resolve the provided path to see if it exists

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
DontShow: False
```

### -Path

A path to a file or files.
Can include wildcards and the wildcards will be resolved to underlying
files.
Can be a single path, an array of paths, or from the pipeline.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (All) False (None)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### psobject



## NOTES

The file(s) must exist for this function to work


## RELATED LINKS

Fill Related Links Here

