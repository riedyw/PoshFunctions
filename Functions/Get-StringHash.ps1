function Get-StringHash {
    <#
.SYNOPSIS
    To calculate a hash for provided strings
.DESCRIPTION
    To calculate a hash for provided strings
.PARAMETER String
    A string or array of strings that you want to send through a hashing function.
    Accepts input from the pipeline
.PARAMETER Algorithm
    The hashing algorithm to run against the string. Valid entries are: 'SHA1', 'SHA256', 'SHA384', 'SHA512', 'MACTripleDES', 'MD5', 'RIPEMD160'
    Defaults to 'MD5'
.PARAMETER IncludeInput
    Switch to include input in the output stream.
.EXAMPLE
    Get-StringHash -String 123, hello -IncludeInput -Algorithm SHA1

    Algorithm Hash                                     String
    --------- ----                                     ------
    SHA1      40BD001563085FC35165329EA1FF5C5ECBDBBEEF 123
    SHA1      AAF4C61DDCC5E8A2DABEDE0F3B482CD9AEA9434D hello
.EXAMPLE
    123, 'hello' | Get-StringHash -IncludeInput

    Algorithm Hash                             String
    --------- ----                             ------
    MD5       202CB962AC59075B964B07152D234B70 123
    MD5       5D41402ABC4B2A76B9719D911017C592 hello
.EXAMPLE
    Get-StringHash -String hello

    5D41402ABC4B2A76B9719D911017C592
#>

    [CmdletBinding()]
    [OutputType('string')]
    Param (
        [parameter(ValueFromPipeLine)]
        [string[]] $String,

        [ValidateSet('SHA1', 'SHA256', 'SHA384', 'SHA512', 'MACTripleDES', 'MD5', 'RIPEMD160')]
        [string] $Algorithm = 'MD5',

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $MD5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
        $TripleDES = New-Object -TypeName System.Security.Cryptography.MACTripleDES
        $SHA1 = New-Object -TypeName System.Security.Cryptography.SHA1CryptoServiceProvider
        $SHA256 = New-Object -TypeName System.Security.Cryptography.SHA256CryptoServiceProvider
        $SHA384 = New-Object -TypeName System.Security.Cryptography.SHA384CryptoServiceProvider
        $SHA512 = New-Object -TypeName System.Security.Cryptography.SHA512CryptoServiceProvider
        $RIPEMD160 = New-Object -TypeName System.Security.Cryptography.RIPEMD160Managed
    }

    process {
        foreach ($currentString in $String) {
            switch ($Algorithm) {
                'SHA1' {
                    $Hash = [System.Bitconverter]::ToString($SHA1.ComputeHash($currentString.ToCharArray())) -replace '-'
                }
                'SHA256' {
                    $Hash = [System.Bitconverter]::ToString($SHA256.ComputeHash($currentString.ToCharArray())) -replace '-'
                }
                'SHA384' {
                    $Hash = [System.Bitconverter]::ToString($SHA384.ComputeHash($currentString.ToCharArray())) -replace '-'
                }
                'SHA512' {
                    $Hash = [System.Bitconverter]::ToString($SHA512.ComputeHash($currentString.ToCharArray())) -replace '-'
                }
                'MACTripleDES' {
                    $Hash = [System.Bitconverter]::ToString($TripleDES.ComputeHash($currentString.ToCharArray())) -replace '-'
                }
                'MD5' {
                    $Hash = [System.Bitconverter]::ToString($MD5.ComputeHash($currentString.ToCharArray())) -replace '-'
                }
                'RIPEMD160' {
                    $Hash = [System.Bitconverter]::ToString($RIPEMD160.ComputeHash($currentString.ToCharArray())) -replace '-'
                }
            }

            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                        Algorithm = $Algorithm
                        Hash      = $Hash
                        String    = $currentString
                    })
            } else {
                Write-Output -InputObject $Hash
            }

        }
    }

    end {
        $MD5.Dispose()
        $TripleDES.Dispose()
        $SHA1.Dispose()
        $SHA256.Dispose()
        $SHA384.Dispose()
        $SHA512.Dispose()
        $RIPEMD160.Dispose()
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
