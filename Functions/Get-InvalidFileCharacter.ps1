function Get-InvalidFileCharacter {
<#
.SYNOPSIS
    Gets invalid filename characters
.DESCRIPTION
    Gets invalid filename characters. Function aliased to 'Show-InvalidFileCharacter'
    for backward compatibility.
.PARAMETER IncludeValues
    Switch indicating that decimal and hexadecimal representations of characters are to be included in output
.PARAMETER Printable
    Switch indicating that only printable characters are to be in the output
.EXAMPLE
    Get-InvalidFileCharacter -Printable

    Would return
    "
    <
    >
    |
    :
    *
    ?
    \
    /
.EXAMPLE
    Get-InvalidFileCharacter -Printable -IncludeValues

    Would return
    Char Dec Hex
    ---- --- ---
       "  34 22
       <  60 3c
       >  62 3e
       | 124 7c
       :  58 3a
       *  42 2a
       ?  63 3f
       \  92 5c
       /  47 2f
#>

    [CmdletBinding(ConfirmImpact='None')]
    [alias('Show-InvalidFileCharacter')] #FunctionAlias
    [OutputType([char[]])]
    Param (
        [switch] $IncludeValues,

        [switch] $Printable
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $Invalid = [System.IO.Path]::GetInvalidFileNameChars() | Select-Object -Property @{Name='Char';Expr={$_.ToString()}},
            @{Name='Dec';Expr={[int][char] $_}},
            @{Name='Hex';Expr={'{0:x}' -f ([int][char] $_)}}
        if ($Printable) {
            $Invalid = $Invalid | Where-Object {$_.Dec -gt 32}
        }
        if ($IncludeValues) {
            Write-Output -InputObject $Invalid
        } else {
            Write-Output -InputObject $Invalid.Char
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
