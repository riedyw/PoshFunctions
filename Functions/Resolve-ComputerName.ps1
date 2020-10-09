Function Resolve-ComputerName {
<#
.SYNOPSIS
    To parse from a given computername and split it into the pieces that make it up
.DESCRIPTION
    To parse from a given computername the pieces that make it up into the properties ComputerName, Valid, Hull, PIT, HostName, ParsedCN
.PARAMETER ComputerName
    A string or an array of strings which specify the ComputerName(s) for which you want the names parsed.
.PARAMETER Case
    An optional parameter. 'Upper' will convert calculated fields to uppercase. 'Lower' will convert calculated fields to lowercase. The original specified computername is not altered.
.EXAMPLE
    Resolve-ComputerName -ComputerName 'LCS10CINDC01'

    Would return
    ComputerName Valid Hull  PIT HostName ParsedCN
    ------------ ----- ----  --- -------- --------
    LCS10CINDC01  True LCS10 CIN DC01     LCS10CINDC01
.EXAMPLE
    Resolve-ComputerName -ComputerName 'badname'

    Would return
    ComputerName Valid Hull PIT HostName ParsedCN
    ------------ ----- ---- --- -------- --------
    badname      False          badname
.EXAMPLE
    Resolve-ComputerName -ComputerName 'LCS10CINDC01' -Case Lower

    Would return
    ComputerName Valid Hull  PIT HostName ParsedCN
    ------------ ----- ----  --- -------- --------
    LCS10CINDC01  True lcs10 cin dc01     lcs10cindc01
.EXAMPLE
    "lcs2cindc01","itt2auinhvm01","badname" | Resolve-ComputerName  -case upper

    Would return
    ComputerName  Valid Hull  PIT HostName ParsedCN
    ------------  ----- ----  --- -------- --------
    lcs2cindc01    True LCS2  CIN DC01     LCS2CINDC01
    itt2auinhvm01  True ITT2A UIN HVM01    ITT2AUINHVM01
    badname       False           BADNAME
.EXAMPLE
    Resolve-ComputerName -Computername 'LCS18cindc01' -case Upper -verbose

    Would return
    VERBOSE: $ValidPlatform=[((LCS\d\d)|(LCS\d)|ITT2A|ITT2B|ITT2C|ITT2|(LDE\d))]
    VERBOSE: $ValidPit=[(CIN|UIN|CWS|HME|CNS|CCS)]
    VERBOSE: Computers specified are [LCS18cindc01]
    VERBOSE: $curComputerName=[LCS18cindc01]
    VERBOSE: $FullRegEx=[^((LCS\d\d)|(LCS\d)|ITT2A|ITT2B|ITT2C|ITT2|(LDE\d))(CIN|UIN|CWS|HME|CNS|CCS)(([0-9]|[A-Z])+)$]
    VERBOSE: Converting fields to uppercase

    ComputerName Valid Hull  PIT HostName ParsedCN
    ------------ ----- ----  --- -------- --------
    LCS18cindc01  True LCS18 CIN DC01     LCS18CINDC01
.OUTPUTS
    [psobject]
    A custom object containing the following properties:
    ComputerName - The name of the computer as originally specified
    Valid        - A boolean indicating if it is a valid computername given this script
    Hull         - A string being 'LCS' followed by 1 or 2 digits, or 'ITT2', 'ITT2A', 'ITT2B', 'ITT2C', 'LDE' followed by 1 digit, or blank if computername is invalid
    PIT          - A string from the set (CIN, UIN, CWS, HME, CNS, CCS) or '' if undetermined
    HostName     - The remaining portion of the string after Hull and PIT
    ParsedCN     - The computername with the case rules applied to it or a blank
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [OutputType('psobject')]
    Param(
        [Parameter(
            Mandatory,HelpMessage='Add help message for user',
            Position = 0,
            ValueFromPipeline)]
            [string[]] $ComputerName,
        [Parameter(
            Position = 1,
            ParameterSetName = '')]
            [ValidateSet('Upper','Lower')]
            [string] $Case
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
        $ValidPlatform       = '((LCS\d\d)|(LCS\d)|ITT2A|ITT2B|ITT2C|ITT2|(LDE\d))'
        $ValidPit            = '(CIN|UIN|CWS|HME|CNS|CCS)'
        write-verbose -Message "`$ValidPlatform=[$($ValidPlatform)]"
        write-verbose -Message "`$ValidPit=[$($ValidPit)]"
    }

    process {
        write-verbose -Message "Computers specified are [$($computerName -join ', ')]"
        foreach ($curComputerName in $ComputerName) {
            write-verbose -Message "`$curComputerName=[$($curComputerName)]"
            $FullRegEx = '^' + $ValidPlatform + $ValidPit + '(([0-9]|[A-Z])+)$'
            write-verbose -Message "`$FullRegEx=[$($FullRegEx)]"
            if ($curComputerName -match $FullRegEx) {
                $Hull = $matches[1]
                $Pit  = $matches[5]
                $HostName = $matches[6]
                switch ($case) {
                    'Upper' {
                        write-verbose -Message 'Converting fields to uppercase'
                        $Prop = @{
                            ComputerName = $curComputerName
                            Valid        = $true
                            Hull         = $Hull.ToUpper()
                            PIT          = $PIT.ToUpper()
                            HostName     = $HostName.ToUpper()
                            ParsedCN     = $curComputerName.ToUpper()
                        }
                    }
                    'Lower' {
                        write-verbose -Message 'Converting fields to lowercase'
                        $Prop = @{
                            ComputerName = $curComputerName
                            Valid        = $true
                            Hull         = $Hull.ToLower()
                            PIT          = $PIT.ToLower()
                            HostName     = $HostName.ToLower()
                            ParsedCN     = $curComputerName.ToLower()
                        }
                    }
                    default {
                        $Prop = @{
                            ComputerName = $curComputerName
                            Valid        = $true
                            Hull         = $Hull
                            PIT          = $PIT
                            HostName     = $HostName
                            ParsedCN     = $curComputerName
                        }
                    }
                } # endSwitch
                $obj = new-object -TypeName psobject -property $prop
                # By default no control over order of field names so fixing with select-object
                $obj | Select-Object -Property ComputerName, Valid, Hull, PIT, HostName, ParsedCN
            } else {
                switch ($case) {
                    'Upper' {
                        write-verbose -Message 'Converting fields to uppercase'
                        $Prop = @{
                            ComputerName = $curComputerName
                            Valid        = $false
                            Hull         = ''
                            PIT          = ''
                            HostName     = $curComputerName.ToUpper()
                            ParsedCN     = ''
                        }
                    }
                    'Lower' {
                        write-verbose -Message 'Converting fields to lowercase'
                        $Prop = @{
                            ComputerName = $curComputerName
                            Valid        = $false
                            Hull         = ''
                            PIT          = ''
                            HostName     = $curComputerName.ToLower()
                            ParsedCN     = ''
                        }
                    }
                    default {
                        $Prop = @{
                            ComputerName = $curComputerName
                            Valid        = $false
                            Hull         = ''
                            PIT          = ''
                            HostName     = $curComputerName
                            ParsedCN     = ''
                        }
                    }
                } # endSwitch
                $obj = new-object -TypeName psobject -property $prop
                $obj | Select-Object -Property ComputerName, Valid, Hull, PIT, HostName, ParsedCN
            } # endElse
        } # endForEach ($curComputerName in $ComputerName)
    } # endProcess

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    }

} # EndFunction Resolve-ComputerName
