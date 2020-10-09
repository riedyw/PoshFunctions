Function Get-UrlContent {
<#
.SYNOPSIS
    To get the HTML content of a specified URL
.DESCRIPTION
    To get the HTML content of a specified URL
.PARAMETER URL
    The URL string, which should begin with "https://" or "http://"
.PARAMETER IgnoreSslError
    To ignore any SSL errors that are generated
.NOTES
    This function only exists for PowerShell versions prior to the inclusion of Invoke-WebRequest
.EXAMPLE
    Get-UrlContent -URL "http://www.google.com"
    Would return:
    The HTML content that is found on Google's homepage
.EXAMPLE
    Get-UrlContent -URL "https://secureServer"
    Assuming the computer does not have a valid certificate for secureServer then this would return:
    $Null
.EXAMPLE
    Get-UrlContent -URL "https://secureServer" -IgnoreSslError
    Assuming the computer does not have a valid certificate for secureServer and you wish to override the SSL error then this would return:
    The HTML content that is found on secureServer's homepage
.OUTPUTS
    Either $Null if any errors exist or a [string] if successful
#>
    [CmdletBinding()]
    Param (
        [parameter(ValueFromPipeLine,HelpMessage='Add help message for user',ValueFromPipeLineByPropertyName,Mandatory)]
        [string] $URL,

        [parameter()]
        [switch] $IgnoreSslError
    )
    $oldEA = $ErrorActionPreference
    $ErrorActionPreference = 'continue'
    write-verbose -message "Saving current value of `$ErrorActionPreference [$($oldEa)] and setting it to 'Stop'"
    if ($IgnoreSslError) {
        write-verbose -message 'Turning on IgoreSslError'
        [System.Net.ServicePointManager]::ServerCertificateValidationCallBack = { $true }
    }
    $htmlContent = $null
    write-verbose -message 'Creating a webclient'
    $webClient = New-Object -TypeName System.Net.WebClient
    write-verbose -message "Requesting content from [$($URL)]"
    try {
        $htmlContent = $webClient.downloadstring($URL)
    } catch {
        write-error -message "Could not connect to [$($URL)]"
    } finally {
        if ($IgnoreSslError) {
            write-verbose -message 'Turning off IgoreSslError'
            [System.Net.ServicePointManager]::ServerCertificateValidationCallBack = { $false }
        }
    }
    write-verbose -message "Resetting value of `$ErrorActionPreference back to [$($oldEa)]"
    $ErrorActionPreference = $oldEA
    write-verbose -message 'Disposing of webClient connection'
    $webClient.Dispose()
    remove-variable -name webClient
    if ($htmlContent) {
        write-verbose -message 'Successful download of HTML content'
        write-output -inputobject $htmlContent
    } else {
        write-verbose -message 'Unsuccessful download of HTML content'
        return
    }
} #EndFunction Get-UrlContent
