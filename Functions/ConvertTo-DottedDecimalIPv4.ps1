function ConvertTo-DottedDecimalIPv4 {
 <#
.SYNOPSIS
     Returns a dotted decimal IP address.
.DESCRIPTION
     ConvertTo-DecimalIP takes 32 bit unsigned integer address into a dotted decimal IP address
.PARAMETER IPAddress
     An IP Address to convert.
.PARAMETER IncludeInput
    Switch that will display input parameters in the output
.EXAMPLE
    ConvertTo-DottedDecimalIP -IPAddress 16885952

    Would return
    192.168.1.1
.EXAMPLE
    ConvertTo-DottedDecimalIP -IPAddress 16885952 -IncludeInput

    Would return
    IPAddress DottedDecimalIP
    --------- ---------------
    16885952 192.168.1.1
#>

    [CmdletBinding(ConfirmImpact='None')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [ipaddress[]] $IPAddress,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curIPAddress in $IPAddress) {
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                        IPAddress = $curIPAddress.Address
                        DottedDecimalIP =$curIPAddress.IPAddressToString
                    })
            } else {
                Write-Output -InputObject $curIPAddress.IPAddressToString
            }
        }
      }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}

Set-Alias -Name 'ConvertTo-DottedDecimalIP' -Value 'ConvertTo-DottedDecimalIPv4' -Description 'Alias for ConvertTo-DottedDecimalIPv4'
