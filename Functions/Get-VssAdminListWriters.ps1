function Get-VssadminListWriters {
    <#
.SYNOPSIS
    Runs 'vssadmin.exe list writers' and parses the output into objects
.DESCRIPTION
    Runs 'vssadmin.exe list writers' and parses the output into objects
.EXAMPLE
    Get-VssadminListWriters | Where-Object { $_.Writer -eq 'Registry Writer' }

    Writer           : Registry Writer
    WriterID         : {afbab4a2-367d-4d15-a586-71dbb18f8485}
    WriterInstanceID : {c9081102-4fc6-45f9-a90e-b0ded03e1215}
    State            : [1] Stable
    LastError        : No error
.EXAMPLE
    Get-VssadminListWriters | Sort-Object Writer | Format-Table -AutoSize

    Writer                          WriterID                               WriterInstanceID                       State      LastError
    ------                          --------                               ----------------                       -----      ---------
    ASR Writer                      {be000cbe-11fe-4426-9c58-531aa6355fc4} {8b373ea3-83ab-4642-a2b5-f7ddede48292} [1] Stable No error
    BITS Writer                     {4969d978-be47-48b0-b100-f328f07ac1e0} {6a004930-b70c-4ff7-8020-d17ea85bdf11} [1] Stable No error
    COM+ REGDB Writer               {542da469-d3e1-473c-9f4f-7847f01fc64f} {f0fa025d-070c-4db7-8160-9a9df75fffc5} [1] Stable No error
    IIS Config Writer               {2a40fd15-dfca-4aa8-a654-1f8c654603f6} {32051351-0f94-414f-990b-b111b8fbda6e} [1] Stable No error
    IIS Metabase Writer             {59b1f0cf-90ef-465f-9609-6ca8b2938366} {11705c72-42a3-45a9-bb1d-52eb3c7b230d} [1] Stable No error
    MSSearch Service Writer         {cd3f2362-8bef-46c7-9181-d62844cdc0b2} {04e79a73-76c9-4373-8a95-a40f197a11b3} [1] Stable No error
    Performance Counters Writer     {0bada1de-01a9-4625-8278-69e735f39dd2} {f0086dda-9efc-47c5-8eb6-a944c3d09381} [1] Stable No error
    Registry Writer                 {afbab4a2-367d-4d15-a586-71dbb18f8485} {c9081102-4fc6-45f9-a90e-b0ded03e1215} [1] Stable No error
    Shadow Copy Optimization Writer {4dc3bdd4-ab48-4d07-adb0-3bee2926fd7f} {feb88c59-d0a2-4208-b59b-2cdaf7fff0b8} [1] Stable No error
    SqlServerWriter                 {a65faa63-5ea8-4ebc-9dbd-a0c4db26912a} {1e247a69-0781-4c5a-b4c2-8f87c195eea4} [1] Stable No error
    System Writer                   {e8132975-6f93-4464-a53e-1050253ae220} {3361d3ed-064c-4be8-aca9-f9e1faff0428} [1] Stable No error
    Task Scheduler Writer           {d61d61c8-d73a-4eee-8cdd-f6f9786b7124} {1bddd48e-5052-49db-9b07-b96f96727e6b} [1] Stable No error
    VSS Metadata Store Writer       {75dfb225-e2e4-4d39-9ac9-ffaff65ddf06} {088e7a7d-09a8-4cc6-a609-ad90e75ddc93} [1] Stable No error
    WMI Writer                      {a6ad56c2-b509-4e6c-bb19-49d8f43532f0} {891f28b0-0e51-4e96-936a-01a06107552a} [1] Stable No error
.NOTES
    Added PSTypeName       = 'PFVSSAdminWriter' to [pscustomobject] so it can be handled by formatting file
#>

    [CmdletBinding(ConfirmImpact = 'None')]
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
                        Writer           = $writer
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
