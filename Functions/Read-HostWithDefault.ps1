function Read-HostWithDefault {
<#
.SYNOPSIS
    A wrapper for Read-Host that includes a default value. Optionally can provide a prompt.
.DESCRIPTION
    A wrapper for Read-Host that includes a default value. Optionally can provide a prompt.
.PARAMETER Default
    A required parameter indicating what the default return value will be if the user just hits [Enter]
.PARAMETER Prompt
    A string template for the prompt string. Defaults to 'Enter a password value or accept default of'. Resulting prompt with this template would be "Enter a password value or accept default of [$Default]"
.NOTES
    Author:     Bill Riedy
.EXAMPLE
    $password = Read-HostWithDefault -Default 'SuperSecretPassword'

    Would prompt the user with: 'Enter a password value or accept default of [SuperSecretPassword]:' and store the result in $password
.EXAMPLE
    $username = Read-HostWithDefault -Default 'sa' -Prompt 'Enter a SQL user login or accept default of'

    Would prompt the user with: 'Enter a SQL user login or accept default of [sa]:' and store the result in $username
.OUTPUTS
    [string]
.LINK
    Read-Host
#>

    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType('string')]
    param(
        [parameter(Mandatory,HelpMessage='Add help message for user')]
        [string] $Default,

        [parameter()]
        [string] $Prompt = 'Enter a password value or accept default of'
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        $Response = read-host -Prompt ($Prompt + " [$Default]")
        if ('' -eq $response) {
            $Default
        }
        else {
            $Response
        }
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
} #EndFunction Read-HostWithDefault
