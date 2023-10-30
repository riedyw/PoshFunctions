# PoshFunctions

A curated list of Powershell functions and filters wrapped into a module. Over 225 functions/filters.

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

    Name                           Synopsis
    ----                           --------
    Compare-ObjectProperty         Compares two objects property by property.
    Compare-ObjectSetComplement    Compares 2 arrays of strings and returns The SET COMPLEMENT of the arrays
    Compare-ObjectSetDifference    Compares 2 arrays of strings and returns The SET DIFFERENCE of the arrays
    Compare-ObjectSetIntersection  Compares 2 arrays of strings and returns The SET INTERSECTION of the arrays
    Compare-ObjectSetUnion         Compares 2 arrays of strings and returns The SET UNION of the arrays
    Compare-PSGalleryObject        Compares the installed module(s) or script(s) that have been installed from
                                   PowerShellGallery.com
    ConvertFrom-Base64             Convert from a Base64 string to normal string
    ConvertFrom-Binary             Convert an string or string array from binary to an integer
    ConvertFrom-DateTime           Converts a datetime into a datetime represented in a different format.
    ConvertFrom-FsRight            To convert a [uint32] FileSystemRight value into a human readable form
    ConvertFrom-Hex                Convert an string or string array from hexadecimal to an integer
    ConvertFrom-HexString          Convert a hex string or array of hex string to text
    ConvertFrom-HtmlEncode         Converts a URL encoded string back into a normal string
    ConvertFrom-RomanNumeral       Converts a roman numeral to a number.
    ConvertFrom-UrlEncode          Converts a URL encoded string back into a normal string
    ConvertFrom-UTC                Converts a datetime from UTC to local time
    ConvertFrom-XML                Convert XML to an object
    Convert-HexToRGB               Converts Hex to RGB values
    Convert-Int32ToUint32          Converts int32 values to uint32 values
    Convert-Int64ToText            Convert integer to English text
    Convert-ObjectToHashtable      Takes a single object and converts its properties and values into a hashtable.
    Convert-RGBToHex               Converts an RGB color string to hex equivalent
    Convert-SecureStringToString   Converts a SecureString value back to a plaintext string
    ConvertTo-Base64               ConvertTo-Base64 converts a normal string to a base 64 string
    ConvertTo-Binary               Convert an integer or array of integers to binary
    ConvertTo-BinaryIPv4           Converts a Decimal IP address into a binary format.
    ConvertTo-Bool                 Parse a string and convert it to a Boolean
    ConvertTo-DateTime             Converts a formatted date string back into a datetime datatype.
    ConvertTo-DecimalIPv4          Converts a Dotted Decimal IP address into a 32-bit unsigned integer.
    ConvertTo-DottedDecimalIPv4    Returns a dotted decimal IP address.
    ConvertTo-Hex                  Convert an integer or array of integers to hexadecimal
    ConvertTo-HexString            Convert a string or array of string to hex strings
    ConvertTo-HtmlEncode           To encode plaintext using [Web.HttpUtility]::HtmlEncode()
    ConvertTo-OrderedDictionary    Converts a HashTable, Array, or an OrderedDictionary to an OrderedDictionary.
    ConvertTo-RomanNumeral         Converts a number to a Roman numeral.
    ConvertTo-UncPath              A simple function to convert a local file path and a computer name to a network
                                   UNC path.
    ConvertTo-UrlEncode            To encode plaintext using [Web.HttpUtility]::UrlEncode()
    ConvertTo-UTC                  Converts a datetime from local time to UTC
    Convert-UserFlag               Converts a userflag enumeration to a human readable list of attributes about an
                                   AD object.
    Copy-Object                    To copy an object to standard output
    Eexit                          Closes the transcript, and exits the PowerShell session
    Expand-IPV6                    Takes an abbreviated IPv6 string and expands it fully
    Expand-String                  Expanding a string expression. Can handle Powershell string expressions or
                                   Environment variable expansion.
    Expand-Tab                     To expand tab characters to spaces
    Export-CSVSortedColumn         Sorts the column names alphabetically and exports to csv
    Export-FontSample              Exports an HTML file containing sample text formatted in all the fonts installed on
                                   the current system.
    Format-MacAddress              Function to cleanup a MACAddress string
    Format-RandomCase              Formats a string character by character randomly into upper or lower case.
    Format-ReverseString           To reverse a string, or an array of strings
    Format-ReverseToken            To reverse a string that is broken into tokens by a delimiter
    Format-SortedList              Creates a formatted list with properties sorted alphabetically
    Format-TitleCase               Get the last day of the month given the year as an integer, and the month as
                                   an integer
    Format-WrapText                Wraps text at a particular column width
    Get-ArpTable                   Gets the dynamic entries in the arp table and parses them into IPAddress and
                                   MACAddress
    Get-Assoc                      Displays file extension associations
    Get-BashPath                   To take a normal Windows path and convert it to a bash path for things like git bash.
    Get-BinaryType                 Gets the binary executable type for a given set of files
    Get-CeasarCipher               Shifts letters in string by a certain number of positions. Default shift is 13
                                   characters or the classic ROT13.
    Get-ComputerSite               Determines the Active Directory site of a specified computername(s). Relies on
                                   nltest.exe that comes with Windows
    Get-ComputerUptime             To mimic and extend the Get-ComputerUptime function found in PowerShell 6 or 7
    Get-ConsoleWindowSize          Gets the current the window size and buffer size of the current console window
    Get-DiceRoll                   Simulates rolling gaming dice
    Get-DiskType                   A quick function to determine what type of local disk a computer has
    Get-DisplayBrightness          To get the current brightness of the display
    Get-DNSHostEntryAsync          Performs a DNS Get Host asynchronously
    Get-DriveStat                  To get statistics on drives on a particular server or servers.
    Get-DuplicateFileName          To find duplicate file names within a given folder
    Get-Enum                       To get the static values of enum datatypes
    Get-ErrorInfo                  Returns errors in a concise object
    Get-ExecutableForFile          Given a file, determine what program is associated with file.
    Get-Factorial                  Determine the factorial of a given integer value
    Get-FileEncoding               To get the file encoding of a file
    Get-FileName                   Gets a filename through the native OpenFileDialog. Can select a single file or
                                   multiple files.
    Get-FileSizeOnDisk             Powershell script to get file size and size on disk of all files in a directory.
    Get-FileWithLeadingSpace       To find files that begin with a space character
    Get-FolderName                 Gets a foldername through the native OpenFileDialog.
    Get-Font                       Gets the fonts currently loaded on the system
    Get-Fortune                    Display a short quote
    Get-Ftype                      Displays file types used in file extension associations
    Get-InvalidFileCharacter       Gets invalid filename characters
    Get-IpRange                    Given a subnet in CIDR format, get all of the valid IP addresses in that range.
    Get-IpV4Network                Given a subnet in CIDR format, get all of the valid IP addresses in that range.
    Get-LastDayInMonth             Get the last day of the month given the year as an integer, and the month as
                                   an integer
    Get-List                       Returns an array given an indeterminate number of command line arguments.
    Get-LongName                   To get the longname of a provided shortname (8.3) of a file or folder
    Get-MachineType                A quick function to determine if a computer is VM or physical box.
    Get-MacVendor                  Resolve MacAddresses To Vendors
    Get-Magic8Ball                 Get one of the answers from the magic 8 ball.
    Get-Md5Sum                     To calculate an Md5Sum for a file
    Get-MyLocalLogonTime           Gets local logon time for the current user
    Get-NetworkCredential          Returns a [System.Net.NetworkCredential] given a passed [PSCredential] parameter
    Get-NTFSPermission             To get permission information on a specified Path or folder name
    Get-NtpDate                    To get the time from an NTP server
    Get-Power                      Provides exponentian
    Get-PrintableAscii             Gets an array of objects that show printable Ascii characters.
    Get-PrivateProfileComment      To get comments from an .ini file
    Get-PrivateProfileSection      To get data out of an .ini file
    Get-PrivateProfileSectionNames To get the section names out of an .ini file
    Get-PrivateProfileString       To get data out of an .ini file
    Get-ProcessUser                Get a list of processes and the user context that they run under. By default excluded
                                   system tasks
    Get-PSWho                      Get PowerShell user summary information
    Get-RandomDate                 Gets a random date
    Get-RandomHexDigit             Gets a random hex digit, or a string of hex digits
    Get-RandomMacAddress           Gets a random sequence of 12 hexadecimal digits
    Get-RegExpandString            Retrieves a null-terminated string that contains unexpanded references to environment
                                   variables (REG_EXPAND_SZ) from local or remote computers.
    Get-RegistryValue              Get the values from a specified registry key
    Get-RelativePath               Get a relative path to a specified list of paths relative to a specified path
    Get-Round                      Correctly rounds a number. Optionally can specify the number of digits to round to.
    Get-SaveFileName               Gets a filename through the native SaveFileDialog.
    Get-ScheduledTaskUser          Get a list of scheduled tasks and the user context that they run under. By default
                                   excluded system tasks
    Get-ServiceUser                Get a list of services and the user context that they run under. By default excluded
                                   services running as system
    Get-Shortcut                   Get information about a Shortcut (.lnk file)
    Get-ShortName                  To get the shortname 8.3 of a file or folder
    Get-SID                        To get the SID of a specified domain user passed as either an (email) or
                                   (domain,username)
    Get-SpecialFolder              Gets special folder name location
    Get-SqlDatabase                Get list of SQL databases
    Get-SqlIndexFragmentation      Get SQL Index Fragmentation
    Get-SqlStoredProcedure         Get SQL Stored Procedures
    Get-StaticProperty             To list the static properties of a .NET class
    Get-String                     Returns a string given an indeterminate number of command line arguments.
    Get-StringHash                 To calculate a hash for provided strings
    Get-SubnetMaskIPv4             Gets a dotted decimal subnet mask given the number of bits in the mask
    Get-TruncatedDate              To truncate a date at a given level
    Get-Type                       Get exported types in the current session
    Get-TypeAccelerator            Gets type accelerators
    Get-UrlContent                 To get the HTML content of a specified URL
    Get-VssadminListVolumes        Runs 'vssadmin.exe list volumes' and parses the output into objects
    Get-VssadminListWriters        Runs 'vssadmin.exe list writers' and parses the output into objects
    Get-WordCount                  Gets summary statistics of all the words and how many of each there are
    Get-WordList                   Returns a list of over 38,000 words.
    Invoke-Beep                    Uses the Beep function of the .Net [Console] class
    Invoke-CountdownTimer          Invokes a countdown timer
    Invoke-SoundPlayer             Use the SoundPlayer in Powershell. Can be synchronous or asynchronous.
    Invoke-Speak                   Use the speech synthesizer in Powershell. Can be synchronous or asynchronous. Option
                                   for random voice.
    Join-Object                    Combines two object lists based on a related property between them.
    Lock-Workstation               Locks the workstation
    Measure-Char                   To count the number of times a character appears in a string, or an array of strings.
    Merge-Object                   Returns a 'clean' array of objects that have all property names in each element of
                                   the array
    mklink                         mklink calls out to the Command Prompt (cmd.exe) and creates a link
    Move-ToRecycleBin              Instead of outright deleting a file, why not move it to the Recycle Bin?
    New-ColorPicker                Present a dialog to the user and allow them to select or define a color. User can
                                   choose how the color will be returned.
    New-Credential                 Returns a [PSCredential] given a passed UserName, and either a string 'Password' or
                                   a securestring 'SecureString'
    New-DatePicker                 Provides a GUI representation of a calendar where you select a date. Click OK or
                                   press [Enter] to return the date selected. If click Cancel or press [Esc] $null
                                   is returned.
    New-FontPicker                 Present a dialog to the user and allow them to select a font and its characteristics
    New-Inputbox                   Display a Visual Basic style inputbox.
    New-InputBoxSecureString       Provides a GUI text entry box to enter a string and convert it to a securestring
    New-MessageBox                 New-Popup will display a message box. If a timeout is requested it uses Wscript.Shell
                                   PopUp method. If a default button is requested it uses the ::Show method from
                                   'Windows.Forms.MessageBox'
    New-PFDateFormat               Returns a [psobject] with a [datetime] in multiple other formats
    New-QR                         Create New Quick Response Code
    New-RandomPassword             Creates a new random password
    New-ScreenShot                 To take a screenshot and save it to a file.
    New-Shortcut                   This script is used to create a  shortcut.
    Optimize-SqlIndexFragmentation Optimize SQL Index Fragmentation
    Optimize-SqlStoredProcedure    Optimize SQL Stored Procedures
    Out-PDFToPrinter               To print a .PDF to the default printer
    Read-HostWithDefault           A wrapper for Read-Host that includes a default value. Optionally can provide
                                   a prompt.
    Remove-EmptyProperty           To take an object and return only non-empty properties
    Remove-QuotesFromCsv           Removes quotes from a CSV data set. Can optionally set $Delimiter to another
                                   character.
    Remove-TeamsCache              Removes the data that is in the Teams cache for the current user
    Reset-Desktop                  Forces a reset of the desktop
    Resolve-FQDN                   Resolves a hostname or IPv4 address to a fully qualified domain name
    Resolve-HostName               Resolves a hostname to an IPv4 address.
    Set-Capslock                   Sets the state of the CapsLock button.
    Set-Display                    Set-Display turns the display on or off via energy saver api. Can also set display
                                   brightness
    Set-Numlock                    Sets the state of the NumLock button. If you pass $true to function it will turn on
                                   NumLock.
    Set-PrivateProfileComment      To place comment(s) in an .ini file. Comments are lines that begin with a
                                   semicolon ';'.
    Set-PrivateProfileString       To set data in an .ini file
    Set-Scrolllock                 Sets the state of the ScrollLock button.
    Set-SpeakerVolume              Sets the speaker volume.
    Set-WindowState
    Set-WindowStyle                To control the behavior of a window
    Show-AllColor                  Shows all console colors
    Show-Calendar                  Displays a visual representation of a calendar.
    Show-Color                     Show-Color displays the names and values of the console colors
    Show-ColorsWithBackground      Show-ColorsWithBackground displays all combinations of foreground/background of the
                                   console colors.
    Show-DaysOfWeek                Shows the days of the week
    Show-FileAttribute             Shows the available file attributes
    Show-FsRight                   To list all potential file system rights
    Show-Month                     Shows the months
    Show-NamedColor                Shows all named colors
    Show-Object                    Takes an object and displays a new window containing the object, and you can drill
                                   down on its properties.
    Show-Progress                  Show progress as items pass through a section of the pipline
    Show-ShortDaysOfWeek           Show short days of the week
    Show-ShortMonth                Shows short month
    Show-SubnetMaskIPv4            Show IPv4 subnet masks
    Show-Timezone                  Show timezone information
    Split-CanonicalName            To split a CanonicalName string line by into its constituent parts which are
                                   separated by a /
    Split-DistinguishedName        To split a DistinguishedName string line by into its constituent parts which are
                                   separated by a comma
    Split-Line                     To split a string line by line and return a string array
    Start-ADReplication            Forces replication to occur between domain controllers in domain.
    Start-RecordSession            Creates a transcript of current Powershell session
    Stop-RecordSession             Stops the running transcript
    Switch-Mute                    Toggles speaker mute
    Test-ConnectionAsync           Performs a ping test asynchronously
    Test-CSVFormat                 Verifies the format of CSV file and that each row has the same number of fields as
                                   the header row
    Test-IsAdmin                   Determines if you are running elevated (as Administrator)
    Test-IsCapsLock                Determines if the CapsLock key is on or not
    Test-IsDate                    Tests to see if the specified string is a valid [datetime] string
    Test-IsFileLocked              Determine if a file is locked.
    Test-IsHexString               Tests to determine if a string is a valid hexadecimal number. Can optionally include
                                   a prefix of '0x' or '#'
    Test-IsLocalIPv4               Tests to determine if a specified IPv4 address is LOCAL or REMOTE (must be sent to
                                   default gateway). Aliased to 'Test-IsLocalIP'
    Test-IsNull                    Given a passed [string] tests to determine if .IsNullOrEmpty() or
                                   .IsNullOrWhitespace(), with .IsNullOrEmpty() being the default
    Test-IsNumeric                 Determines if specified string can be parsed to a number
    Test-IsNumLock                 Determines the state of NumLock
    Test-IsScrollLock              Sets the state of the ScrollLock button. If you pass $true to function it will turn
                                   on ScrollLock.
    Test-IsValidEmailAddress       Tests validity if specified string is an email address.
    Test-IsValidIPv4               Verifies if passed parameter is a valid IP v4 address
    Test-IsValidIPv6               Verifies if passed parameter is a valid IP v6 address
    Test-MultipleBool              Takes multiple bool values and applies a boolean operator against them to get an
                                   answer
    Test-Network                   Wrapper function for Get-IpRange, Test-ConnectionAsync, and Get-DNSHostEntryAsync to
                                   give summary table of ip addresses that either resolve to a host name or respond to
                                   a ping
    Test-NtpDateVsNow              To test whether local time and NTP time fall within a particular tolerance
    Test-Password                  To validate credentials and return a boolean
    Test-PasswordComplexity        Tests a password for length and password complexity
    Test-Port                      Tests a Port or a range of ports on a specific ComputerName(s).
    Test-Set                       Compares 2 arrays of strings and determines if they are EQUAL, SUBSET, SUPERSET,
                                   or UNEQUAL
    Update-ExplorerIcon            Updates Explorer icons
    Use-Stopwatch                  Uses a stopwatch datatype found in module. Can get stopwatch status, start, stop,
                                   reset, or restart.
    Write-SelectStatement          From a single object with named properties it will write out a select statement that
                                   will join array elements.
    Write-StringArray              Takes [string] or [string[]] input and writes the code that would create a string
                                   array with that information.
    Write-StringHash               Takes [hashtable] input and writes the code that would create a hashtable with that
                                   information.
    Write-TextMenu                 Creates the logic for a new simple text based menu. Originally published as script
                                   New-TextMenu in the PowerShellGallery
