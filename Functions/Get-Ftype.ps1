function Get-Ftype {
<#
.SYNOPSIS
    Displays file types used in file extension associations
.DESCRIPTION
    Displays file types used in file extension associations which can only gotten from cmd.exe
.PARAMETER AsArray
    Switch to return result as an array of objects as opposed to an ordered dictionary
.EXAMPLE
    Get-Ftype

    Name                           Value
    ----                           -----
    VLC.rec                        "C:\Program Files\VideoLAN\VLC\vlc.exe" --started-from-file "%1"
    ChromeHTML                     "C:\Program Files\Google\Chrome\Application\chrome.exe" --single-argument %1

        ... snip many lines ...

    VLC.rmvb                       "C:\Program Files\VideoLAN\VLC\vlc.exe" --started-from-file "%1"
.EXAMPLE
    Get-Ftype -AsArray | Where-Object { $_.Name -match '^Word' }

    Name                         Value
    ----                         -----
    Word.AutoRecovery.8          "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
    Word.Backup.8                "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
    Word.Document.12             "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
    Word.Document.8              "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
    Word.DocumentMacroEnabled.12 "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
    Word.OpenDocumentText.12     "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1"
    Word.RTF.8                   "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
    Word.Template.12             "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
    Word.Template.8              "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
    Word.TemplateMacroEnabled.12 "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u"
    Word.UriLink.16              C:\Program Files (x86)\Microsoft Office\Root\Office16\protocolhandler.exe "%1"
    wordhtmlfile                 "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE"
    wordhtmltemplate             "C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE"
    Wordpad.Document.1           "%ProgramFiles%\Windows NT\Accessories\WORDPAD.EXE" "%1"
#>

    [CmdletBinding()]
    param (
        [switch] $AsArray
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        $CmdReturn = (cmd.exe /d /c ftype)
        $GetFtype = ([ordered] @{})
        ForEach ($CurItem in $CmdReturn) {
            $Temp = $CurItem.Split('=')
        $GetFtype.Add($Temp[0],$Temp[1])
        }
        if ($AsArray) {
            $ArrayOutput = $GetFtype.GetEnumerator() | ForEach-Object {
                new-object -TypeName psobject -Property ([ordered] @{
                    FType = $_.Name
                    Program = $_.Value
                })
            }
            Write-Output -InputObject $ArrayOutput
        } else {
            Write-Output -InputObject $GetFtype
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
