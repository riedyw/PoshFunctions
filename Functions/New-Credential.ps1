function New-Credential {
<#
.SYNOPSIS
    Returns a [PSCredential] given a passed UserName, and either a string 'Password' or a securestring 'SecureString'
.DESCRIPTION
    Returns a [PSCredential] given a passed UserName, and either a string 'Password' or a securestring 'SecureString'. Behavior is controlled by ParameterSetName
.PARAMETER UserName
    A mandatory parameter of type [string] that represents a username that you are creating. Can be of the form 'username', or 'domain\username', or 'username@company.com'. In both parameter set names 'SecureString' and 'Password'
.PARAMETER SecureString
    A mandatory parameter of type [securestring] that represents a securestring password. In parameter set name 'SecureString'
.PARAMETER Password
    A mandatory parameter of type [tring] that represents a plaintext password. In parameter set name 'Password'
.EXAMPLE
    $Credential = New-Credential -UserName 'donaldduck' -Password 'Quack'
.EXAMPLE
    $SecureString = Read-Host -Prompt 'Enter password' -AsSecureString
    $Cred2 = New-Credential -UserName 'mickeymouse' -SecureString $SecureString
.INPUTS
    'string', 'securestring'

    or

    'string', 'string'
.OUTPUTS
    'PSCredential'
.NOTES
    Medium to High impact as this function will return the password, albeit hidden from default view
#>

    [CmdletBinding(DefaultParameterSetName = 'SecureString', ConfirmImpact = 'Medium')]
    [OutputType('PSCredential')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingUsernameAndPasswordParams', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingConvertToSecureStringWithPlainText', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]

    Param
    (

        [Parameter(Mandatory, Position = 0, ParameterSetName = 'SecureString')]
        [Parameter(Mandatory, Position = 0, ParameterSetName = 'Password')]
        [string] $UserName,

        [Parameter(Mandatory, Position = 1, ParameterSetName = 'SecureString')]
        [securestring] $SecureString,

        [Parameter(Mandatory,HelpMessage='Please enter the Password', Position = 1, ParameterSetName = 'Password')]
        [string] $Password

    )
    #endregion parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'SecureString' {
            }
            'Password' {
                Write-Verbose -Message 'Creating $SecureString'
                $SecureString = ConvertTo-SecureString -String $Password -AsPlainText -Force
            }
        }
        New-Object -TypeName 'PSCredential' -ArgumentList $UserName, $SecureString
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
