# source https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/enabling-preview-of-powershell-files-in-windows-explorer

function Enable-PowerShellFilePreview {
<#
.SYNOPSIS
    To enable previewing of Powershell files in the File Explorer.
.DESCRIPTION
    To enable previewing of Powershell files in the File Explorer.
.PARAMETER Font
    The name of the font to be used in the preview.
.PARAMETER FontSize
    The size of the font to be displayed
.EXAMPLE
    Enable-PowerShellFilePreview -Font 'Lucida Console' -FontSize 90
#>

    [CmdletBinding()]
    param
    (
        [string]
        $Font = 'Consolas',

        [int]
        $FontSize = 120
    )

    # set the font and size (also applies to Notepad)
    $path = 'HKCU:\Software\Microsoft\Notepad'
    Set-ItemProperty -Path $path -Name lfFaceName -Value $Font
    Set-ItemProperty -Path $path -Name iPointSize -Value $FontSize

    # enable the preview of PowerShell files
    $path = 'HKCU:\Software\Classes\.ps1'
    $exists = Test-Path -Path $path
    if (!$exists){
        $null = New-Item -Path $Path
    }
    $path = 'HKCU:\Software\Classes\.psd1'
    $exists = Test-Path -Path $path
    if (!$exists){
        $null = New-Item -Path $Path
    }

    $path = 'HKCU:\Software\Classes\.psm1'
    $exists = Test-Path -Path $path
    if (!$exists){
        $null = New-Item -Path $Path
    }


    Get-Item -Path HKCU:\Software\Classes\* -Include .ps1,.psm1,.psd1 | Set-ItemProperty -Name PerceivedType -Value text
}
