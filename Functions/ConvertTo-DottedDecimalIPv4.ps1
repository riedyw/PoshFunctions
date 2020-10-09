Function ConvertTo-DottedDecimalIPv4 {
 <#
.SYNOPSIS
     Returns a dotted decimal IP address.
.DESCRIPTION
     ConvertTo-DecimalIP takes 32 bit unsigned integer address into a dotted decimal IP address
.PARAMETER IPAddress
     An IP Address to convert.
.EXAMPLE
    ConvertTo-DottedDecimalIP -IPAddress 16885952

    Would return
    192.168.1.1
#>

[CmdletBinding(ConfirmImpact='None')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [ipaddress] $IPAddress
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        $i = [ipaddress] $IPAddress
        write-output -InputObject $i.IPAddressToString
      }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #EndFunction ConvertTo-DottedDecimalIPv4

Set-Alias -Name 'ConvertTo-DottedDecimalIP' -Value 'ConvertTo-DottedDecimalIPv4'
