@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'PoshFunctions.psm1'

    # Version number of this module.
    ModuleVersion     = '2.2.1.6'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID              = '188504d6-d6ed-4ee3-92c4-7b426ed3d611'

    # Author of this module
    Author            = 'Bill Riedy'

    # Company or vendor of this module
    CompanyName       = ''

    # Copyright statement for this module
    Copyright         = '(c) 2021 Bill Riedy. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'A curated collection of over 160 PowerShell functions. Many functions written by me. Others are attributed wherever possible.'

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

    # Functions export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.

    FunctionsToExport = @( 'Compare-ObjectProperty', 'Compare-PSGalleryObject',
    'Convert-HexToRGB', 'Convert-ObjectToHashtable', 'Convert-RGBToHex',
    'Convert-ROT13', 'Convert-SecureStringToString', 'Convert-UserFlag',
    'ConvertFrom-Base64', 'ConvertFrom-Binary', 'ConvertFrom-DateTime',
    'ConvertFrom-FsRight', 'ConvertFrom-Hex', 'ConvertFrom-UrlEncode',
    'ConvertFrom-UTC', 'ConvertFrom-Xml', 'ConvertTo-Base64', 'ConvertTo-Binary',
    'ConvertTo-BinaryIPv4', 'ConvertTo-Bool', 'ConvertTo-DateTime',
    'ConvertTo-DecimalIPv4', 'ConvertTo-DottedDecimalIPv4', 'ConvertTo-Hex',
    'ConvertTo-OrderedDictionary', 'ConvertTo-UncPath', 'ConvertTo-UrlEncode',
    'ConvertTo-UTC', 'Copy-Object', 'Eexit', 'Expand-IPv6', 'Expand-String',
    'Expand-Tab', 'Export-CSVSortedColumn', 'FileSizeAbove', 'FileSizeBelow',
    'Format-MacAddress', 'Format-RandomCase', 'Format-ReverseString',
    'Format-SortedList', 'Format-WrapText', 'Get-Address', 'Get-BashPath',
    'Get-BinaryType', 'Get-ComputerSite', 'Get-DiceRoll', 'Get-DNSHostEntryAsync',
    'Get-DriveStat', 'Get-Enum', 'Get-ExecutableForFile', 'Get-FileEncoding',
    'Get-FileName', 'Get-FileWithLeadingSpace', 'Get-Folder', 'Get-Font',
    'Get-Fortune', 'Get-GeoCode', 'Get-InvalidFileCharacter', 'Get-IpRange',
    'Get-LastReboot', 'Get-MachineType', 'Get-MacVendor', 'Get-Magic8Ball',
    'Get-Md5Sum', 'Get-NetworkCredential', 'Get-NTFSPermission', 'Get-NtpDate',
    'Get-Power', 'Get-PrintableAscii', 'Get-PrivateProfileComment',
    'Get-PrivateProfileSection', 'Get-PrivateProfileSectionNames',
    'Get-PrivateProfileString', 'Get-PSWho', 'Get-RandomDate',
    'Get-RandomHexDigit', 'Get-RandomMacAddress', 'Get-RegExpandString',
    'Get-RegistryValue', 'Get-Round', 'Get-SaveFile', 'Get-Shortcut', 'Get-SID',
    'Get-SpecialFolder', 'Get-StaticProperty', 'Get-SubnetMaskIPv4',
    'Get-TruncatedDate', 'Get-Type', 'Get-TypeAccelerator', 'Get-Uptime',
    'Get-UrlContent', 'Get-WordCount', 'Get-WordList', 'grep', 'Invoke-Beep',
    'Invoke-Speak', 'Join-Object', 'Lock-Workstation', 'Measure-Char', 'mklink',
    'Move-ToRecycleBin', 'New-Credential', 'New-InputBox', 'New-Popup', 'New-QR',
    'New-RandomPassword', 'New-Screenshot', 'New-Shortcut', 'Read-HostWithDefault',
    'Remove-BlankOrComment', 'Remove-EmptyProperty', 'Remove-QuotesFromCsv',
    'Remove-Trailing', 'Reset-Desktop', 'Resolve-FQDN', 'Resolve-HostName', 'sed',
    'Set-Capslock', 'Set-Display', 'Set-Numlock', 'Set-PrivateProfileComment',
    'Set-PrivateProfileString', 'Set-Scrolllock', 'Set-Speaker', 'Set-Type',
    'Set-WindowStyle', 'Show-AllColor', 'Show-Calendar', 'Show-Color',
    'Show-ColorsWithBackground', 'Show-DaysOfWeek', 'Show-FileAttribute',
    'Show-FsRight', 'Show-Month', 'Show-NamedColor', 'Show-Object',
    'Show-Progress', 'Show-ShortDaysOfWeek', 'Show-ShortMonth',
    'Show-SubnetMaskIPv4', 'Show-Timezone', 'Start-ADReplication',
    'Start-RecordSession', 'Stop-RecordSession', 'Switch-Mute',
    'Test-ConnectionAsync', 'Test-IsAdmin', 'Test-IsCapsLock', 'Test-IsDate',
    'Test-IsFileLocked', 'Test-IsHexString', 'Test-IsNull', 'Test-IsNumeric',
    'Test-IsNumLock', 'Test-IsScrollLock', 'Test-IsValidEmailAddress',
    'Test-IsValidIPv4', 'Test-IsValidIPv6', 'Test-Network', 'Test-NtpDateVsNow',
    'Test-Port', 'Union-Object', 'Update-ExplorerIcon', 'Write-StringArray',
    'Write-TextMenu' )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    #CmdletsToExport = '*'

    # Variables to export from this module
    #VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @( 'Base64Decode', 'Base64Encode', 'Beep',
    'ConvertTo-BinaryIP', 'ConvertTo-DecimalIP', 'ConvertTo-DottedDecimalIP',
    'Fortune', 'Get-LastReboot', 'Get-SubnetMaskIP', 'Md5Sum', 'Parse-Bool',
    'Recycle', 'ReverseString', 'Show-InvalidFileCharacter', 'Show-SpecialFolder',
    'Show-SubnetMaskIP', 'Show-TypeAccelerator', 'Speak', 'Test-IsValidIP',
    'Union', 'UrlDecode', 'UrlEncode', 'WrapText' )

 #>

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @( 'base64', 'beep', 'binaryip', 'calendar', 'capslock', 'color-hex',
            'color-rgb', 'color-show', 'computersite', 'computer-site', 'credential',
            'date-random', 'datetime', 'date-truncate', 'days-week', 'decimalip',
            'display', 'dns-async', 'dotteddecimalip', 'email-address', 'expand-string',
            'expand-tab', 'exponentiation', 'file', 'file-encoding', 'file-invalidchar',
            'folder', 'format', 'functions', 'gui', 'ini', 'inputbox', 'ip', 'iprange',
            'isadmin', 'isdate', 'ishexstring', 'isnumeric', 'isvalidemail', 'isvalidip',
            'library', 'macaddress', 'magic8ball', 'markdown', 'md5sum', 'msgbox',
            'numlock', 'ping-async', 'popup', 'progress', 'random-date', 'registry',
            'reverse-string', 'rot13', 'round', 'savefile', 'scrolllock', 'set-type',
            'share-permission', 'share-stat', 'shortcut', 'sid', 'speak', 'subnetmask',
            'system', 'timezone', 'urlencode', 'utc', 'wrap-text', 'xml' )


            # A URL to the license for this module.
            LicenseUri = 'https://github.com/riedyw/PoshFunctions/blob/master/License.txt'

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/riedyw/PoshFunctions'

            # A URL to an icon representing this module.
            IconUri = 'https://github.com/riedyw/PoshFunctions/blob/master/PoshFunctions.png'

            # ReleaseNotes of this module
            ReleaseNotes = @'
