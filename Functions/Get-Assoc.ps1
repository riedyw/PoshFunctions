function Get-Assoc {
    <#
.SYNOPSIS
    Displays file extension associations
.DESCRIPTION
    Displays file extension associations which can be gotten from cmd.exe
.PARAMETER AsArray
    Switch to return result as an array of objects as opposed to an ordered dictionary
.EXAMPLE
    Get-Assoc

    Name                           Value
    ----                           -----
.EXAMPLE
    Get-Assoc -AsArray | Where-Object { $_.Name -match 'xls' } | Select-Object Value, Name

    Value                            Name
    -----                            ----
    Excel.Sheet.8                    .xls
    Excel.SheetBinaryMacroEnabled.12 .xlsb
    Excelhtmlfile                    .xlshtml
    Excel.SheetMacroEnabled.12       .xlsm
    excelmhtmlfile                   .xlsmhtml
    Excel.Sheet.12                   .xlsx
#>

    [CmdletBinding()]
    param (
        [switch] $AsArray
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $CmdReturn = (cmd.exe /d /c assoc)
        $GetAssoc = ([ordered] @{})
        foreach ($CurItem in $CmdReturn) {
            $Temp = $CurItem.Split('=')
            $GetAssoc.Add($Temp[0], $Temp[1])
        }
        if ($AsArray) {
            $ArrayOutput = $GetAssoc.GetEnumerator() | ForEach-Object {
                    new-object -TypeName psobject -Property ([ordered] @{
                        Extension = $_.Name
                        FType = $_.Value
                    })
                }
                Write-Output -InputObject $ArrayOutput
        } else {
            Write-Output -InputObject $GetAssoc
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
