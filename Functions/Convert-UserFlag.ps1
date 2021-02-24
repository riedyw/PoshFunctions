function Convert-UserFlag {
<#
.SYNOPSIS
    Converts a userflag enumeration to a human readable list of attributes about an AD object.
.DESCRIPTION
    Converts a userflag enumeration to a human readable list of attributes about an AD object.
.PARAMETER UserFlag
    A integer value providing attributes about an AD object.
.PARAMETER IncludeInput

.EXAMPLE
    Convert-UserFlag -UserFlag (0x0200 + 0x0010 + 0x800000)

    Would return
    ACCOUNTENABLE, LOCKOUT, NORMAL_ACCOUNT, PASSWORD_EXPIRED
.EXAMPLE
    Convert-UserFlag -UserFlag (0x0200 +  0x800000)

    Would return
    NOT_LOCKOUT, ACCOUNTENABLE, NORMAL_ACCOUNT, PASSWORD_EXPIRED
.EXAMPLE
    Convert-UserFlag -ListAvailable

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
.INPUTS
    [int]
.OUTPUTS
    [string]
.LINK
    https://www.google.com
.LINK
    https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/useraccountcontrol-manipulate-account-properties
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    Param(
        [Parameter(Position = 0, ValueFromPipeLine)]
        [int[]] $UserFlag,

        [switch] $IncludeInput,

        [switch] $ListAvailable
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($psversiontable.psversion.major -ge 7) {
            $split = "`n"
        } else {
            $split = "`r`n"
        }
        $HereString = @"
UserFlagHex,UserFlagDec,Text
0x0001,1,SCRIPT
0x0002,2,ACCOUNTDISABLE
0x0008,8,HOMEDIR_REQUIRED
0x0010,16,LOCKOUT
0x0020,32,PASSWD_NOTREQD
0x0040,64,PASSWD_CANT_CHANGE
0x0080,128,ENCRYPTED_TEXT_PWD_ALLOWED
0x0100,256,TEMP_DUPLICATE_ACCOUNT
0x0200,512,NORMAL_ACCOUNT
0x0800,2048,INTERDOMAIN_TRUST_ACCOUNT
0x1000,4096,WORKSTATION_TRUST_ACCOUNT
0x2000,8192,SERVER_TRUST_ACCOUNT
0x10000,65536,DONT_EXPIRE_PASSWORD
0x20000,131072,MNS_LOGON_ACCOUNT
0x40000,262144,SMARTCARD_REQUIRED
0x80000,524288,TRUSTED_FOR_DELEGATION
0x100000,1048576,NOT_DELEGATED
0x200000,2097152,USE_DES_KEY_ONLY
0x400000,4194304,DONT_REQ_PREAUTH
0x800000,8388608,PASSWORD_EXPIRED
0x1000000,16777216,TRUSTED_TO_AUTH_FOR_DELEGATION
0x04000000,67108864,PARTIAL_SECRETS_ACCOUNT
"@
        $ListAvailableArray = $HereString -split $split | ConvertFrom-Csv
        foreach ($item in $ListAvailableArray) {
            $item.UserFlagDec = $item.UserFlagDec -as 'int'
        }
        if ($ListAvailable) {
            return $ListAvailableArray
        }
    }

    process {
        foreach ($curFlag in $UserFlag) {
            $List = New-Object -TypeName System.Collections.ArrayList
            [void] $List.Add('NOT_LOCKOUT')
            [void] $List.Add('ACCOUNTENABLE')
            if ($curflag -band 0x0002) {
                [void] $List.Remove('ACCOUNTENABLE')
            }

            if ($curflag -band 0x0010) {
                [void] $List.Remove('NOT_LOCKOUT')
            }


            foreach ($item in $ListAvailableArray) {
                if ($curflag -band $($item.userflagdec)) {
                    [void] $List.Add("$($item.text)")
                }
            }
            $ReturnVal = $List -join ', '
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    UserFlag = $curFlag
                    Text = $ReturnVal
                })
            } else {
                write-output -InputObject $ReturnVal
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
