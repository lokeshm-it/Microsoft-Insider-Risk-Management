<#
.SYNOPSIS
    Produces a configuration readiness checklist for an Insider Risk Management deployment.

.DESCRIPTION
    Insider Risk Management does not expose a comprehensive PowerShell cmdlet set for
    reading policy/indicator/threshold configuration (this is managed primarily
    through the Microsoft Purview portal UI and Microsoft Graph security API).
    This script instead produces a structured, printable readiness checklist
    mirroring the validation performed manually in this project (see
    docs/Validation.md), intended to be run interactively by an administrator
    completing each item, or adapted to call the Microsoft Graph security API
    directly once API-based validation is required.

.PARAMETER PolicyName
    The display name of the Insider Risk Management policy being validated.

.EXAMPLE
    .\Validate-InsiderRiskConfiguration.ps1 -PolicyName "Data Leaks Insider Risk Policy"

.NOTES
    Author:  Lokesh Karnam
    Purpose: Microsoft Purview Insider Risk Management — Project 17
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$PolicyName = "Data Leaks Insider Risk Policy"
)

function Write-Log {
    param([string]$Message, [string]$Level = 'INFO')
    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Write-Host "[$timestamp] [$Level] $Message"
}

$checklist = [ordered]@{
    "Analytics enabled (tenant + user level)"                         = $null
    "Privacy / pseudonymization configured"                           = $null
    "Office indicators enabled"                                       = $null
    "Device indicators enabled"                                       = $null
    "Microsoft Defender for Endpoint indicators enabled"               = $null
    "Risky browsing indicators enabled"                                = $null
    "Intelligent detections (event threshold + alert volume) set"      = $null
    "Unallowed / third-party domains reviewed"                         = $null
    "Role groups assigned beyond base group"                           = $null
    "$PolicyName created from template"                                = $null
    "Policy scoped to correct users/groups/adaptive scopes"            = $null
    "Content prioritization configured (sites, labels, SITs)"          = $null
    "Triggering event and thresholds configured"                       = $null
    "Sequence detection reviewed"                                      = $null
    "Policy reaches Healthy status"                                    = $null
    "Activity scoring started for at least one test user"              = $null
    "Alert generation confirmed post-scoring"                          = $null
}

Write-Log "Insider Risk Management Configuration Readiness Checklist for policy: $PolicyName"
Write-Log "Answer each item interactively (Y/N). Press Enter to skip and leave unanswered."
Write-Host ""

foreach ($item in $($checklist.Keys)) {
    $response = Read-Host "  [ ] $item (Y/N)"
    $checklist[$item] = switch ($response.ToUpper()) {
        'Y' { 'Pass' }
        'N' { 'Fail' }
        default { 'Not Answered' }
    }
}

Write-Host ""
Write-Log "----- Readiness Summary -----"
$checklist.GetEnumerator() | ForEach-Object {
    $status = $_.Value
    $level = switch ($status) { 'Pass' { 'SUCCESS' } 'Fail' { 'WARN' } default { 'INFO' } }
    Write-Log ("{0,-65} : {1}" -f $_.Key, $status) $level
}

$failCount = ($checklist.Values | Where-Object { $_ -eq 'Fail' }).Count
$unansweredCount = ($checklist.Values | Where-Object { $_ -eq 'Not Answered' }).Count

Write-Host ""
if ($failCount -eq 0 -and $unansweredCount -eq 0) {
    Write-Log "All checklist items passed. Policy is ready to be considered production-validated." "SUCCESS"
}
else {
    Write-Log "$failCount item(s) failed and $unansweredCount item(s) were not answered. Resolve these before treating '$PolicyName' as production-ready." "WARN"
}
