function New-FontPicker {
    <#
.SYNOPSIS
    Present a dialog to the user and allow them to select a font and its characteristics
.DESCRIPTION
    Present a dialog to the user and allow them to select a font and its characteristics
.EXAMPLE
    New-FontPicker

    Will present the user with a font dialog and return the following if Arial 18 point italic was selected:

    FontFamily       : [FontFamily: Name=Arial]
    Bold             : False
    GdiCharSet       : 0
    GdiVerticalFont  : False
    Italic           : True
    Name             : Arial
    OriginalFontName :
    Strikeout        : False
    Underline        : False
    Style            : Italic
    Size             : 18
    SizeInPoints     : 18
    Unit             : Point
    Height           : 28
    IsSystemFont     : False
    SystemFontName   :
.NOTES
    If the user selects 'Cancel' from the dialog box no value is returned.
#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    param (

    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        #~~< FontPicker >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $FontPicker = New-Object -TypeName System.Windows.Forms.Form
        $FontPicker.ClientSize = New-Object -TypeName System.Drawing.Size -ArgumentList (496, 204)
        $FontPicker.Font = New-Object -TypeName System.Drawing.Font -ArgumentList ('Segoe UI', 10.0, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([byte](0)))
        $FontPicker.Text = 'Font Picker'
        $FontPicker.AutoSize = $true
        $FontPicker.AutoSizeMode = 'GrowOnly'
        $FontPicker.Icon = (Join-Path -Path $Script:ModulePath -ChildPath 'Resources\PoshFunctions.ico')
        #~~< OKButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $OKButton = New-Object -TypeName System.Windows.Forms.Button
        $OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $OKButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (389, 69)
        $OKButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (95, 23)
        $OKButton.TabIndex = 1
        $OKButton.Text = 'OK'
        $OKButton.UseVisualStyleBackColor = $true
        $FontPicker.AcceptButton = $OKButton
        #~~< CancelButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $CancelButton = New-Object -TypeName System.Windows.Forms.Button
        $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
        $CancelButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (389, 125)
        $CancelButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (95, 23)
        $CancelButton.TabIndex = 2
        $CancelButton.Text = 'Cancel'
        $CancelButton.UseVisualStyleBackColor = $true
        $FontPicker.CancelButton = $CancelButton
        #~~< ItalicsCheck >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ItalicsCheck = New-Object -TypeName System.Windows.Forms.CheckBox
        $ItalicsCheck.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (261, 153)
        $ItalicsCheck.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (104, 24)
        $ItalicsCheck.TabIndex = 10
        $ItalicsCheck.Text = 'Italic'
        $ItalicsCheck.Enabled = $false
        $ItalicsCheck.UseVisualStyleBackColor = $true
        #~~< BoldCheck >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $BoldCheck = New-Object -TypeName System.Windows.Forms.CheckBox
        $BoldCheck.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (261, 100)
        $BoldCheck.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (104, 24)
        $BoldCheck.TabIndex = 9
        $BoldCheck.Text = 'Bold'
        $BoldCheck.Enabled = $false
        $BoldCheck.UseVisualStyleBackColor = $true
        #~~< StyleText >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $StyleText = New-Object -TypeName System.Windows.Forms.TextBox
        $StyleText.Enabled = $false
        $StyleText.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (13, 156)
        $StyleText.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (161, 21)
        $StyleText.TabIndex = 8
        $StyleText.TabStop = $false
        $StyleText.Text = ''
        #~~< StyleLabel >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $StyleLabel = New-Object -TypeName System.Windows.Forms.Label
        $StyleLabel.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 130)
        $StyleLabel.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100, 23)
        $StyleLabel.TabIndex = 7
        $StyleLabel.Text = 'Style'
        #~~< SizeText >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $SizeText = New-Object -TypeName System.Windows.Forms.TextBox
        $SizeText.Enabled = $false
        $SizeText.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 100)
        $SizeText.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (60, 21)
        $SizeText.TabIndex = 6
        $SizeText.TabStop = $false
        $SizeText.Text = ''
        #~~< SizeLabel >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $SizeLabel = New-Object -TypeName System.Windows.Forms.Label
        $SizeLabel.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 74)
        $SizeLabel.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100, 23)
        $SizeLabel.TabIndex = 5
        $SizeLabel.Text = 'Font size'
        #~~< NameText >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $NameText = New-Object -TypeName System.Windows.Forms.TextBox
        $NameText.Enabled = $false
        $NameText.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (13, 42)
        $NameText.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (312, 21)
        $NameText.TabIndex = 4
        $NameText.TabStop = $false
        $NameText.Text = ''
        #~~< NameLabel >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $NameLabel = New-Object -TypeName System.Windows.Forms.Label
        $NameLabel.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (13, 25)
        $NameLabel.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100, 23)
        $NameLabel.TabIndex = 3
        $NameLabel.Text = 'Font name'
        #~~< FontButon >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $FontButon = New-Object -TypeName System.Windows.Forms.Button
        $FontButon.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (389, 21)
        $FontButon.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (95, 23)
        $FontButon.TabIndex = 0
        $FontButon.Text = 'Font dialog'
        $FontButon.UseVisualStyleBackColor = $true
        $FontButon.add_Click( { FontButonClick -object ($FontButon) })
        $FontPicker.Controls.Add($ItalicsCheck)
        $FontPicker.Controls.Add($BoldCheck)
        $FontPicker.Controls.Add($StyleText)
        $FontPicker.Controls.Add($StyleLabel)
        $FontPicker.Controls.Add($SizeText)
        $FontPicker.Controls.Add($SizeLabel)
        $FontPicker.Controls.Add($NameText)
        $FontPicker.Controls.Add($NameLabel)
        $FontPicker.Controls.Add($CancelButton)
        $FontPicker.Controls.Add($OKButton)
        $FontPicker.Controls.Add($FontButon)
        $FontPicker.add_Load( { FormLoad -object ($FontPicker) })
        #~~< FontDialog >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $FontDialog = New-Object -TypeName System.Windows.Forms.FontDialog
        $FontDialog.ShowHelp = $true

        function FontButonClick {
            [CmdletBinding()]
            [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
            param
            (
                $object
            )
            $FontResult = $FontDialog.ShowDialog()
            if ($FontResult -eq 'OK') {
                $NameText.Text = $FontDialog.Font.Name
                $SizeText.Text = $FontDialog.Font.Size
                $StyleText.Text = $FontDialog.Font.Style
                $BoldCheck.Checked = $FontDialog.Font.Bold
                $ItalicsCheck.Checked = $FontDialog.Font.Italic
            }
        }
        function FormLoad {
            [CmdletBinding()]
            [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
            param
            (
                $object
            )
            $NameText.Text = $FontDialog.Font.Name
            $SizeText.Text = $FontDialog.Font.Size
            $StyleText.Text = $FontDialog.Font.Style
            $BoldCheck.Checked = $FontDialog.Font.Bold
            $ItalicsCheck.Checked = $FontDialog.Font.Italic
        }
    }

    process {
        [System.Windows.Forms.Application]::EnableVisualStyles()
        $Result = $FontPicker.ShowDialog()
        if ($Result -eq 'OK') {
            Write-Output -InputObject $FontDialog.Font
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
