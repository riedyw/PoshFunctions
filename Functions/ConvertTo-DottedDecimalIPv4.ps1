function ConvertTo-DottedDecimalIPv4 {
 <#
.SYNOPSIS
     Returns a dotted decimal IP address.
.DESCRIPTION
     ConvertTo-DecimalIPv4 takes 32 bit unsigned integer address into a dotted decimal IP address.
     Function aliased to 'ConvertTo-DecimalIP'
.PARAMETER IPAddress
     An IP Address to convert.
.PARAMETER IncludeInput
    Switch that will display input parameters in the output
.EXAMPLE
    ConvertTo-DottedDecimalIPv4 -IPAddress 16885952

    Would return
    192.168.1.1
.EXAMPLE
    ConvertTo-DottedDecimalIPv4 -IPAddress 16885952 -IncludeInput

    Would return
    IPAddress DottedDecimalIP
    --------- ---------------
    16885952 192.168.1.1
#>

    [CmdletBinding(ConfirmImpact='None')]
    [alias('ConvertTo-DottedDecimalIP')] #FunctionAlias
    param(
        [Parameter(Mandatory,HelpMessage='Please enter an IPvr address', Position = 0, ValueFromPipeline)]
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
