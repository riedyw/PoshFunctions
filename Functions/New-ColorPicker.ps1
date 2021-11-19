function New-ColorPicker {
    <#
.SYNOPSIS
    Present a dialog to the user and allow them to select or define a color. User can choose how the color will be returned.
.DESCRIPTION
    Present a dialog to the user and allow them to select or define a color. User can choose how the color will be returned.
.PARAMETER R
    The Red color value. Defaults to '0'. Valid range 0-255. Can be passed from the pipeline by property name.
.PARAMETER G
    The Green color value. Defaults to '0'. Valid range 0-255. Can be passed from the pipeline by property name.
.PARAMETER B
    The Blue color value. Defaults to '0'. Valid range 0-255. Can be passed from the pipeline by property name.
.PARAMETER AsHashTable
    Switch that will present the results of 'R,G,B' as a hashtable as opposed to a psobject
.EXAMPLE
    New-ColorPicker -R 20 -G 45 -B 255

    Will present the user with a color dialog pre-populated with 23, 45, 255
.EXAMPLE
    New-ColorPicker -verbose

    VERBOSE: Starting [New-ColorPicker]
    VERBOSE: R [0] G [0] B [0]

    VERBOSE: Ending [New-ColorPicker]
    R   G   B
    -   -   -
    0 128 192

    Assuming that they entered the color 0, 128, 192 and selected 'Rgb' as the output type.
.NOTES
    The user can select how the result will be returned to them:

    * Hex       - where the color will be returned as 6 hexadecimal characters in the form: 'RRGGBB'

    * RgbString - where the color will be returned as 3 integers separated by a comman 'R,G,B'

    * Rgb       - where the color will returned as a psobject with 3 properties: R, G, B

    If the user selects 'Cancel' from the dialog box no value is returned.
#>

    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseOutputTypeCorrectly', '')]
    param (
        [Parameter(Position = 0, ValueFromPipelineByPropertyName)]
        [ValidateRange(0, 255)]
        [Alias('Red')]
        [int] $R = 0,

        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [ValidateRange(0, 255)]
        [Alias('Green')]
        [int] $G = 0,

        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [ValidateRange(0, 255)]
        [Alias('Blue')]
        [int] $B = 0,

        [switch] $AsHashTable
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        #region Form Creation
        #Warning: It is recommended that changes inside this region be handled using the ScriptForm Designer.
        #When working with the ScriptForm designer this region and any changes within may be overwritten.
        #~~< ColorPicker >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorPicker = New-Object -TypeName System.Windows.Forms.Form
        $ColorPicker.ClientSize = New-Object -TypeName System.Drawing.Size -ArgumentList (420, 400)
        $ColorPicker.Text = 'Select color'
        #~~< OKButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $OKButton = New-Object -TypeName System.Windows.Forms.Button
        $OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $OKButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (300, 73)
        $OKButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100, 23)
        $OKButton.TabIndex = 5
        $OKButton.Text = 'OK'
        $OKButton.UseVisualStyleBackColor = $true
        $ColorPicker.AcceptButton = $OKButton
        #~~< CancelButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $CancelButton = New-Object -TypeName System.Windows.Forms.Button
        $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
        $CancelButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (300, 131)
        $CancelButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100, 23)
        $CancelButton.TabIndex = 6
        $CancelButton.Text = 'Cancel'
        $CancelButton.UseVisualStyleBackColor = $true
        $ColorPicker.CancelButton = $CancelButton
        #~~< AsHashCheck >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $AsHashCheck = New-Object -TypeName System.Windows.Forms.CheckBox
        $AsHashCheck.Enabled = $false
        $AsHashCheck.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (180, 100)
        $AsHashCheck.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (104, 24)
        $AsHashCheck.TabIndex = 11
        $AsHashCheck.Text = 'As hashtable'
        $AsHashCheck.UseVisualStyleBackColor = $true
        #~~< PictureBox >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $PictureBox = New-Object -TypeName System.Windows.Forms.PictureBox
        $PictureBox.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
        $PictureBox.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (232, 289)
        $PictureBox.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (75, 75)
        $PictureBox.TabIndex = 10
        $PictureBox.TabStop = $false
        $PictureBox.Text = ''
        $PictureBox.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32](([System.Byte](224)))), ([System.Int32](([System.Byte](224)))), ([System.Int32](([System.Byte](224)))))
        #~~< ResultLabel >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ResultLabel = New-Object -TypeName System.Windows.Forms.Label
        $ResultLabel.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 294)
        $ResultLabel.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (197, 23)
        $ResultLabel.TabIndex = 9
        $ResultLabel.Text = 'Resulting color expression'
        #~~< ColorTextBox >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorTextBox = New-Object -TypeName System.Windows.Forms.TextBox
        $ColorTextBox.Enabled = $false
        $ColorTextBox.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (13, 320)
        $ColorTextBox.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (199, 20)
        $ColorTextBox.TabIndex = 8
        $ColorTextBox.Text = ''
        #~~< DescriptionLabel >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $DescriptionLabel = New-Object -TypeName System.Windows.Forms.Label
        $DescriptionLabel.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 13)
        $DescriptionLabel.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (200, 23)
        $DescriptionLabel.TabIndex = 5
        $DescriptionLabel.Text = 'Please select the color result type'
        #~~< ColorButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorButton = New-Object -TypeName System.Windows.Forms.Button
        $ColorButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (300, 19)
        $ColorButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100, 23)
        $ColorButton.TabIndex = 0
        $ColorButton.Text = 'Color Dialog'
        $ColorButton.UseVisualStyleBackColor = $true
        #~~< ColorResult >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorResult = New-Object -TypeName System.Windows.Forms.GroupBox
        $ColorResult.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (13, 39)
        $ColorResult.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (149, 203)
        $ColorResult.TabIndex = 4
        $ColorResult.TabStop = $false
        $ColorResult.Text = 'Select Color Result'
        #~~< HexRb >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $HexRb = New-Object -TypeName System.Windows.Forms.RadioButton
        $HexRb.Checked = $true
        $HexRb.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (15, 30)
        $HexRb.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (104, 24)
        $HexRb.TabIndex = 1
        $HexRb.TabStop = $true
        $HexRb.Text = 'Hex'
        $HexRb.UseVisualStyleBackColor = $true
        #~~< RgbStringRB >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $RgbStringRB = New-Object -TypeName System.Windows.Forms.RadioButton
        $RgbStringRB.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (15, 110)
        $RgbStringRB.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (104, 24)
        $RgbStringRB.TabIndex = 3
        $RgbStringRB.Text = 'RGB String'
        $RgbStringRB.UseVisualStyleBackColor = $true
        #~~< ColorObjectRb >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorObjectRb = New-Object -TypeName System.Windows.Forms.RadioButton
        $ColorObjectRb.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (15, 150)
        $ColorObjectRb.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (104, 24)
        $ColorObjectRb.TabIndex = 5
        $ColorObjectRb.TabStop = $true
        $ColorObjectRb.Text = 'Color object'
        $ColorObjectRb.UseVisualStyleBackColor = $true
        #~~< RgbRb >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $RgbRb = New-Object -TypeName System.Windows.Forms.RadioButton
        $RgbRb.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (15, 70)
        $RgbRb.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (104, 24)
        $RgbRb.TabIndex = 2
        $RgbRb.Text = 'R,G,B'
        $RgbRb.UseVisualStyleBackColor = $true
        $ColorResult.Controls.Add($HexRb)
        $ColorResult.Controls.Add($RgbStringRB)
        $ColorResult.Controls.Add($ColorObjectRb)
        $ColorResult.Controls.Add($RgbRb)
        $ColorPicker.Controls.Add($AsHashCheck)
        $ColorPicker.Controls.Add($PictureBox)
        $ColorPicker.Controls.Add($ResultLabel)
        $ColorPicker.Controls.Add($ColorTextBox)
        $ColorPicker.Controls.Add($CancelButton)
        $ColorPicker.Controls.Add($OKButton)
        $ColorPicker.Controls.Add($DescriptionLabel)
        $ColorPicker.Controls.Add($ColorButton)
        $ColorPicker.Controls.Add($ColorResult)
        #~~< ColorDialog >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorDialog = New-Object -TypeName System.Windows.Forms.ColorDialog
        $ColorDialog.ShowHelp = $true

        #endregion

        #region myCustomFormCode
        $ColorPicker.AutoSize = $true
        $ColorPicker.AutoSizeMode = 'GrowOnly'
        $ColorPicker.Font = [System.Drawing.SystemFonts]::get_MessageBoxFont()
        if ($Script:ModulePath) {
            $ColorPicker.Icon = (Join-Path -Path $Script:ModulePath -ChildPath 'Resources\PoshFunctions.ico')
        }
        $ColorPicker.add_Load( { $ColorTextBox.Text = '{0:X2}{1:X2}{2:X2}' -f $R, $G, $B })
        $ColorButton.add_Click( { Select-ColorButton -R ([ref] $R) -G ([ref] $G) -B ([ref] $B) })
        $RgbStringRb.add_Click( { Show-Result -object ($RgbStringRb) })
        $ColorObjectRb.add_Click( { Show-Result -object ($ColorObjectRb) })
        $RgbRb.add_Click( { Show-Result -object ($RgbRb) })
        $HexRb.add_Click( { Show-Result -object ($HexRb) })
        $AsHashCheck.Checked = $AsHashTable
        #endregion

        function Show-Result {
            [CmdletBinding()]
            [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
            param (
                $object
            )
            if ($HexRb.Checked) {
                $AsHashCheck.Enabled = $false
                $ColorTextBox.Text = '{0:X2}{1:X2}{2:X2}' -f $R, $G, $B
            } elseif ($RgbRb.Checked) {
                $AsHashCheck.Enabled = $true
                $ColorTextBox.Text = 'R={0}, G={1}, B={2}' -f $R, $G, $B
            } elseif ($RgbStringRB.Checked) {
                $AsHashCheck.Enabled = $false
                $ColorTextBox.Text = '{0},{1},{2}' -f $R, $G, $B
            } else {
                $AsHashCheck.Enabled = $false
                $ColorTextBox.Text = 'Color object'
            }
        }

        function Select-ColorButton {
            [CmdletBinding()]
            param
            (
                [ref] $R,

                [ref] $G,

                [ref] $B
            )
            $ColorDialog.Color = [System.Drawing.Color]::FromArgb($R.Value, $G.Value, $B.Value)
            $ColorResult = $ColorDialog.ShowDialog()
            if ($ColorResult -eq 'OK') {
                $R.Value = $ColorDialog.Color.R
                $G.Value = $ColorDialog.Color.G
                $B.Value = $ColorDialog.Color.B
                $PictureBox.BackColor = [System.Drawing.Color]::FromArgb($R.Value, $G.Value, $B.Value)
                if ($HexRb.Checked) {
                    $ColorTextBox.Text = '{0:X2}{1:X2}{2:X2}' -f $R.Value, $G.Value, $B.Value
                } elseif ($RgbRb.Checked) {
                    $ColorTextBox.Text = 'R={0}, G={1}, B={2}' -f $R.Value, $G.Value, $B.Value
                } elseif ($RgbStringRB.Checked) {
                    $ColorTextBox.Text = '{0},{1},{2}' -f $R.Value, $G.Value, $B.Value
                } else {
                    $ColorTextBox.Text = 'Color Object'
                }
            }
        }
    }

    process {
        Write-Verbose -Message "R [$R] G [$G] B [$B] AsHashTable [$AsHashTable]"
        [System.Windows.Forms.Application]::EnableVisualStyles()
        $PictureBox.BackColor = [System.Drawing.Color]::FromArgb($R, $G, $B)
        $Result = $ColorPicker.ShowDialog()
        if ($Result -eq 'OK') {
            if ($HexRb.Checked) {
                Write-Output -InputObject ('{0:X2}{1:X2}{2:X2}' -f $R, $G, $B)
            } elseif ($RgbRb.Checked) {
                if ($AsHashCheck.Checked) {
                    ([ordered] @{
                            R = $R
                            G = $G
                            B = $B
                        })
                } else {
                    New-Object -TypeName psobject -Property ([ordered] @{
                            R = $R
                            G = $G
                            B = $B
                        })
                }
            } elseif ($RgbStringRB.Checked) {
                Write-Output -InputObject ('{0},{1},{2}' -f $R, $G, $B)
            } else {
                Write-Output -InputObject $ColorDialog.Color
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
