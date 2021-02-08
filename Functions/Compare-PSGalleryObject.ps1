Function Compare-PSGalleryObject {
<#
.SYNOPSIS
    Converts a formatted date string back into a datetime datatype.
.DESCRIPTION
    Converts a formatted date string back into a datetime datatype.
.PARAMETER DateString
    The date string that you wish to convert back to a datetime. Alias 'Date'.  Can be input from the pipeline.
.PARAMETER DMTF
    A switch parameter to display in DMTF format. Default parameter set.

    DmtfDateTime is of the form 'yyyyMMddHHmmss.ffffff+UUU'

    Where
        yyyy    is the 4 digit year
        MM      is the 2 digit month
        dd      is the 2 digit day of the month
        HH      is the 2 digit in 24 hour format (00-23, 1 pm = 13)
        mm      is the 2 digit minute (00-59)
        ss      is the 2 digit second (00-59)
        ffffff  is the 6 digit microsecond
        +       is a plus or minus to indicate offset from UTC
        UUU     is the 3 digit number of minutes offset from UTC (000-720)
.PARAMETER Unix
    A switch parameter to convert from a UnixEpoch which is the number of seconds since '1/1/1970 12:00:00 AM UTC'.
.PARAMETER FileTime
    Converts a large integer filetime [int64] into a datetime string. There is a special value that returns a value of 'Never'.

    Filetimes are expressed in Ticks. Ticks can range from 0 - 2650467743999999999. Translating these into dates you get
                      0 = Monday, January 01, 1601 12:00:00.00000 AM
    2650467743999999999 = Friday, December 31, 9999 11:59:59.99999 PM
.PARAMETER ICSDateTime
    IcsDateTime is of the form 'yyyyMMddTHHmmssZ'

    Where
        yyyy    is the 4 digit year
        MM      is the 2 digit month
        dd      is the 2 digit day of the month
        HH      is the 2 digit in 24 hour format (00-23, 1 pm = 13)
        mm      is the 2 digit minute (00-59)
        ss      is the 2 digit second (00-59)
        T       is the letter T
        Z       is an optional suffix indicating UTC or Zulu time

    If the final character is NOT a Z then the time is local time.
.PARAMETER Excel
    Switch to indicate that the datestring is in Excel format which represents dates as the number of days since (get-date 1/1/1900)
.PARAMETER Format
    See help for Get-Date and the -Format parameter. This will parse the datestring using the Format as a template.
.PARAMETER IncludeOriginal
    Switch to enable the original datetime to appear in the output.
.PARAMETER UTC
    Forces the output to be in the UTC timezone. Alias of this parameter is 'Zulu'
.EXAMPLE
    ConvertTo-DateTime '20161124225058.082190+060'

    If you were in the EST timezone this would return the datetime

    Thursday, November 24, 2016 4:50:58 PM
.EXAMPLE
    ConvertTo-DateTime -DateString 946684799 -Unix -UTC

    Would return
    Friday, December 31, 1999 11:59:59 PM
.EXAMPLE
    ConvertTo-DateTime '20161124T225058Z' -ICSDateTime

    If in the EST timezone this would return
    Thursday, November 24, 2016 5:50:58 PM
.EXAMPLE
    ConvertTo-DateTime 131619940792563529 -FileTime -UTC

    Would return
    Thursday, February 1, 2018 9:27:59 PM
.EXAMPLE
    ConvertTo-DateTime '20-04-01' -Format 'yy-MM-dd'

    Would return
    Wednesday, April 1, 2020 12:00:00 AM
.EXAMPLE
    ConvertTo-DateTime -DateString 946684799 -Unix -Verbose

    Would return
    VERBOSE: Starting [ConvertTo-DateTime]
    VERBOSE: ParameterSetName [Unix]
    VERBOSE: Your local timezone is '(UTC-05:00) Eastern Time (US & Canada)'
    VERBOSE: The date '12/31/1999 18:59:59' is 946684799 seconds in the future of '01/01/1970 00:00:00' UTC

    Friday, December 31, 1999 6:59:59 PM
    VERBOSE: Ending ConvertTo-DateTime
.NOTES
    Info:       For further information on DMTF time formats see https://docs.microsoft.com/en-us/windows/desktop/wmisdk/cim-datetime

    Added Excel functionality
#>

    #region parameter
    [CmdletBinding(DefaultParameterSetName = 'Module',ConfirmImpact='None')]
    [OutputType('psobject')]
    Param
    (

        [Parameter(ParameterSetName = 'Module')]
        [Parameter(ParameterSetName = 'Script')]
        [string] $MatchString,

        [Parameter(ParameterSetName = 'Module')]
        [Parameter(ParameterSetName = 'Script')]
        [ValidateSet('Module','Script')]
        [string] $ObjectType = 'Module',

        [Parameter(ParameterSetName = 'Module')]
        [switch] $Module,

        [Parameter(ParameterSetName = 'Script')]
        [switch] $Script

    )
    #endregion parameter

    
# inspired by Get-ModuleVersionInformation at: https://tfl09.blogspot.com/2018/07/keeping-powershell-modules-up-to-date.html

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "ParameterSetName [$($PsCmdlet.ParameterSetName)]"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            'Module' {
                $Objects  = Get-InstalledModule -Verbose:$False | Where-Object { $_.Name -match $MatchString }
                Write-Verbose -Message ('{0} modules locally' -f $Objects.count)
                Foreach ($Object in $Objects) {
                    Write-Verbose -Message "Processing $($Object.name)"
                    
                    $UpdateObject         = [ordered] @{}    # create the hash table
                    $UpdateObject.ObjectType = 'Module'
                    $UpdateObject.Name    = $Object.Name     # Add name
                    $UpdateObject.InstalledVersion = $Object.Version  # And local version

                    try {
                    #  Find module, and add gallery version number to hash table
                        $GalObj = Find-Module -Name $Object.name -ErrorAction Stop
                        $UpdateObject.GalVersion = $GalObj.Version | Sort-Object -Descending | Select-Object -First 1
                    }
                    # here - find module could not find the module in the gallery
                    Catch {
                        # If module isn't in the gallery
                        $UpdateObject.GalVersion = [System.Version]::new(0,0)
                    }

                    # now emit the object
                    New-Object -TypeName PSObject -Property $UpdateObject
                }
            }

            'Script' {
                $Objects  = Get-InstalledScript -Verbose:$False | Where-Object { $_.Name -match $MatchString }
                Write-Verbose -Message ('{0} scripts locally' -f $Objects.count)
                Foreach ($Object in $Objects) {
                    Write-Verbose -Message "Processing $($Object.name)"
                    
                    $UpdateObject         = [ordered] @{}    # create the hash table
                    $UpdateObject.ObjectType = 'Script'
                    $UpdateObject.Name    = $Object.Name     # Add name
                    $UpdateObject.InstalledVersion = $Object.Version  # And local version

                    try {
                    #  Find module, and add gallery version number to hash table
                        $GalObj = Find-Script -Name $Object.name -ErrorAction Stop
                        $UpdateObject.GalVersion = $GalObj.Version | Sort-Object -Descending | Select-Object -First 1
                    }
                    # here - find module could not find the module in the gallery
                    Catch {
                        # If module isn't in the gallery
                        $UpdateObject.GalVersion = [System.Version]::new(0,0)
                    }

                    # now emit the object
                    New-Object -TypeName PSObject -Property $UpdateObject
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }
    
} # End Function

