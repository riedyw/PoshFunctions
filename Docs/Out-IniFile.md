---
external help file: MyFunctions-help.xml
Module Name: MyFunctions
online version:
schema: 2.0.0
---

# Out-IniFile

## SYNOPSIS
Write hash content to INI file

## SYNTAX

```
Out-IniFile [-Append] [[-Encoding] <String>] [-FilePath] <String> [-Force] [-InputObject] <Hashtable>
 [-Passthru] [<CommonParameters>]
```

## DESCRIPTION
Write hash content to INI file

## EXAMPLES

### EXAMPLE 1
```
Out-IniFile $IniVar "C:\myinifile.ini"
```

-----------  
Description  
Saves the content of the $IniVar Hashtable to the INI File c:\myinifile.ini

### EXAMPLE 2
```
$IniVar | Out-IniFile "C:\myinifile.ini" -Force
```

-----------  
Description  
Saves the content of the $IniVar Hashtable to the INI File c:\myinifile.ini and overwrites the file if it is already present

### EXAMPLE 3
```
$file = Out-IniFile $IniVar "C:\myinifile.ini" -PassThru
```

-----------  
Description  
Saves the content of the $IniVar Hashtable to the INI File c:\myinifile.ini and saves the file into $file

### EXAMPLE 4
```
$Category1 = @{â€œKey1â€=â€Value1â€;â€Key2â€=â€Value2â€}
```

$Category2 = @{â€œKey1â€=â€Value1â€;â€Key2â€=â€Value2â€}  
$NewINIContent = @{â€œCategory1â€=$Category1;â€Category2â€=$Category2}  
Out-IniFile -InputObject $NewINIContent -FilePath "C:\MyNewFile.INI"  
-----------  
Description  
Creating a custom Hashtable and saving it to C:\MyNewFile.INI

## PARAMETERS

### -Append
Adds the output to the end of an existing file, instead of replacing the file contents.

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

### -Encoding
Specifies the type of character encoding used in the file.
Valid values are "Unicode", "UTF7",  
 "UTF8", "UTF32", "ASCII", "BigEndianUnicode", "Default", and "OEM".
"Unicode" is the default.
 
  
"Default" uses the encoding of the system's current ANSI code page. 
 
  
"OEM" uses the current original equipment manufacturer code page identifier for the operating   
system.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Unicode
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilePath
Specifies the path to the output file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Allows the cmdlet to overwrite an existing read-only file.
Even using the Force parameter, the cmdlet cannot override security restrictions.

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

### -InputObject
Specifies the Hashtable to be written to the file.
Enter a variable that contains the objects or type a command or expression that gets the objects.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Passthru
Passes an object representing the location to the pipeline.
By default, this cmdlet does not generate any output.

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String  
System.Collections.Hashtable

## OUTPUTS

### System.IO.FileSystemInfo

## NOTES
Author        : Oliver Lipkau \<oliver@lipkau.net\>  
Blog        : http://oliver.lipkau.net/blog/  
Source        : https://github.com/lipkau/PsIni 
              http://gallery.technet.microsoft.com/scriptcenter/ea40c1ef-c856-434b-b8fb-ebd7a76e8d91 
Version        : 1.0 - 2010/03/12 - Initial release  
              1.1 - 2012/04/19 - Bugfix/Added example to help (Thx Ingmar Verheij)  
              1.2 - 2014/12/11 - Improved handling for missing output file (Thx SLDR) 
  
#Requires -Version 2.0

## RELATED LINKS

[Get-IniContent]()

