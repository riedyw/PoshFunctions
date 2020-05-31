Function Show-TypeAccelerator {
<#
.SYNOPSIS
    Shows type accelerators
.DESCRIPTION
    Shows type accelerators [int32] [datetime] etc.
.NOTES
    Author:     Bill Riedy
#>

    #requires -Version 2

    [CmdletBinding(ConfirmImpact='None')]
    Param ()

    Begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    Process {
        $t = [PSObject].Assembly.GetType('System.Management.Automation.TypeAccelerators')
        $t::Get.GetEnumerator() |
            Where-Object {$_.Value.Name -notlike '*Attribute*'} |
            Sort-object -Property Key | Select-Object -Property Key, Value
    }

    End {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

}
