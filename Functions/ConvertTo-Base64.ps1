function ConvertTo-Base64 {
<#
.SYNOPSIS
    ConvertTo-Base64 converts a normal string to a base 64 string
.DESCRIPTION
    ConvertTo-Base64 converts a normal string to a base 64 string
.PARAMETER String
    The string you want manipulated
.PARAMETER IncludeInput
    Switch to enable input parameters to appear in output
.EXAMPLE
    ConvertTo-Base64 -String 'Password'

    Would return
    UABhAHMAcwB3AG8AcgBkAA==
.EXAMPLE
    ConvertTo-Base64 -String Hello,Goodbye -IncludeInput

    String  Base64
    ------  ------
    Hello   SABlAGwAbABvAA==
    Goodbye RwBvAG8AZABiAHkAZQA=
.OUTPUTS
    [string[]]
.LINK
    about_Properties
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    param
    (
        [Parameter(ValueFromPipeline)]
        [string[]] $String,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curString in $String) {
            $bytesto = [System.Text.Encoding]::Unicode.GetBytes($curString)
            $encodedto = [System.Convert]::ToBase64String($bytesto)
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        String = $curString
                        Base64 = $encodedto
                    })
            } else {
                Write-Output -InputObject $encodedto
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}

Set-Alias -Name 'Base64Encode' -Value 'ConvertTo-Base64' -Description 'Alias for ConvertTo-Base64'
