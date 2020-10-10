# PoshFunctions

A variety of Powershell functions and filters wrapped into a module.

## Install the module

To install the module run the following command:

    Install-Module PoshFunctions

Copy the `PoshFunctions` folder into one of the folders specified in the `$env:PSMODULEPATH` folders.

To display the paths enter the following command.

    $env:PSMODULEPATH

To display in a way better understood by you the human:

    $env:PSMODULEPATH -Split ';'

Or you can save it to a variable

    $ModPath = $env:PSMODULEPATH -Split ';'

Then you can reference a particular path

    $ModPath[1]


## Import the module

To import the module enter the following command

    Import-Module -Name PoshFunctions

## Functions

For the functions themselves see [**Functions**](Functions) folder.

- Add-Help
- Add-ISEThemeMenu
- audio-function
- Compare-ObjectProperty
- Convert-ARGBToHex
- Convert-BitShift
- Convert-HexToARGB
- Convert-ObjectToHashtable
- Convert-ROT13
- Convert-SecureStringToString
- Convert-UserFlag
- ConvertFrom-Base64
- ConvertFrom-DateTime
- ConvertFrom-FsRight
- ConvertFrom-UrlEncode
- ConvertFrom-UTC
- ConvertFrom-Xml
- ConvertTo-Base64
- ConvertTo-BinaryIPv4
- ConvertTo-Bool
- ConvertTo-DateTime
- ConvertTo-DecimalIPv4
- ConvertTo-DottedDecimalIPv4
- ConvertTo-Markdown
- ConvertTo-OrderedDictionary
- ConvertTo-PlainText
- ConvertTo-SecureText
- ConvertTo-UncPath
- ConvertTo-UrlEncode
- ConvertTo-UTC
- Copy-Object
- Eexit
- Enable-PowerShellFilePreview
- Expand-String
- Expand-Tab
- Export-CSVSortedColumn
- Export-ISEThemeFile
- FileSizeAbove
- FileSizeBelow
- Format-MacAddress
- Format-ReverseString
- Format-SortedList
- Format-WrapText
- Get-BashPath
- Get-BinaryType
- Get-ComputerSite
- Get-CurrentISETheme
- Get-DNSHostEntryAsync
- Get-DriveStat
- Get-Enum
- Get-ExecutableForFile
- Get-FileEncoding
- Get-FileName
- Get-FileWithLeadingSpace
- Get-Folder
- Get-Font
- Get-Fortune
- Get-ImportedISETheme
- Get-In
- Get-IniContent
- Get-IpRange
- Get-ISETheme
- Get-LastReboot
- Get-MachineType
- Get-MacVendor
- Get-Magic8Ball
- Get-Md5Sum
- Get-ModuleVersionInformation
- Get-NetStatistics
- Get-NTFSPermission
- Get-NtpDate
- Get-OpenFiles
- Get-OperatingSystemSKU
- Get-Power
- Get-PrivateProfileComment
- Get-PrivateProfileSection
- Get-PrivateProfileSectionNames
- Get-PrivateProfileString
- Get-PSWho
- Get-RandomDate
- Get-RandomHexDigit
- Get-RandomMacAddress
- Get-RegExpandString
- Get-RegistryValue
- Get-Round
- Get-SaveFile
- Get-Sessions
- Get-Share
- Get-SharePermission
- Get-Shares
- Get-ShareStat
- Get-Shortcut
- Get-SID
- Get-StaticProperty
- Get-SubnetMaskIPv4
- Get-TruncatedDate
- Get-Type
- Get-UrlContent
- Get-WordCount
- grep
- Help
- Import-GroupISETheme
- Import-ISEThemeFile
- Invoke-Speak
- Invoke-WindowsAPI
- Join-Object
- Lock-Workstation
- mklink
- Move-ToRecycleBin
- New-InputBox
- New-Popup
- New-QR
- New-Screenshot
- New-Shortcut
- New-WPFMessageBox
- New-WPFMessageBox2
- Read-HostWithDefault
- Remove-BlankOrComment
- Remove-BOMFromFile
- Remove-EmptyProperty
- Remove-InvalidFileNameChar
- Remove-ISETheme
- Remove-QuotesFromCsv
- Remove-Trailing
- Reset-Desktop
- Resolve-ComputerName
- Resolve-FQDN
- Resolve-HostName
- Search-Method
- sed
- Select-ISETheme
- Set-Capslock
- Set-Display
- Set-DisplayOff
- Set-DisplayOn
- Set-ISEColor
- Set-ISETheme
- Set-Numlock
- Set-PrivateProfileComment
- Set-PrivateProfileString
- Set-Scrolllock
- Set-Speaker
- Set-Type
- Set-WindowStyle
- Show-AllColor
- Show-Calendar
- Show-Color
- Show-ColorsWithBackground
- Show-DaysOfWeek
- Show-FileAttribute
- Show-FsRight
- Show-InvalidFileCharacter
- Show-Month
- Show-NamedColor
- Show-Object
- Show-Progress
- Show-ShortDaysOfWeek
- Show-ShortMonth
- Show-SpecialFolder
- Show-SubnetMaskIPv4
- Show-Timezone
- Show-TypeAccelerator
- Start-RecordSession
- Stop-RecordSession
- Switch-Mute
- Test-ConnectionAsync
- Test-IsAdmin
- Test-IsCapsLock
- Test-IsDate
- Test-IsFileLocked
- Test-IsHexString
- Test-IsNumeric
- Test-IsNumLock
- Test-IsScrollLock
- Test-IsValidEmailAddress
- Test-IsValidIPv4
- Test-NtpDateVsNow
- Test-Port
- Union-Object
- Update-ExplorerIcon
- Use-CallerPreference


## EOF - End Of File Comment
