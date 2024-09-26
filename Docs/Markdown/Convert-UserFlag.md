---
external help file: poshfunctions-help.xml
Module Name: poshfunctions
online version: 
schema: 2.0.0
---

# Convert-UserFlag

## SYNOPSIS

Converts a userflag enumeration to a human readable list of attributes about an AD object.

## SYNTAX

### __AllParameterSets

```
Convert-UserFlag [[-UserFlag <Int32[]>]] [-IncludeInput] [-ListAvailable] [<CommonParameters>]
```

## DESCRIPTION

Converts a userflag enumeration to a human readable list of attributes about an AD object.


## EXAMPLES

### Example 1: EXAMPLE 1

```
Convert-UserFlag -UserFlag (0x0200 + 0x0010 + 0x800000)
```

Would return
ACCOUNTENABLE, LOCKOUT, NORMAL_ACCOUNT, PASSWORD_EXPIRED





### Example 2: EXAMPLE 2

```
Convert-UserFlag -UserFlag (0x0200 +  0x800000)
```

Would return
NOT_LOCKOUT, ACCOUNTENABLE, NORMAL_ACCOUNT, PASSWORD_EXPIRED





### Example 3: EXAMPLE 3

```
Convert-UserFlag -ListAvailable
```

UserFlagHex UserFlagDec Text
----------- ----------- ----
0x0001                1 SCRIPT
0x0002                2 ACCOUNTDISABLE
0x0008                8 HOMEDIR_REQUIRED
0x0010               16 LOCKOUT
0x0020               32 PASSWD_NOTREQD
0x0040               64 PASSWD_CANT_CHANGE
0x0080              128 ENCRYPTED_TEXT_PWD_ALLOWED
0x0100              256 TEMP_DUPLICATE_ACCOUNT
0x0200              512 NORMAL_ACCOUNT
0x0800             2048 INTERDOMAIN_TRUST_ACCOUNT
0x1000             4096 WORKSTATION_TRUST_ACCOUNT
0x2000             8192 SERVER_TRUST_ACCOUNT
0x10000           65536 DONT_EXPIRE_PASSWORD
0x20000          131072 MNS_LOGON_ACCOUNT
0x40000          262144 SMARTCARD_REQUIRED
0x80000          524288 TRUSTED_FOR_DELEGATION
0x100000        1048576 NOT_DELEGATED
0x200000        2097152 USE_DES_KEY_ONLY
0x400000        4194304 DONT_REQ_PREAUTH
0x800000        8388608 PASSWORD_EXPIRED
0x1000000      16777216 TRUSTED_TO_AUTH_FOR_DELEGATION
0x04000000     67108864 PARTIAL_SECRETS_ACCOUNT






## PARAMETERS

### -IncludeInput

{{ Fill IncludeInput Description }}

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

### -ListAvailable

{{ Fill ListAvailable Description }}

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

### -UserFlag

A integer value providing attributes about an AD object.

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases: 
Accepted values: 

Required: True (None) False (All)
Position: 0
Default value: 
Accept pipeline input: True
Accept wildcard characters: False
DontShow: False
```


### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### [int]



## OUTPUTS

### [string]



## NOTES

This function contains a here string.
The contents of the here string to its closing token MUST, MUST, MUST be at column 0.
Autoformatting and indentation will break the here string.
Please do NOT autoformat this document.


## RELATED LINKS

[] (https://www.google.com)

[] (https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/useraccountcontrol-manipulate-account-properties)

