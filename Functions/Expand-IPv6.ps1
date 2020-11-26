function Expand-IPV6 {
# source: https://badflyer.com/powershell-ipv4-to-ipv6/

#
# Expand an IPv6 address. For example ::1 becomes 0000:0000:0000:0000:0000:0000:0000:0001
#


    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true, 
                   Position = 0,
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true)][String]$IPv6
    )
    process
    {
        $count = 0
        $loc = -1
 
        # Count the number of colons, and keep track of the double colon
        for($i = 0; $i -lt $IPv6.Length; $i++) 
        { 
            if($IPv6[$i] -eq ':') 
            {
                $count++
                if(($i - 1) -ge 0 -and $IPv6[$i-1] -eq ':')
                {
                    $loc = $i
                }
            }
        }
 
        # If we didnt find a double colon and the count isn't 7, then throw an exception
        if($loc -lt 0 -and $count -ne 7)
        {
            throw "Invalid IPv6 Address"
        }
 
        # Add in any missing colons if we had a double
        $cleaned = $IPv6
        if($count -lt 7)
        {
            $cleaned = $IPv6.Substring(0, $loc) + (':'*(7-$count)) + $IPv6.Substring($loc)
        }
 
        # Parse current values in fill in new IP with hex numbers padded to 4 digits
        $result = @()
        foreach($splt in $cleaned -split ':')
        {
            $val = 0
            $r = [int]::TryParse($splt, [System.Globalization.NumberStyles]::HexNumber, [System.Globalization.CultureInfo]::InvariantCulture, [ref]$val)
            $result += ('{0:X4}' -f $val)
        }
 
        return $result -join ':'
    }
}