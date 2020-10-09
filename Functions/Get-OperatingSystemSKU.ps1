##############################################################################
##
## Get-OperatingSystemSku
##
## From Windows PowerShell Cookbook (O'Reilly)
## by Lee Holmes (http://www.leeholmes.com/guide)
##
##############################################################################

function Get-OperatingSystemSKU {
<#
.SYNOPSIS
Gets the sku information for the current operating system
.EXAMPLE
PS > Get-OperatingSystemSku
Professional with Media Center
#>

    [CmdletBinding()]
    [OutputType('string')]
    param( [string] $Sku =
    (Get-CimInstance -ClassName Win32_OperatingSystem).OperatingSystemSku)

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {

        Set-StrictMode -Version 3
        switch ($Sku)
        {
            0 { "An unknown product [$($SKU)]"; break; }
            1 { "Ultimate [$($SKU)]"; break; }
            2 { "Home Basic [$($SKU)]"; break; }
            3 { "Home Premium [$($SKU)]"; break; }
            4 { "Enterprise [$($SKU)]"; break; }
            5 { "Home Basic N [$($SKU)]"; break; }
            6 { "Business [$($SKU)]"; break; }
            7 { "Server Standard [$($SKU)]"; break; }
            8 { "Server Datacenter (full installation) [$($SKU)]"; break; }
            9 { "Windows Small Business Server [$($SKU)]"; break; }
            10 { "Server Enterprise (full installation) [$($SKU)]"; break; }
            11 { "Starter [$($SKU)]"; break; }
            12 { "Server Datacenter (core installation) [$($SKU)]"; break; }
            13 { "Server Standard (core installation) [$($SKU)]"; break; }
            14 { "Server Enterprise (core installation) [$($SKU)]"; break; }
            15 { "Server Enterprise for Itanium-based Systems [$($SKU)]"; break; }
            16 { "Business N [$($SKU)]"; break; }
            17 { "Web Server (full installation) [$($SKU)]"; break; }
            18 { "HPC Edition [$($SKU)]"; break; }
            19 { "Windows Storage Server 2008 R2 Essentials [$($SKU)]"; break; }
            20 { "Storage Server Express [$($SKU)]"; break; }
            21 { "Storage Server Standard [$($SKU)]"; break; }
            22 { "Storage Server Workgroup [$($SKU)]"; break; }
            23 { "Storage Server Enterprise [$($SKU)]"; break; }
            24 { "Windows Server 2008 for Windows Essential Server Solutions [$($SKU)]"; break; }
            25 { "Small Business Server Premium [$($SKU)]"; break; }
            26 { "Home Premium N [$($SKU)]"; break; }
            27 { "Enterprise N [$($SKU)]"; break; }
            28 { "Ultimate N [$($SKU)]"; break; }
            29 { "Web Server (core installation) [$($SKU)]"; break; }
            30 { "Windows Essential Business Server Management Server [$($SKU)]"; break; }
            31 { "Windows Essential Business Server Security Server [$($SKU)]"; break; }
            32 { "Windows Essential Business Server Messaging Server [$($SKU)]"; break; }
            33 { "Server Foundation [$($SKU)]"; break; }
            34 { "Windows Home Server 2011 [$($SKU)]"; break; }
            35 { "Windows Server 2008 without Hyper-V for Windows Essential Server Solutions [$($SKU)]"; break; }
            36 { "Server Standard without Hyper-V [$($SKU)]"; break; }
            37 { "Server Datacenter without Hyper-V (full installation) [$($SKU)]"; break; }
            38 { "Server Enterprise without Hyper-V (full installation) [$($SKU)]"; break; }
            39 { "Server Datacenter without Hyper-V (core installation) [$($SKU)]"; break; }
            40 { "Server Standard without Hyper-V (core installation) [$($SKU)]"; break; }
            41 { "Server Enterprise without Hyper-V (core installation) [$($SKU)]"; break; }
            42 { "Microsoft Hyper-V Server [$($SKU)]"; break; }
            43 { "Storage Server Express (core installation) [$($SKU)]"; break; }
            44 { "Storage Server Standard (core installation) [$($SKU)]"; break; }
            45 { "Storage Server Workgroup (core installation) [$($SKU)]"; break; }
            46 { "Storage Server Enterprise (core installation) [$($SKU)]"; break; }
            46 { "Storage Server Enterprise (core installation) [$($SKU)]"; break; }
            47 { "Starter N [$($SKU)]"; break; }
            48 { "Professional [$($SKU)]"; break; }
            49 { "Professional N [$($SKU)]"; break; }
            50 { "Windows Small Business Server 2011 Essentials [$($SKU)]"; break; }
            51 { "Server For SB Solutions [$($SKU)]"; break; }
            52 { "Server Solutions Premium [$($SKU)]"; break; }
            53 { "Server Solutions Premium (core installation) [$($SKU)]"; break; }
            54 { "Server For SB Solutions EM [$($SKU)]"; break; }
            55 { "Server For SB Solutions EM [$($SKU)]"; break; }
            56 { "Windows MultiPoint Server [$($SKU)]"; break; }
            59 { "Windows Essential Server Solution Management [$($SKU)]"; break; }
            60 { "Windows Essential Server Solution Additional [$($SKU)]"; break; }
            61 { "Windows Essential Server Solution Management SVC [$($SKU)]"; break; }
            62 { "Windows Essential Server Solution Additional SVC [$($SKU)]"; break; }
            63 { "Small Business Server Premium (core installation) [$($SKU)]"; break; }
            64 { "Server Hyper Core V [$($SKU)]"; break; }
            72 { "Server Enterprise (evaluation installation) [$($SKU)]"; break; }
            76 { "Windows MultiPoint Server Standard (full installation) [$($SKU)]"; break; }
            77 { "Windows MultiPoint Server Premium (full installation) [$($SKU)]"; break; }
            79 { "Server Standard (evaluation installation) [$($SKU)]"; break; }
            80 { "Server Datacenter (evaluation installation) [$($SKU)]"; break; }
            84 { "Enterprise N (evaluation installation) [$($SKU)]"; break; }
            95 { "Storage Server Workgroup (evaluation installation) [$($SKU)]"; break; }
            96 { "Storage Server Standard (evaluation installation) [$($SKU)]"; break; }
            98 { "Windows 8 N [$($SKU)]"; break; }
            99 { "Windows 8 China [$($SKU)]"; break; }
            100 { "Windows 8 Single Language [$($SKU)]"; break; }
            101 { "Windows 8 [$($SKU)]"; break; }
            103 { "Professional with Media Center [$($SKU)]"; break; }
            default {'UNKNOWN: ' + $SKU }
        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
