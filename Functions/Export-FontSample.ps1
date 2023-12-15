function Export-FontSample {
<#
.SYNOPSIS
    Exports an HTML file containing sample text formatted in all the fonts installed on the current system.
.DESCRIPTION
    Exports an HTML file containing sample text formatted in all the fonts installed on the current system.
.PARAMETER Path
    The path to the file that you want the font sample exported to. If the file does not end in either '.htm', or '.html' then an extension of '.htm' will be added to the file.
    Defaults to the filename FontSample.htm in the path specified by $env:TEMP
.PARAMETER Text
    Sample text that you want to displayed in the HTML file. Defaults to the string array:
    @( 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
       'abcdefghijklmnopqrstuvwxyz',
       '1234567890',
        '!@#$%^&*()&#91;&#93;&#123;&#125;-_=+ &cent;&pound;',
        '&gamma;&delta;&theta;&lambda;&xi;&pi;&sigma;&upsilon;&psi;&omega;'
    )
.PARAMETER Quiet
    Switch to produce no output to the PowerShell session
.PARAMETER Show
    Switch to open the produced HTML file with the default browser
.EXAMPLE
    Export-FontSample
#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseBOMForUnicodeEncodedFile','')]
    param(
        [Alias('FileName')]
        [string] $Path = (Join-Path -Path $env:TEMP -ChildPath 'FontSample.htm'),

        [string[]] $Text =     @(
               'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
               'abcdefghijklmnopqrstuvwxyz',
               '1234567890',
               '!@#$%^&*()&#91;&#93;&#123;&#125;-_=+ &cent;&pound;',
               '&gamma;&delta;&theta;&lambda;&xi;&pi;&sigma;&upsilon;&psi;&omega;'
            ),

        [switch] $Quiet,

        [switch] $Show
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if ($Path -notmatch '\.html?$') {
            Write-Verbose -Message "[$Path] does not end with extension .htm or .html"
            $Path = $Path + '.htm'
        }
        Write-Verbose -Message "Text specified was [$($Text -join ' ')]"
    }

    process {
        $FontsInstalled = Get-Font -Verbose:$false
        Write-Verbose -Message "There are [$($FontsInstalled.Count)] fonts installed."
        $HtmlStart = @"
<html>
<head>
<meta content="text/html; charset=ISO-8859-1"
http-equiv="content-type">
<title>$Path</title>
</head>
<body>
<h1>Font Sample</h1>
<p>Font sample created from the list of installed fonts on this computer.
Font names are listed twice: </p>
<ul>
<li>Once in Arial</li>
<li>Once in that particular font.</li>
</ul>
<p>There will be a sample text that was either specified via the -Text parameter or
a sample set which includes upper case English
alphabet, lower case English alphabet, numbers 0-9, a small sample
of commonly used symbols, and several Greek letters.</p>
"@

        $HtmlEnd = @'
</body>
</html>
'@

        # create HTML
        $Result = $FontsInstalled |
            ForEach-Object -begin { $strHTML = New-Object -Type 'System.Collections.Arraylist' } -process {
                $tmpString = "<p><font style=`"font-family: Helvetica,Arial,sans-serif;`" size=`"4`">[{0}] / </font><font size=`"4`" face=`"{0}`">[{0}]</font><br/>" -f ($_)
                $null = $strHTML.Add( $tmpString )
                #$tmpString = "<font size=`"4`" face=`"{0}`">[{0}]</font><br/>" -f ($_)
                #$strHTML += $tmpString
                $tmpString = "<font size=`"3`" face=`"{0}`"> {1}</font></p>" -f ($_), ($Text -join ' ')
                $null = $strHTML.Add($tmpString)
            } -end {$strHTML}

        $HtmlFile = $HtmlStart + ($Result | Out-String -Width 1024) + $HtmlEnd

        # write HTML
        Set-Content -Path $Path -Value $HtmlFile
        if (-not $Quiet) {
            Write-Output -InputObject "HTML saved to [$Path]"
        }
        if ($Show) {
            Invoke-Item -Path $Path
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
} # EndFunction Export-FontSample
