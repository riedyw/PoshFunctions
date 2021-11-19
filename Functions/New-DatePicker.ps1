function New-DatePicker {
    <#
.SYNOPSIS
    Provides a GUI representation of a calendar where you select a date. Click OK or press [Enter] to return the date selected. If click Cancel or press [Esc] $null is returned.
.DESCRIPTION
    Provides a GUI representation of a calendar where you select a date. Click OK or press [Enter] to return the date selected. If click Cancel or press [Esc] $null is returned.
.PARAMETER Title
    The title of the form. Defaults to 'Select a date'
.PARAMETER IncludeTime
    Switch to include time as part of the picker. Format is 'ddd MM/dd/yyyy HH:mm' where MM represents the 2 digit month (01-12), HH represents the hour using a 24 hour clock (00-23) and mm represents the 2 digit minute (00-59). Seconds are truncated to 00.
.PARAMETER Date
    Default datetime value for the dialog box
.NOTES
    If -IncludeTime is not specified the time is truncated to midnight (the zero hour) of the day selected.
.EXAMPLE
    New-DatePicker -Title 'This is my custom title' -Verbose
    VERBOSE: Starting [New-DatePicker]
    VERBOSE: Title [This is my custom title]

    Tuesday, August 3, 2021 12:00:00 AM
    VERBOSE: Ending [New-DatePicker]
.EXAMPLE
    New-DatePicker -Verbose
    VERBOSE: Starting [New-DatePicker]
    VERBOSE: Title [Select a date]

    Tuesday, August 3, 2021 12:00:00 AM
    VERBOSE: Ending [New-DatePicker]
.EXAMPLE
    New-DatePicker -IncludeTime

    Wednesday, August 4, 2021 4:55:00 PM
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [OutputType('datetime')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    param (
        [Parameter(Position = 0)]
        [string] $Title = 'Select a date',

        [switch] $IncludeTime,

        [datetime] $Date
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "Title [$Title]"
        Add-Type -AssemblyName 'System.Windows.Forms'
        Add-Type -AssemblyName 'System.Drawing'

        #~~< DatePicker >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $DatePicker = New-Object -TypeName System.Windows.Forms.Form
        $DatePicker.ClientSize = New-Object -TypeName System.Drawing.Size -ArgumentList (460, 262)
        $DatePicker.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Fixed3D
        $DatePicker.Text = $Title
        $DatePicker.AutoSize = $true
        $DatePicker.AutoSizeMode = 'GrowOnly'
        #~~< OKButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $OKButton = New-Object -TypeName System.Windows.Forms.Button
        $OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $OKButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (362, 31)
        $OKButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (75, 23)
        $OKButton.TabIndex = 1
        $OKButton.Text = 'OK'
        $OKButton.UseVisualStyleBackColor = $true
        $DatePicker.AcceptButton = $OKButton
        #~~< CancelButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $CancelButton = New-Object -TypeName System.Windows.Forms.Button
        $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
        $CancelButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (362, 73)
        $CancelButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (75, 23)
        $CancelButton.TabIndex = 2
        $CancelButton.Text = 'Cancel'
        $CancelButton.UseVisualStyleBackColor = $true
        $DatePicker.CancelButton = $CancelButton
        #~~< DateTimePicker >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $DateTimePicker = New-Object -TypeName System.Windows.Forms.DateTimePicker
        $DateTimePicker.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (30, 32)
        $DateTimePicker.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (264, 22)
        $DateTimePicker.TabIndex = 0
        $DatePicker.Controls.Add($CancelButton)
        $DatePicker.Controls.Add($OKButton)
        $DatePicker.Controls.Add($DateTimePicker)

        #region myCustomFormCode
        $DatePicker.AutoSize = $true
        $DatePicker.AutoSizeMode = 'GrowOnly'
        $DatePicker.Font = [System.Drawing.SystemFonts]::get_MessageBoxFont()
        $OKButton.Font = [System.Drawing.SystemFonts]::get_MessageBoxFont()
        $CancelButton.Font = [System.Drawing.SystemFonts]::get_MessageBoxFont()
        if ($Script:ModulePath) {
            $DatePicker.Icon = (Join-Path -Path $Script:ModulePath -ChildPath 'Resources\PoshFunctions.ico')
        }

        if ($IncludeTime) {
            $DateTimePicker.Format = [System.Windows.Forms.DateTimePickerFormat]::Custom
            $DateTimePicker.CustomFormat = 'ddd MM/dd/yyyy HH:mm'
        }
        if ($Date) {
            $DateTimePicker.Value = $Date
        }
        #endregion

    }

    process {
        [System.Windows.Forms.Application]::EnableVisualStyles()
        $Result = $DatePicker.ShowDialog()
        if ($Result -eq 'OK') {
            if ($IncludeTime) {
                $DateTimePicker.Value = Get-Date -Date $DateTimePicker.Value -Second 0 -Millisecond 0
            } else {
                $DateTimePicker.Value = Get-Date -Date $DateTimePicker.Value -Hour 0 -Minute 0 -Second 0 -Millisecond 0
            }
            $DateTimePicker.Value
        }

    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