### 2.2.1.6
* updated PoshFunctions.psd1 to explicitly enumerate AliasesToExport
* tested all functions work properly in both PowerShell 5.1 and 7.1.2
* updated all *.ps* to pass Invoke-ScriptAnalyzer without throwing RuleViolation. The only one I could NOT fix is function Union-Object. If you wish this error to not affect you then I would suggest that when you import the module you include the -DisableNameChecking parameter
* updated scripts to attempt to explicit and fully name all parameters and all functions and parameters match the case as found in official Microsoft documentation
* made GitHub repository viewable to the public and updated PoshFunctions.psd1 to reflect the GitHub repository
* updated Compare-ObjectProperty - updated comment help to give better .EXAMPLE
* updated ConvertFrom-DateTime - changed -DateTime parameter to -Date to be more PowerShell-y
* updated Format-MacAddress - change $prop from [hashtable] to ([ordered] [hashtable]) so behavior is consistent between PowerShell.exe and pwsh.exe
* updated ConvertFrom-UTC - added -IncludeInput
* updated ConvertTo-DateTime - changed -IncludeOriginal to -IncludeInput for consistency, aliased to 'IncludeOriginal'
* updated Get-Power - added -IncludeInput
* updated Get-RandomDate - added some examples in comment help, -IncludeInput parameter
* updated Test-IsHexString - added .PARAMETER statements to comment help
* updated Test-IsDate - changed New-Object parameter to match form "-Propery ([ordered] @{...})" so that output matches between PowerShell and pwsh
* updated Test-IsNumeric - changed New-Object parameter to match form "-Propery ([ordered] @{...})" so that output matches between PowerShell and pwsh
* updated sed - added process blocks and Write-Verbose
* updated Get-BashPath - added example in comment help, changed New-Object parameter to match form "-Propery ([ordered] @{...})" so that output matches between PowerShell and pwsh, changed -IncludeOriginal to -IncludeInput to be consistent
* updated Convert-ROT13 - added -IncludeInput parameter, added examples
* updated Convert-ARGBToHex - changed -IncludeOriginal to -IncludeInput to be consistent
* updated Get-ComputerSite - change -IncludeComputerName to -IncludeInput to be consistent
* updated Expand-IPv6 - added code to handle multiple addresses to be expanded, added -IncludeInput
* updated ConvertTo-Bool - changed -IncludeOriginal to -IncludeInput to be consistent
* updated ConvertTo-BinaryIPv4 - changed -IncludeOriginal to -IncludeInput to be consistent
* updated ConvertTo-Base64 - added -IncludeInput
* updated ConvertFrom-Base64 - added -IncludeInput
* updated Expand-String - changed -IncludeOriginal to -IncludeInput to be consistent aliased to 'IncludeOriginal', added to comment help
* updated Get-RandomHexDigit - added begin, process, end blocks, updated comment help
* updated Get-WordCount - updated comment help to more accurately reflect function
* updated New-InputBox - added write-verbose statements
* updated New-Popup - added example in help
* updated Set-Display - corrected example in comment help, corrected example works flawlessly
* removed Help - relied on external tool less.exe which is a port of a Linux tool that is a paginated more.com where you can go forward or backward
* updated ConvertTo-UncPath - added -IncludeInput, additional example
* updated ConvertTo-UrlEncode - changed -IncludeOriginal to -IncludeInput to be consistent and aliased to 'IncludeOriginal'
* updated ConvertFrom-UrlEncode - changed -IncludeOriginal to -IncludeInput to be consistent aliased to 'IncludeOriginal', fixed minor logic error
* updated ConvertTo-DecimalIPv4 - added code to handle multiple addresses to be converted, added -IncludeInput, added example
* updated ConvertTo-DottedDecimalIPv4 - added code to handle multiple addresses to be converted, added -IncludeInput, added example
* updated Show-FileAttribute - added examples
* removed ConvertTo-Markdown - does not function as expected and I never use this function
* updated Format-RandomCase - added -IncludeInput, renamed some variables inside of function, added example
* updated Get-MachineType - added example, changed -ComputerName to [string[]] and added code to handle multiple
* updated Get-NTFSPermission - changed $Path from [string] to [string[]] and function can now handle multiple paths
* removed Get-OperatingSystemSKU - never use this function
* updated Get-Font - added begin, process, end blocks. tightened up code in process block and slightly changed internal variable name
* updated Get-Md5Sum - changed -IncludeFile to -IncludeInput to be consistent and aliased to 'IncludeFile', changed -File to -Path to be more Powershell-y and aliased to 'File', 'FileName'
* updated Get-SID - changed -IncludeOriginal to -IncludeInput to be consistent and aliased to 'IncludeOriginal'
* updated Get-TruncatedDate - changed -IncludeOriginal to -IncludeInput and aliased to 'IncludeOriginal'
* updated Resolve-FQDN - added -IncludeInput, changed -ComputerName to [string[]]
* updated Resolve-HostName - changed -HostName to [string[]], added -IncludeInput, added example
* renamed Get-InvalidFileCharacter from Show-InvalidFileCharacter - added -IncludeValues where decimal and hexadecimal values are included in output, added -Printable where only printable characters (> 32) are in the output, added examples, added alias for function 'Show-InvalidFileCharacter', changed datatype of 'Char' from [char] to [string]
* updated Get-Enum - changed -IncludeType to -IncludeInput aliased to 'IncludeType' fixed minor logic error
* updated Get-Filename - added begin, process, end blocks, added Write-Verbose
* updated Get-Folder - added begin, process, end blocks, added Write-Verbose
* updated Get-SaveFile - changed -InitialDirectory to -Path and aliased to 'InitialDirectory'
* renamed Get-TypeAccelerator from Show-TypeAccelerator - added -MatchString string parameter to show only those that match, here string entries for some type accelerators that don't show up automatically, added $split delimiter depending on Powershell major version number
* updated Test-NTPDateVsNow - added -IncludeInput parameter, -ComputerName no longer mandatory and if left blank uses Get-ADDomainController to determine name of DC, added example
* updated Get-Fortune - added Wisdom.txt to module and default -Path to this file
* updated Get-MacVendor - added write-verbose, updated comment help, removed redundant portion of regex
* renamed Get-SpecialFolder from Show-SpecialFolder - reworked Show-SpecialFolder, added -Name parameter with ValidateSet against it for valid SpecialFolder names and if not specified returns all SpecialFolders, added -IncludeInput to be consistent with other functions, aliased function to 'Show-SpecialFolder' for backward compatibility
* removed Get-Share - use the Get-SMBShare command from SmbShare module
* removed Get-SharePermission - use GetSMBShareAccess command from SmbShare module
* removed Get-ShareStat
* updated Get-SubnetMaskIPv4 - changed -NetworkLength to -Length and aliased to old name, changed -IncludeCIDR to -IncludeInput to be more consistent, changed field name with -IncludeInput
* updated Convert-UserFlag - changed -UserFlag to [int[]], added -IncludeInput to be consistent
* udpated Set-Type - added begin, process, end blocks, updated logic to properly accept input from pipeline and to be handled by both pwsh and Powershell
* removed Get-PoshFunctionsPrivateData - can get the same information by: (Get-Module PoshFunctions).PrivateData
* updated Get-Type - added begin, process, end blocks and write-verbose
* removed Remove-InvalidFileNameChar - not needed can code around it with Get-InvalidFileCharacter
* added ConvertTo-Binary
* added ConvertFrom-Binary
* added ConvertTo-Hex
* added ConvertFrom-Hex
* removed ConvertTo-PlainText - better to use Convert-SecureStringToString
* removed ConvertTo-SecureText
* renamed Get-Uptime from Get-LastReboot - made function more closely mimic Get-Uptime from PowerShell 6 and 7, aliased to Get-LastReboot
* removed Remove-BOMFromFile - can get functionality by using Notepad++
* removed Search-Method - really didn't work
* updated New-Shortcut - fixed logic errors that prevented proper functioning
* updated New-Screenshot - added begin, process, end blocks, added write-verbose
* removed Convert-ARGBToHex - I didn't use any colors with the A attribute, and the function didn't provide flexibility in output
* removed Convert-HexToARGB - I didn't use any colors with the A attribute, and the function didn't provide flexibility in output
* added Convert-RGBToHex - can either accept RGB strings or explicitly specified -Red -Green -Blue parameters, has -IncludeInput and -Prefix parameters
* added Convert-HexToRGB - accepts HEX strings with or without # prefix, has -IncludeInput parameter which will list not only the RGBString but also Red, Green, Blue values, changed to allow for pipeline input and multiple hex strings
* added New-RandomPassword - can specify minimum and maximum password lengths, whether to avoid similar characters or limit the alphabetic characters to short English words
* updated Get-IpRange - changed -Subnets to -Subnet to conform to Powershell standards, aliased to 'Subnets'
* added Test-Network - wrapper for Get-IpRange, Test-ConnectionAsync, and Get-DNSHostEntryAsync to give summary table of ip addresses that either resolve to a host name or respond to a ping
* added Get-GeoCode
* added Get-Address


