function New-QRCode {
<#
.SYNOPSIS
    Creates a file containing a QR code based on the data and specifications provided
.DESCRIPTION
    Creates a file containing a QR code based on the data and specifications provided
.PARAMETER Data
    The data to be QR encoded. Could be plain text, a URL, or the output of any of the New-*Uri functions in this module
.PARAMETER Size
    Size of one of the edges of the picture, in pixels. Range 50-750, default 200
.PARAMETER ECC
    Level of Error Correction Code where:
        L = low, ~7% destroyed data may be corrected
        M = middle, ~15% destroyed data may be corrected
        Q = quality, ~25% destroyed data may be corrected
        H = high, ~30% destroyed data may be corrected
.PARAMETER Margin
    Margin, in pixels before the actual QR code begins. Range 0-10, default of 4
.PARAMETER Format
    Format of the file to be produced. Options: 'png', 'jpg', 'gif', 'svg'. Default 'png'
.PARAMETER Path
    The path to the file to be created. Extension of the file with match the format name.
    If not specified it will create a temporary file in $env:TEMP
    If the file exists and you want it to be overwritten you must specify -Force
.PARAMETER Show
    Calls Invoke-Item and the path of the file created to open it in the associated program
.PARAMETER Force
    To force overwriting the file specified in -Path
.NOTES
    Inspired by From <https://goqr.me/api/doc/create-qr-code/>

    Writes to the information stream the name of the file that is created

    This function was rewritten because Google shut down their QR code API web portal
.EXAMPLE
    New-QRCode -Data 'https://cnn.com' -Show -Force
    [INFORMATION] New QR code written to [C:\Users\USER\AppData\Local\Temp\tmpDEB9.png]

        Directory: C:\Users\USER\AppData\Local\Temp

    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    -a----         9/19/2024   1:50 PM            416 tmpDEB9.png

    A new file will be created and the program associated with .png files will be launched. If you attempt to photograph
    the picture with a smart phone it will prompt if you want to open the URL specified in your default browser.
#>

    # todo - add -IncludeInput and format file
    [CmdletBinding()]
    [OutputType([System.IO.FileInfo])]
    param (
        [Parameter(Mandatory)]
        [string] $Data,

        [ValidateRange(50, 750)]
        [int] $Size = 200,

        [ValidateSet('L', 'M', 'Q', 'H')]
        [string] $ECC = 'M',

        [ValidateRange(0, 10)]
        [int] $Margin = 4,

        [ValidateSet('png', 'jpg', 'gif', 'svg')]
        [string] $Format = 'png',

        [string] $Path,

        [switch] $Show,

        [switch] $Force
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $OldInformationPreference = $InformationPreference
        $InformationPreference = 'Continue'
        $Format = $Format.ToLower()
        $ECC = $ECC.ToUpper()
        $SizeString = $Size.ToString() + 'x' + $Size.ToString()
        $Data = ConvertTo-UrlEncode -URL $Data
        $URL = (
            'https://api.qrserver.com/v1/create-qr-code/?data=' + $Data +
            '&size=' + $SizeString +
            '&ecc=' + $ECC +
            '&margin=' + $Margin +
            '&format=' + $Format
        )

        if (-not $Script:Path) {
            $Path = New-TemporaryFileWithExtension -Extension ('.' + $Format)
            Remove-Item -Path $Path
        }
    }

    process {
        if ((Test-Path -Path $Path) -and -not $Force) {
            Write-Error -Message "File [$Path] exists and you didn't specify -Force"
            break
        }
        Write-Information -MessageData "[INFORMATION] New QR code written to [$Path]"
        Invoke-WebRequest -Uri $URL -OutFile $Path
        Get-Item -Path $Path

        if ($Show) {
            Invoke-Item -Path $Path
        }
    }

    end {
        $InformationPreference = $OldInformationPreference
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
