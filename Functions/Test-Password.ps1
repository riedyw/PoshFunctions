function Test-Password {
<#
.SYNOPSIS
    To validate credentials and return a boolean
.DESCRIPTION
    To validate credentials and return a boolean. Can specify either a credential or username and securestring. Default ParameterSetName 'Credential'
.PARAMETER Domain
    Where the credential is being checked against. Either ('.' or $env:computername) or (domainname with or without .com)
.PARAMETER Credential
    Credential ParameterSetName 'Credential'
.PARAMETER UserName
    The username to check. ParameterSetName 'SecureString'
.PARAMETER Password
    The password passed as a securestring. ParameterSetName 'SecureString'
.EXAMPLE
    Test-Password -Domain contosco.com -Credential $GoodCredential

    $true
.EXAMPLE
    Test-Password -Domain contosco.com -Credential $BadCredential

    $false
.EXAMPLE
    Test-Password -UserName $username -Password $goodpassword -Domain contosco

    True
.EXAMPLE
    Test-Password -UserName $username -Password $badpassword -Domain contosco

    False
.EXAMPLE
    Test-Password -Credential $LocalCred -Domain '.'

    True
.EXAMPLE
    Test-Password -UserName $localuser -Password $localpassword -Domain '.'

    True
.NOTES
    # inspired by https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/validating-user-account-passwords-part-2
    # extra code to fix .ValidateCredentials error https://stackoverflow.com/questions/46170531/exception-in-validatecredentials-the-server-cannot-handle-directory-requests#comment95679386_46172068

    * added code to allow domain to be specified as '.' aka the local machine
    * added parameter set names to allow for either a credential to be passed or a combination username / password (as a securestring)

#>

    # todo - add Credential

    #region parameter
    [CmdletBinding(DefaultParameterSetName='Credential', ConfirmImpact = 'Medium')]
    [OutputType('bool')]
    Param (
        [Parameter(Mandatory, ParameterSetName = 'SecureString')]
        [Parameter(Mandatory, ParameterSetName = 'Credential')]
        [string] $Domain,

        [Parameter(Mandatory, ParameterSetName = 'SecureString')]
        [string] $UserName,

        [Parameter(Mandatory, ParameterSetName = 'SecureString')]
        [securestring] $Password,

        [Parameter(Mandatory, ParameterSetName = 'Credential')]
        [pscredential] $Credential
    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
        Add-Type -AssemblyName System.DirectoryServices.AccountManagement
        $LocalSystem = Get-CimInstance -Class Win32_ComputerSystem -Verbose:$false
    }

    process {
        if ($PsCmdlet.ParameterSetName -eq 'Credential') {
            $UserName = $Credential.GetNetworkCredential().UserName
            $PlainPassword = $Credential.GetNetworkCredential().Password
        } else {
            $PlainPassword = Convert-SecureStringToString -SecureString $Password -Verbose:$false
        }
        if (($Domain -eq '.') -or ($Domain -match "^$($LocalSystem.Name)\.?")) {
            Write-Verbose -Message 'Local query'
            # $Type = 'local'
            if ($Domain -eq '.') {
                Write-Verbose -Message "Changing -Domain to [$($env:COMPUTERNAME)]"
                $Domain = $env:COMPUTERNAME
            }
            $Context = [System.DirectoryServices.AccountManagement.ContextType]::Machine
            $PrincipalContext = [System.DirectoryServices.AccountManagement.PrincipalContext]::new($Context, $Domain)
            $PrincipalContext.ValidateCredentials($UserName, $PlainPassword)
        } else {
            Write-Verbose -Message 'Domain query'
            # $Type = 'domain'
            $Context = [System.DirectoryServices.AccountManagement.ContextType]::Domain
            $DefaultNC = "DC=$($LocalSystem.Domain.replace('.', ',DC='))"
            $PrincipalContext = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -Argumentlist $Context,
                $LocalSystem.Domain, $DefaultNC, ([System.DirectoryServices.AccountManagement.ContextOptions]'SecureSocketLayer,Negotiate')
            $PrincipalContext.ValidateCredentials($UserName, $PlainPassword, [System.DirectoryServices.AccountManagement.ContextOptions]'Negotiate')
        }
    }

    end {
        # i want to ensure the plain password is not kept in memory so setting to random string before removing it
        $PlainPassword = 'randomstring'
        Remove-Variable -Name PlainPassword
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