### 2.2.1.5
* added Release Notes
* added Get-DiceRoll
* added Get-NetworkCredential
* added New-Credential
* added PoshFunctions.png
* added PoshFunctions.xcf
* added ReadMe.html
* added Test-IsNull
* updated Format-RandomCase
* updated Get-PoshFunctionsPrivateData
* updated PoshFunctions.psd1
* updated ReadMe.md

### 2.2.1.4 - Published 9 February 2021
* added Compare-PSGalleryObject
* added Get-PoshFunctionsPrivateData
* added Get-WordList
* added Start-ADReplication
* added Write-StringArray
* added Write-TextMenu - copied from my PSGallery script New-TextMenu
* renamed Words.txt to WordList.txt
* updated Convert-ROT13
* updated ConvertFrom-DateTime
* updated ConvertTo-DateTime
* updated Format-WrapText
* updated Get-DNSHostEntryAsync
* updated Resolve-FQDN
* updated Test-ConnectionAsync

### 2.2.1.3 - Published 16 December 2020
* added Words.txt - list of English words
* added Expand-IPv6
* added Format-RandomCase
* added Get-PrintableAscii
* added Invoke-Beep
* added Measure-Char
* added Test-IsValidIPv6
* updated Convert-ROT13
* updated ConvertTo-DecimalIPv4
* updated ConvertTo-DottedDecimalIPv4
* updated ConvertTo-SecureText
* updated Get-DNSHostEntryAsync
* updated Get-SubnetMaskIPv4
* updated Set-PrivateProfileComment
* updated Show-SubnetMaskIPv4
* updated Test-IsValidIPv4

