function ConvertFrom-FsRight {
    <#
.SYNOPSIS
    To convert a [uint32] FileSystemRight value into a human readable form
.DESCRIPTION
    To convert a [uint32] FileSystemRight value into a human readable form using normal text
.PARAMETER Rights
    The filesystemrights value determined by: get-acl -Path $Path | select-object -expand access | select-object FileSystemRights
    Alternatively a [uint32] value could be passed from the command line. Hex values need to be enclosed in quotes.
.PARAMETER IncludeInput
    Switch to include input values in the output
.EXAMPLE
    ConvertFrom-FsRight -Rights "0x1F01FF"
    Would return
    FullControl
.EXAMPLE
    ConvertFrom-FsRight -Rights "0x1301BF"
    Would return
    ReadAndExecute,Modify,Write
.EXAMPLE
    ConvertFrom-FsRight -Rights 268435456
    Would return
    GenericAll
.LINK
    Get-ACL
.OUTPUTS
    A [string] of all the applicable rights in readable form
#>

    #region Parameters
    [CmdletBinding()]
    [OutputType('string')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    param(
        [uint64[]] $Rights,

        [switch] $IncludeInput
    )
    #endregion Parameters

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $fsPermission = Show-FsRight -Verbose:$false
    }

    process {
        foreach ($curRights in $Rights) {
            $temp = @()
            $MatchFound = $false
            $fsPermission | Where-Object { $_.Type -eq 'Combo' } | ForEach-Object {
                #write-verbose "Name = [$($_.name)], Value = [$($_.Dec)]"
                if ($curRights -eq $_.Dec) {
                    $temp += $_.Name
                    $MatchFound = $true
                    Write-Verbose -Message "Temp now equal to [$($temp -join ',')]"
                    Write-Output -InputObject ( $_.Name )
                    #break
                }
            }
            if (-not $MatchFound ) {
                # Simple permissions hit a match, output the variable and return
                #    if ($temp) {
                #        write-output -inputobject ( $temp -join ',' )
                #    }
                $fsPermission | Where-Object { $_.Type -eq 'Single' } | ForEach-Object {
                    #write-verbose "Name = [$($_.name)], Value = [$($_.Dec)]"
                    if ($curRights -band $_.Dec) {
                        $temp += $_.Name
                        $MatchFound = $true
                        Write-Verbose -Message "Temp now equal to [$($temp -join ',')]"
                    }
                }
                $MatchFound | Out-Null
                # Simple permissions hit a match, output the variable and return
                if ( $MatchFound ) {
                    if ($IncludeInput) {
                        New-Object -TypeName psobject -Property ([ordered] @{
                                Right       = $curRights
                                RightHex    = ('0x{0:x6}' -f $curRights)
                                RightString = ( $temp -join ',' )
                            })
                    } else {
                        Write-Output -InputObject ( $temp -join ',' )
                    }

                } else {
                    Write-Output -InputObject $null
                }
            }
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
