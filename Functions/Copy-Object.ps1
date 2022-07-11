function Copy-Object {
<#
.SYNOPSIS
    To copy an object to standard output
.DESCRIPTION
    To copy an object to standard output. Any complex data structure (beyond int, datetime, double, etc)
    that is assigned to another variable that second variable is actually a pointer to the dataset
    already in memory. What this allows you to do is to get a true copy where you can manipulate the
    second variable without affecting the contents of the first variable
.PARAMETER InputObject
    The object that you want copied.
.EXAMPLE
    # Example of what is WRONG with assigning a variable object to another variable
    $A = New-Object -TypeName 'psobject' -Property ([ordered] @{ Name = 'server' ; Value = 12 })
    $B = $A
    $B.Value = 3
    $A

    Name   Value
    ----   -----
    server     3

    # Which is probably not what you want to do.
.EXAMPLE
    $A = New-Object -TypeName 'psobject' -Property ([ordered] @{ Name = 'server' ; Value = 12 })
    $B = Copy-Object -InputObject $A
    $B.Value = 3
    $A

    Name   Value
    ----   -----
    server    12
#>

    # todo Change += to System.Collections.Arraylist

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('psobject')]
    Param(
        [Parameter(Mandatory, Position = 0, ValueFromPipeline)]
        [psobject[]] $InputObject
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $result = @()
    }

    process {
        foreach ($curObject in $InputObject) {
            if ($curObject.gettype().name -eq 'HashTable') {
                $result += $curObject.Clone()
            } else {
                $tempObject = New-Object -TypeName PsObject
                $curObject.psobject.properties | ForEach-Object {
                    $tempObject | Add-Member -MemberType $_.MemberType -Name $_.Name -Value $_.Value
                }
                $result += $tempObject
            }
        }
    }

    end {
        Write-Output -InputObject $result
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
