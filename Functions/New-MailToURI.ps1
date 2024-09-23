function New-MailToUri {
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

    # todo - update comment help, add -IncludeInput
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position=0, ValueFromPipeline)]
        [string[]] $To,

        [string] $Subject,

        [string[]] $Body,

        [string[]] $CC,

        [string[]] $BCC
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $ToFix = $To -join ','
        $Data = "MAILTO:"
        $Data += $ToFix
        $SubjectFix = ($Subject | ConvertTo-UrlEncode) -replace '\+', '%20'
        if ($SubjectFix) {
            $SubjectFix = 'subject=' + $SubjectFix
        }
        # body could be multiple lines, convert to string and remove final newline
        $BodyFix = (($Body | ConvertTo-UrlEncode) -replace '\+', '%20' | Out-String) -replace '\r?\n$'
        if ($BodyFix) {
            $BodyFix = 'body=' + $BodyFix
        }
        $CCFix = $CC -join ','
        if ($CCFix) {
            $CCFix = 'cc=' + $CCFix
        }
        $BCCFIX = $BCC -join ','
        if ($BCCFix) {
            $BCCFix = 'bcc=' + $BCCFix
        }
        $Arguments = ($SubjectFix, $BodyFix, $CCFix, $BCCFIX) -join '&'
        if ($Arguments) {
            $Arguments = $Arguments -replace '&&', '&'
            $Data += '?' + $Arguments
        }
    }

    process {
        $ReturnVal = $Data
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
