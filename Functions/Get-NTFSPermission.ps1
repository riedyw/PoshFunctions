function Get-NTFSPermission {
<#
.SYNOPSIS
    To get permission information on a specified Path or folder name
.DESCRIPTION
    To get permission information on a specified Path or folder name
.PARAMETER Path
    The name of the path
.EXAMPLE
    Get-NTFSPermission -Path "C:\Temp"

    Would return:

    A listing of all of the permissions
#>

    # todo Change += to System.Collections.Arraylist

    [CmdletBinding()]
    param([string[]] $Path)

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($curPath in $Path) {
            Write-Verbose -Message "Path specified was [$($curPath)]"
            if (-not (Test-Path -Path $curPath)) {
                Write-Error -Message "Path [$($curPath)] does not exist"
                break
            } else {
                Write-Verbose -Message "The path [$($curPath)] exists"
            }
            $acl = Get-Acl -Path $curPath
            $aclPermissions = $acl | Select-Object -ExpandProperty access
            $ComputerName = $env:COMPUTERNAME
            $returnVariable = @()
            $aclPermissions | ForEach-Object {
                $tmpObject = '' | Select-Object -Property ComputerName, Path, AccessType, IdentityReference, Rights, IsInherited, InheritanceFlags, PropogationFlags
                $tmpObject.ComputerName = $ComputerName
                $tmpObject.Path = $curPath
                $tmpObject.AccessType = $_.AccessControlType
                $tmpObject.IdentityReference = $_.IdentityReference
                $tmpObject.InheritanceFlags = $_.InheritanceFlags
                #        $tmpObject.Rights               = ConvertFrom-AccessMask -AccessMask $_.FileSystemRights.value__
                $tmpObject.Rights = ConvertFrom-FsRight -Rights (Convert-Int32ToUint32 -Number $_.FileSystemRights.value__)
                $tmpObject.PropogationFlags = $_.PropogationFlags
                $returnVariable += $tmpObject
            }
        }
    }

    end {
        Write-Output -InputObject $returnVariable
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
