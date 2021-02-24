function Get-SID {
<#
.SYNOPSIS
    To get the SID of a specified domain user passed as either an (email) or (domain,username)
.DESCRIPTION
    To get the SID of a specified domain user passed as either an (email) or (domain,username)
    If no parameters are specified it gets the SID of the user running the cmdlet
    Default ParameterSetName DomainUser
.PARAMETER Domain
    The domain that you wish to query. Not mandatory and will default to $env:USERDOMAIN
    Part of ParameterSetName DomainUser
.PARAMETER Username
    The user that you wish to query. Not mandatory and will default to $env:USERNAME
    Part of ParameterSetName DomainUser
.PARAMETER Email
    The email that you wish to query. Not mandatory
    Part of ParameterSetName Email
.PARAMETER IncludeInput
    Switch to enable the original input parameters to appear in the output. Aliased to 'IncludeOriginal'
    Is present in both ParameterSetName DomainUser and Email
.EXAMPLE
    Get-SID

    S-1-5-21-1482476501-746137067-839522115-29321
.EXAMPLE
    Get-SID -IncludeInput

    Domain      UserName      SID
    ------      --------      ---
    contosco    administrator S-1-5-21-1482476501-846137067-872522115-500
.EXAMPLE
    Get-SID -Email Administrator@Contosco.com -IncludeInput

    Email                      SID
    -----                      ---
    administrator@contosco.com S-1-5-21-1482476501-846137067-872522115-500
.NOTES
    Helpful if you don't have the ActiveDirectory module installed on your system.
#>

    #region parameter
    [CmdletBinding(DefaultParameterSetName = 'DomainUser')]
    [OutputType('string')]
    Param
    (
        [Parameter(ParameterSetName = 'DomainUser')]
        [string] $Domain = $env:USERDOMAIN,

        [Parameter(ParameterSetName = 'DomainUser')]
        [string] $Username = $env:USERNAME,

        [Parameter(ParameterSetName = 'Email')]
        [string] $Email,

        [Parameter(ParameterSetName = 'DomainUser')]
        [Parameter(ParameterSetName = 'Email')]
        [Alias('IncludeOriginal')]
        [switch] $IncludeInput

    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'DomainUser' {
                $ADObj = [System.Security.Principal.NTAccount]::new($Domain, $Username)
                $SID = $AdObj.Translate([System.Security.Principal.SecurityIdentifier])
                $ReturnVal = $SID.Value
                if ($IncludeInput) {
                    $prop = ([ordered] @{
                            Domain   = $Domain.ToLower()
                            UserName = $Username.ToLower()
                            SID      = $ReturnVal
                        } )
                    New-Object -TypeName psobject -Property $prop
                } else {
                    Write-Output -InputObject $ReturnVal
                }
            }
            'Email' {
                $AdObj = [System.Security.Principal.NTAccount]::new($Email)
                $SID = $AdObj.Translate([System.Security.Principal.SecurityIdentifier])
                $ReturnVal = $SID.Value
                if ($IncludeInput) {
                    $prop = ([ordered] @{
                            Email = $Email.ToLower()
                            SID   = $ReturnVal
                        } )
                    New-Object -TypeName psobject -Property $prop
                } else {
                    Write-Output -InputObject $ReturnVal
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
