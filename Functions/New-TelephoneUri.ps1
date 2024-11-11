function New-TelephoneUri {
    <#
.SYNOPSIS
    Creates appropriately formatted text for an Telephone URI that can be embedded in a QR code
.DESCRIPTION
    Creates appropriately formatted text for an Telephone URI that can be embedded in a QR code
.PARAMETER Telephone
    The telephone number for the URI text
.EXAMPLE
    New-TelephoneUri -telephone '518.555.1212'

    TEL:518.555.1212
.NOTES
    Inspired by https://support.seagullscientific.com/hc/en-us/community/posts/4415554566167-QR-Code-SMSTO-multiple-recipients>
.LINK
    New-QRCode
#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory, HelpMessage = 'Enter the Telephone number', Position = 0, ValueFromPipeline)]
        [string] $Telephone
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $ReturnVal = 'TEL:' + $Telephone
        Write-Output -InputObject $ReturnVal
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
