---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# Test-IsValidEmailAddress

## SYNOPSIS
Tests validity if specified string is an email address.

## SYNTAX

```
Test-IsValidEmailAddress [-EmailAddress] <String> [<CommonParameters>]
```

## DESCRIPTION
Casts the passed value as "System.Net.Mail.MailAddress" data type.
If successful it parses string into the properties: DisplayName, User, Host, Address
White space normally delimits the DisplayName from the address so an extra check
is performed to see if EmailAddress specified matches the resolved Address property

## EXAMPLES

### EXAMPLE 1
```
Test-IsValidEmailAddress -EmailAddress "user@gmail.com"
```

Would return:
True

### EXAMPLE 2
```
Test-IsValidEmailAddress "bademail"
```

Would return:
False

### EXAMPLE 3
```
Test-IsValidEmailAddress "test user@gmail.com" -verbose
```

Would return:
VERBOSE: You entered email address: \[test user@gmail.com\]
VERBOSE: Address resolved to: \[user@gmail.com\]
VERBOSE: \[user@gmail.com\] does not match \[test user@gmail.com\]
VERBOSE: The address is NOT valid.
False

### EXAMPLE 4
```
Test-IsValidEmailAddress -EmailAddress "user@gmail.com" -verbose
```

Would return:
VERBOSE: You entered email address: \[user@gmail.com\]
VERBOSE: Address resolved to: \[user@gmail.com\]
VERBOSE: Address valid, no guarantee that address \[user@gmail.com\] exists.

## PARAMETERS

### -EmailAddress
Add help message for user

```yaml
Type: String
Parameter Sets: (All)
Aliases: Address

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### bool
## NOTES

## RELATED LINKS
