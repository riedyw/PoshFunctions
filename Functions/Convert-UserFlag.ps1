Function Convert-UserFlag {
<#
.SYNOPSIS
    Converts a userflag enumeration to a human readable list of attributes about an AD object.
.DESCRIPTION
    Converts a userflag enumeration to a human readable list of attributes about an AD object.
.PARAMETER UserFlag
    A integer value providing attributes about an AD object.
.EXAMPLE
    Convert-UserFlag -UserFlag (0x0200 + 0x0010 + 0x800000)

    Would return
    LOCKOUT, NORMAL_ACCOUNT, PASSWORD_EXPIRED
.EXAMPLE
    Convert-UserFlag -UserFlag (0x0200 +  0x800000)

    Would return
    NOT_LOCKOUT, NORMAL_ACCOUNT, PASSWORD_EXPIRED
.INPUTS
    [int]
.OUTPUTS
    [string]
.LINK
    https://www.google.com
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    Param(
        [Parameter(Position = 0, Mandatory, ValueFromPipeLine)]
        [int] $UserFlag
    )
    #endregion Parameter

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    } #close begin block

    process {
        $List = New-Object -TypeName System.Collections.ArrayList
        [void] $List.Add('NOT_LOCKOUT')
        Switch ($UserFlag) {
            ($UserFlag  -BOR 0x0001) { [void] $List.Add('SCRIPT') }
            ($UserFlag  -BOR 0x0002) { [void] $List.Add('ACCOUNTDISABLE') }
            ($UserFlag  -BOR 0x0008) { [void] $List.Add('HOMEDIR_REQUIRED') }
            ($UserFlag  -BOR 0x0010) { [void] $List.Remove('NOT_LOCKOUT'); [void] $List.Add('LOCKOUT') }
            ($UserFlag  -BOR 0x0020) { [void] $List.Add('PASSWD_NOTREQD') }
            ($UserFlag  -BOR 0x0040) { [void] $List.Add('PASSWD_CANT_CHANGE') }
            ($UserFlag  -BOR 0x0080) { [void] $List.Add('ENCRYPTED_TEXT_PWD_ALLOWED') }
            ($UserFlag  -BOR 0x0100) { [void] $List.Add('TEMP_DUPLICATE_ACCOUNT') }
            ($UserFlag  -BOR 0x0200) { [void] $List.Add('NORMAL_ACCOUNT') }
            ($UserFlag  -BOR 0x0800) { [void] $List.Add('INTERDOMAIN_TRUST_ACCOUNT') }
            ($UserFlag  -BOR 0x1000) { [void] $List.Add('WORKSTATION_TRUST_ACCOUNT') }
            ($UserFlag  -BOR 0x2000) { [void] $List.Add('SERVER_TRUST_ACCOUNT') }
            ($UserFlag  -BOR 0x10000) { [void] $List.Add('DONT_EXPIRE_PASSWORD') }
            ($UserFlag  -BOR 0x20000) { [void] $List.Add('MNS_LOGON_ACCOUNT') }
            ($UserFlag  -BOR 0x40000) { [void] $List.Add('SMARTCARD_REQUIRED') }
            ($UserFlag  -BOR 0x80000) { [void] $List.Add('TRUSTED_FOR_DELEGATION') }
            ($UserFlag  -BOR 0x100000) { [void] $List.Add('NOT_DELEGATED') }
            ($UserFlag  -BOR 0x200000) { [void] $List.Add('USE_DES_KEY_ONLY') }
            ($UserFlag  -BOR 0x400000) { [void] $List.Add('DONT_REQ_PREAUTH') }
            ($UserFlag  -BOR 0x800000) { [void] $List.Add('PASSWORD_EXPIRED') }
            ($UserFlag  -BOR 0x1000000) { [void] $List.Add('TRUSTED_TO_AUTH_FOR_DELEGATION') }
            ($UserFlag  -BOR 0x04000000) { [void] $List.Add('PARTIAL_SECRETS_ACCOUNT') }
        }
        $List -join ', '
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction Convert-UserFlag
