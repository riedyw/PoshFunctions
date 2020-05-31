Function Test-IsValidEmailAddress {
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

    [CmdletBinding(ConfirmImpact='None')]
    [Outputtype('bool')]
    Param (
        [parameter(Mandatory,HelpMessage='Add help message for user',Position=0,ValueFromPipeLine,ValueFromPipeLineByPropertyName)]
        [Alias('Address')]
        [string] $EmailAddress
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        Write-Verbose -message "You entered email address: [$($EmailAddress)]"
        Try {
            $temp = [System.Net.Mail.MailAddress] $EmailAddress
            write-verbose -message "Address resolved to: [$($temp.Address)]"
            if ($temp.Address -ne $EmailAddress) {
                write-verbose -message "[$($temp.Address)] does not match [$($EmailAddress)]"
                write-output -InputObject $false
            } else {
                Write-Verbose -message "Address valid, no guarantee that address [$($EmailAddress)] exists."
                Write-Output -InputObject $True
            }
        } Catch {
            Write-Verbose -message 'The address is NOT valid.'
            Write-Output -inputobject $False
        }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
} #EndFunction Test-IsValidEmailAddress
