function Test-IsValidEmailAddress {
<#
.SYNOPSIS
    Tests validity if specified string is an email address.
.DESCRIPTION
    Casts the passed value as "System.Net.Mail.MailAddress" data type.
    If successful it parses string into the properties: DisplayName, User, Host, Address
    White space normally delimits the DisplayName from the address so an extra check
    is performed to see if EmailAddress specified matches the resolved Address property
.EXAMPLE
    Test-IsValidEmailAddress -EmailAddress "user@gmail.com"

    Would return:
    True
.EXAMPLE
    Test-IsValidEmailAddress "bademail"

    Would return:
    False
.EXAMPLE
    Test-IsValidEmailAddress "test user@gmail.com" -verbose

    Would return:
    VERBOSE: You entered email address: [test user@gmail.com]
    VERBOSE: Address resolved to: [user@gmail.com]
    VERBOSE: [user@gmail.com] does not match [test user@gmail.com]
    VERBOSE: The address is NOT valid.
    False
.EXAMPLE
    Test-IsValidEmailAddress -EmailAddress "user@gmail.com" -verbose

    Would return:
    VERBOSE: You entered email address: [user@gmail.com]
    VERBOSE: Address resolved to: [user@gmail.com]
    VERBOSE: Address valid, no guarantee that address [user@gmail.com] exists.
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [Outputtype('bool')]
    Param (
        [parameter(Mandatory, HelpMessage = 'Add help message for user', Position = 0, ValueFromPipeLine, ValueFromPipeLineByPropertyName)]
        [Alias('Address')]
        [string] $EmailAddress
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        Write-Verbose -Message "You entered email address: [$($EmailAddress)]"
        try {
            $temp = [System.Net.Mail.MailAddress] $EmailAddress
            Write-Verbose -Message "Address resolved to: [$($temp.Address)]"
            if ($temp.Address -ne $EmailAddress) {
                Write-Verbose -Message "[$($temp.Address)] does not match [$($EmailAddress)]"
                Write-Output -InputObject $false
            } else {
                Write-Verbose -Message "Address valid, no guarantee that address [$($EmailAddress)] exists."
                Write-Output -InputObject $True
            }
        } catch {
            Write-Verbose -Message 'The address is NOT valid.'
            Write-Output -InputObject $False
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
