@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'PoshFunctions.psm1'

    # Version number of this module.
    ModuleVersion     = '2.2.10'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID              = '188504d6-d6ed-4ee3-92c4-7b426ed3d611'

    # Author of this module
    Author            = 'Bill Riedy'

    # Company or vendor of this module
    CompanyName       = ''

    # Copyright statement for this module
    Copyright         = '(c) 2022 Bill Riedy. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'A curated collection of over 215 PowerShell functions. Many functions written by me. Others are attributed wherever possible.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.0'

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
    # Recreated by running the following from PS prompt in PoshFunctions folder
    # dir .\Functions\*.ps1 | select -expand basename | Write-StringArray -VariableName FunctionsToExport -ExcludeDollarSign | Format-WrapText -Width 80 | set-clipboard

    FunctionsToExport = @( 'Compare-ObjectProperty', 'Compare-ObjectSetComplement',
        'Compare-ObjectSetDifference', 'Compare-ObjectSetIntersection',
        'Compare-ObjectSetUnion', 'Compare-PSGalleryObject', 'Convert-HexToRGB',
        'Convert-Int32ToUint32', 'Convert-Int64ToText', 'Convert-ObjectToHashtable',
        'Convert-RGBToHex', 'Convert-SecureStringToString', 'Convert-UserFlag',
        'ConvertFrom-Base64', 'ConvertFrom-Binary', 'ConvertFrom-DateTime',
        'ConvertFrom-FsRight', 'ConvertFrom-Hex', 'ConvertFrom-HexString',
        'ConvertFrom-HtmlEncode', 'ConvertFrom-RomanNumeral', 'ConvertFrom-UrlEncode',
        'ConvertFrom-UTC', 'ConvertFrom-Xml', 'ConvertTo-Base64', 'ConvertTo-Binary',
        'ConvertTo-BinaryIPv4', 'ConvertTo-Bool', 'ConvertTo-DateTime',
        'ConvertTo-DecimalIPv4', 'ConvertTo-DottedDecimalIPv4', 'ConvertTo-Hex',
        'ConvertTo-HexString', 'ConvertTo-HtmlEncode', 'ConvertTo-OrderedDictionary',
        'ConvertTo-RomanNumeral', 'ConvertTo-UncPath', 'ConvertTo-UrlEncode',
        'ConvertTo-UTC', 'Copy-Object', 'Eexit', 'Expand-IPv6', 'Expand-String',
        'Expand-Tab', 'Export-CSVSortedColumn', 'Export-FontSample', 'FileSizeAbove',
        'FileSizeBelow', 'Format-MacAddress', 'Format-RandomCase',
        'Format-ReverseString', 'Format-ReverseToken', 'Format-SortedList',
        'Format-TitleCase', 'Format-WrapText', 'Get-ArpTable', 'Get-Assoc',
        'Get-BashPath', 'Get-BinaryType', 'Get-CeasarCipher', 'Get-ComputerSite',
        'Get-ComputerUptime', 'Get-DiceRoll', 'Get-DiskType', 'Get-DisplayBrightness',
        'Get-DNSHostEntryAsync', 'Get-DriveStat', 'Get-DuplicateFileName', 'Get-Enum',
        'Get-ErrorInfo', 'Get-ExecutableForFile', 'Get-Factorial', 'Get-FileEncoding',
        'Get-FileName', 'Get-FileSizeOnDisk', 'Get-FileWithLeadingSpace',
        'Get-FolderName', 'Get-Font', 'Get-Fortune', 'Get-Ftype',
        'Get-InvalidFileCharacter', 'Get-IpRange', 'Get-IpV4Network',
        'Get-LastDayInMonth', 'Get-List', 'Get-LongName', 'Get-MachineType',
        'Get-MacVendor', 'Get-Magic8Ball', 'Get-Md5Sum', 'Get-MyLocalLogonTime',
        'Get-NetworkCredential', 'Get-NTFSPermission', 'Get-NtpDate', 'Get-Power',
        'Get-PrintableAscii', 'Get-PrivateProfileComment', 'Get-PrivateProfileSection',
        'Get-PrivateProfileSectionNames', 'Get-PrivateProfileString',
        'Get-ProcessUser', 'Get-PSWho', 'Get-RandomDate', 'Get-RandomHexDigit',
        'Get-RandomMacAddress', 'Get-RegExpandString', 'Get-RegistryValue',
        'Get-RelativePath', 'Get-Round', 'Get-SaveFileName', 'Get-ScheduledTaskUser',
        'Get-ServiceUser', 'Get-Shortcut', 'Get-ShortName', 'Get-SID',
        'Get-SpecialFolder', 'Get-SqlDatabase', 'Get-SqlIndexFragmentation',
        'Get-SqlStoredProcedure', 'Get-StaticProperty', 'Get-String',
        'Get-SubnetMaskIPv4', 'Get-TruncatedDate', 'Get-Type', 'Get-TypeAccelerator',
        'Get-UrlContent', 'Get-VssAdminListVolumes', 'Get-VssAdminListWriters',
        'Get-WordCount', 'Get-WordList', 'grep', 'Invoke-Beep',
        'Invoke-CountdownTimer', 'Invoke-SoundPlayer', 'Invoke-Speak', 'Join-Object',
        'Lock-Workstation', 'Measure-Char', 'Merge-Object', 'mklink',
        'Move-ToRecycleBin', 'New-ColorPicker', 'New-Credential', 'New-DatePicker',
        'New-FontPicker', 'New-InputBox', 'New-InputBoxSecureString', 'New-MessageBox',
        'New-PFDateFormat', 'New-QR', 'New-RandomPassword', 'New-Screenshot',
        'New-Shortcut', 'Optimize-SqlIndexFragmentation',
        'Optimize-SqlStoredProcedure', 'Out-PDFToPrinter', 'Read-HostWithDefault',
        'Remove-BlankOrComment', 'Remove-EmptyProperty', 'Remove-QuotesFromCsv',
        'Remove-TeamsCache', 'Remove-Trailing', 'Reset-Desktop', 'Resolve-FQDN',
        'Resolve-HostName', 'sed', 'Set-Capslock', 'Set-Display', 'Set-Numlock',
        'Set-PrivateProfileComment', 'Set-PrivateProfileString', 'Set-Scrolllock',
        'Set-SpeakerVolume', 'Set-Type', 'Set-WindowState', 'Set-WindowStyle',
        'Show-AllColor', 'Show-Calendar', 'Show-Color', 'Show-ColorsWithBackground',
        'Show-DaysOfWeek', 'Show-FileAttribute', 'Show-FsRight', 'Show-Month',
        'Show-NamedColor', 'Show-Object', 'Show-Progress', 'Show-ShortDaysOfWeek',
        'Show-ShortMonth', 'Show-SubnetMaskIPv4', 'Show-Timezone',
        'Split-CanonicalName', 'Split-DistinguishedName', 'Split-Line',
        'Start-ADReplication', 'Start-RecordSession', 'Stop-RecordSession',
        'Switch-Mute', 'Test-ConnectionAsync', 'Test-CSVFormat', 'Test-IsAdmin',
        'Test-IsCapsLock', 'Test-IsDate', 'Test-IsFileLocked', 'Test-IsHexString',
        'Test-IsLocalIPv4', 'Test-IsNull', 'Test-IsNumeric', 'Test-IsNumLock',
        'Test-IsScrollLock', 'Test-IsValidEmailAddress', 'Test-IsValidIPv4',
        'Test-IsValidIPv6', 'Test-MultipleBool', 'Test-Network', 'Test-NtpDateVsNow',
        'Test-Password', 'Test-PasswordComplexity', 'Test-Port', 'Test-Set',
        'Update-ExplorerIcon', 'Use-Stopwatch', 'Write-SelectStatement',
        'Write-StringArray', 'Write-StringHash', 'Write-TextMenu' )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    #CmdletsToExport = '*'

    # Variables to export from this module
    #VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    # AliasesToExport   = '*'

    AliasesToExport   = @( 'Base64Decode', 'Base64Encode', 'Beep',
        'Convert-IntToText', 'Convert-ROT13', 'ConvertTo-BinaryIP',
        'ConvertTo-DecimalIP', 'ConvertTo-DottedDecimalIP', 'CountdownTimer',
        'Fortune', 'Get-DupeFileName', 'Get-Folder', 'Get-LastReboot', 'Get-SaveFile',
        'Get-SubnetMaskIP', 'Md5Sum', 'Parse-Bool', 'Recycle', 'ReverseString',
        'Set-Speaker', 'Show-InvalidFileCharacter', 'Show-SpecialFolder',
        'Show-SubnetMaskIP', 'Show-TypeAccelerator', 'Speak', 'Test-IsLocalIP',
        'Test-IsValidIP', 'Test-MultiBool', 'UrlDecode', 'UrlEncode', 'WrapText' )

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
            Tags         = @( 'base64', 'beep', 'binaryip', 'calendar', 'capslock', 'color-hex',
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
            LicenseUri   = 'https://github.com/riedyw/PoshFunctions/blob/master/Resources/License.txt'

            # A URL to the main website for this project.
            ProjectUri   = 'https://github.com/riedyw/PoshFunctions'

            # A URL to an icon representing this module.
            IconUri      = 'https://github.com/riedyw/PoshFunctions/blob/master/Resources/PoshFunctions.png'

            # ReleaseNotes of this module
            ReleaseNotes = @'
For full release notes see .\Resources\ReleaseNotes.txt
### 2.2.10
* added Get-DiskType - returns the type of disk and type of bus for a given computer(s) local disk(s)
* added Get-FileSizeOnDisk - returns actual disk usage when NTFS compression is enabled for file(s)
* added Get-IpV4Network - to determine network given IP address and subnet mask
* added Set-WindowState - to minimize/maximize a window
* added Test-CSVFormat - determine if number of fields match header row
* updated Get-CaesarCipher - to allow negative rotation
* updated Get-SqlIndexFragmentation - fixed ???
* updated Invoke-Beep - fixed ???
* updated Get-PrivateProfileSection - fixed error when ini value contains a backslash '\'

### 2.2.9
* added ConvertFrom-HexString - converting a hex string back to plain text: '41' -> 'A'
* added ConvertTo-HexString = converting plain text to a hex string: 'A' -> '41'
* added Get-ErrorInfo - explain please
* added Get-Factorial - calculates the factorial of a number 1-20. Higher than 20 results in overflow of [int64] datatype
* added Invoke-SoundPlayer - will play a .wav file
* added Split-CanonicalName - splits an AD canonical name into either -Parent or -Leaf
* added Split-DistinguishedName - splits an AD distinguished name into either -Parent or -Leaf
* added Write-SelectStatement - helper function to write a select statement for properties and converts properties that are arrays to a delimited string. Helpful when exporting complex object to CSV
* updated Compare-ObjectProperty - replaced += with [System.Collections.Arraylist]
* updated Convert-Int32ToUint32 - replaced += with [System.Collections.Arraylist]
* updated Convert-Int64ToText - fixed trailing space with .Trim()
* updated ConvertFrom-FsRight - removed $MatchFound | Out-Null, replaced += with [System.Collections.Arraylist], fixed logic error with Combo rights and IncludeInput
* updated Copy-Object - replaced += with [System.Collections.Arraylist]
* updated Expand-IPv6 - replaced += with [System.Collections.Arraylist]
* updated Export-FontSample - replaced += with [System.Collections.Arraylist]
* updated Format-RandomCase - replaced += with [System.Collections.Arraylist]
* updated Format-WrapText - replaced += with [System.Collections.Arraylist]
* updated Get-CeasarCipher - replaced += with [System.Collections.Arraylist]
* updated Get-ComputerUptime - added Credential
* updated Get-DisplayBrightness - added Credential, fixed error if not running on laptop monitor
* updated Get-Enum - replaced += with [System.Collections.Arraylist]
* updated Get-Font - minor logic fix in Where-Object statement that previously returned no results
* updated Get-IpRange - replaced += with [System.Collections.Arraylist]
* updated Get-MachineType - added Credential
* updated Get-MacVendor - replaced Invoke-RestMethod with curl.exe as it was no longer returning correct results
* updated Get-NTFSPermission - replaced += with [System.Collections.Arraylist]
* updated Get-NtpDate - replace piping to Out-Null to $null =
* updated Get-PSWho - added Credential
* updated Get-PrintableAscii - updated logic to replace ' ' with '(Space)'
* updated Get-PrivateProfileString - replace piping to Out-Null to $null =
* updated Get-ProcessUser - added Credential
* updated Get-ScheduledTaskUser - replaced += with [System.Collections.Arraylist], added Credential
* updated Get-ServiceUser - replaced += with [System.Collections.Arraylist], added Credential
* updated Get-SqlDatabase - replaced += with [System.Collections.Arraylist]
* updated Get-SqlStoredProcedure - replaced += with [System.Collections.Arraylist]
* updated Get-Type - replaced += with [System.Collections.Arraylist]
* updated Get-TypeAccelerator - replaced += with [System.Collections.Arraylist]
* updated Invoke-Speak - replaced += with [System.Collections.Arraylist]
* updated Measure-Char - replaced += with [System.Collections.Arraylist]
* updated Merge-Object - replaced += with [System.Collections.Arraylist]
* updated New-Shortcut - replace piping to Out-Null to $null =
* updated Optimize-SQLIndexFragmentation - replace piping to Out-Null to $null =
* updated Optimize-SQLStoredProcedure - replace piping to Out-Null to $null =
* updated Set-Display - added Credential
* updated Set-PrivateProfileComment - replaced += with [System.Collections.Arraylist]
* updated Set-WindowStyle - replace piping to Out-Null to $null =
* updated Show-Calendar - replaced += with [System.Collections.Arraylist]
* updated Show-FsRight - replaced += with [System.Collections.Arraylist]
* updated Show-NamedColor - replaced += with [System.Collections.Arraylist]
* updated Show-Object - replaced += with [System.Collections.Arraylist]
* updated Show-Progress - replaced += with [System.Collections.Arraylist]
* updated Start-ADReplication - added Credential
* updated Start-RecordSession - replace piping to Out-Null to $null =
* updated Test-IsDate - removed [DateTime] $d | Out-Null
* updated Test-IsNumeric - replaced piping to Out-Null with saving to a variable
* updated Test-MultipleBool - replaced += with [System.Collections.Arraylist]
* updated Test-Password - added Credential
* updated Write-StringArray - replaced += with [System.Collections.Arraylist]
* updated Write-StringHash - changed type of -Hash and error check for hashtable or arraylist
* updated Write-StringHash - replaced += with [System.Collections.Arraylist]
* updated Write-TextMenu - replaced += with [System.Collections.Arraylist]

### 2.2.8
* created .\Resources folder and moved files from the root of the modules excluding: PoshFunctions.psd1, PoshFunctions.psm1, ReadMe.md
* added additional word list file that contains over 370,000 entries for more English words
* added Convert-Int64ToText - Take an integer value and convert to English text. Valid range +/- 999,999,999,999.
* added ConvertFrom-RomanNumeral - Converts a roman numeral to a number
* added ConvertTo-RomanNumeral - Converts a number to a Roman numeral
* added Get-ArpTable - takes output from 'arp.exe -a' and parses output into objects
* added Get-Assoc - Displays file extension associations
* added Get-Ftype - Displays file types used in file extension associations
* added Get-VssAdminListVolumes - takes output from 'vssadmin.exe list volumes' and parses output into objects
* added Get-VssAdminListWriters - takes output from 'vssadmin.exe list writers' and parses output into objects
* added New-PFDateFormat - which represents a [datetime] in multiple formats
* added Test-IsLocalIPv4 - which determines if target IP address is local or remote (routed through default gateway) given the ip addresses and subnet mask
* deleted Get-Address - REST API at website no longer works
* deleted Get-GeoCode - REST API at website no longer works
* updated Convert-HexToRGB - changed 'return' to 'break' in error condition
* updated ConvertFrom-Datetime - added -ISO8601 parameter
* updated ConvertFrom-FSRight - added -IncludeInput parameter, added support for array of input
* updated ConvertTo-Datetime - added -ISO8601 parameter
* updated Expand-String - changed class name from 'ExtractData' to 'PFExtractData' to prevent conflict
* updated Get-BinaryType - changed namespace from 'Win32Utils' to 'PFWin32Utils' to prevent conflict
* updated Get-ExecutableForFile - changed class name from 'Win32API' to 'PFWin32API' to prevent conflict, changed name of internal variable
* updated Get-LongName - added -LiteralPath for explictly named paths (no wildcards), proper handling of multiple paths with wildcards
* updated Get-MacVendor - changed [ValidatePattern] to logic within function to clean up improperly formatted mac addresses, display MacAddress then Vendor
* updated Get-NTFSPermission - changed 'return' to 'break' in error condition
* updated Get-PrintableAscii - added 'Q' to similar characters regex
* updated Get-RandomDate - changed 'return' to 'break' in error condition
* updated Get-SQLDatabase - changed 'return' to 'break' in error condition
* updated Get-SQLIndexFragmentation - changed 'return' to 'break' in error condition
* updated Get-SQLStoredProcedure - changed 'return' to 'break' in error condition
* updated Get-ShortName - added -LiteralPath for explictly named paths (no wildcards), proper handling of multiple paths with wildcards
* updated Get-UrlContent - changed 'return' to 'break' in error condition
* updated Get-WordCount - function would throw errors if it encountered PowerShell keywords, implemented work around
* updated Get-Wordlist - added -Full to use longer > 370,000 word list resource, moved word list file to .\Resources
* updated New-ColorPicker - to reflect its icon file moving to .\Resources
* updated New-DatePicker - to reflect its icon file moving to .\Resources
* updated New-FontPicker - to reflect its icon file moving to .\Resources
* updated New-InputBoxSecureString - to reflect its icon file moving to .\Resources, changed 'return' to 'break' in error condition
* updated New-RandomPassword - added -FullWordlist to use longer wordlist file. Added 'Q' to similar regex
* updated New-Screenshot - changed 'return' to 'break' in error condition
* updated Optimize-SQLIndexFragmentation - changed 'return' to 'break' in error condition
* updated Optimize-SQLStoredProcedure - changed 'return' to 'break' in error condition
* updated Remove-TeamsCache - changed 'return' to 'break' in error condition
* updated Set-Display - changed class name from 'API' to 'PFAPI' to prevent conflict, changed name of internal variable
* updated Set-SpeakerVolume - added -Adjust parameter so you can adjust volume up or down
* updated Start-AdReplication - changed hard coded -ThrottleLimit from 8 to [environment]::ProcessorCount so that it determines number of processors on the fly
* updated Test-PasswordComplexity - removed dependency on Get-PrintableAscii
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
