function New-LocalAdmin {
    if (Test-IsAdmin) {
        #
        # Modify LocalAdmin and PasswordPlainText to desired values
        $LocalAdmin = 'tagadmin'
        $PasswordPlaintext = 'Mtt^S$R9j3)3'
        $PasswordSecureString = $PasswordPlaintext | ConvertTo-SecureString -AsPlainText -Force
        $UserParam = @{
            Name                 = $LocalAdmin
            AccountNeverExpires  = $true
            PasswordNeverExpires = $true
            Description          = 'Local admin for TAG Solutions'
            Password             = $PasswordSecureString
        }
        if (-not (Get-LocalUser -Name $LocalAdmin -ea SilentlyContinue)) {
            New-LocalUser @UserParam
        } else {
            Set-LocalUser @UserParam
        }
        if (-not (Get-LocalGroupMember -Group administrators -Member $LocalAdmin -ea SilentlyContinue)) {
            Add-LocalGroupMember -Group administrators -Member $LocalAdmin
        }

    } else {
        Write-Error 'Not running from an elevated session. Please run as Administrator.'
    }

}
