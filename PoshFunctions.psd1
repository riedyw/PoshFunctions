

@{

# Script module or binary module file associated with this manifest.
RootModule = 'PoshFunctions.psm1'

# Version number of this module.
ModuleVersion = '2.2.1.3'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '188504d6-d6ed-4ee3-92c4-7b426ed3d611'

# Author of this module
Author = 'Bill Riedy'

# Company or vendor of this module
CompanyName = ''

# Copyright statement for this module
Copyright = '(c) 2020 Bill Riedy. All rights reserved.'

# Description of the functionality provided by this module
Description = 'A curated collection of over 150 PowerShell functions. Many functions written by me. Others are attributed whereever possible.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(﻿'Compare-ObjectProperty', 'Convert-ARGBToHex', 'Convert-HexToARGB', 'Convert-ObjectToHashtable', 'Convert-ROT13', 'Convert-SecureStringToString', 'Convert-UserFlag', 'ConvertFrom-Base64', 'ConvertFrom-DateTime', 'ConvertFrom-FsRight', 'ConvertFrom-UrlEncode', 'ConvertFrom-UTC', 'ConvertFrom-Xml', 'ConvertTo-Base64', 'ConvertTo-BinaryIPv4', 'ConvertTo-Bool', 'ConvertTo-DateTime', 'ConvertTo-DecimalIPv4', 'ConvertTo-DottedDecimalIPv4', 'ConvertTo-Markdown', 'ConvertTo-OrderedDictionary', 'ConvertTo-PlainText', 'ConvertTo-SecureText', 'ConvertTo-UncPath', 'ConvertTo-UrlEncode', 'ConvertTo-UTC', 'Copy-Object', 'Eexit', 'Expand-IPv6', 'Expand-String', 'Expand-Tab', 'Export-CSVSortedColumn', 'FileSizeAbove', 'FileSizeBelow', 'Format-MacAddress', 'Format-RandomCase', 'Format-ReverseString', 'Format-SortedList', 'Format-WrapText', 'Get-BashPath', 'Get-BinaryType', 'Get-ComputerSite', 'Get-DNSHostEntryAsync', 'Get-DriveStat', 'Get-Enum', 'Get-ExecutableForFile', 'Get-FileEncoding', 'Get-FileName', 'Get-FileWithLeadingSpace', 'Get-Folder', 'Get-Font', 'Get-Fortune', 'Get-InstalledModuleVersion', 'Get-IpRange', 'Get-LastReboot', 'Get-MachineType', 'Get-MacVendor', 'Get-Magic8Ball', 'Get-Md5Sum', 'Get-NTFSPermission', 'Get-NtpDate', 'Get-OperatingSystemSKU', 'Get-Power', 'Get-PrintableAscii', 'Get-PrivateProfileComment', 'Get-PrivateProfileSection', 'Get-PrivateProfileSectionNames', 'Get-PrivateProfileString', 'Get-PSWho', 'Get-RandomDate', 'Get-RandomHexDigit', 'Get-RandomMacAddress', 'Get-RegExpandString', 'Get-RegistryValue', 'Get-Round', 'Get-SaveFile', 'Get-Share', 'Get-SharePermission', 'Get-ShareStat', 'Get-Shortcut', 'Get-SID', 'Get-StaticProperty', 'Get-SubnetMaskIPv4', 'Get-TruncatedDate', 'Get-Type', 'Get-UrlContent', 'Get-WordCount', 'grep', 'Help', 'Invoke-Beep', 'Invoke-Speak', 'Join-Object', 'Lock-Workstation', 'Measure-Char', 'mklink', 'Move-ToRecycleBin', 'New-InputBox', 'New-Popup', 'New-QR', 'New-Screenshot', 'New-Shortcut', 'Read-HostWithDefault', 'Remove-BlankOrComment', 'Remove-BOMFromFile', 'Remove-EmptyProperty', 'Remove-InvalidFileNameChar', 'Remove-QuotesFromCsv', 'Remove-Trailing', 'Reset-Desktop', 'Resolve-FQDN', 'Resolve-HostName', 'Search-Method', 'sed', 'Set-Capslock', 'Set-Display', 'Set-Numlock', 'Set-PrivateProfileComment', 'Set-PrivateProfileString', 'Set-Scrolllock', 'Set-Speaker', 'Set-Type', 'Set-WindowStyle', 'Show-AllColor', 'Show-Calendar', 'Show-Color', 'Show-ColorsWithBackground', 'Show-DaysOfWeek', 'Show-FileAttribute', 'Show-FsRight', 'Show-InvalidFileCharacter', 'Show-Month', 'Show-NamedColor', 'Show-Object', 'Show-Progress', 'Show-ShortDaysOfWeek', 'Show-ShortMonth', 'Show-SpecialFolder', 'Show-SubnetMaskIPv4', 'Show-Timezone', 'Show-TypeAccelerator', 'Start-RecordSession', 'Stop-RecordSession', 'Switch-Mute', 'Test-ConnectionAsync', 'Test-IsAdmin', 'Test-IsCapsLock', 'Test-IsDate', 'Test-IsFileLocked', 'Test-IsHexString', 'Test-IsNumeric', 'Test-IsNumLock', 'Test-IsScrollLock', 'Test-IsValidEmailAddress', 'Test-IsValidIPv4', 'Test-IsValidIPv6', 'Test-NtpDateVsNow', 'Test-Port', 'Union-Object', 'Update-ExplorerIcon'
)


# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
#CmdletsToExport = '*'

# Variables to export from this module
#VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('base64', 'beep', 'binaryip', 'calendar', 'capslock', 'color-hex', 'color-rgb', 'color-show', 'computer-site', 'computersite', 'datetime', 'date-random', 'date-truncate', 'days-week', 'decimalip', 'display', 'dns-async', 'dotteddecimalip', 'email-address', 'expand-string', 'expand-tab', 'exponentiation', 'file', 'file-encoding', 'file-invalidchar', 'folder', 'format', 'functions', 'gui', 'ini', 'inputbox', 'ip', 'iprange', 'isadmin', 'isdate', 'ishexstring', 'isnumeric', 'isvalidemail', 'isvalidip', 'library', 'macaddress', 'magic8ball', 'markdown', 'md5sum', 'msgbox', 'numlock', 'ping-async', 'popup', 'progress', 'random-date', 'registry', 'reverse-string', 'rot13', 'round', 'savefile', 'scrolllock', 'set-type', 'share-permission', 'share-stat', 'shortcut', 'sid', 'speak', 'subnetmask', 'system', 'timezone', 'urlencode', 'utc', 'wrap-text', 'xml'
)

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = False

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

