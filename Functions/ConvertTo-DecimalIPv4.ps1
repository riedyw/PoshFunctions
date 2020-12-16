Function ConvertTo-DecimalIPv4 {
<#
.SYNOPSIS
    Converts a Dotted Decimal IP address into a 32-bit unsigned integer.
.DESCRIPTION
    ConvertTo-DecimalIP takes a dotted decimal IP and uses the [ipaddress] accelerator to determine 32 bit decimal value
.PARAMETER IPAddress
    An IP Address to convert.
.EXAMPLE
    ConvertTo-DecimalIP -IPAddress 10.20.30.40

    Would return
    673059850
.EXAMPLE
    ConvertTo-DecimalIP -IPAddress 192.168.1.1

    Would return
    16885952
#>

    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('string')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [ipaddress] $IPAddress
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        $i = [ipaddress] $IPAddress
        write-output -InputObject $i.Address
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction ConvertTo-DecimalIPv4

Set-Alias -Name 'ConvertTo-DecimalIP' -Value 'ConvertTo-DecimalIPv4' -Description 'Alias for ConvertTo-DecimalIPv4'
