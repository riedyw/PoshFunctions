function New-SmsUri {
  <#
      .SYNOPSIS
      Creates appropriately formatted text for an SMS URI that can be embedded in a QR code
      .DESCRIPTION
      Creates appropriately formatted text for an SMS URI that can be embedded in a QR code. If it is embedded in a QR code
      the resulting QR code will begin writing an SMS text in the default messaging app on your smart phone addressed to
      the Telephone parameter. Optionally if Message is specified it puts that in the message portion of the text. This will be
      in draft mode on your smart phone, the user has to press Send
      .PARAMETER Telephone
      The digits representing the telephone number.
      .PARAMETER Message
      An optional message
      .NOTES
      Inspired by https://support.seagullscientific.com/hc/en-us/community/posts/4415554566167-QR-Code-SMSTO-multiple-recipients>
      .LINK
      New-QRCode
      .EXAMPLE
      New-SmsUri -Telephone 212-555-8600

      SMSTO:212-555-8600
      .EXAMPLE
      New-SmsUri -Telephone 212-555-8500 -Message 'Please text back'

      SMSTO:212-555-8500:Please text back
      .EXAMPLE
      $QRCodeData = New-SmsUri -Telephone 212-555-8500 -Message 'Please text back'
      New-QRCode -Data $QRCodeData -Show

      And attempting to take a picture on your smart phone will begin composing an SMS message to Telephone containing
      Message in the message block.
  #>

    # todo add -IncludeInput
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position=0, ValueFromPipeline)]
        [string] $Telephone,

        [string] $Message
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $ReturnVal = 'SMSTO:' + $Telephone
        if ($Message) {
            $ReturnVal += ':' + $Message
        }
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
