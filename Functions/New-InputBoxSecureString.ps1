function New-InputBoxSecureString {
    <#
.SYNOPSIS
    Provides a GUI text entry box to enter a string and convert it to a securestring
.DESCRIPTION
    Provides a GUI text entry box to enter a string and convert it to a securestring. Function validates input and provides an input mask, both of which can be disabled.
.PARAMETER Title
    The title of the form. Defaults to 'New SecureString'
.PARAMETER DisableValidation
    Switch that will turn off the second entry box which ensures that data is input correctly.
.PARAMETER DisableInputMask
    Switch that will disable the input mask character which defaults to '*'
.PARAMETER Description
    The description block of the form. Defaults to 'Please enter the plain text you wish to be converted to a securestring'
.PARAMETER EntryBoxLabel
    The label block of the entry text input box. Defaults to 'Please enter the value'
.PARAMETER ValidateBoxLabel
    The label block of the entry text input box. Defaults to 'Please re-enter the value'
.EXAMPLE
    $SecureString = New-InputBoxSecureString

    Will display a form with 2 text entry fields that are masked with '*', and will verify the values match before converting to a securestring
.EXAMPLE
    $SecureString = New-InputBoxSecureString -Verbose
    VERBOSE: Starting [New-InputBoxSecureString]
    VERBOSE: Title [New SecureString]
    VERBOSE: Description [Please enter the plain text you wish to be converted to a securestring]
    VERBOSE: EntryBoxLabel [Please enter the value]
    VERBOSE: ValidateBoxLabel [Please re-enter the value]
    VERBOSE: DisableValidation [False], DisableInputMask [False]
    System.Security.SecureString
    VERBOSE: Ending [New-InputBoxSecureString]

    Will display a form with 2 text entry fields that are masked with '*', and will verify the values match before converting to a securestring
#>

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingConvertToSecureStringWithPlainText', '')]
    param (
        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'Validate')]
        [string] $Title = 'New SecureString',

        [Parameter(ParameterSetName = 'Validate')]
        [switch] $DisableValidation,

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'Validate')]
        [switch] $DisableInputMask,

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'Validate')]
        [string] $Description = 'Please enter the plain text you wish to be converted to a securestring',

        [Parameter(ParameterSetName = 'Default')]
        [Parameter(ParameterSetName = 'Validate')]
        [string] $EntryBoxLabel = 'Please enter the value',

        [Parameter(ParameterSetName = 'Validate')]
        [string] $ValidateBoxLabel = 'Please re-enter the value'
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        Write-Verbose -Message "Title [$Title]"
        Write-Verbose -Message "Description [$Description]"
        Write-Verbose -Message "EntryBoxLabel [$EntryBoxLabel]"
        Write-Verbose -Message "ValidateBoxLabel [$ValidateBoxLabel]"
        Write-Verbose -Message "DisableValidation [$DisableValidation], DisableInputMask [$DisableInputMask]"
        Add-Type -AssemblyName 'System.Windows.Forms'
        Add-Type -AssemblyName 'System.Drawing'
        $Font = 'Microsoft Sans Serif'

        #~~< ValidateEntry >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ValidateEntry = New-Object -TypeName System.Windows.Forms.Form
        $ValidateEntry.AutoSize = $true
        $ValidateEntry.ClientSize = New-Object -TypeName System.Drawing.Size -ArgumentList (300, 220)
        $ValidateEntry.Font = New-Object -TypeName System.Drawing.Font -ArgumentList ($Font, 12.0, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([byte](0)))
        $ValidateEntry.Text = $Title
        $ValidateEntry.AutoSize = $true
        $ValidateEntry.AutoSizeMode = 'GrowOnly'
        $ValidateEntry.Icon = (Join-Path -Path $Script:ModulePath -ChildPath 'PoshFunctions.ico')
        #~~< OKButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $OKButton = New-Object -TypeName System.Windows.Forms.Button
        $OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $OKButton.Font = New-Object -TypeName System.Drawing.Font -ArgumentList ($Font, 9.0, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([byte](0)))
        $OKButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (197, 12)
        $OKButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (75, 23)
        $OKButton.TabIndex = 2
        $OKButton.Text = 'OK'
        $OKButton.UseVisualStyleBackColor = $true
        $ValidateEntry.AcceptButton = $OKButton
        #~~< CancelButton >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $CancelButton = New-Object -TypeName System.Windows.Forms.Button
        $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
        $CancelButton.Font = New-Object -TypeName System.Drawing.Font -ArgumentList ($Font, 9.0, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([byte](0)))
        $CancelButton.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (197, 60)
        $CancelButton.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (75, 23)
        $CancelButton.TabIndex = 3
        $CancelButton.Text = 'Cancel'
        $CancelButton.UseVisualStyleBackColor = $true
        $ValidateEntry.CancelButton = $CancelButton
        #~~< EntryLabel >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $EntryLabel = New-Object -TypeName System.Windows.Forms.Label
        $EntryLabel.Font = New-Object -TypeName System.Drawing.Font -ArgumentList ($Font, 9.0, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([byte](0)))
        $EntryLabel.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 96)
        $EntryLabel.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (250, 39)
        $EntryLabel.Text = $EntryBoxLabel
        #~~< EntryBox >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $EntryBox = New-Object -TypeName System.Windows.Forms.TextBox
        $EntryBox.Font = New-Object -TypeName System.Drawing.Font -ArgumentList ($Font, 9.0, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([byte](0)))
        $EntryBox.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 138)
        $EntryBox.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (260, 24)
        $EntryBox.TabIndex = 0
        if (-not $DisableInputMask) {
            $EntryBox.PasswordChar = '*'
        }
        $EntryBox.Text = ''
        if (-not $DisableValidation) {
            $ValidateEntry.ClientSize = New-Object -TypeName System.Drawing.Size -ArgumentList (300, 260)
            #~~< ValidateLabel >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            $ValidateLabel = New-Object -TypeName System.Windows.Forms.Label
            $ValidateLabel.Font = New-Object -TypeName System.Drawing.Font -ArgumentList ($Font, 9.0, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([byte](0)))
            $ValidateLabel.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 175)
            $ValidateLabel.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (250, 53)
            #$ValidateLabel.TabIndex = 4
            $ValidateLabel.Text = $ValidateBoxLabel
            #~~< ValidateBox >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            $ValidateBox = New-Object -TypeName System.Windows.Forms.TextBox
            $ValidateBox.Font = New-Object -TypeName System.Drawing.Font -ArgumentList ($Font, 9.0, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([byte](0)))
            $ValidateBox.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 221)
            $ValidateBox.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (260, 24)
            $ValidateBox.TabIndex = 1
            if (-not $DisableInputMask) {
                $ValidateBox.PasswordChar = '*'
            }
            $ValidateBox.Text = ''
        }
        #~~< DescriptionLabel >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $DescriptionLabel = New-Object -TypeName System.Windows.Forms.Label
        $DescriptionLabel.Font = New-Object -TypeName System.Drawing.Font -ArgumentList ($Font, 9.0, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([byte](0)))
        $DescriptionLabel.Location = New-Object -TypeName System.Drawing.Point -ArgumentList (12, 12)
        $DescriptionLabel.Size = New-Object -TypeName System.Drawing.Size -ArgumentList (180, 200)
        #$DescriptionLabel.TabIndex = 6
        $DescriptionLabel.Text = $Description
        if (-not $DisableValidation) {
            $ValidateEntry.Controls.Add($ValidateBox)
            $ValidateEntry.Controls.Add($ValidateLabel)
        }
        $ValidateEntry.Controls.Add($EntryBox)
        $ValidateEntry.Controls.Add($EntryLabel)
        $ValidateEntry.Controls.Add($DescriptionLabel)
        $ValidateEntry.Controls.Add($CancelButton)
        $ValidateEntry.Controls.Add($OKButton)
    }

    process {
        [System.Windows.Forms.Application]::EnableVisualStyles()
        $Result = $ValidateEntry.ShowDialog()
        if ($Result -eq 'OK') {
            if (-not $DisableValidation) {
                if ($ValidateBox.Text -eq $EntryBox.Text) {
                    if ($EntryBox.Text.Length -eq 0) {
                        Write-Error -Message 'Must enter a string'
                        return
                    }
                } else {
                    Write-Error -Message 'Values do NOT match'
                    return
                }
            } else {
                   if ($EntryBox.Text.Length -eq 0) {
                        Write-Error -Message 'Must enter a string'
                        return
                    }
            }
            $ReturnVal = ConvertTo-SecureString -String $EntryBox.Text -AsPlainText -Force
            Write-Output -InputObject $ReturnVal
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}
