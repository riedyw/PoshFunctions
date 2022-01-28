@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'PoshFunctions.psm1'

    # Version number of this module.
    ModuleVersion     = '2.2.8'

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
    Description       = 'A curated collection of over 200 PowerShell functions. Many functions written by me. Others are attributed wherever possible.'

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

    FunctionsToExport = @( 'Compare-ObjectProperty', 'Compare-ObjectSetComplement',
        'Compare-ObjectSetDifference', 'Compare-ObjectSetIntersection',
        'Compare-ObjectSetUnion', 'Compare-PSGalleryObject', 'Convert-HexToRGB',
        'Convert-Int32ToUint32', 'Convert-Int64ToText', 'Convert-ObjectToHashtable',
        'Convert-RGBToHex', 'Convert-SecureStringToString', 'Convert-UserFlag',
        'ConvertFrom-Base64', 'ConvertFrom-Binary', 'ConvertFrom-DateTime',
        'ConvertFrom-FsRight', 'ConvertFrom-Hex', 'ConvertFrom-HtmlEncode',
        'ConvertFrom-UrlEncode', 'ConvertFrom-UTC', 'ConvertFrom-Xml',
        'ConvertTo-Base64', 'ConvertTo-Binary', 'ConvertTo-BinaryIPv4',
        'ConvertTo-Bool', 'ConvertTo-DateTime', 'ConvertTo-DecimalIPv4',
        'ConvertTo-DottedDecimalIPv4', 'ConvertTo-Hex', 'ConvertTo-HtmlEncode',
        'ConvertTo-OrderedDictionary', 'ConvertTo-UncPath', 'ConvertTo-UrlEncode',
        'ConvertTo-UTC', 'Copy-Object', 'Eexit', 'Expand-IPv6', 'Expand-String',
        'Expand-Tab', 'Export-CSVSortedColumn', 'Export-FontSample', 'FileSizeAbove',
        'FileSizeBelow', 'Format-MacAddress', 'Format-RandomCase',
        'Format-ReverseString', 'Format-ReverseToken', 'Format-SortedList',
        'Format-TitleCase', 'Format-WrapText', 'Get-ArpTable', 'Get-BashPath',
        'Get-BinaryType', 'Get-CeasarCipher', 'Get-ComputerSite', 'Get-ComputerUptime',
        'Get-DiceRoll', 'Get-DisplayBrightness', 'Get-DNSHostEntryAsync',
        'Get-DriveStat', 'Get-DuplicateFileName', 'Get-Enum', 'Get-ExecutableForFile',
        'Get-FileEncoding', 'Get-FileName', 'Get-FileWithLeadingSpace',
        'Get-FolderName', 'Get-Font', 'Get-Fortune', 'Get-InvalidFileCharacter',
        'Get-IpRange', 'Get-LastDayInMonth', 'Get-List', 'Get-LongName',
        'Get-MachineType', 'Get-MacVendor', 'Get-Magic8Ball', 'Get-Md5Sum',
        'Get-MyLocalLogonTime', 'Get-NetworkCredential', 'Get-NTFSPermission',
        'Get-NtpDate', 'Get-Power', 'Get-PrintableAscii', 'Get-PrivateProfileComment',
        'Get-PrivateProfileSection', 'Get-PrivateProfileSectionNames',
        'Get-PrivateProfileString', 'Get-ProcessUser', 'Get-PSWho', 'Get-RandomDate',
        'Get-RandomHexDigit', 'Get-RandomMacAddress', 'Get-RegExpandString',
        'Get-RegistryValue', 'Get-RelativePath', 'Get-Round', 'Get-SaveFileName',
        'Get-ScheduledTaskUser', 'Get-ServiceUser', 'Get-Shortcut', 'Get-ShortName',
        'Get-SID', 'Get-SpecialFolder', 'Get-SqlDatabase', 'Get-SqlIndexFragmentation',
        'Get-SqlStoredProcedure', 'Get-StaticProperty', 'Get-String',
        'Get-SubnetMaskIPv4', 'Get-TruncatedDate', 'Get-Type', 'Get-TypeAccelerator',
        'Get-UrlContent', 'Get-VssAdminListVolumes', 'Get-VssAdminListWriters',
        'Get-WordCount', 'Get-WordList', 'grep', 'Invoke-Beep',
        'Invoke-CountdownTimer', 'Invoke-Speak', 'Join-Object', 'Lock-Workstation',
        'Measure-Char', 'Merge-Object', 'mklink', 'Move-ToRecycleBin',
        'New-ColorPicker', 'New-Credential', 'New-DatePicker', 'New-FontPicker',
        'New-InputBox', 'New-InputBoxSecureString', 'New-MessageBox',
        'New-PFDateFormat', 'New-QR', 'New-RandomPassword', 'New-Screenshot',
        'New-Shortcut', 'Optimize-SqlIndexFragmentation',
        'Optimize-SqlStoredProcedure', 'Out-PDFToPrinter', 'Read-HostWithDefault',
        'Remove-BlankOrComment', 'Remove-EmptyProperty', 'Remove-QuotesFromCsv',
        'Remove-TeamsCache', 'Remove-Trailing', 'Reset-Desktop', 'Resolve-FQDN',
        'Resolve-HostName', 'sed', 'Set-Capslock', 'Set-Display', 'Set-Numlock',
        'Set-PrivateProfileComment', 'Set-PrivateProfileString', 'Set-Scrolllock',
        'Set-SpeakerVolume', 'Set-Type', 'Set-WindowStyle', 'Show-AllColor',
        'Show-Color', 'Show-ColorsWithBackground', 'Show-DaysOfWeek',
        'Show-FileAttribute', 'Show-FsRight', 'Show-Month', 'Show-NamedColor',
        'Show-Object', 'Show-Progress', 'Show-ShortDaysOfWeek', 'Show-ShortMonth',
        'Show-SubnetMaskIPv4', 'Show-Timezone', 'Split-Line', 'Start-ADReplication',
        'Start-RecordSession', 'Stop-RecordSession', 'Switch-Mute',
        'Test-ConnectionAsync', 'Test-IsAdmin', 'Test-IsCapsLock', 'Test-IsDate',
        'Test-IsFileLocked', 'Test-IsHexString', 'Test-IsNull', 'Test-IsNumeric',
        'Test-IsNumLock', 'Test-IsScrollLock', 'Test-IsValidEmailAddress',
        'Test-IsValidIPv4', 'Test-IsValidIPv6', 'Test-MultipleBool', 'Test-Network',
        'Test-NtpDateVsNow', 'Test-Password', 'Test-PasswordComplexity', 'Test-Port',
        'Test-Set', 'Update-ExplorerIcon', 'Use-Stopwatch', 'Write-StringArray',
        'Write-StringHash', 'Write-TextMenu' )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    #CmdletsToExport = '*'

    # Variables to export from this module
    #VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    # AliasesToExport = '*'

    AliasesToExport   = @( 'Base64Decode', 'Base64Encode', 'Beep',
        'Convert-IntToText', 'Convert-ROT13', 'ConvertTo-BinaryIP',
        'ConvertTo-DecimalIP', 'ConvertTo-DottedDecimalIP', 'CountdownTimer',
        'Fortune', 'Get-DupeFileName', 'Get-Folder', 'Get-LastReboot', 'Get-SaveFile',
        'Get-SubnetMaskIP', 'Md5Sum', 'Parse-Bool', 'Recycle', 'ReverseString',
        'Set-Speaker', 'Show-InvalidFileCharacter', 'Show-SpecialFolder',
        'Show-SubnetMaskIP', 'Show-TypeAccelerator', 'Speak', 'Test-IsValidIP',
        'Test-MultiBool', 'UrlDecode', 'UrlEncode', 'WrapText' )

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
            LicenseUri   = 'https://github.com/riedyw/PoshFunctions/blob/master/License.txt'

            # A URL to the main website for this project.
            ProjectUri   = 'https://github.com/riedyw/PoshFunctions'

            # A URL to an icon representing this module.
            IconUri      = 'https://github.com/riedyw/PoshFunctions/blob/master/PoshFunctions.png'

            # ReleaseNotes of this module
            ReleaseNotes = @'
