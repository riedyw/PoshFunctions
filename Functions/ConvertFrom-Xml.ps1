function ConvertFrom-XML {
<#
.SYNOPSIS
    Convert XML to an object
.DESCRIPTION
    Convert XML to an object
.PARAMETER XML
    The XML that you want converted
.EXAMPLE
    [xml] $xml = @'
<?xml version="1.0" encoding="utf-8"?>
<Objects>
<Object Type="System.Management.Automation.PSCustomObject">
    <Property Name="ComputerName" Type="System.String">DemoLaptop</Property>
    <Property Name="Path" Type="System.String">c:\Temp</Property>
    <Property Name="UNCPath" Type="System.String">\\DemoLaptop\c$\Temp</Property>
</Object>
</Objects>
'@

    ConvertFrom-XML -XML $xml

    Would return
    ComputerName Path    UNCPath
    ------------ ----    -------
    DemoLaptop   c:\Temp \\DemoLaptop\c$\Temp
.NOTES
    Only tested with single level XML content. Not tested with hierarchical XML content.
#>

[CmdletBinding(ConfirmImpact='None')]
    param
    (
        [xml] $XML
    )
    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($Object in @($XML.Objects.Object)) {
            $PSObject = New-Object -TypeName PSObject
            foreach ($Property in @($Object.Property)) {
                $PSObject | Add-Member -membertype NoteProperty -name $Property.Name -value $Property.InnerText
            }
            Write-Output -InputObject $PSObject
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
