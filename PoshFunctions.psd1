@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'PoshFunctions.psm1'

    # Version number of this module.
    ModuleVersion     = '2.2.2'

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

    FunctionsToExport = @('Compare-ObjectProperty', 'Compare-PSGalleryObject',
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
    'Format-ReverseToken', 'Format-SortedList', 'Format-TitleCase',
    'Format-WrapText', 'Get-Address', 'Get-BashPath', 'Get-BinaryType',
    'Get-ComputerSite', 'Get-ComputerUptime', 'Get-DiceRoll',
    'Get-DNSHostEntryAsync', 'Get-DriveStat', 'Get-Enum', 'Get-ExecutableForFile',
    'Get-FileEncoding', 'Get-FileName', 'Get-FileWithLeadingSpace',
    'Get-FolderName', 'Get-Font', 'Get-Fortune', 'Get-GeoCode',
    'Get-InvalidFileCharacter', 'Get-IpRange', 'Get-LastDayInMonth',
    'Get-LongName', 'Get-MachineType', 'Get-MacVendor', 'Get-Magic8Ball',
    'Get-Md5Sum', 'Get-NetworkCredential', 'Get-NTFSPermission', 'Get-NtpDate',
    'Get-Power', 'Get-PrintableAscii', 'Get-PrivateProfileComment',
    'Get-PrivateProfileSection', 'Get-PrivateProfileSectionNames',
    'Get-PrivateProfileString', 'Get-PSWho', 'Get-RandomDate',
    'Get-RandomHexDigit', 'Get-RandomMacAddress', 'Get-RegExpandString',
    'Get-RegistryValue', 'Get-Round', 'Get-SaveFileName', 'Get-Shortcut',
    'Get-ShortName', 'Get-SID', 'Get-SpecialFolder', 'Get-StaticProperty',
    'Get-SubnetMaskIPv4', 'Get-TruncatedDate', 'Get-Type', 'Get-TypeAccelerator',
    'Get-UrlContent', 'Get-WordCount', 'Get-WordList', 'grep', 'Invoke-Beep',
    'Invoke-CountdownTimer', 'Invoke-Speak', 'Join-Object', 'Lock-Workstation',
    'Measure-Char', 'mklink', 'Move-ToRecycleBin', 'New-Credential',
    'New-InputBox', 'New-InputBoxSecureString', 'New-Popup', 'New-QR',
    'New-RandomPassword', 'New-Screenshot', 'New-Shortcut', 'Out-PDFToPrinter',
    'Read-HostWithDefault', 'Remove-BlankOrComment', 'Remove-EmptyProperty',
    'Remove-QuotesFromCsv', 'Remove-TeamsCache', 'Remove-Trailing',
    'Reset-Desktop', 'Resolve-FQDN', 'Resolve-HostName', 'sed', 'Set-Capslock',
    'Set-Display', 'Set-Numlock', 'Set-PrivateProfileComment',
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
    'Test-Password', 'Test-Port', 'Union-Object', 'Update-ExplorerIcon',
    'Write-StringArray', 'Write-TextMenu')

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    #CmdletsToExport = '*'

    # Variables to export from this module
    #VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    # AliasesToExport = '*'

    AliasesToExport = @('Base64Decode', 'Base64Encode', 'Beep',
    'ConvertTo-BinaryIP', 'ConvertTo-DecimalIP', 'ConvertTo-DottedDecimalIP',
    'CountdownTimer', 'Fortune', 'Get-Folder', 'Get-LastReboot', 'Get-SaveFile',
    'Get-SubnetMaskIP', 'Md5Sum', 'Parse-Bool', 'Recycle', 'ReverseString',
    'Show-InvalidFileCharacter', 'Show-SpecialFolder', 'Show-SubnetMaskIP',
    'Show-TypeAccelerator', 'Speak', 'Test-IsValidIP', 'Union', 'UrlDecode',
    'UrlEncode', 'WrapText')

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
For full release notes see ReleaseNotes.txt

