function ConvertTo-SecureText {
<#
.SYNOPSIS
    Converts plain text to secure string.
.DESCRIPTION
    Converts plain text to secure string.
.PARAMETER Prompt
    Text that you want to be displayed when prompting user.
#>

    [CmdletBinding()]
    [OutputType('string')]
    Param (
        [parameter(ValueFromPipeLine = $True, ValueFromPipeLineByPropertyName = $True)]
        [Alias('Ask')]
        [string] $Prompt = 'Please enter text'
    )

    begin {
        Write-Verbose -Message "Starting $($MyInvocation.Mycommand)"
    } #close begin block

    process {
        $secure = Read-Host -AsSecureString  -Prompt "$Prompt"
        $encrypted = ConvertFrom-SecureString -SecureString $secure
        $encrypted
    }

    end {
        Write-Verbose -Message "Ending $($MyInvocation.Mycommand)"
    } #close end block

} #EndFunction ConvertTo-SecureText
