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
        [int] $B = 0
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        #region Form Creation
        #~~< ColorForm >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorForm = New-Object -TypeName System.Windows.Forms.Form
        $ColorForm.ClientSize = New-Object -TypeName System.Drawing.Size -ArgumentList (358, 336)
        $ColorForm.Text = 'Select color'
        $ColorForm.Font = New-Object -TypeName System.Drawing.Font -ArgumentList ('Segoe UI', 10.0, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([byte](0)))
        $ColorForm.AutoSize = $true
        $ColorForm.AutoSizeMode = 'GrowOnly'
        $ColorForm.Icon = (Join-Path -Path $Script:ModulePath -ChildPath 'PoshFunctions.ico')
        #~~< OKButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $OKButton = New-Object -TypeName System.Windows.Forms.Button
        $OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $OKButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (232, 80)
        $OKButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100, 23)
        $OKButton.TabIndex = 4
        $OKButton.Text = 'Return result'
        $OKButton.UseVisualStyleBackColor = $true
        $ColorForm.AcceptButton = $OKButton
        #~~< CancelButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $CancelButton = New-Object -TypeName System.Windows.Forms.Button
        $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
        $CancelButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (232, 138)
        $CancelButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100, 23)
        $CancelButton.TabIndex = 5
        $CancelButton.Text = 'Cancel'
        $CancelButton.UseVisualStyleBackColor = $true
        $ColorForm.CancelButton = $CancelButton
        #~~< ResultLabel >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ResultLabel = New-Object -TypeName System.Windows.Forms.Label
        $ResultLabel.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 226)
        $ResultLabel.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (197, 23)
        $ResultLabel.Text = 'Resulting color expression'
        #~~< ColorTextBox >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorTextBox = New-Object -TypeName System.Windows.Forms.TextBox
        $ColorTextBox.Enabled = $false
        $ColorTextBox.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (13, 252)
        $ColorTextBox.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (199, 20)
        $ColorTextBox.Text = ''
        #~~< FormDescription >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $FormDescription = New-Object -TypeName System.Windows.Forms.Label
        $FormDescription.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 13)
        $FormDescription.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (200, 23)
        $FormDescription.Text = 'Please select the color result type'
        #~~< RgbStringRB >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $RgbStringRB = New-Object -TypeName System.Windows.Forms.RadioButton
        $RgbStringRB.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (27, 168)
        $RgbStringRB.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (104, 24)
        $RgbStringRB.Text = 'RGB String'
        $RgbStringRB.TabIndex = 2
        $RgbStringRB.UseVisualStyleBackColor = $true
        $RgbStringRb.add_Click( { Show-Result -object ($RgbStringRb) })
        #~~< RgbRb >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $RgbRb = New-Object -TypeName System.Windows.Forms.RadioButton
        $RgbRb.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (27, 120)
        $RgbRb.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (104, 24)
        $RgbRb.Text = 'R,G,B'
        $RgbRb.TabIndex = 1
        $RgbRb.UseVisualStyleBackColor = $true
        $RgbRb.add_Click( { Show-Result -object ($RgbRb) })
        #~~< HexRb >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $HexRb = New-Object -TypeName System.Windows.Forms.RadioButton
        $HexRb.Checked = $true
        $HexRb.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (27, 80)
        $HexRb.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (104, 24)
        $HexRb.Text = 'Hex'
        $HexRb.TabIndex = 0
        $HexRb.TabStop = $true
        $HexRb.UseVisualStyleBackColor = $true
        $HexRb.add_Click( { Show-Result -object ($HexRb) })
        #~~< ColorResult >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorResult = New-Object -TypeName System.Windows.Forms.GroupBox
        $ColorResult.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 56)
        $ColorResult.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (200, 141)
        $ColorResult.Text = 'Select Color Result'
        $ColorResult.Controls.Add($HexRb)
        $ColorResult.Controls.Add($RgbRb)
        $ColorResult.Controls.Add($RgbStringRB)
        #~~< ColorButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorButton = New-Object -TypeName System.Windows.Forms.Button
        $ColorButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (232, 26)
        $ColorButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100, 23)
        $ColorButton.TabIndex = 3
        $ColorButton.Text = 'Color Dialog'
        $ColorButton.UseVisualStyleBackColor = $true
        $ColorButton.add_Click( { Select-ColorButton -R ([ref] $R) -G ([ref] $G) -B ([ref] $B) })
        #~~< PictureBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $PictureBox1 = New-Object -TypeName System.Windows.Forms.PictureBox
        $PictureBox1.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (232, 221)
        $PictureBox1.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (100, 50)
        $PictureBox1.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
        $PictureBox1.TabStop = $false
        $PictureBox1.Text = ''
        #~~< Add controls >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorForm.Controls.Add($ResultLabel)
        $ColorForm.Controls.Add($ColorTextBox)
        $ColorForm.Controls.Add($CancelButton)
        $ColorForm.Controls.Add($OKButton)
        $ColorForm.Controls.Add($FormDescription)
        $ColorForm.Controls.Add($RgbStringRB)
        $ColorForm.Controls.Add($RgbRb)
        $ColorForm.Controls.Add($HexRb)
        $ColorForm.Controls.Add($ColorButton)
        $ColorForm.Controls.Add($ColorResult)
        $ColorForm.Controls.Add($PictureBox1)
        $ColorForm.add_Load( { $ColorTextBox.Text = '{0:X2}{1:X2}{2:X2}' -f $R, $G, $B })
        #~~< ColorDialog >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ColorDialog = New-Object -TypeName System.Windows.Forms.ColorDialog
        $ColorDialog.ShowHelp = $false
        #endregion

        function Show-Result {
            [CmdletBinding()]
            [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', '')]
            param (
                $object
            )
            if ($HexRb.Checked) {
                $ColorTextBox.Text = '{0:X2}{1:X2}{2:X2}' -f $R, $G, $B
            } elseif ($RgbRb.Checked) {
                $ColorTextBox.Text = 'R={0}, G={1}, B={2}' -f $R, $G, $B
            } else {
                $ColorTextBox.Text = '{0},{1},{2}' -f $R, $G, $B
            }
        }

        function Select-ColorButton {
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
                $PictureBox1.BackColor = [System.Drawing.Color]::FromArgb($R.Value, $G.Value, $B.Value)
                if ($HexRb.Checked) {
                    $ColorTextBox.Text = '{0:X2}{1:X2}{2:X2}' -f $R.Value, $G.Value, $B.Value
                } elseif ($RgbRb.Checked) {
                    $ColorTextBox.Text = 'R={0}, G={1}, B={2}' -f $R.Value, $G.Value, $B.Value
                } else {
                    $ColorTextBox.Text = '{0},{1},{2}' -f $R.Value, $G.Value, $B.Value
                }
            }
        }
    }

    process {
        Write-Verbose -Message "R [$R] G [$G] B [$B]"
        [System.Windows.Forms.Application]::EnableVisualStyles()
        $PictureBox1.BackColor = [System.Drawing.Color]::FromArgb($R, $G, $B)
        $Result = $ColorForm.ShowDialog()
        if ($Result -eq 'OK') {
            if ($HexRb.Checked) {
                Write-Output -InputObject ('{0:X2}{1:X2}{2:X2}' -f $R, $G, $B)
            } elseif ($RgbRb.Checked) {
                New-Object -TypeName psobject -Property ([ordered] @{
                        R = $R
                        G = $G
                        B = $B
                    })
            } else {
                Write-Output -InputObject ('{0},{1},{2}' -f $R, $G, $B)
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
