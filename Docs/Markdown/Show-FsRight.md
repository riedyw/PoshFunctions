---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Show-FsRight

## SYNOPSIS

To list all potential file system rights

## SYNTAX

### __AllParameterSets

```
Show-FsRight [<CommonParameters>]
```

## DESCRIPTION

To list all potential file system rights


## EXAMPLES

### Example 1: EXAMPLE 1

```
Show-FsRight
```

Would return
A listing of all of the explicit filesystemrights

                    Name Type   Hex                    Dec
                    ---- ----   ---                    ---
                ReadData Single 0x00000001               1
             CreateFiles Single 0x00000002               2
              AppendData Single 0x00000004               4
  ReadExtendedAttributes Single 0x00000008               8
 WriteExtendedAttributes Single 0x00000010              16
             ExecuteFile Single 0x00000020              32
DeleteSubdirectoriesAndFiles Single 0x00000040              64
          ReadAttributes Single 0x00000080             128
         WriteAttributes Single 0x00000100             256
                   Write Single 0x00000116             278
                  Delete Single 0x00010000           65536
         ReadPermissions Single 0x00020000          131072
                    Read Single 0x00020089          131209
          ReadAndExecute Single 0x000200A9          131241
                  Modify Single 0x000301BF          197055
       ChangePermissions Single 0x00040000          262144
           TakeOwnership Single 0x00080000          524288
             Synchronize Single 0x00100000         1048576
                    Read Combo  0x00120089         1179785
          ReadAndExecute Combo  0x001200A9         1179817
              Read,Write Combo  0x0012019F         1180063
    ReadAndExecute,Write Combo  0x001201BF         1180095
ReadAndExecute,Modify,Write Combo  0x001301BF         1245631
             FullControl Single 0x001F01FF         2032127
    AccessSystemSecurity Combo  0x01000000        16777216
          MaximumAllowed Combo  0x02000000        33554432
              GenericAll Combo  0x10000000       268435456
          GenericExecute Combo  0x20000000       536870912
            GenericWrite Combo  0x40000000      1073741824
             GenericRead Combo  0x80000000      2147483648
  ReadAndExecuteExtended Combo  0xFFA0000000 1097901015040






## PARAMETERS


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## OUTPUTS

### An array of objects containing the fields Name, Type, Dec, Hex



## NOTES



## RELATED LINKS

Fill Related Links Here