For full release notes see .\Resources\ReleaseNotes.txt
### 2.2.8
* created .\Resources folder and moved files from the root of the modules excluding: PoshFunctions.psd1, PoshFunctions.psm1, ReadMe.md
* added additional word list file that contains over 370,000 entries for more English words
* added Convert-Int64ToText - Take an integer value and convert to English text. Valid range +/- 999,999,999,999.
* added Get-ArpTable - takes output from 'arp.exe -a' and parses output into objects
* added Get-VssAdminListVolumes - takes output from 'vssadmin.exe list volumes' and parses output into objects
* added Get-VssAdminListWriters - takes output from 'vssadmin.exe list writers' and parses output into objects
* added New-PFDateFormat - which represents a [datetime] in multiple formats
* deleted Get-Address - REST API at website no longer works
* deleted Get-GeoCode - REST API at website no longer works
* deleted Show-Calendar - function is flat out broken and all prior versions have the same error
* updated Convert-HexToRGB - changed 'return' to 'break' in error condition
* updated Expand-String - changed class name from 'ExtractData' to 'PFExtractData' to prevent conflict
* updated Get-BinaryType - changed namespace from 'Win32Utils' to 'PFWin32Utils' to prevent conflict
* updated Get-ExecutableForFile - changed class name from 'Win32API' to 'PFWin32API' to prevent conflict, changed name of internal variable
* updated Get-LongName - updated function so Test-Path, Resolve-Path, Get-Item use -LiteralPath vs -Path
* updated Get-MacVendor - changed [ValidatePattern] to logic within function to clean up improperly formatted mac addresses, display MacAddress then Vendor
* updated Get-NTFSPermission - changed 'return' to 'break' in error condition
* updated Get-RandomDate - changed 'return' to 'break' in error condition
* updated Get-SQLDatabase - changed 'return' to 'break' in error condition
* updated Get-SQLIndexFragmentation - changed 'return' to 'break' in error condition
* updated Get-SQLStoredProcedure - changed 'return' to 'break' in error condition
* updated Get-ShortName - updated function so Test-Path, Resolve-Path, Get-Item use -LiteralPath vs -Path
* updated Get-UrlContent - changed 'return' to 'break' in error condition
* updated Get-WordCount - function would throw errors if it encountered PowerShell keywords, implemented work around
* updated Get-Wordlist - added -Full to use longer > 370,000 word list resource, moved word list file to .\Resources
* updated New-ColorPicker - to reflect its icon file moving to .\Resources
* updated New-DatePicker - to reflect its icon file moving to .\Resources
* updated New-FontPicker - to reflect its icon file moving to .\Resources
* updated New-InputBoxSecureString - to reflect its icon file moving to .\Resources, changed 'return' to 'break' in error condition
* updated New-RandomPassword - added -FullWordlist to use longer wordlist file
* updated New-Screenshot - changed 'return' to 'break' in error condition
* updated Optimize-SQLIndexFragmentation - changed 'return' to 'break' in error condition
* updated Optimize-SQLStoredProcedure - changed 'return' to 'break' in error condition
* updated Remove-TeamsCache - changed 'return' to 'break' in error condition
* updated Set-Display - changed class name from 'API' to 'PFAPI' to prevent conflict, changed name of internal variable
* updated Set-SpeakerVolume - added -Adjust parameter so you can adjust volume up or down
* updated Start-AdReplication - changed hard coded -ThrottleLimit from 8 to [environment]::ProcessorCount so that it determines number of processors on the fly
* updated Test-PasswordComplexity - removed dependency on Get-PrintableAscii

