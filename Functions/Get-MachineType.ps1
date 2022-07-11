function Get-MachineType {
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
    Get-MachineType -ComputerName DEMOLAPTOP, CORPDC1

    ComputerName Type     Manufacturer          Model
    ------------ ----     ------------          -----
    DEMOLAPTOP   Physical Microsoft Corporation Surface Pro 6
    CORPDC1      VM       VMware, Inc.          VMware Virtual Platform
.EXAMPLE
    Get-MachineType -ComputerName (Get-Content c:\temp\computerlist.txt)
    Query if a list of computers are physical or virtual machines.
.LINK
    https://gallery.technet.microsoft.com/scriptcenter/Get-MachineType-VM-or-ff43f3a9
.NOTES
    Put in error checking around Get-CimInstance to handle Kerberos errors.
#>

    # todo - add Credential

    [CmdletBinding()]
    [OutputType('PSCustomObject')]
    Param
    (
        # ComputerName
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName, Position = 0)]
        [Alias('CN', 'Server')]
        [string[]] $ComputerName = $env:COMPUTERNAME
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $CimOption = New-CimSessionOption -EncodePortInServicePrincipalName
    }

    process {
        foreach ($Computer in $ComputerName) {
            Write-Verbose -Message "Checking $Computer"
            try {
                $ComputerSystemInfo = Get-CimInstance -Class Win32_ComputerSystem -ComputerName $Computer -ErrorAction Stop -Verbose:$false
            } catch {
                try {
                    $CimSession = New-CimSession -ComputerName $Computer -SessionOption $CimOption
                    $ComputerSystemInfo = Get-CimInstance -Class Win32_ComputerSystem  -CimSession $CimSession -ErrorAction Stop -Verbose:$false
                    $CimSession.Close()
                    $CimSession.Dispose()
                } catch {
                    Write-Error -Message "$Computer`: $($_.Exception.Message)"
                }
            }
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
                    ComputerName = $ComputerSystemInfo.PSComputername.ToUpper()
                    Type         = $MachineType
                    Manufacturer = $ComputerSystemInfo.Manufacturer
                    Model        = $ComputerSystemInfo.Model
                })
            Write-Output -InputObject $MachineTypeInfo

        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
