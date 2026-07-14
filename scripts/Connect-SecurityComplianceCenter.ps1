<#
.SYNOPSIS
    Connects to Security & Compliance PowerShell for Microsoft Purview Insider Risk
    Management administration.

.DESCRIPTION
    Establishes a modern-auth connection to Security & Compliance PowerShell
    (IPPSSession) using the ExchangeOnlineManagement module. This connection is a
    prerequisite for role group verification cmdlets used in this repository
    (Get-RoleGroupMember, Get-RoleGroup) against Insider Risk Management role groups.

    Note: Insider Risk Management policies, indicators, and alerts are primarily
    managed through the Microsoft Purview portal UI and Microsoft Graph security API.
    Security & Compliance PowerShell's role in this workflow is limited to
    role-group and general compliance-portal connectivity verification.

.PARAMETER UserPrincipalName
    The UPN of the account used to connect (must hold Compliance Administrator,
    Global Administrator, or an equivalent Insider Risk Management admin role).

.EXAMPLE
    .\Connect-SecurityComplianceCenter.ps1 -UserPrincipalName admin@securem365lsb.onmicrosoft.com

.NOTES
    Author:  Lokesh Karnam
    Purpose: Microsoft Purview Insider Risk Management — Project 17
    Requires: ExchangeOnlineManagement module (Install-Module ExchangeOnlineManagement)
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, HelpMessage = "UPN of the admin account used to connect to Security & Compliance PowerShell")]
    [ValidateNotNullOrEmpty()]
    [string]$UserPrincipalName
)

$ErrorActionPreference = 'Stop'

function Write-Log {
    param([string]$Message, [string]$Level = 'INFO')
    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Write-Host "[$timestamp] [$Level] $Message"
}

try {
    Write-Log "Checking for the ExchangeOnlineManagement module..."

    if (-not (Get-Module -ListAvailable -Name ExchangeOnlineManagement)) {
        Write-Log "ExchangeOnlineManagement module not found. Installing for the current user..." "WARN"
        Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser -Force -AllowClobber
    }
    else {
        Write-Log "ExchangeOnlineManagement module is already installed."
    }

    Write-Log "Importing ExchangeOnlineManagement module..."
    Import-Module ExchangeOnlineManagement -ErrorAction Stop

    Write-Log "Connecting to Security & Compliance PowerShell as '$UserPrincipalName'. A sign-in prompt will appear..."
    Connect-IPPSSession -UserPrincipalName $UserPrincipalName

    Write-Log "Successfully connected to Security & Compliance PowerShell." "SUCCESS"
    Write-Log "You can now run role group cmdlets such as Get-RoleGroupMember and Get-RoleGroup against Insider Risk Management role groups."
}
catch {
    Write-Log "Failed to connect to Security & Compliance PowerShell: $($_.Exception.Message)" "ERROR"
    throw
}