### 2.2.7
* added module icon file .\PoshFunctions.ico for custom WinForms forms created
* moved function aliases to within the function definition so all the code is together
* added ConvertFrom-HtmlEncode - helps with decoding strings that contain HTML special characters. For instance, 'this &amp; that' becomes 'this & that'
* added ConvertTo-HtmlEncode - helps with encoding strings that contain HTML special characters. For instance, 'this & that' becomes 'this &amp; that'
* added Export-FontSample - creates HTML output of sample text formatted with all of the installed fonts on the system
* added Get-CeasarCipher - a more robust version of Convert-ROT13 where you can specify the key or number of positions to shift. Aliased to 'Convert-ROT13' for backward compatibility.
* added Get-DisplayBrightness - to determine current display brightness
* added Get-DuplicateFileName - creates a quick list of duplicate file names within a given folder
* added Get-List - function to return an array given an indeterminate number of command line parameters
* added Get-String - function to return a string given an indeterminate number of command line parameters
* added New-ColorPicker - presents dialog box where user can select a color.
* added New-DatePicker - presents dialog box where user can select a date, can optionally include the time
* added New-FontPicker - dialog that allows user to select a font from a dialog box
* added Split-Line - more reliably split a string into its constituent lines. Returns an array.
* added Test-MultipleBool - to do logical AND/OR across an array of boolean values
* added Test-PasswordComplexity - to verify if a string is of proper length and matches all character types
* added Write-StringHash - to take a given hashtable and write the code to create it
* removed Convert-ROT13 - see more robust Get-CeasarCipher
* renamed Set-Speaker to Set-SpeakerVolume to be better named. Set an alias to Set-Speaker for backward compatibility
* renamed Union-Object to Merge-Object to get around Invoke-ScriptAnalyzer error
* updated ConvertFrom-Binary - changed result to [uint64[]] to be able to convert larger numbers.
* updated ConvertFrom-Hex - changed result to [uint64[]] to be able to convert larger numbers.
* updated ConvertTo-Binary - changed -Number to [uint64[]] to be able to convert larger numbers. added -MinimumWidth parameter
* updated ConvertTo-Hex - changed -Number to [uint64[]] to be able to convert larger numbers. added -MinimumWidth parameter, and -Prefix parameter
* updated Get-ComputerUptime - to better handle Kerberos errors sometimes encountered when connecting to systems
* updated Get-DriveStat - to better handle Kerberos errors sometimes encountered when connecting to systems
* updated Get-LastDayInMonth - added -Date parameter and parameter set names
* updated Get-MachineType - to better handle Kerberos errors sometimes encountered when connecting to systems
* updated Get-ProcessUser - to better handle Kerberos errors sometimes encountered when connecting to systems
* updated Get-ServiceUser - to better handle Kerberos errors sometimes encountered when connecting to systems
* updated Merge-Object - aliased to 'Union-Object' for backward compatibility
* updated New-InputBoxSecureString - added module custom icon
* updated New-MessageBox - renamed from New-Popup (aliased for backward compatibility). added functionality for default button
* updated New-RandomPassword - added -TitleCase, -RandomCase, -Web. Changed default parameter set name to ReadableTitleCase
* updated Optimize-SqlIndexFragmentation - to handle error condition of index not having page level locking on. If that error is encountered it enables lock, optimizes index, then disables lock
* updated Set-Display - added -Brightness to set the brightness of the display
* updated Start-ADReplication - added -ThrottleLimit so as to not over saturate the local computer
* updated Test-ConnectionAsync - added -Full switch and made default output brief, slight formatting change in output
* updated Write-StringArray - added -ExcludeDollarSign to make it easier to create input for *.psd1 files

