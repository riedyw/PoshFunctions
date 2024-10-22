function New-MailToUri {
<#
.SYNOPSIS
    Creates appropriately formatted text for a MailTo URI that can be embedded in a QR code
.DESCRIPTION
    Creates appropriately formatted text for a MailTo URI that can be embedded in a QR code. If a QR code is created
    a mail message will be composed with the appropriate information, but it will NOT be sent
.PARAMETER To
    Mandatory recipient of the email
.PARAMETER Subject
    The subject of the mail. This value will be HTML encoded in the output.
.PARAMETER Body
    The body of the mail, can be a string or an array of strings. This value will be HTML encoded in the output.
.PARAMETER CC
    The person(s) copied on the mail
.PARAMETER BCC
    The person(s) blind copied on the mail
.NOTES
    Inspired by https://stackoverflow.com/questions/16822371/generating-an-email-with-a-qr-code
.LINK
    New-QRCode
.EXAMPLE
    New-MailToUri -To webmaster@google.com -Subject 'Bad search' -Body 'My search did not return desired results'

    MAILTO:webmaster@google.com?subject=Bad%20search&body=My%20search%20did%20not%20return%20desired%20results&
.EXAMPLE
    New-MailToUri -To webmaster@google.com -Subject 'Hello'

    MAILTO:webmaster@google.com?subject=Hello&&
.EXAMPLE
    New-MailToUri -To webmaster@google.com -Subject 'Hello' -IncludeInput

    To      : webmaster@google.com
    Subject : Hello
    Body    :
    CC      :
    BCC     :
    URI     : MAILTO:webmaster@google.com?subject=Hello&&
#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position=0, ValueFromPipeline)]
        [string[]] $To,

        [string] $Subject,

        [string[]] $Body,

        [string[]] $CC,

        [string[]] $BCC,

        [switch] $IncludeInput
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
        if ($IncludeInput) {
            New-Object -TypeName psobject -Property ([ordered] @{
                To = $To -join ', '
                Subject = $Subject
                Body = $Body -join '\n'
                CC = $CC -join ', '
                BCC = $BCC -join ', '
                URI = $ReturnVal
            })
        } else {
            Write-Output -InputObject $ReturnVal
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
