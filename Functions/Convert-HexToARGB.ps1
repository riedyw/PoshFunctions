Function Convert-HexToARGB {
<#
.SYNOPSIS
    Converts Hex to ARGB values

.DESCRIPTION
    Converts Hex to ARGB values. Hex values are needed to apply ISE colors in script

.PARAMETER Hex_Val
    An 8 character Hex value

.EXAMPLE
    PS C:\> $ARGB = Convert-HexToARGB $HexValue

    Assigns converted hex value to ARGB variable

.NOTES
    Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
    http://Lifeinpowerhsell.blogspot.com
    http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    Param(
        [parameter(Mandatory)]
        [string] $Hex_Val
    )
    #endregion Parameter

    begin {
    Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    }

    process {
        #-Convert values
        $A = [Convert]::ToInt32($Hex_Val.substring(1, 2), 16)
        $R = [Convert]::ToInt32($Hex_Val.substring(3, 2), 16)
        $G = [Convert]::ToInt32($Hex_Val.substring(5, 2), 16)
        $B = [Convert]::ToInt32($Hex_Val.substring(7, 2), 16)

        #-Output value object
        $Obj = New-Object -TypeName PSObject
        $Obj | Add-Member -MemberType NoteProperty -Name A -Value $A
        $Obj | Add-Member -MemberType NoteProperty -Name R -Value $R
        $Obj | Add-Member -MemberType NoteProperty -Name G -Value $G
        $Obj | Add-Member -MemberType NoteProperty -Name B -Value $B
        $Obj
    } # End process

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
} #end function Convert-HexToARGB