### 2.2.6
* added Get-MyLocalLogonTime
* added Get-RelativePath
* added Use-Stopwatch
* updated Get-Shortcut
* updated New-Shortcut
* updated Start-ADReplication

### 2.2.5
* added Compare-ObjectSetComplement
* added Compare-ObjectSetDifference
* added Compare-ObjectSetIntersection
* added Compare-ObjectSetUnion
* added Get-ProcessUser
* added Get-ScheduledTaskUser
* added Get-ServiceUser
* added Test-Set
* updated Optimize-SqlIndexFragmentation
* updated Optimize-SqlStoredProcedure

### 2.2.4
* added Get-SqlDatabase
* added Get-SqlIndexFragmentation
* added Get-SqlStoredProcedure
* added Optimize-SqlIndexFragmentation
* added Optimize-SqlStoredProcedure

### 2.3.3
* added Invoke-CountdownTimer to implement a count down timer. Accurate to within several seconds

### 2.2.2
* Changed to SemVer versioning, 3 positions Major#.Minor#.Build#
* added Convert-Int32ToUint32 to aid in converting 32 bitmasks which are interpreted as negative int32 numbers, returned from things like (Get-Acl -Path $pwd).Access.FileSystemRights
* added Format-ReverseToken to take a tokenized string like 'monster.google.com' and convert it to 'com.google.monster'
* added New-InputBoxSecureString which will prompt for value and return a secure string. Can optionally verify input, and specify labels for input box(es)
* renamed Get-FolderName from Get-Folder to not conflict with Vmware module. Aliased to Get-Folder for backward compatibility
* renamed Get-SaveFileName from Get-SaveFile to be more consistent across file/folder functions. Aliased to Get-SaveFile for backward compatibility
* updated Convert-RGBToHex to better handle color specifications
* updated ConvertTo-DateTime because of logic error in handling Unix datetime strings
* updated Get-BashPath to include switch so as to not resolve path to existing path on the system
* updated Get-FileWithLeadingSpace to just produce the fullname of the files
* updated Get-Fortune and added -Speak switch
* updated Get-NTFSPermission to use Convert-Int32ToUint32 for certain filesystem rights, like -1610612736 corresponds to GenericExecute,GenericRead and previously the negative number would throw an error as it is really a 32 bitmask and not an int32
* updated Test-Port so that the results are given in the Process block and not wait until the End block
 that the results are given in the Process block and not wait until the End block
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
