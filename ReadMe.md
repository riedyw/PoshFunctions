# PoshFunctions

A curated list of Powershell functions and filters wrapped into a module. Over 150 functions/filters.

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
Convert-ARGBToHex              Converts an ARGB color string to hex equivalent
ConvertFrom-Base64             Convert from a Base64 string to normal string
ConvertFrom-DateTime           Converts a datetime into a datetime represented in a different format.
ConvertFrom-FsRight            To convert a [uint32] FileSystemRight value into a human readable form
ConvertFrom-UrlEncode          Converts a URL encoded string back into a normal string
ConvertFrom-UTC                Converts a datetime from UTC to local time
ConvertFrom-XML                Convert XML to an object
Convert-HexToARGB              Converts Hex to ARGB values
Convert-ObjectToHashtable      Takes a single object and converts its properties and values into a hashtable.
Convert-ROT13                  Shifts letters in string by 13 positions.
Convert-SecureStringToString   Converts a SecureString value back to a plaintext string
ConvertTo-Base64               ConvertTo-Base64 converts a normal string to a base 64 string
ConvertTo-BinaryIPv4           Converts a Decimal IP address into a binary format.
ConvertTo-Bool                 Parse a string and convert it to a Boolean
ConvertTo-DateTime             Converts a formatted date string back into a datetime datatype.
ConvertTo-DecimalIPv4          Converts a Dotted Decimal IP address into a 32-bit unsigned integer.
ConvertTo-DottedDecimalIPv4    Returns a dotted decimal IP address.
ConvertTo-Markdown             Convert pipeline output to a markdown document.
ConvertTo-OrderedDictionary    Converts a HashTable, Array, or an OrderedDictionary to an OrderedDictionary.
ConvertTo-PlainText            Converts the System.Security.SecureString to plain text.
ConvertTo-SecureText           ...
ConvertTo-UncPath              A simple function to convert a local file path and a computer name to a network UNC path.
ConvertTo-UrlEncode            To encode plaintext using [Web.HttpUtility]::UrlEncode()
ConvertTo-UTC                  Converts a datetime from local time to UTC
Convert-UserFlag               Converts a userflag enumeration to a human readable list of attributes about an AD object.
Copy-Object                    To copy an object to standard output
Eexit                          Closes the transcript, and exits the PowerShell session
Expand-String                  Expanding a string expression. Can handle Powershell string expressions or Environment variable expansion.
Expand-Tab                     To expand tab characters to spaces
Export-CSVSortedColumn         Sorts the column names alphabetically and exports to csv
FileSizeAbove                  To use as a filter against Get-ChildItem
FileSizeBelow                  To use as a filter against Get-ChildItem
Format-MacAddress              Function to cleanup a MACAddress string
Format-ReverseString           To reverse a string, or an array of strings
Format-SortedList              Creates a formatted list with properties sorted alphabetically
Format-WrapText                Wraps text at a particular column width
Get-BashPath                   To take a normal Windows path and convert it to a bash path for things like git bash.
Get-BinaryType                 Gets the binary executable type for a given set of files
Get-ComputerSite               Describe purpose of "Get-ComputerSite" in 1-2 sentences.
Get-DNSHostEntryAsync          ...
Get-DriveStat                  To get statistics on drives on a particular server or servers.
Get-Enum                       To get the static values of enum datatypes
Get-ExecutableForFile          Given a file, determine what program is associated with file.
Get-FileEncoding               To get the file encoding of a file
Get-FileName                   Gets a filename through the native OpenFileDialog. Can select a single file or multiple files.
Get-FileWithLeadingSpace       To find files that begin with a space character
Get-Folder                     Gets a filename through the native OpenFileDialog. Can select a single file or multiple files.
Get-Font                       Gets the fonts currently loaded on the system
Get-Fortune                    Display a short quote
Get-InstalledModuleVersion     Get version information on installed modules and most recent version on PSGallery
Get-IpRange                    Given a subnet in CIDR format, get all of the valid IP addresses in that range.
Get-LastReboot                 Describe purpose of "Get-LastReboot" in 1-2 sentences.
Get-MachineType                A quick function to determine if a computer is VM or physical box.
Get-MacVendor                  Resolve MacAddresses To Vendors
Get-Magic8Ball                 Get one of the answers from the magic 8 ball.
Get-Md5Sum                     To calculate an Md5Sum for a file
Get-NTFSPermission             To get permission information on a specified Path or folder name
Get-NtpDate                    To get the time from an NTP server
Get-OperatingSystemSKU         Gets the sku information for the current operating system
Get-Power                      Provides exponentian
Get-PrivateProfileComment      To get comments from an .ini file
Get-PrivateProfileSection      To get data out of an .ini file
Get-PrivateProfileSectionNames To get the section names out of an .ini file
Get-PrivateProfileString       To get data out of an .ini file
Get-PSWho                      Get PowerShell user summary information
Get-RandomDate                 Gets a random date
Get-RandomHexDigit             Gets a random hex digit, or a string of hex digits
Get-RandomMacAddress           Gets a random sequence of 12 hexadecimal digits
Get-RegExpandString            Retrieves a null-terminated string that contains unexpanded references to environment variables (REG_EXPAND_SZ) from local or remote computers.
Get-RegistryValue              Get the values from a specified registry key
Get-Round                      Correctly rounds a number. Optionally can specify the number of digits to round to.
Get-SaveFile                   Gets a filename through the native SaveFileDialog.
Get-Share                      To get information about shares on the local computer
Get-SharePermission            To get permission information on specified ShareName
Get-ShareStat                  To get statistics on a share
Get-Shortcut                   Get information about a Shortcut (.lnk file)
Get-SID                        To get the SID of a specified domain user passed as either an (email) or (domain,username)
Get-StaticProperty             To list the static properties of a .NET class
Get-SubnetMaskIPv4             Gets a dotted decimal subnet mask given the number of bits in the mask
Get-TruncatedDate              To truncate a date at a given level
Get-Type                       Get exported types in the current session
Get-UrlContent                 To get the HTML content of a specified URL
Get-WordCount                  Gets summary statistics of all the words and how many of each there are
grep                           A simple text filter to search for a string
Help                           Describe purpose of "Help" in 1-2 sentences.
Invoke-Speak                   Use the speech synthesizer in Powershell. Can be synchronous or asynchronous. Option for random voice.
Join-Object                    Combines two object lists based on a related property between them.
Lock-Workstation               Locks the workstation
mklink                         Mklink calls out to the Command Prompt (cmd.exe) and creates a link
Move-ToRecycleBin              Instead of outright deleting a file, why not move it to the Recycle Bin?
New-Inputbox                   Display a Visual Basic style inputbox.
New-PopUp                      New-Popup will display a popup message
New-QR                         Create New Quick Response Code
New-ScreenShot                 To take a screenshot and save it to a file.
New-Shortcut                   This script is used to create a  shortcut.
Read-HostWithDefault           A wrapper for Read-Host that includes a default value. Optionally can provide a prompt.
Remove-BlankOrComment          A simple text filter to remove blank lines or lines that begin with a comment character.
Remove-BomFromFile             To remove BOM (byte order marking) from a file.
Remove-EmptyProperty           To take an object and return only non-empty properties
Remove-InvalidFileNameChar     Removes characters from a string that are not valid in Windows file names.
Remove-QuotesFromCsv           Removes quotes from a CSV data set. Can optionally set $Delimiter to another character.
Remove-Trailing                Removes trailing spaces from a string or array of strings.
Reset-Desktop                  Forces a reset of the desktop
Resolve-FQDN                   Resolves a hostname or IPv4 address to a fully qualified domain name
Resolve-HostName               Resolves a hostname to an IPv4 address.
Search-Method                  Search method
sed                            A simple text filter to replace strings
Set-Capslock                   Sets the state of the CapsLock button.
Set-Display                    Set-Display turns the display on or off via energy saver api
Set-Numlock                    Sets the state of the NumLock button. If you pass $true to function it will turn on NumLock.
Set-PrivateProfileComment      To place comment(s) in an .ini file. Comments are lines that begin with a...
Set-PrivateProfileString       To set data in an .ini file
Set-Scrolllock                 Sets the state of the ScrollLock button.
Set-Speaker                    Sets the speaker volume.
Set-Type                       Sets the data type of a property given the property name and the data type.
Set-WindowStyle                To control the behavior of a window
Show-AllColor                  Shows all console colors
Show-Calendar                  Displays a visual representation of a calendar.
Show-Color                     Show-Color displays the names and values of the console colors
Show-ColorsWithBackground      Show-ColorsWithBackground displays all combinations of foreground/background of the console colors.
Show-DaysOfWeek                Shows the days of the week
Show-FileAttribute             Shows the available file attributes
Show-FsRight                   To list all potential file system rights
Show-InvalidFileCharacter      Shows invalid filename characters
Show-Month                     Shows the months
Show-NamedColor                Shows all named colors
Show-Object                    Takes an object and displays a new window containing the object, and you can drill down on its properties.
Show-Progress                  Show progress as items pass through a section of the pipline
Show-ShortDaysOfWeek           Show short days of the week
Show-ShortMonth                Shows short month
Show-SpecialFolder             Shows special folder names
Show-SubnetMaskIPv4            Show IPv4 subnet masks
Show-Timezone                  Show timezone information
Show-TypeAccelerator           Shows type accelerators
Start-RecordSession            Creates a transcript of current Powershell session
Stop-RecordSession             Stops the running transcript
Switch-Mute                    Toggles speaker mute
Test-ConnectionAsync           Performs a ping test asynchronously
Test-IsAdmin                   Determines if you are running elevated (as Administrator)
Test-IsCapsLock                Determines if the CapsLock key is on or not
Test-IsDate                    Tests to see if the specified string is a valid [datetime] string
Test-IsFileLocked              Determine if a file is locked.
Test-IsHexString               Tests to determine if a string is a valid hexadecimal number. Can optionally include a prefix of '0x' or '#'
Test-IsNumeric                 Determines if specified string can be parsed to a number
Test-IsNumLock                 Determines the state of NumLock
Test-IsScrollLock              Sets the state of the ScrollLock button. If you pass $true to function it will turn on ScrollLock.
Test-IsValidEmailAddress       Tests validity if specified string is an email address.
Test-IsValidIPv4               Verifies if passed parameter is a valid IP v4 address
Test-NtpDateVsNow              To test whether local time and NTP time fall within a particular tolerance
Test-Port                      Tests a Port or a range of ports on a specific ComputerName(s).
Union-Object                   Returns a 'clean' array of objects that have all property names in each element of the array
Update-ExplorerIcon            Updates Explorer icons

## EOF - End Of File Comment
