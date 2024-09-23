function Get-VssWriter {
    <#
.SYNOPSIS
    Runs 'vssadmin.exe list writers' and parses the output into objects
.DESCRIPTION
    Runs 'vssadmin.exe list writers' and parses the output into objects
.EXAMPLE
    Get-VssWriter | Where-Object { $_.VssWriter -eq 'Registry Writer' }

    VssWriter                                     WriterID                                  WriterInstanceID                          State                       LastError
    ---------                                     --------                                  ----------------                          -----                       ---------
    Registry Writer                               {afbab4a2-367d-4d15-a586-71dbb18f8485}    {195b1f2f-5656-435e-aee9-6fe0176cbc9a}    [1] Stable                  No error
.EXAMPLE
    Get-VssWriter | Sort-Object VssWriter | Format-Table -AutoSize

    VssWriter                                   WriterID                               WriterInstanceID                       State      LastError
    ---------                                   --------                               ----------------                       -----      ---------
    ASR Writer                                  {be000cbe-11fe-4426-9c58-531aa6355fc4} {4c458a4a-27fc-488a-803c-a8bc88fdd81c} [1] Stable No error
    COM+ REGDB Writer                           {542da469-d3e1-473c-9f4f-7847f01fc64f} {04994869-2c48-4d6b-9ed1-f1a387fee203} [1] Stable No error
    MSSearch Service Writer                     {cd3f2362-8bef-46c7-9181-d62844cdc0b2} {fb018048-30e2-4ac2-a782-1f35b6aa4144} [1] Stable No error
    Performance Counters Writer                 {0bada1de-01a9-4625-8278-69e735f39dd2} {f0086dda-9efc-47c5-8eb6-a944c3d09381} [1] Stable No error
    Registry Writer                             {afbab4a2-367d-4d15-a586-71dbb18f8485} {195b1f2f-5656-435e-aee9-6fe0176cbc9a} [1] Stable No error
    Sentinel Agent Database VSS Writer          {abd005ca-6bfc-44c9-a439-8eb665a676b3} {38ff3a5d-b009-4eea-b0b1-05305e5989b3} [1] Stable No error
    Sentinel Agent DFI Research Data VSS Writer {dcf8278a-dc0f-4b35-afd0-37a07e92fe90} {28c14077-87a8-4a43-aa6b-f911472d6713} [1] Stable No error
    Sentinel Agent Log VSS Writer               {90e12c7e-b9c2-4649-81a2-947d06dd5eba} {90b938e4-cdec-4bc2-85fa-cfbdbf476ff8} [1] Stable No error
    Sentinel Agent Research Data VSS Writer     {9112a876-c17f-4051-b2c3-43f646cde241} {c6c04642-9d79-4257-a070-31cae2cbfc7b} [1] Stable No error
    Shadow Copy Optimization Writer             {4dc3bdd4-ab48-4d07-adb0-3bee2926fd7f} {759b41f1-a6de-4637-bc7e-6620564029e3} [1] Stable No error
    System Writer                               {e8132975-6f93-4464-a53e-1050253ae220} {22bacb18-2047-458f-90c1-68cd07cc26d4} [1] Stable No error
    Task Scheduler Writer                       {d61d61c8-d73a-4eee-8cdd-f6f9786b7124} {1bddd48e-5052-49db-9b07-b96f96727e6b} [1] Stable No error
    VSS Metadata Store Writer                   {75dfb225-e2e4-4d39-9ac9-ffaff65ddf06} {088e7a7d-09a8-4cc6-a609-ad90e75ddc93} [1] Stable No error
    WMI Writer                                  {a6ad56c2-b509-4e6c-bb19-49d8f43532f0} {1dc2f3f0-60ea-4307-9124-74d69e3a1af1} [1] Stable No error
.NOTES
    Added PSTypeName       = 'PFVSSAdminWriter' to [pscustomobject] so it can be handled by formatting file
#>

    [CmdletBinding(ConfirmImpact = 'None')]
    [Alias('Get-VssadminListWriters')] #FunctionAlias
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    param()

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
        if (-not (Test-IsAdmin)) {
            Write-Error -Message 'This function cannot be run because it must be running as Administrator. The current Windows PowerShell session is not running as Administrator. Start Windows PowerShell by using the Run as Administrator option, and then try running the function again.'
            break
        }
    }

    process {
        $vss = vssadmin.exe list writers

        for ($i = 0; $i -lt $vss.count; $i++) {
            switch -Regex ($vss[$i]) {
                '^Writer name:' {
                    $writer = $vss[$i].Substring(13) -replace "'"
                    break
                }
                '^   Writer Id:' {
                    $writerid = $vss[$i].Substring(14)
                    break
                }
                '^   Writer Instance Id:' {
                    $writerinstanceid = $vss[$i].Substring(23)
                    break
                }
                '^   State:' {
                    $state = $vss[$i].Substring(10)
                    break
                }
                '^   Last error:' {
                    $lasterror = $vss[$i].Substring(15)
                    [PSCustomObject] @{
                        PSTypeName       = 'PFVSSAdminWriter'
                        VssWriter        = $writer
                        WriterID         = $writerid
                        WriterInstanceID = $writerinstanceid
                        State            = $state
                        LastError        = $lasterror
                    }
                    break
                }
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
