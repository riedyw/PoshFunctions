function New-ScreenShot {
<#
.SYNOPSIS
    To take a screenshot and save it to a file.
.DESCRIPTION
    To take a screenshot and save it to a file.
.PARAMETER Path
    The path to the file being saved.
.PARAMETER Full
    A switch to determine if you are taking a screenshot of the full desktop or
    just the active window.
.PARAMETER Passthru
    A switch determining if the screenshot image will be passed down the pipeline.
.EXAMPLE
    New-ScreenShot -Path .\Screenshot.bmp -Full -Passthru

    Taking a full screenshot of the desktop and saving it to .\Screenshot.bmp
#>

    [CmdletBinding(SupportsShouldProcess,ConfirmImpact='Low')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments','')]
    Param(
        [Parameter(Position=0,Mandatory,HelpMessage='Enter the path and filename')]
        [ValidateNotNullorEmpty()]
        [ValidateScript({
            #verify the folder exists
            $folder = Split-Path -Path $_
            #Validation differs depending on whether v2 or v3
            if ($PSVersionTable.psversion -eq '2.0') {
                Test-Path -Path $folder
            } else {
                if (! (Test-Path -Path $folder)) {
                    #write a custom error message for v3
                    throw "ERROR: Can't verify that [$folder] exists."
                } else {
                    $true
                }
            }
        })]
        [string] $Path,

        [switch] $Full,

        [switch] $Passthru
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        $obj = New-Object -ComObject WScript.Shell
    }

    process {
        if ($host.Runspace.ApartmentState -ne 'STA') {
            Write-Warning -Message 'You must run this in a PowerShell session with an apartment state of STA'
            break
        }

        #load the necessary assemblies
        Add-Type -AssemblyName 'System.Drawing','System.Windows.Forms'

        if ($Full) {
            #capture the full desktop
            [Windows.Forms.Sendkeys]::SendWait('{PrtSc}')
        }
        else {
            #capture the current window
            [Windows.Forms.Sendkeys]::SendWait('%{PrtSc}')
        }

        #pause enough to give time for the capture to take place
        Start-Sleep -Milliseconds 250

        #create bitmap object from the screenshot
        $bitmap = [Windows.Forms.Clipboard]::GetImage()

        #split off the file extension and use it as the type
        [string] $filename=Split-Path -Path $Path -Leaf
        [string] $FileExtension= $Filename.Split('.')[1].Trim()

        #get the right format value based on the file extension
        switch ($FileExtension) {
            'png'  {$FileType=[System.Drawing.Imaging.ImageFormat]::Png}
            'bmp'  {$FileType=[System.Drawing.Imaging.ImageFormat]::Bmp}
            'gif'  {$FileType=[System.Drawing.Imaging.ImageFormat]::Gif}
            'emf'  {$FileType=[System.Drawing.Imaging.ImageFormat]::Emf}
            'jpg'  {$FileType=[System.Drawing.Imaging.ImageFormat]::Jpeg}
            'tiff' {$FileType=[System.Drawing.Imaging.ImageFormat]::Tiff}
            'wmf'  {$FileType=[System.Drawing.Imaging.ImageFormat]::Wmf}
            'exif' {$FileType=[System.Drawing.Imaging.ImageFormat]::Exif}

            default {
                Write-Warning -Message 'Failed to find a valid graphic file type'
                $FileType=$False
            }
        } #switch

        #Save the file if a valid file type was determined
        if ($FileType) {
            if ($PSCmdlet.ShouldProcess($path)) {
                try {
                    $bitmap.Save($Path.Trim(),$FileType)
                    if ($Passthru) {
                        #write the file object to the pipeline
                        Get-Item -Path $Path.Trim()
                    } #if $passthru
                } #try
                catch {
                    Write-Warning -Message "Failed to save screen capture. $($_.Exception.Message)"
                } #catch
            } #if shouldprocess
        } #if $filetype

        #clear the clipboard
        # [Windows.Forms.Clipboard]::Clear()
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
