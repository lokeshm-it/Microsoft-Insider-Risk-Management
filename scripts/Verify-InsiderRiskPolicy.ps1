<#
.SYNOPSIS
    Verifies Microsoft Purview Insider Risk Management role group readiness.

.DESCRIPTION
    Retrieves membership for the core Insider Risk Management role groups
    (base group, Admins, Analysts, Investigators, Approvers, Auditors, Session
    Approvers) and flags any group with zero assigned users — directly surfacing
    the type of gap identified in this project (only the base group had an
    assigned user, and the Policies page displayed a warning that alerts could
    not be viewed by the current session).

    This script assumes an active Security & Compliance PowerShell session
    (see Connect-SecurityComplianceCenter.ps1).

.EXAMPLE
    .\Verify-InsiderRiskPolicy.ps1

.NOTES
    Author:  Lokesh Karnam
    Purpose: Microsoft Purview Insider Risk Management — Project 17
    Requires: Active Security & Compliance PowerShell session
#>

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

function Write-Log {
    param([string]$Message, [string]$Level = 'INFO')
    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Write-Host "[$timestamp] [$Level] $Message"
}

$roleGroups = @(
    "Insider Risk Management",
    "Insider Risk Management Admins",
    "Insider Risk Management Analysts",
    "Insider Risk Management Approvers",
    "Insider Risk Management Auditors",
    "Insider Risk Management Investigators",
    "Insider Risk Management Session Approvers"
)

try {
    Write-Log "Verifying Insider Risk Management role group membership..."

    $results = foreach ($group in $roleGroups) {
        try {
            $members = Get-RoleGroupMember -Identity $group -ErrorAction Stop
            [PSCustomObject]@{
                RoleGroup   = $group
                MemberCount = ($members | Measure-Object).Count
                Members     = ($members.Name -join ', ')
            }
        }
        catch {
            Write-Log "Could not query role group '$group': $($_.Exception.Message)" "WARN"
            [PSCustomObject]@{
                RoleGroup   = $group
                MemberCount = -1
                Members     = "ERROR"
            }
        }
    }

    $results | Format-Table -AutoSize | Out-String | Write-Host

    $emptyGroups = $results | Where-Object { $_.MemberCount -eq 0 }
    if ($emptyGroups) {
        Write-Log "WARNING: The following role groups have zero assigned users. Alert visibility, investigation, and approval workflows may be blocked until membership is assigned:" "WARN"
        $emptyGroups | ForEach-Object { Write-Log " - $($_.RoleGroup)" "WARN" }
    }
    else {
        Write-Log "All checked role groups have at least one assigned member." "SUCCESS"
    }

    $baseGroup = $results | Where-Object { $_.RoleGroup -eq "Insider Risk Management" }
    if ($baseGroup -and $baseGroup.MemberCount -gt 0 -and ($emptyGroups | Where-Object { $_.RoleGroup -ne "Insider Risk Management" })) {
        Write-Log "NOTE: Only the base 'Insider Risk Management' group has assigned members. Consider assigning users to the more granular groups (Analysts, Investigators, Approvers, Auditors) to enforce least-privilege access." "WARN"
    }
}
catch {
    Write-Log "Verification failed: $($_.Exception.Message)" "ERROR"
    throw
}
