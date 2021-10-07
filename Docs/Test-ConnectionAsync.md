---
external help file: PoshFunctions-help.xml
Module Name: poshfunctions
online version:
schema: 2.0.0
---

# Test-ConnectionAsync

## SYNOPSIS
Performs a ping test asynchronously

## SYNTAX

```
Test-ConnectionAsync [[-ComputerName] <String[]>] [-Timeout <Int32>] [-TimeToLive <Int32>]
 [-BufferSize <Int32>] [-IncludeSource] [-Full] [<CommonParameters>]
```

## DESCRIPTION
Performs a ping test asynchronously

## EXAMPLES

### EXAMPLE 1
```
Test-ConnectionAsync -ComputerName server1,server2
```

ComputerName IPAddress     Result
------------ ---------     ------
server1      192.168.1.31 Success
server2      192.168.1.41 Success

Description
-----------
Performs asynchronous ping test against listed systems and lists brief output.

### EXAMPLE 2
```
Test-ConnectionAsync -ComputerName server1,server2 -Full
```

ComputerName IPAddress    BufferSize  Result ResponseTime
------------ ---------    ----------  ------ ------------
server1      192.168.1.31         32 Success           86
server2      192.168.1.41         32 Success           79

Description
-----------
Performs asynchronous ping test against listed systems and lists full output.

### EXAMPLE 3
```
Test-ConnectionAsync -ComputerName server1,server2 -Full -BufferSize 1500
```

ComputerName IPAddress    BufferSize  Result ResponseTime
------------ ---------    ----------  ------ ------------
server1      192.168.1.31       1500 Success          140
server2      192.168.1.41       1500 Success          137

Description
-----------
Performs asynchronous ping test against listed systems and lists full output with a buffersize of 1500 bytes.

## PARAMETERS

### -ComputerName
List of computers to test connection.
Aliased to 'CN', 'Server'

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Timeout
Timeout in milliseconds.
Default 2000 ms.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 2000
Accept pipeline input: False
Accept wildcard characters: False
```

### -TimeToLive
Sets a time to live on ping request.
Default 128.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Ttl

Required: False
Position: Named
Default value: 128
Accept pipeline input: False
Accept wildcard characters: False
```

### -BufferSize
How large you want the buffer to be.
Valid range 32-65500, default of 32.
If the buffer is 1501 bytes or greater then the ping can fragment.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 32
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeSource
A switch determining if you want the source computer name to appear in the output

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

### -Full
A switch determining if full output appears

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

### [pscustomobject] with output from Net.AsyncPingResult and optionally the source address
## NOTES
Inspired by Test-ConnectionAsync by 'Boe Prox'
https://gallery.technet.microsoft.com/scriptcenter/Asynchronous-Network-Ping-abdf01aa
* fixed logic around processing pipeline
* removed $Buffer parameter
* added $BufferSize parameter and dynamically create $Buffer from $BufferSize
* added $IncludeSource so that source computer would be included in output
* added $Full so that default output is brief
* changed datatype of .IPAddress to \[version\] so that it can be sorted properly

## RELATED LINKS