### 2.2.1.2
* added Docs folder filled with .md files
* added Docs\HTML folder
* updated PSGetModuleInfo.xml
* updated PoshFunctions.psd1
* updated ReadMe.md

### 2.2.1.1
* added Compare-ObjectProperty, Convert-ARGBToHex, Convert-HexToARGB,
    Convert-ObjectToHashtable,  Convert-ROT13, Convert-SecureStringToString,
    Convert-UserFlag, ConvertFrom-Base64, ConvertFrom-DateTime,
    ConvertFrom-FsRight, ConvertFrom-UrlEncode, ConvertFrom-UTC,
    ConvertFrom-Xml, ConvertTo-Base64, ConvertTo-BinaryIPv4, ConvertTo-Bool,
    ConvertTo-DateTime, ConvertTo-DecimalIPv4, ConvertTo-DottedDecimalIPv4,
    ConvertTo-Markdown, ConvertTo-OrderedDictionary, ConvertTo-PlainText,
    ConvertTo-SecureText, ConvertTo-UncPath, ConvertTo-UrlEncode, ConvertTo-UTC,
    Copy-Object, Eexit, Expand-String, Expand-Tab, Export-CSVSortedColumn,
    FileSizeAbove, FileSizeBelow, Format-MacAddress, Format-ReverseString,
    Format-SortedList, Format-WrapText, Get-BashPath, Get-BinaryType,
    Get-ComputerSite, Get-DNSHostEntryAsync, Get-DriveStat, Get-Enum,
    Get-ExecutableForFile, Get-FileEncoding, Get-FileName,
    Get-FileWithLeadingSpace, Get-Folder, Get-Font, Get-Fortune,
    Get-InstalledModuleVersion, Get-IpRange, Get-LastReboot, Get-MachineType,
    Get-MacVendor, Get-Magic8Ball, Get-Md5Sum, Get-NTFSPermission, Get-NtpDate,
    Get-OperatingSystemSKU, Get-Power, Get-PrivateProfileComment,
    Get-PrivateProfileSection, Get-PrivateProfileSectionNames,
    Get-PrivateProfileString, Get-PSWho, Get-RandomDate, Get-RandomHexDigit,
    Get-RandomMacAddress, Get-RegExpandString, Get-RegistryValue, Get-Round,
    Get-SaveFile, Get-Share, Get-SharePermission, Get-ShareStat, Get-Shortcut,
    Get-SID, Get-StaticProperty, Get-SubnetMaskIPv4, Get-TruncatedDate, Get-Type,
    Get-UrlContent, Get-WordCount, grep, Help, Invoke-Speak, Join-Object,
    Lock-Workstation, mklink, Move-ToRecycleBin, New-InputBox, New-Popup,
    New-QR, New-Screenshot, New-Shortcut, Read-HostWithDefault,
    Remove-BlankOrComment, Remove-BOMFromFile, Remove-EmptyProperty,
    Remove-InvalidFileNameChar, Remove-QuotesFromCsv, Remove-Trailing,
    Reset-Desktop, Resolve-FQDN, Resolve-HostName, Search-Method, sed,
    Set-Capslock, Set-Display, Set-Numlock, Set-PrivateProfileComment,
    Set-PrivateProfileString, Set-Scrolllock, Set-Speaker, Set-Type,
    Set-WindowStyle, Show-AllColor, Show-Calendar, Show-Color,
    Show-ColorsWithBackground, Show-DaysOfWeek, Show-FileAttribute,
    Show-FsRight, Show-InvalidFileCharacter, Show-Month, Show-NamedColor,
    Show-Object, Show-Progress, Show-ShortDaysOfWeek, Show-ShortMonth,
    Show-SpecialFolder, Show-SubnetMaskIPv4, Show-Timezone, Show-TypeAccelerator,
    Start-RecordSession, Stop-RecordSession, Switch-Mute, Test-ConnectionAsync,
    Test-IsAdmin, Test-IsCapsLock, Test-IsDate, Test-IsFileLocked,
    Test-IsHexString, Test-IsNumeric, Test-IsNumLock, Test-IsScrollLock,
    Test-IsValidEmailAddress, Test-IsValidIPv4, Test-NtpDateVsNow, Test-Port,
    Union-Object, Update-ExplorerIcon
'@

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
