# Source: https://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
# get-help about_ISE-Color-Theme-Cmdlets for more information

Function Export-ISEThemeFile {
<#
.SYNOPSIS
    Exports an ISE theme to an xml file

.DESCRIPTION
    Exports an ISE theme to an xml file and saves in the registry
    if SaveToISE is passed

.PARAMETER RegistryTheme
    Optionally supply an ISE theme name to export that theme

.PARAMETER SaveToISE
    After exporting, save the theme to the registry

.EXAMPLE
    PS C:\> Export-ISEThemeFile -ISETheme "Monokai"

    Exports ISE theme to an xml file

.EXAMPLE
    PS C:\> Export-ISEThemeFile -SaveToISE

    Exports the current ISE theme and saves it in the ISE for future reference

.NOTES
    Part of the ISEColorThemeCmdlets.ps1 Script by Jeff Pollock
    http://Lifeinpowerhsell.blogspot.com
    http://gallery.technet.microsoft.com/ISE-Color-Theme-Cmdlets-24905f9e
#>

[CmdletBinding(ConfirmImpact='Low')]
    Param(
        [Parameter(ValueFromPipeline,ValueFromPipelinebyPropertyName)]
        [string] $ISETheme,

        [Parameter(ValueFromPipeline,ValueFromPipelinebyPropertyName)]
        [switch] $SaveToISE
    )

    begin{}

    process {
        # Determine whether exporting current theme or a saved theme
        If ($ISETheme) {
            $Theme = Get-ISETheme -ThemeName $ISETheme
            $XmlTheme = $Theme
        } Else {
            $XmlTheme = Get-CurrentISETheme
        }

        # Set the File Name
        $FilePath = Get-SaveFile -Filter 'ISE Theme| *.StorableColorTheme.ps1xml|All files|*.*'

        # # Trim the extension if found
        # If ($FilePath.Length -gt  26) {
            # If ($FilePath.Substring($FilePath.Length - 26) -ieq ".StorableColorTheme.ps1xml") {
                # $FilePath = $FilePath.Substring(0,$FilePath.Length - 26)
            # }
        # }

        # # Set ThemeName for ISE import
        # $ThemeName = $FilePath.Substring($FilePath.LastIndexOf("\") + 1)
        # # Set file extension
        # $FilePath = "$FilePath.StorableColorTheme.ps1xml"

        # Create The Document
        $XmlWriter = New-Object -TypeName System.XMl.XmlTextWriter -ArgumentList ($filePath,[Text.Encoding]::Unicode)

        # Set The Formatting
        $xmlWriter.Formatting = 'Indented'
        $xmlWriter.Indentation = '4'

        # Write the XML Decleration
        $xmlWriter.WriteStartDocument()

        # Write Root Element
        $xmlWriter.WriteStartElement('StorableColorTheme')
        $XmlWriter.WriteAttributeString('xmlns:xsd','http://www.w3.org/2001/XMLSchema')
        $XmlWriter.WriteAttributeString('xmlns:xsi','http://www.w3.org/2001/XMLSchema-instance')

        # Write Keys
        $xmlWriter.WriteStartElement('Keys')
        ForEach ($Attribute in $XmlTheme) {
            #Write Base Colors Keys
            If ($Attribute.Class -eq 'Base') {
                $xmlWriter.WriteElementString('string',$Attribute.Attribute)
            }

            # Write TokenColors Keys
            If ($Attribute.Class -eq 'TokenColors') {
                $xmlWriter.WriteElementString('string',"TokenColors\$($Attribute.Attribute)")
            }

            # Write ConsoleTokenColors Keys
            If ($Attribute.Class -eq 'ConsoleTokenColors') {
                $xmlWriter.WriteElementString('string',"ConsoleTokenColors\$($Attribute.Attribute)")
            }

            # Write XmlTokenColors Keys
            If ($Attribute.Class -eq 'XmlTokenColors') {
                $xmlWriter.WriteElementString('string',"XmlTokenColors\$($Attribute.Attribute)")
            }
        }
        $xmlWriter.WriteEndElement() # <-- Closing Keys

        # Write Values
        $xmlWriter.WriteStartElement('Values')

        ForEach ($Attribute in $XmlTheme) {
            # Write Base Colors Values
            If ($Attribute.Class -eq 'Base') {
                $xmlWriter.WriteStartElement('Color')
                $xmlWriter.WriteElementString('A',$Attribute.A)
                $xmlWriter.WriteElementString('R',$Attribute.R)
                $xmlWriter.WriteElementString('G',$Attribute.G)
                $xmlWriter.WriteElementString('B',$Attribute.B)
                $xmlWriter.WriteEndElement() # <-- Closing Color
            }

            # Write TokenColors Values
            If ($Attribute.Class -eq 'TokenColors') {
                $xmlWriter.WriteStartElement('Color')
                $xmlWriter.WriteElementString('A',$Attribute.A)
                $xmlWriter.WriteElementString('R',$Attribute.R)
                $xmlWriter.WriteElementString('G',$Attribute.G)
                $xmlWriter.WriteElementString('B',$Attribute.B)
                $xmlWriter.WriteEndElement() # <-- Closing Color
            }

            # Write ConsoleTokenColors Values
            If ($Attribute.Class -eq 'ConsoleTokenColors') {
                $xmlWriter.WriteStartElement('Color')
                $xmlWriter.WriteElementString('A',$Attribute.A)
                $xmlWriter.WriteElementString('R',$Attribute.R)
                $xmlWriter.WriteElementString('G',$Attribute.G)
                $xmlWriter.WriteElementString('B',$Attribute.B)
                $xmlWriter.WriteEndElement() # <-- Closing Color
            }

            # Write XmlTokenColors Values
            If ($Attribute.Class -eq 'XmlTokenColors') {
                $xmlWriter.WriteStartElement('Color')
                $xmlWriter.WriteElementString('A',$Attribute.A)
                $xmlWriter.WriteElementString('R',$Attribute.R)
                $xmlWriter.WriteElementString('G',$Attribute.G)
                $xmlWriter.WriteElementString('B',$Attribute.B)
                $xmlWriter.WriteEndElement() # <-- Closing Color
            }
         }
         $xmlWriter.WriteEndElement() # <-- Closing Values

        #Write Name and Font Attribu
        If ($Attribute.Class -eq 'Other') {
            $xmlWriter.WriteElementString('Name',$ThemeName)
            $xmlWriter.WriteElementString('FontFamily',$Attribute.FontFamily)
            $xmlWriter.WriteElementString('FontSize',$Attribute.FontSize)
        }

        # Write Close Tag for Root Element
        $xmlWriter.WriteEndElement() # <-- Closing StorableColorTheme

        # End the XML Document
        $xmlWriter.WriteEndDocument()

        # Finish The Document
        $xmlWriter.Finalize
        $xmlWriter.Flush | out-null
        $xmlWriter.Close()

        If ($SaveToISE) {
            Import-ISEThemeFile -FileName $FilePath
        }
    }

    end{}

} #end function Import-ISEThemeFile
