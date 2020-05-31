Function Get-MachineType {
<#
.SYNOPSIS
    A quick function to determine if a computer is VM or physical box.
.DESCRIPTION
    This function is designed to quickly determine if a local or remote computer is a physical machine or a virtual machine.
.NOTES
    inspired by https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9/view/Discussions
    Created by: Jason Wasser
    Modified: 4/20/2017 03:28:53 PM

    Changelog:
    * Code cleanup thanks to suggestions from @juneb_get_help
    * Added Xen AWS Xen for HVM domU

    To Do:
    * Find the Model information for other hypervisor VM's (i.e KVM).
.EXAMPLE
    Get-MachineType
    Query if the local machine is a physical or virtual machine.
.EXAMPLE
    Get-MachineType -ComputerName SERVER01
    Query if SERVER01 is a physical or virtual machine.
.EXAMPLE
    Get-MachineType -ComputerName (Get-Content c:\temp\computerlist.txt)
    Query if a list of computers are physical or virtual machines.
.LINK
    https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
#>

    # fixme doesn't work in pwsh

    [CmdletBinding()]
    [OutputType('PSCustomObject')]
    Param
    (
        # ComputerName
        [Parameter(ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0)]
        [string[]] $ComputerName = $env:COMPUTERNAME
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        foreach ($Computer in $ComputerName) {
            Write-Verbose -Message "Checking $Computer"
            try {
                $ComputerSystemInfo = Get-WmiObject -Class Win32_ComputerSystem -ComputerName $Computer -ErrorAction Stop

                switch -regex ($ComputerSystemInfo.Model) {

                    # Check for Hyper-V Machine Type
                    'Virtual Machine' {
                        $MachineType = 'VM'
                    }

                    # Check for VMware Machine Type
                    'VMware' {
                        $MachineType = 'VM'
                    }

                    # Check for Oracle VM Machine Type
                    'VirtualBox' {
                        $MachineType = 'VM'
                    }

                    # Check for Xen
                    'HVM domU' {
                        $MachineType = 'VM'
                    }

                    # Otherwise it is a physical Box
                    default {
                        $MachineType = 'Physical'
                    }
                }

                # Building MachineTypeInfo Object
                $MachineTypeInfo = New-Object -TypeName PSObject -Property ([ordered]@{
                        ComputerName = $ComputerSystemInfo.PSComputername
                        Type         = $MachineType
                        Manufacturer = $ComputerSystemInfo.Manufacturer
                        Model        = $ComputerSystemInfo.Model
                    })
                $MachineTypeInfo
            } catch [Exception] {
                Write-Error -Message "$Computer`: $($_.Exception.Message)"
            }
        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} #Endfunction Get-MachineType
