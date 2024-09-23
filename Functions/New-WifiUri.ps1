function New-WifiUri {
    <#
      .SYNOPSIS
      To create a WIFI uri that can be used for input to New-QRCode
      .DESCRIPTION
      To create a WIFI uri that can be used for input to New-QRCode
      .PARAMETER SSID
      The SSID name. Mandatory. It's recommended that it NOT contain "'", '"', ';', ',', '\' as they will need to be escaped and may produce odd results.
      .PARAMETER Password
      The password. Mandatory. It's recommended that it NOT contain "'", '"', ';', ',', '\' as they will need to be escaped and may produce odd results.
      .PARAMETER EncryptionType
      The encryption used on the link. Valid values: 'WPA2', 'WPA', 'WEP'. Defaults as 'WPA2'
      .PARAMETER Hidden
      Switch indicating that the SSID is hidden and not broadcast
      .NOTES
      Information or caveats about the function e.g. 'This function is not supported in Linux'
      .LINK
      Specify a URI to a help page, this will show when Get-Help -Online is used.
      .EXAMPLE
      New-WifiUri -SSID 'Corp WiFi' -Password "It is a secret"

      WIFI:S:Corp WiFi;T:WPA2;P:It is a secret;H:false;;
  #>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, HelpMessage='Enter the SSID')]
        [string] $SSID,

        [Parameter(Mandatory, HelpMessage='Enter the Password')]
        [string] $Password,

        [ValidateSet('WPA2', 'WPA', 'WEP')]
        [string] $EncryptionType = 'WPA2',

        [switch] $Hidden
    )

    # todo add -IncludeInput and format file
    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "SSID [$SSID] Password [$Password] EncryptionType [$EncryptionType] Hidden [$Hidden]"
        $SSID = ConvertTo-PFEscape -String $SSID -SpecialChar '''";,\' -EscapeChar '\'
        $Password = ConvertTo-PFEscape -String $Password -SpecialChar '''";,\' -EscapeChar '\'
        #$Password = $Password -replace '\\', '\\' -replace "'", "\'" -replace '"', '\"' -replace ';', '\;' -replace ',', '\,'
        $EncryptionType = $EncryptionType.ToUpper()
    }

    process {
        $ReturnVal = 'WIFI:S:' + $SSID + ';T:' + $EncryptionType + ';P:' + $Password + ';H:' + $Hidden.ToString().ToLower() + ';;'
        Write-Output -InputObject $ReturnVal

    }

    end {
        Write-Verbose -Message "SSID [$SSID] Password [$Password] EncryptionType [$EncryptionType] Hidden [$Hidden]"
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