### 2.2.2
* Changed to SemVer versioning, 3 positions Major#.Minor#.Build#
* added New-InputBoxSecureString which will prompt for value and return a secure string. Can optionally verify input, and specify labels for input box(es)
* renamed Get-FolderName from Get-Folder to not conflict with Vmware module. Aliased to Get-Folder for backward compatibility
* renamed Get-SaveFileName from Get-SaveFile to be more consistent across file/folder functions. Aliased to Get-SaveFile for backward compatibility
* added Format-ReverseToken to take a tokenized string like 'monster.google.com' and convert it to 'com.google.monster'
* added Invoke-CountdownTimer to implement a count down timer. Accurate to within 1-2 seconds

### 2.2.1.6
* updated PoshFunctions.psd1 to explicitly enumerate AliasesToExport
* tested all functions work properly in both PowerShell 5.1 and 7.1.2
* updated all *.ps* to pass Invoke-ScriptAnalyzer without throwing RuleViolation. The only one I could NOT fix is function Union-Object. If you wish this error to not affect you then I would suggest that when you import the module you include the -DisableNameChecking parameter
* updated scripts to attempt to explicit and fully name all parameters and all functions and parameters match the case as found in official Microsoft documentation
* made GitHub repository viewable to the public and updated PoshFunctions.psd1 to reflect the GitHub repository
* 16 ADDITIONS
* added Convert-HexToRGB
* added Convert-RGBToHex
* added ConvertFrom-Binary
* added ConvertFrom-Hex
* added ConvertTo-Binary
* added ConvertTo-Hex
* added Format-TitleCase
* added Get-Address
* added Get-GeoCode
* added Get-LastDayInMonth
* added Get-LongName
* added Get-ShortName
* added New-RandomPassword
* added Out-PrinterPDF
* added Test-Network
* added Test-Password
* 15 REMOVED
* removed Convert-ARGBToHex
* removed Convert-HexToARGB
* removed ConvertTo-Markdown
* removed ConvertTo-PlainText
* removed ConvertTo-SecureText
* removed Get-OperatingSystemSKU
* removed Get-PoshFunctionsPrivateData
* removed Get-Share
* removed Get-SharePermission
* removed Get-ShareStat
* removed Help
* removed Remove-BOMFromFile
* removed Remove-InvalidFileNameChar
* removed Search-Method
* 4 RENAMED
* renamed Get-InvalidFileCharacter from Show-InvalidFileCharacter
* renamed Get-SpecialFolder from Show-SpecialFolder
* renamed Get-TypeAccelerator from Show-TypeAccelerator
* renamed Get-ComputerUptime from Get-LastReboot
* 55 UPDATED
* udpated Set-Type
* updated Compare-ObjectProperty
* updated Convert-ROT13
* updated Convert-UserFlag
* updated ConvertFrom-Base64
* updated ConvertFrom-DateTime
* updated ConvertFrom-UTC
* updated ConvertFrom-UrlEncode
* updated ConvertTo-Base64
* updated ConvertTo-BinaryIPv4
* updated ConvertTo-Bool
* updated ConvertTo-DateTime
* updated ConvertTo-DecimalIPv4
* updated ConvertTo-DottedDecimalIPv4
* updated ConvertTo-UncPath
* updated ConvertTo-UrlEncode
* updated Expand-IPv6
* updated Expand-String
* updated Format-MacAddress
* updated Format-RandomCase
* updated Get-BashPath
* updated Get-ComputerSite
* updated Get-Enum
* updated Get-Filename
* updated Get-Folder
* updated Get-Font
* updated Get-Fortune
* updated Get-IpRange
* updated Get-MacVendor
* updated Get-MachineType
* updated Get-Md5Sum
* updated Get-NTFSPermission
* updated Get-Power
* updated Get-RandomDate
* updated Get-RandomHexDigit
* updated Get-SID
* updated Get-SaveFile
* updated Get-SubnetMaskIPv4
* updated Get-TruncatedDate
* updated Get-Type
* updated Get-WordCount
* updated New-InputBox
* updated New-Popup
* updated New-Screenshot
* updated New-Shortcut
* updated Resolve-FQDN
* updated Resolve-HostName
* updated Set-Display
* updated Show-FileAttribute
* updated Test-IsDate
* updated Test-IsHexString
* updated Test-IsNumeric
* updated Test-NTPDateVsNow
* updated sed
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
