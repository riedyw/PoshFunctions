# Source https://gallery.technet.microsoft.com/scriptcenter/f615d7e8-ed15-498d-b7cc-078377f523bf

function New-QR {
<#
.SYNOPSIS
       Create New Quick Response Code

.DESCRIPTION
    Create New Quick Response Code

    Function uses Google API so script requires internet access.
    Script will compose QR request and then download generated image.

    New-QR returns the properties of the new QR code created.

.PARAMETER fileName
    file name of QR code to be created.
    Can specify fullpath, please use .PNG file extension.
    If specifying fullpath ensure directory structure exists.

.PARAMETER Message
    Message to be encoded in QR code.
    Script will check the message length to ensure it does not exceed the max allowed size
    Purely numeric content allows for a larger storage capacity in code.

    Message Examples
    "TEL:0416123456" (Will call my cell phone)
    "SMSTO:0416123456:Hi Matt,`nI am at your desk." (An SMS to me. Note the new line character)
    "http://painterinfo.com" (Open this website)
    "This is the Pishkin Building" (A plain text message encoded in the QR Code)

.PARAMETER Enc
    Allowed encoding types are:
    UTF-8, Shift_JIS, ISO-8859-1
    UTF-8 is default and recommended type

.PARAMETER ECL
    Error Correction Level

    L - [Default] Allows recovery of up to 7% data loss
    M - Allows recovery of up to 15% data loss
    Q - Allows recovery of up to 25% data loss
    H - Allows recovery of up to 30% data loss

    Use L for maximum storage capacity in QR code
    Use H if you think the QR code might get damaged or if you want to embed plain text or logo after.

.PARAMETER Size
    The QR code's physical size in pixels, not to be confused with the data storage size.
    Function caters for several pre-set sizes and a custom size option
    S - 75x75
    M - 150x150 [default]
    L - 300x300
    X - 547x547 - This appears to be the maximum size that the API can produce.
    C - Custom size to be used - Warning too small will result QR code generation failure.
        If too large a value is specified then the 150x150 default will be generated instead.
        Use -chs parameter in conjunction with -Size C or Custom size will default to 150x150

.PARAMETER chs
    This is the custom size of the image in pixels e.g. 150x150
    This parameter is only read when -Size C parameter is specified. (Otherwise ignored)
    Min = 50x50 [approximate] Large QR codes may need to be physically larger to fit the data.
    Max = 547x547

.PARAMETER margin
    Defaults to 4 and it is recommended to leave it at that.
    A white space margin of 4 is required for reliable QR code reading.
    Valid Values are 1..4

.EXAMPLE
    New-QR http://painterinfo.com

Description
-----------
    Creates a new QR code (URL)
    Path to QR code image is returned by script

.EXAMPLE
    New-QR -Message "This is a test" -Size C -chs 200x200

Description
-----------
    Creates a new QR code (TEXT)
    Custom image size 200x200 is created.
    Path to QR code is returned by script

.EXAMPLE
    ii (New-QR -message TEL:0754419999 -Size L -ECL H).fullname

Description
-----------
    Creates a new QR code (Phone Number) and is opened with default image viewer.
    -Size L (image size is 300x300 pixels)
    -ECL H (30% of image is redundant)

.EXAMPLE
    Import-Csv "C:\QR\users.csv" | New-QR -S L

Description
-----------
    Using the following CSV, multiple 300x300 QR Codes are generated.

    "Message","Filename"
    "TEL:0416123456","C:\QR\Matt.png"
    "TEL:0417123456","C:\QR\John.png"
    "TEL:0418123456","C:\QR\Ruth.png"
    "TEL:0419123456","C:\QR\Fred.png"

.INPUTS
    psObject
    (filename,Message)

.OUTPUTS
    psObject
    (FullName,ErrorCorrrection,Margin,Dimensions,DataSize)

.NOTES
    NAME:      New-QR
    PURPOSE:   Generate QR codes with PowerShell
    VERSION:   1.0
    AUTHOR:    Matthew Painter
    LASTEDIT:  06/August/2011

.LINK
    http://code.google.com/apis/chart/infographics/docs/qr_codes.html

#>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess','')]
    param(
        [string] $chs = '150x150',

        [string] $ECL = 'L',

        [string] $Enc = 'UTF-8',

        [Parameter(Position=1, ValueFromPipelineByPropertyName)]
        [string] $fileName="$env:temp\QR.png",

        [int] $margin = 4,

        [Parameter(Mandatory, Position=0, HelpMessage='Message to be encoded', ValueFromPipelineByPropertyName)]
        [object] $Message,

        [string] $Size = 'M'
    )

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process
    {
        switch ($Size) # Pre-set Physical Size of QR Code image in pixels
        {
            'S' {$chs = '75x75'}
            'M' {$chs = '150x150'}
            'L' {$chs = '300x300'}
            'X' {$chs = '547x547'}
            'C' {If ($chs -imatch '[5-9][0-9][x][5-9][0-9]' -or  $chs -imatch '[1-5][0-4][0-9][x][1-5][0-4][0-9]') {write-verbose -Message "Custom chs $chs"} else {Write-verbose -Message 'chs invalid, changing to default - 150x150'; $chs = '150x150'};
                 $split = $chs.split('x');
                 If ($split[0] -ne $split[1] ){$chs = "$($split[0])x$($split[0])"; Write-Verbose -Message "Making chs symmetrical $chs"}
                 If ($split[0] -gt 547){$chs = '547x547'}
                 }
            default {$chs = '150x150'}
        }

        switch ($ECL) # Error Correction Level
        {
            'L' {$chld = 'L'}
            'M' {$chld = 'M'}
            'Q' {$chld = 'Q'}
            'H' {$chld = 'H'}
            default {$chld = 'L'}
        }

        switch ($Enc) # Encoding type
        {
            'UTF-8' {$choe = 'UTF-8'}
            'Shift_JIS' {$choe = 'Shift_JIS'}
            'ISO-8859-1' {$choe = 'ISO-8859-1'}
            default {$choe = 'UTF-8'}
        }

        # Hash table of QR Code maximum data capacity. Limit is governed by Error Correction Level and data type
        $Limit = @{
            'LN'=7089;
            'LA'=4296;
            'MN'=5596;
            'MA'=3391;
            'QN'=3993;
            'QA'=2420;
            'HN'=3057;
            'HA'=1852;
        }

        # Numeric or AlphaNumeric?
        # Messages with purely numeric data type have a larger QR Code storage capacity.
        $NorA='N'
        for ($a = 1; $a -le $Message.length; $a++) {if (!($Message.substring($a-1,1) -match '[0-9]')){$NorA='A'; break}}

        # Check Message length does not exceed the Code's specification limit.
        if ($Message.length -gt $Limit."$chld$NorA")
        {
            Write-Verbose -Message 'Message Size Limit Exceeded'; Break
        }
        else
        {
            Write-Verbose -Message "Message $(if ($NorA -eq 'N'){'Purely Numeric'}else{'Not Purely Numeric'})"
            Write-Verbose -Message "Max Message Length $($Limit."$chld$NorA")"
            Write-Verbose -Message "Message Length $($Message.length) OK"
        }

        # Build URL and request QR Code from Google API
        $chld = "$chld`|$margin"
        $Message = $Message -replace(' ', '+')
        $URL = "https://chart.googleapis.com/chart?chs=$chs&cht=qr&chld=$chld&choe=$choe&chl=$Message"
        $req = [System.Net.HttpWebRequest]::Create($url)
        $req.Proxy = [System.Net.WebRequest]::DefaultWebProxy
        $req.Proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials
        try {$res = $req.GetResponse()} catch { Write-error -Message "$URL $($error[0])"; break}

        # Save downloaded binary file
        if($res.StatusCode -eq 200)
        {
            $reader = $res.GetResponseStream()
            try {$writer = new-object -TypeName System.IO.FileStream -ArgumentList $fileName, 'Create'}catch{Write-error -Message 'Invalid File Path?'; break}
            [byte[]] $buffer = new-object -TypeName byte[] -ArgumentList 4096

            do
            {
                $count = $reader.Read($buffer, 0, $buffer.Length)
                $writer.Write($buffer, 0, $count)
            } while ($count -gt 0)

            $reader.Close()
            $writer.Flush()
            $writer.Close()

            # Output properties
            $QRProperties = @{
                FullName = (get-childitem -Path $filename).fullname
                DataSize = $Message.length
                Dimensions = $chs
                ECLevel = $chld.split('|')[0]
                Margin = $chld.split('|')[1]
            }
            New-Object -TypeName PSObject -Property $QRProperties

        }

        Write-Verbose -Message "FileName $fileName"
        Write-Verbose -Message "chs $chs"
        Write-Verbose -Message "chld $chld"
        Write-Verbose -Message "choe $choe"
        Write-Verbose -Message "URL $URL"
        Write-Verbose -Message "Http Status Code $($res.StatusCode)"
        Write-Verbose -Message "Message $Message"

        $res.Close()
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
