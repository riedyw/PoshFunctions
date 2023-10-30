function Get-FileEncoding {
    <#
.SYNOPSIS
    To get the file encoding of a file
.DESCRIPTION
    To get the file encoding of a file
.PARAMETER Path
    The file that you want to check its encoding.
.EXAMPLE
    Get-FileEncoding -Path .\UTF16-BigEndian.txt

    Unicode UTF-16 Big-Endian
.EXAMPLE
    Get-FileEncoding -Path .\UTF16-LittleEndian.txt

    Unicode UTF-16 Little-Endian
.NOTES
    # source: https://gist.github.com/jpoehls/2406504
#>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory, HelpMessage = 'Please enter the path to a file', ValueFromPipelineByPropertyName)]
        [string[]] $Path
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($CurPath in $Path) {
            if (Test-Path -Path $CurPath) {
                $ResolveFile = Resolve-Path -Path $CurPath
                foreach ($CurrentResolve in $ResolveFile) {
                    if (-not (Get-Item -Path $CurrentResolve.Path).PSIsContainer) {
                        [byte[]] $byte = Get-Content -Encoding byte -ReadCount 4 -TotalCount 4 -Path $CurrentResolve.Path
                        #Write-Host Bytes: $byte[0] $byte[1] $byte[2] $byte[3]

                        if ( $byte[0] -eq 0xef -and $byte[1] -eq 0xbb -and $byte[2] -eq 0xbf ) {
                            # EF BB BF (UTF8)
                            $EncodingType = 'UTF8'
                        } elseif ($byte[0] -eq 0xfe -and $byte[1] -eq 0xff) {
                            # FE FF  (UTF-16 Big-Endian)
                            $EncodingType = 'Unicode UTF-16 Big-Endian'
                        } elseif ($byte[0] -eq 0xff -and $byte[1] -eq 0xfe) {
                            # FF FE  (UTF-16 Little-Endian)
                            $EncodingType = 'Unicode UTF-16 Little-Endian'
                        } elseif ($byte[0] -eq 0 -and $byte[1] -eq 0 -and $byte[2] -eq 0xfe -and $byte[3] -eq 0xff) {
                            # 00 00 FE FF (UTF32 Big-Endian)
                            $EncodingType = 'UTF32 Big-Endian'
                        } elseif ($byte[0] -eq 0xfe -and $byte[1] -eq 0xff -and $byte[2] -eq 0 -and $byte[3] -eq 0) {
                            # FE FF 00 00 (UTF32 Little-Endian)
                            $EncodingType = 'UTF32 Little-Endian'
                        } elseif ($byte[0] -eq 0x2b -and $byte[1] -eq 0x2f -and $byte[2] -eq 0x76 -and ($byte[3] -eq 0x38 -or $byte[3] -eq 0x39 -or $byte[3] -eq 0x2b -or $byte[3] -eq 0x2f) ) {
                            # 2B 2F 76 (38 | 38 | 2B | 2F)
                            $EncodingType = 'UTF7'
                        } elseif ( $byte[0] -eq 0xf7 -and $byte[1] -eq 0x64 -and $byte[2] -eq 0x4c ) {
                            # F7 64 4C (UTF-1)
                            $EncodingType = 'UTF-1'
                        } elseif ($byte[0] -eq 0xdd -and $byte[1] -eq 0x73 -and $byte[2] -eq 0x66 -and $byte[3] -eq 0x73) {
                            # DD 73 66 73 (UTF-EBCDIC)
                            $EncodingType = 'UTF-EBCDIC'
                        } elseif ( $byte[0] -eq 0x0e -and $byte[1] -eq 0xfe -and $byte[2] -eq 0xff ) {
                            # 0E FE FF (SCSU)
                            $EncodingType = 'SCSU'
                        } elseif ( $byte[0] -eq 0x0e -and $byte[1] -eq 0xfe -and $byte[2] -eq 0xff ) {
                            $EncodingType = 'SCSU'
                        } elseif ( $byte[0] -eq 0xfb -and $byte[1] -eq 0xee -and $byte[2] -eq 0x28 ) {
                            # FB EE 28  (BOCU-1)
                            $EncodingType = 'BOCU-1'
                        } elseif ($byte[0] -eq 0x84 -and $byte[1] -eq 0x31 -and $byte[2] -eq 0x95 -and $byte[3] -eq 0x33) {
                            # 84 31 95 33 (GB-18030)
                            $EncodingType = 'GB-18030'
                        } else {
                            $EncodingType = 'ASCII'
                        }
                        New-Object -TypeName psobject -Property ([ordered] @{
                                EncodingType = $EncodingType
                                Path         = $CurrentResolve.Path
                            })

                    } else {
                        Write-Error -Message "ERROR: File [$CurrentResolve] is a directory. Skipping..."
                    }
                }
            } else {
                Write-Error -Message "ERROR: Path [$CurPath] does not exist"
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
