# Implementation Guide — Microsoft Purview Insider Risk Management

Full step-by-step configuration guide covering all 30 screenshots (AP01-AP30). Every step includes purpose, procedure, explanation of every visible option, why it matters, what happens with a different selection, prerequisites, licensing notes, best practice, and expected result.

## Configuration Workflow

Every step below is backed by a specific screenshot. No configuration is described that is not visible in the referenced image; where a setting could not be confirmed, it is explicitly noted.

------------------------------------------------------

## Step 1
### Navigate to Insider Risk Management from the Microsoft Purview Solutions Menu

**Purpose**

Insider Risk Management is one of several Microsoft Purview compliance solutions. This step establishes the entry point into the solution and confirms it is provisioned in the tenant alongside related solutions such as Communication Compliance, Data Loss Prevention, and Data Security Investigations.

**Procedure**

1. Sign in to the Microsoft Purview portal.
2. Select **Solutions** in the left navigation.
3. In the Solutions flyout, locate and select **Insider Risk Management**.

**Image:**
AP01 (`01-Microsoft-Purview-Solutions-Overview.png`)

**Caption:**
Figure 17.1 – Microsoft Purview Solutions Menu Showing Insider Risk Management

**Explanation**

The Solutions flyout lists every provisioned Purview solution alphabetically: Audit, Communication Compliance, Compliance Alerts, Compliance Manager, Data Catalog, Data Lifecycle Management, Data Loss Prevention, Data Security Investigations, Data Security Posture Management (classic), DSPM, DSPM for AI (classic), eDiscovery, Information Barriers, Information Protection, **Insider Risk Management**, and Records Management. The presence of Insider Risk Management in this list confirms the solution is available to the signed-in administrator, though it does not by itself confirm licensing — a user without the correct license may still see the tile but be blocked from configuring policies.

**Why this configuration matters**

Confirming solution visibility is the first checkpoint before any deeper configuration. If Insider Risk Management were missing from this list, the root cause would typically be licensing or role assignment, not a configuration defect within the solution itself.

**Best Practice**

Bookmark the direct Insider Risk Management URL for repeat administrative access rather than navigating through the Solutions menu each time, and verify the signed-in account holds an appropriate role group (see Step 13) before assuming full access.

**Expected Result**

Selecting **Insider Risk Management** loads the solution's **Overview** page.

------------------------------------------------------

## Step 2
### Review the Insider Risk Management Overview Page and Recommended Actions

**Purpose**

The Overview page is a guided checklist that Microsoft surfaces to help an administrator move from an empty configuration to a working policy. Reviewing it first establishes a complete, ordered task list for the remainder of this project.

**Procedure**

1. On the Insider Risk Management **Overview** tab, review the **"admin365 lab, here are your top recommended actions"** panel.
2. Note the five listed actions and their required/optional and time-to-complete metadata.
3. Review the **User summary** panel beneath it.

**Image:**
AP02 (`02-Insider-Risk-Management-Overview.png`)

**Caption:**
Figure 17.2 – Insider Risk Management Overview and Recommended Actions

**Explanation**

Five actions are listed:

| Action | Required/Optional | Time to Complete | Status |
|---|---|---|---|
| Turn on analytics to scan for potential risks | Optional | 48 hours | Completed (green check) |
| Get to know insider risk management | Optional | 10 min | Not started |
| Configure insider risk settings | Required | 10 min | Not started |
| Create your first policy | Required | 5 min | Not started |
| Make sure your team can get their jobs done (assign role groups) | Required | 10 min | Not started |

The **User summary** panel shows **"No policy data found"** / **"No data available at this moment"**, confirming this is a fresh, unconfigured tenant instance at the start of this project.

**Why this configuration matters**

Turning on analytics first (already completed here) is what powers the "Get to know your organization" insights used later to recommend indicator thresholds automatically (see Step 27). Completing the three "Required" actions (settings, policy, role groups) is the minimum bar for a functioning deployment.

**Best Practice**

Follow Microsoft's recommended action order rather than jumping directly to policy creation — analytics must be running before threshold recommendations in later steps (Step 24, Step 27) can be meaningfully accurate.

**Expected Result**

An ordered, trackable checklist is available to guide the remaining configuration.

------------------------------------------------------

## Step 3
### Review the Full Recommendations List (Setup and Fine-Tuned Detection)

**Purpose**

Beyond the five headline actions, Microsoft Purview surfaces a longer backlog of recommended actions grouped by maturity stage. Reviewing this full list sets expectations for what a mature Insider Risk Management deployment includes beyond this project's initial scope.

**Procedure**

1. Select **Recommendations** in the left navigation.
2. Review the **Not started (16)** / **Completed (1)** counters.
3. Toggle **Show completed actions** on.
4. Review the **Setup** table and the **Fine-tuned detection** table.

**Image:**
AP03 (`03-Insider-Risk-Recommendations-Setup.png`)

**Caption:**
Figure 17.3 – Insider Risk Management Recommendations: Setup and Fine-Tuned Detection

**Explanation**

The **Setup** table repeats the five actions from Step 2, confirming **Turn on analytics to scan for potential risks** as the only Completed item at this stage. The **Fine-tuned detection** table introduces two additional, optional post-setup actions: **Explore best practices for tuning alerts** and **Manage policy exclusions** (preventing policies from detecting activity tied to specific file types, paths, keywords, or SharePoint sites).

**Why this configuration matters**

Policy exclusions and alert-tuning best practices are typically second-phase activities performed after a policy has been running long enough to generate a baseline of alerts — attempting to tune exclusions before any alert history exists risks suppressing legitimate signal prematurely.

**Best Practice**

Treat "Fine-tuned detection" items as a 30–60 day post-launch review activity, not a day-one task.

**Expected Result**

A complete backlog of setup and tuning actions is visible and trackable from a single pane.

------------------------------------------------------

## Step 4
### Review Comprehensive Protection and Extended Integration Recommendations

**Purpose**

This step captures Microsoft's guidance for scaling Insider Risk Management beyond a single policy — including domain-based risk scoring, priority users, multi-cloud coverage, custom indicators, physical asset protection, Adaptive Protection, and Microsoft Defender XDR integration.

**Procedure**

1. Continue scrolling the **Recommendations** page below the Setup and Fine-tuned detection tables.
2. Review the **Comprehensive protection** table.
3. Review the **Extended integration** table.

**Image:**
AP04 (`04-Insider-Risk-Recommendations-Protection.png`)

**Caption:**
Figure 17.4 – Insider Risk Management Recommendations: Comprehensive Protection and Extended Integration

**Explanation**

**Comprehensive protection** actions include: Add allowed and unallowed domains; Detect activity from priority users; Tune policies using real-time analytics (preview); Detect activity across multiple cloud apps; Make sure your policies cover all users; Create and use custom indicators; Detect activity from priority physical assets. **Extended integration** actions include: Set up Adaptive Protection (combines Insider Risk Management with DLP to dynamically minimize risky activity) and Share insider risk data with Microsoft Defender XDR (preview), which integrates insider risk signals and alerts into the Microsoft Defender portal for a unified investigation view. All items in both tables show **Not started** in this lab.

**Why this configuration matters**

Adaptive Protection and Defender XDR integration represent the natural maturity path after this project's baseline Data Leaks policy is stable — they are **not configured in this lab** and should not be assumed present.

**Best Practice**

Sequence Adaptive Protection and Defender XDR sharing after the core policy (this project) has produced a stable volume of validated alerts, to avoid dynamically escalating DLP enforcement based on an unproven risk model.

**Expected Result**

A full roadmap of advanced capabilities is documented for future phases; none were enabled in this lab.

------------------------------------------------------

## Step 5
### Configure Insider Risk Management Analytics Settings

**Purpose**

Analytics settings determine whether Insider Risk Management scans the tenant for potential risk activity and at what aggregation level (tenant vs. individual user) those insights are surfaced.

**Procedure**

1. Navigate to **Settings → Insider Risk Management**.
2. Select the **Analytics** tab under Solution settings.
3. Review the description of what scanning does.
4. Confirm **Show insights at tenant level** is toggled **On**.
5. Confirm **Show insights at user level** is toggled **On**.
6. Select **Save** if changes were made.

**Image:**
AP05 (`05-Analytics-Settings.png`)

**Caption:**
Figure 17.5 – Insider Risk Management Analytics Settings

**Explanation**

Both toggles — **Show insights at tenant level** and **Show insights at user level** — are set to **On**. Tenant-level insights aggregate data for Analytics reports; user-level insights aggregate into the Data Loss Prevention, Communication Compliance, and Microsoft Defender user activity summary, along with Advanced Hunting tables, and require **Data sharing** to also be enabled. The portal explicitly flags a privacy consideration: administrators can choose the aggregation level shown to balance investigative usefulness against user privacy.

**Why this configuration matters**

Turning off tenant-level insights would prevent the "Get to know your organization" analytics report from populating, which in turn prevents Microsoft from recommending user-activity-based thresholds later in the policy wizard (see Step 27). Turning off user-level insights would limit cross-solution correlation (DLP, Communication Compliance, Defender) at the individual user level.

**If another option were selected**

If both toggles were turned **Off**, the tenant would receive no proactive analytics scan, and the "Turn on analytics" recommended action (Step 2) would remain incomplete — policies could still be created manually, but without analytics-informed threshold recommendations.

**Prerequisites**

Data sharing (a separate settings tab) must be enabled to support user-level insight aggregation, per the on-screen guidance.

**Best Practice**

Enable both toggles in most enterprise scenarios to maximize signal quality, but document this decision in a privacy impact assessment, since it affects how much individual user behavior is aggregated and surfaced.

**Expected Result**

Analytics scans run daily against Microsoft 365 audit sources and populate insights at both tenant and user levels.

------------------------------------------------------

## Step 6
### Configure Privacy Settings (Pseudonymization)

**Purpose**

Privacy settings control whether investigators see real usernames or pseudonymized identifiers when reviewing alerts, cases, and policies — a key control for balancing investigative effectiveness with employee privacy expectations.

**Procedure**

1. In **Insider Risk Management settings**, select the **Privacy** tab.
2. Review the two available options.
3. Select **Show pseudonymized versions of usernames**.
4. Review the example pseudonymized identifier format.

**Image:**
AP06 (`06-Privacy-Settings.png`)

**Caption:**
Figure 17.6 – Insider Risk Management Privacy Settings — Pseudonymized Usernames

**Explanation**

Two mutually exclusive options are presented:

- **Show pseudonymized versions of usernames** (selected) — displays an anonymized identifier such as `AnonyIS8-988` across all Insider Risk Management features (policies, alerts, cases).
- **Do not show pseudonymized versions of usernames** (not selected) — displays the real display name, for example `Grace Taylor`.

The **Show pseudonymized versions of usernames** option is selected in this configuration.

**Why this configuration matters**

Pseudonymization delays exposure of an individual's real identity until an authorized role (typically an Insider Risk Management Investigator with un-mask permission) determines an alert warrants deeper review. This directly supports data minimization and privacy-by-design principles increasingly required under GDPR-style regulations and internal HR/legal governance frameworks.

**If another option were selected**

Selecting **Do not show pseudonymized versions of usernames** would expose real names to every role with alert visibility from the first triage step, increasing privacy risk and potentially requiring additional HR/legal sign-off depending on jurisdiction.

**Best Practice**

Default to pseudonymized usernames, and formally document the specific role(s) authorized to un-mask identities as part of an approved investigation workflow.

**Expected Result**

All Insider Risk Management alerts, cases, and policies display pseudonymized identifiers instead of real usernames.

------------------------------------------------------

## Step 7
### Configure Policy Indicators — Office Activities

**Purpose**

Office indicators define which SharePoint- and OneDrive-related user activities can be detected by insider risk policies. Enabling an indicator here does not itself alert on it — it makes the indicator *available* to be selected within individual policies (as seen later in Step 25).

**Procedure**

1. In **Insider Risk Management settings**, select **Policy indicators**.
2. Expand the **Office indicators** section.
3. Review the **Select all** checkbox and the full list of individual indicators.
4. Confirm indicators are checked (enabled) as required.

**Image:**
AP07 (`07-Policy-Indicators-Office-Activities.png`)

**Caption:**
Figure 17.7 – Policy Indicators: Office Activities Enabled

**Explanation**

**Select all** is checked, enabling every listed Office indicator, including: sharing SharePoint files/folders/sites with people outside the organization; downloading content from SharePoint; syncing content from SharePoint; downloading content from OneDrive; syncing content from OneDrive; adding people outside/inside the organization to priority SharePoint sites; downgrading sensitivity labels applied to files; removing sensitivity labels from files; removing sensitivity labels from SharePoint sites (and additional indicators visible with further scrolling in the source portal).

**Why this configuration matters**

These indicators map directly to the most common data-exfiltration vectors in Microsoft 365 — bulk downloads, external sharing, and label downgrade/removal (a technique sometimes used to evade DLP controls tied to sensitivity labels).

**If another option were selected**

Deselecting specific indicators (rather than Select all) would create blind spots — for example, disabling "Removing sensitivity labels from files" would prevent detection of a common technique used to strip protection before exfiltrating a file.

**Prerequisites**

Requires the Microsoft 365 Unified Audit Log to be enabled, since these indicators are audit-log-driven.

**Best Practice**

Enable the full Office indicator set as a baseline, then use policy-level indicator selection (Step 25) to scope down per policy rather than disabling indicators tenant-wide.

**Expected Result**

All listed Office activities become available for selection within any Insider Risk Management policy.

------------------------------------------------------

## Step 8
### Configure Policy Indicators — Device Activities

**Purpose**

Device indicators extend detection to endpoint-level activity captured via the Microsoft Purview device onboarding/collection agent — actions that occur locally on a managed device rather than in the Microsoft 365 cloud audit trail.

**Procedure**

1. Continue on the **Policy indicators** tab.
2. Expand the **Device indicators** section.
3. Confirm **Select all** is checked.
4. Review the individual device indicators listed.

**Image:**
AP08 (`08-Policy-Indicators-Device-Activities.png`)

**Caption:**
Figure 17.8 – Policy Indicators: Device Activities Enabled

**Explanation**

**Select all** is checked, enabling: creating or copying files to USB; using a browser to upload files to the web; copying sensitive or priority content to the clipboard; printing files; creating or transferring files to a network share; file copied to remote desktop session; using a browser to download content from a third-party site; using a browser to download content from an unallowed domain; creating sensitive files on a device; reading sensitive files on a device; renaming files on device; creating hidden files on a device; deleting files from a device; mounting USB to a device; archiving files on a device.

**Why this configuration matters**

Device indicators are essential for detecting exfiltration paths that bypass cloud services entirely — for example, copying a sensitive file directly to a USB drive. Several of these indicators (archiving, renaming, hiding files) also map to obfuscation techniques used in the multi-step sequence detection configured later in Step 26.

**If another option were selected**

Without device indicators enabled, a user could copy sensitive files to removable media or a network share with zero visibility to Insider Risk Management, regardless of how well Office indicators are configured.

**Prerequisites**

Devices must be onboarded to the Purview device collection agent (this lab shows this as a satisfied/green prerequisite in Step 16/AP16) for these indicators to generate telemetry.

**Best Practice**

Prioritize onboarding high-risk device populations (privileged users, departing employees, finance/HR/engineering roles) first if full-fleet onboarding is not immediately feasible.

**Expected Result**

Endpoint-level file and USB activity becomes available for detection across Insider Risk Management policies.

------------------------------------------------------

## Step 9
### Configure Policy Indicators — Microsoft Defender for Endpoint and Risky Browsing

**Purpose**

This step integrates Microsoft Defender for Endpoint security alerts and preview "risky browsing" indicators into Insider Risk Management's signal set, extending detection beyond data movement into security-relevant endpoint behavior and web browsing.

**Procedure**

1. Continue on the **Policy indicators** tab.
2. Expand **Microsoft Defender for Endpoint indicators**, review the data-sharing consent notice, and confirm **Select all** is checked.
3. Expand **Risky browsing indicators (preview)** and confirm **Select all** is checked.

**Image:**
AP09 (`09-Policy-Indicators-Defender-Risky-Browsing.png`)

**Caption:**
Figure 17.9 – Policy Indicators: Microsoft Defender for Endpoint and Risky Browsing (Preview)

**Explanation**

An information banner states: *"If you select these indicators, you're agreeing to share Microsoft Defender for Endpoint security alerts with the compliance portal. Shared alert data from Microsoft Defender for Endpoint is processed and stored in the same location as your insider risk management data."* Under this consent, both **Defense evasion – Attempt to bypass security controls** and **Unwanted software – Unapproved or malicious software** are enabled. Under **Risky browsing indicators (preview)**, **Select all** is checked, enabling: browsed to malware websites, keylogger websites, generative AI websites, phishing websites, hacking websites, child abuse websites, criminal activity websites, cult websites, and gambling websites (with additional items visible on further scroll).

**Why this configuration matters**

Defense-evasion alerts (for example, disabling antivirus or tampering with logging) are strong indicators of intentional, sophisticated insider activity rather than accidental oversharing. Risky browsing indicators extend the model into acceptable-use and security-hygiene territory, including generative AI website usage — directly relevant to organizations concerned about sensitive data being pasted into public AI tools.

**If another option were selected**

Declining the Defender for Endpoint data-sharing consent would leave these two indicators unavailable to any policy, removing correlation between confirmed Defender security alerts and Insider Risk Management scoring.

**Licensing Requirements**

Microsoft Defender for Endpoint Plan 2 is required for Defender-sourced indicators.

**Best Practice**

Review this data-sharing consent with a privacy/legal stakeholder before enabling in production, since it establishes a formal cross-solution data flow between Defender and Purview compliance data stores.

**Expected Result**

Defender for Endpoint security alerts and preview risky-browsing categories become available as Insider Risk Management indicators.

------------------------------------------------------

## Step 10
### Configure Intelligent Detections — File Activity Detection and Alert Volume

**Purpose**

Intelligent detections tune how raw activity volume is translated into risk score adjustments and how many alerts of each severity the solution generates, allowing the deployment to be calibrated to the organization's actual tolerance for alert volume.

**Procedure**

1. Select **Intelligent detections** under Insider Risk Management settings.
2. Review **File activity detection** and its **Minimum number of daily events to boost score for unusual activity** field.
3. Confirm the value entered (`50`).
4. Review the **Alert volume** slider and its current position.

**Image:**
AP10 (`10-Intelligent-Detections-Configuration.png`)

**Caption:**
Figure 17.10 – Intelligent Detections: File Activity Threshold and Alert Volume

**Explanation**

The **Minimum number of daily events to boost score for unusual activity** field is set to **50 or more events**. The portal's own example clarifies the logic: if a user averages 10 file downloads per day over the past 30 days but downloads 20 files in a single day, the score is **not** boosted, because 20 is still below the configured threshold of 50 — even though 20 is double that user's personal baseline. The **Alert volume** slider is set to **Default volume**, described as showing all high-severity alerts and a balanced amount of medium and low severity alerts.

**Why this configuration matters**

This threshold is the primary lever for controlling false-positive volume from "unusual for this user" activity. A low threshold (for example, 10) would flag much smaller deviations from a user's baseline as scoring-worthy, increasing alert volume and investigator workload; a high threshold reduces noise but risks missing moderate escalations in activity.

**If another option were selected**

Moving the Alert volume slider toward "Fewer alerts" would suppress a larger share of medium/low severity alerts, which risks missing early-stage exfiltration behavior that has not yet reached high severity. Moving it toward "More alerts" increases investigator workload and may not be sustainable without a proportionally staffed analyst team.

**Best Practice**

Start with Default volume and the Microsoft-suggested daily-event threshold, then adjust downward only after analytics has run long enough (see Step 2, 48-hour analytics window) to establish a real organizational baseline, rather than guessing a threshold on day one.

**Expected Result**

Unusual-activity score boosting and alert severity distribution are calibrated to a defined, documented baseline.

------------------------------------------------------

## Step 11
### Configure Microsoft Defender for Endpoint Alert Statuses and Unallowed Domains

**Purpose**

This step defines which Microsoft Defender for Endpoint alert investigation states should be eligible to influence Insider Risk Management scoring, and introduces the unallowed-domains list used to increase risk scores for sharing/download activity involving specific external domains.

**Procedure**

1. Continue on **Intelligent detections**.
2. Expand **Microsoft Defender for Endpoint alert statuses** and confirm **Select all** is checked (Unknown, New, In progress, Resolved).
3. Expand **Domains → Unallowed domains** and review the current (empty) list.

**Image:**
AP11 (`11-Defender-Alert-Status-Domain-Configuration.png`)

**Caption:**
Figure 17.11 – Defender for Endpoint Alert Statuses and Unallowed Domains Configuration

**Explanation**

All four Defender for Endpoint alert statuses — **Unknown, New, In progress, Resolved** — are selected, meaning security violation alerts are generated from related Defender activity regardless of that alert's current investigation stage in Defender. The **Unallowed domains** list is present but shows **0 items / No domains added yet** — this list, when populated, would map to indicators such as sending email to, or downloading content from, an unallowed domain (for example, a competitor's domain or a known personal webmail provider), and any match is assigned a higher risk score.

**Why this configuration matters**

Including all four Defender alert statuses (rather than only "Resolved") ensures Insider Risk Management does not wait for a Defender analyst to close out an investigation before considering the related activity in its own risk model — reducing time-to-detection for correlated threats.

**If another option were selected**

Restricting this to only **Resolved** alerts would introduce a significant detection delay, since Defender investigations can remain open for extended periods.

**Best Practice**

Populate the Unallowed domains list with known competitor domains, common free webmail/file-sharing domains not sanctioned for business use, and any domains flagged in prior data-loss incidents. **Not configured in this lab** — the list was empty at the time of capture.

**Expected Result**

Defender alerts at any investigation stage can contribute to insider risk scoring, and a domain-based risk amplification mechanism is available (pending population).

------------------------------------------------------

## Step 12
### Configure Third-Party Domains

**Purpose**

Third-party domains represent the inverse control to unallowed domains: officially sanctioned external business domains (such as an approved cloud storage vendor) that the organization still wants visibility into, without necessarily treating all activity toward them as automatically high-risk.

**Procedure**

1. Continue scrolling within **Intelligent detections → Domains**.
2. Review the **Third-party domains** section and its current (empty) list.
3. Note the **Save** button used to persist all Intelligent detections changes.

**Image:**
AP12 (`12-Third-Party-Domain-Configuration.png`)

**Caption:**
Figure 17.12 – Third-Party Domains Configuration

**Explanation**

The **Third-party domains** list shows **0 items / No domains added yet**. Per the on-screen description, domains added here are used to generate alerts for the device indicator *"Use a browser to download content from a third-party site"* — relevant when an organization uses approved third-party cloud storage or SaaS tools for legitimate business purposes and wants that activity logged and scored appropriately rather than ignored.

**Why this configuration matters**

Without a defined third-party domains list, the "download from a third-party site" indicator (enabled in Step 8) still functions, but the solution cannot distinguish an approved business tool from an unrelated, potentially risky external site.

**If another option were selected**

Leaving this list empty indefinitely (as observed in this lab) means the organization forgoes finer-grained differentiation between sanctioned and unsanctioned third-party destinations for this specific indicator.

**Best Practice**

Populate this list as part of ongoing SaaS/shadow-IT governance, ideally sourced from an approved application inventory (for example, from Microsoft Defender for Cloud Apps app discovery).

**Expected Result**

A persisted, savable configuration surface for both unallowed and third-party domains exists and is ready for population as governance data becomes available.

------------------------------------------------------

## Step 13
### Review Insider Risk Management Role Groups

**Purpose**

Before creating a policy, administrative access must be reviewed to ensure the principle of least privilege is applied — assigning administrators, analysts, investigators, and auditors to distinct role groups rather than granting one broad set of permissions to every user.

**Procedure**

1. Navigate to **Settings → Roles and scopes → Role groups**.
2. Search or filter for **"insider"**.
3. Review the seven returned role groups and their Roles/Users/Security groups counts.

**Image:**
AP13 (`13-Insider-Risk-Role-Groups.png`)

**Caption:**
Figure 17.13 – Insider Risk Management Role Groups in Microsoft Purview

**Explanation**

| Role Group | Type | Roles | Users | Security Groups |
|---|---|---|---|---|
| Insider Risk Management | Built-in | 17 | 1 | 0 |
| Insider Risk Management Admins | Built-in | 5 | 0 | 0 |
| Insider Risk Management Analysts | Built-in | 7 | 0 | 0 |
| Insider Risk Management Approvers | Built-in | 2 | 0 | 0 |
| Insider Risk Management Auditors | Built-in | 2 | 0 | 0 |
| Insider Risk Management Investigators | Built-in | 10 | 0 | 0 |
| Insider Risk Management Session Approvers | Built-in | 1 | 0 | 0 |

Only the base **Insider Risk Management** group has a user assigned (1 user), while the specialized groups (Admins, Analysts, Approvers, Auditors, Investigators, Session Approvers) have zero users assigned in this lab.

**Why this configuration matters**

The base **Insider Risk Management** role group grants broad access (17 roles) and appears to be the only group with an assigned user in this tenant — this is a materially different access model than assigning the more narrowly scoped **Analysts** or **Investigators** groups, which would restrict a given user to only the permissions needed for their specific function (alert triage vs. case investigation vs. audit review).

**If another option were selected**

Assigning users to the granular groups (Analysts, Investigators, Approvers, Auditors) instead of the broad base group would better enforce separation of duties — for example, ensuring the person who investigates a case is not the same person who approves final disciplinary/legal action (Session Approvers, Approvers).

**Prerequisites**

Requires Global Administrator or Compliance Administrator (or equivalent Purview role administration permission) to create or modify role group membership.

**Best Practice**

In production, avoid relying solely on the broad base **Insider Risk Management** group. Assign named individuals to the specific functional groups matching their actual job duties, and reserve **Session Approvers** for a very small, senior group given its sensitivity (this role approves access to investigation sessions/recordings).

**Expected Result**

Role groups are visible and ready for granular membership assignment; membership beyond the base group is **not configured in this lab**.

------------------------------------------------------

## Step 14
### Open the Policies Page and Begin Policy Creation

**Purpose**

This step transitions from solution-wide configuration into the policy-authoring workflow, where the specific risk scenario (Data Leaks) is defined and scoped.

**Procedure**

1. Select **Policies** in the Insider Risk Management left navigation.
2. Confirm the **User Policies** tab is active.
3. Review the warning banner regarding role group assignment for alert visibility.
4. Review the **Policy warnings / Policy recommendations / Healthy policies** counters (all 0).
5. Select **Create policy** and review the two available creation paths: **Quick policy** and **Custom policy**.

**Image:**
AP14 (`14-Create-Insider-Risk-Policy.png`)

**Caption:**
Figure 17.14 – Insider Risk Management Policies Page and Create Policy Menu

**Explanation**

A warning banner states: *"Attention: You currently aren't assigned to a role group that allows you to view alerts. Consider assigning somebody to this role"* — directly reflecting the role group gap identified in Step 13. The **Policies** table shows **0 items** with the message **"You don't have any policies yet. We recommend starting with a data leaks quick policy."** and a **Get started** button. The **Create policy** dropdown offers **Quick policy** (preconfigured settings for common scenarios) and **Custom policy** (fully manual configuration).

**Why this configuration matters**

The role group warning is a direct, actionable signal that alert visibility will be blocked for the current session/user until a role group with alert-viewing permission (such as Analysts or Investigators) is assigned — this is a **prerequisite gap carried forward from Step 13** and should be resolved before relying on this deployment for live monitoring.

**If another option were selected**

Choosing **Custom policy** instead of **Quick policy** would require manually specifying every template parameter without Microsoft's preconfigured indicator/threshold recommendations — appropriate for advanced, highly specific scenarios, but slower to stand up a first policy.

**Best Practice**

For a first deployment, use **Quick policy** to establish a working baseline quickly, and resolve the role-group warning before considering the deployment production-ready.

**Expected Result**

The policy creation menu is available, with the platform explicitly recommending a Data Leaks quick policy as the starting point.

------------------------------------------------------

## Step 15
### Review Quick Policy Templates

**Purpose**

Quick policies apply Microsoft-preconfigured settings for common insider risk scenarios, reducing configuration time and embedding Microsoft's recommended defaults for a given scenario type.

**Procedure**

1. From the **Create policy** menu, select **Quick policy**.
2. Review each available quick policy card: **Data leaks**, **Data theft from Microsoft 365 apps by users leaving your org**, **Critical asset protection**, **Email exfiltration**, **Risky AI Usage**.
3. Select **Get started** under **Data leaks**.

**Image:**
AP15 (`15-Quick-Policy-Templates.png`)

**Caption:**
Figure 17.15 – Create Quick Policies Panel

**Explanation**

Five quick policy options are presented:

| Quick Policy | Scenario |
|---|---|
| Data leaks | Detects potential data leaks from all users, ranging from accidental oversharing to malicious data theft |
| Data theft from Microsoft 365 apps by users leaving your org | Detects potential data theft by users leaving the organization or whose account was deleted from Microsoft Entra ID |
| Critical asset protection | Detects activity involving the org's most valuable assets, where loss could cause legal liability, financial loss, or reputational damage |
| Email exfiltration | Detects users emailing sensitive assets outside the org, including to personal email addresses |
| Risky AI Usage (New) | Detects potentially risky or sensitive content in Microsoft Copilot, enterprise AI apps, and web versions of other AI apps |

**Data leaks** was selected as the starting template for this project.

**Why this configuration matters**

The **Data leaks** template is the broadest of the five, covering "all users in your org," making it an appropriate general-purpose baseline policy before narrower templates (such as Critical asset protection or Risky AI Usage) are layered in for specific asset classes or emerging risks.

**If another option were selected**

Choosing **Email exfiltration** instead would narrow detection specifically to email-based data movement, missing SharePoint, device, and browser-based exfiltration paths covered by the broader Data leaks template.

**Best Practice**

Deploy **Data leaks** as a baseline organizational policy, and layer in **Critical asset protection** or **Risky AI Usage** as targeted, additive policies once specific high-value data assets or AI tool usage patterns are identified.

**Expected Result**

The **New insider risk policy** wizard opens with the **Data leaks** template pre-selected.

------------------------------------------------------

## Step 16
### Review the Data Leaks Policy Template Details and Prerequisites

**Purpose**

Before proceeding, the wizard surfaces the specific prerequisites, triggering events, and detected activities associated with the Data leaks template, allowing the administrator to confirm readiness before committing to the template.

**Procedure**

1. In the **Policy template** step of the wizard, confirm **Data leaks** is selected in the left template list.
2. Review the **Prerequisites** section: DLP policy (Optional), Devices onboarded (Optional), Physical badging connector (Optional), Connect cloud applications (Optional).
3. Review the **Triggering event** and **Activities detected include** summaries.
4. Select **Next**.

**Image:**
AP16 (`16-Select-Policy-Template-Data-Leaks.png`)

**Caption:**
Figure 17.16 – Data Leaks Policy Template: Prerequisites and Triggering Events

**Explanation**

The template lists four prerequisites, of which two show a green checkmark (satisfied) and two are unchecked (not satisfied/not configured):

| Prerequisite | Status Shown |
|---|---|
| DLP policy | Satisfied (green check) — Optional |
| Devices onboarded | Satisfied (green check) — Optional |
| Physical badging connector | Not satisfied — Optional |
| Connect cloud applications | Not satisfied — Optional |

The template's **Triggering event** is described as: *"User performs selected exfiltration activities that exceed specific thresholds"* or *"User performs an activity matching specified DLP policy."* **Activities detected include**: downloading files from SharePoint, printing files, and copying data to personal cloud storage services (a representative, non-exhaustive sample).

**Why this configuration matters**

Because all four prerequisites are marked **Optional**, the template can be created even with only two of four satisfied — but the two unmet prerequisites (physical badging, cloud application connectors) directly limit which indicators will produce real telemetry: physical-access and cloud-storage/cloud-service indicators will exist in the policy's indicator list (Step 25) but will not generate meaningful alerts without their respective connectors.

**If another option were selected**

Proceeding without any DLP policy or device onboarding (both currently satisfied here) would remove two of the richest signal sources for this template and is not recommended.

**Prerequisites**

DLP policy and device onboarding (both satisfied in this lab); physical badging connector and cloud app connectors (both outstanding, **not configured in this lab**).

**Best Practice**

Document unmet optional prerequisites as a known limitation of the initial deployment (see Known Limitations) rather than silently proceeding, so stakeholders understand which detection categories will not yet produce alerts.

**Expected Result**

The wizard advances to the **Name and description** step with the Data leaks template locked in.

------------------------------------------------------

## Step 17
### Name and Describe the Policy

**Purpose**

A clear, descriptive policy name is required for ongoing policy management, especially as an organization scales to multiple overlapping insider risk policies.

**Procedure**

1. In the **Name and description** step, enter a policy name.
2. Optionally enter a description.
3. Select **Next**.

**Image:**
AP17 (`17-Policy-Name-and-Description.png`)

**Caption:**
Figure 17.17 – Naming the Data Leaks Insider Risk Policy

**Explanation**

The policy **Name** field is set to **"Data Leaks Insider Risk Policy."** The **Description** field was left empty in this configuration.

**Why this configuration matters**

A descriptive, unambiguous name is important given that Insider Risk Management supports many concurrent policies (Data theft, Data leaks, Risky AI usage, Security policy violations, Health record misuse, Risky browser usage, and their sub-variants) — vague names create ambiguity for investigators reviewing which policy generated a given alert.

**If another option were selected**

Leaving the description blank (as done here) is acceptable for a lab/demo but is not recommended in production, where a description documenting policy owner, review cadence, and business justification supports audit and change-management requirements.

**Best Practice**

In production, always complete the description field with policy purpose, owning team, and review date to support compliance audit trails.

**Expected Result**

The policy is uniquely and clearly named for ongoing identification in the Policies list, Reports, and alert triage views.

------------------------------------------------------

## Step 18
### Choose Users, Groups, and Adaptive Scopes

**Purpose**

This step defines the population of users the policy will monitor — either the entire organization or a specifically scoped subset via static groups or adaptive (attribute-based) scopes.

**Procedure**

1. In the **Users and groups** step, review the two scoping options.
2. Select **All users, groups, and adaptive scopes**.
3. Select **Next**.

**Image:**
AP18 (`18-Users-Groups-and-Adaptive-Scopes.png`)

**Caption:**
Figure 17.18 – Policy Scope: All Users, Groups, and Adaptive Scopes

**Explanation**

Two options are presented: **All users, groups, and adaptive scopes** (selected) and **Specific users, groups, and adaptive scopes** (not selected). Selecting "All" applies the policy tenant-wide rather than to a defined subset.

**Why this configuration matters**

An organization-wide scope maximizes coverage for the Data leaks template's intentionally broad detection goal ("data leaks from all users in your org," per Step 15), consistent with using this policy as a baseline rather than a targeted control.

**If another option were selected**

Selecting **Specific users, groups, and adaptive scopes** would restrict monitoring to a defined population — appropriate for a pilot rollout, a specific high-risk department, or to control initial alert volume before organization-wide rollout, but it would leave all other users unmonitored by this policy.

**Best Practice**

For a first production rollout, many organizations pilot with **Specific users, groups, and adaptive scopes** (for example, a single department) to validate alert volume and quality before expanding to **All users**. This lab proceeded directly to organization-wide scope, appropriate for a lab/demo environment.

**Expected Result**

The policy applies its triggering logic and indicators to every user, group, and adaptive scope in the tenant.

------------------------------------------------------

## Step 19
### Decide Whether to Prioritize Content

**Purpose**

Content prioritization allows the policy to assign higher risk scores to activity involving specific SharePoint sites, sensitivity labels, sensitive information types, file extensions, or trainable classifiers — focusing investigator attention on the organization's most sensitive content.

**Procedure**

1. In the **Content to prioritize** step, review the two top-level options.
2. Select **I want to prioritize content**.
3. Confirm all five prioritization categories are checked: **SharePoint sites, Sensitivity labels, Sensitive info types, File extensions, Trainable classifiers**.
4. Select **Next**.

**Image:**
AP19 (`19-Content-Prioritization-Options.png`)

**Caption:**
Figure 17.19 – Content Prioritization Category Selection

**Explanation**

**I want to prioritize content** is selected, with all five sub-categories checked: SharePoint sites, Sensitivity labels, Sensitive info types, File extensions, and Trainable classifiers. The alternative, **I don't want to prioritize content right now**, was not selected; the wizard notes this decision can be revisited after policy creation.

**Why this configuration matters**

Per the wizard's own guidance, risk scores are increased for any activity that contains priority content, which increases the chance of generating a high-severity alert — meaning content prioritization is the primary mechanism for ensuring the policy surfaces the organization's genuinely sensitive data movement above routine, lower-risk activity.

**If another option were selected**

Selecting **I don't want to prioritize content right now** would treat all detected activity equally regardless of content sensitivity, reducing the policy's ability to distinguish a download of a public marketing PDF from a download of a customer database export.

**Best Practice**

Always enable content prioritization when sensitivity labels or sensitive information types are already deployed in the tenant (as they are here — see Step 21), since this directly leverages existing Microsoft Purview Information Protection investment.

**Expected Result**

The wizard proceeds through dedicated sub-steps to define exactly which SharePoint sites and sensitive info types should be prioritized (Steps 20–21).

------------------------------------------------------

## Step 20
### Configure SharePoint Sites to Prioritize

**Purpose**

This step identifies specific SharePoint sites whose content should be treated as high-priority, increasing the risk score for any related activity regardless of file type.

**Procedure**

1. In the **SharePoint sites** sub-step, select **Add or edit SharePoint sites**.
2. Add the target site(s).
3. Confirm the site appears in the list with its name and URL.
4. Select **Next**.

**Image:**
AP20 (`20-SharePoint-Sites-Prioritization.png`)

**Caption:**
Figure 17.20 – SharePoint Sites Prioritized for Higher Risk Scoring

**Explanation**

One SharePoint site is configured: **Team Site**, with URL `https://securem365lsb.sharepoint.com...` (truncated in the portal view). Per the on-screen description, *"Any activity associated with all file types in these sites will be assigned a higher risk score."*

**Why this configuration matters**

Site-level prioritization is a broad-brush control — every file within the designated site is treated as sensitive, regardless of its individual classification. This is most appropriate for sites known to exclusively host sensitive content (for example, an HR, Legal, or Finance-only site) rather than general-purpose collaboration sites with mixed content sensitivity.

**If another option were selected**

Leaving this list empty (returning to Step 19 and disabling SharePoint sites as a prioritization category) would forgo site-based risk amplification entirely, relying solely on sensitivity labels and sensitive information types (Step 21) for content-based scoring.

**Best Practice**

Reserve SharePoint site prioritization for sites with a narrow, well-understood content scope; for general-purpose sites with mixed sensitivity, rely primarily on sensitivity labels and sensitive information type detection instead.

**Expected Result**

Any detected activity touching the **Team Site** is scored with elevated priority regardless of the specific file's classification.

------------------------------------------------------

## Step 21
### Configure Sensitive Information Types to Prioritize

**Purpose**

This step identifies specific Sensitive Information Types (SITs) — pattern-based classifiers such as credit card numbers, passport numbers, or national ID numbers — whose presence in content should increase the associated activity's risk score.

**Procedure**

1. In the **Sensitive info types** sub-step, select **Add or edit sensitive info types**.
2. Add the target SIT(s).
3. Confirm the SIT appears in the list.
4. Select **Next**.

**Image:**
AP21 (`21-Sensitive-Information-Types-Configuration.png`)

**Caption:**
Figure 17.21 – Sensitive Information Types Prioritized for Higher Risk Scoring

**Explanation**

One sensitive information type is configured: **Credit Card Number** — a built-in Microsoft-provided SIT using pattern matching and checksum validation to identify credit card numbers in content. Per the on-screen description, *"Any activity associated with content that contains this sensitive info will be assigned a higher risk score."*

### Sensitive Information Types Table

| SIT | Source | Configured in This Lab |
|---|---|---|
| Credit Card Number | Built-in Microsoft SIT | Yes |
| U.S. Social Security Number | Built-in Microsoft SIT | Not configured in this lab |
| Passport Number (any region) | Built-in Microsoft SIT | Not configured in this lab |
| Custom/organization-specific SIT | Requires custom SIT authoring | Not configured in this lab |

**Why this configuration matters**

Credit Card Number is a common regulatory-driven SIT (PCI DSS relevance) and demonstrates the pattern for adding additional SITs relevant to the organization's actual regulatory exposure (for example, healthcare organizations would add health-record-related SITs; organizations with EU customers would add EU-specific national ID SITs).

**If another option were selected**

Using only a single, narrow SIT (as done here) limits content-based prioritization to credit-card-pattern content only — a production deployment would typically include multiple SITs reflecting the organization's actual regulated data types.

**Best Practice**

Expand this list to include every SIT with regulatory or contractual significance to the organization (PCI, PII, PHI, financial account numbers, etc.), and periodically review Microsoft's built-in SIT catalog for newly added regional identifiers.

**Expected Result**

Any detected activity involving content matching the Credit Card Number pattern is scored with elevated priority.

------------------------------------------------------

## Step 22
### Configure Activity Scoring Scope for Priority Content

**Purpose**

This step determines whether the policy scores and alerts on all detected activity regardless of content sensitivity, or restricts alerting specifically to activity involving the priority content defined in Steps 20–21.

**Procedure**

1. In the **Scoring** sub-step, review the two available options.
2. Select **Get alerts for all activity**.
3. Select **Next**.

**Image:**
AP22 (`22-Configure-Activity-Scoring-for-Priority-Content.png`)

**Caption:**
Figure 17.22 – Activity Scoring Scope: All Activity vs. Priority-Content-Only

**Explanation**

**Get alerts for all activity** is selected — risk scores are assigned and alerts generated for all specified activities regardless of whether they include priority content. The alternative, **Get alerts only for activity that includes priority content**, would restrict scoring/alerting strictly to activity involving the Team Site or Credit Card Number content defined earlier; non-priority activity would still be visible for review if an alert is otherwise generated, but would not itself be scored.

**Why this configuration matters**

Choosing "all activity" keeps the Data leaks policy's intentionally broad detection posture (per its template description) intact — priority content still increases score, but does not gate whether scoring happens at all.

**If another option were selected**

Selecting **Get alerts only for activity that includes priority content** would significantly narrow this baseline policy's effective coverage down to only Team Site and Credit Card Number-related activity, undermining its purpose as a broad, organization-wide baseline. This restricted mode is better suited to a dedicated, narrowly scoped policy (for example, a "Credit Card Data Protection" policy) rather than the general Data leaks baseline.

**Best Practice**

Use "Get alerts for all activity" for broad baseline policies and reserve "priority-content-only" scoring for narrowly targeted, asset-specific policies (such as Critical asset protection, seen in Step 15).

**Expected Result**

All specified exfiltration activities are eligible for scoring and alerting; priority content further boosts, but does not gate, that scoring.

------------------------------------------------------

## Step 23
### Select the Triggering Event for the Policy

**Purpose**

The triggering event determines the condition under which the policy begins assigning risk scores to a given user's activity — either a DLP policy match, or performance of specific exfiltration activities exceeding a threshold.

**Procedure**

1. In the **Triggering event** step, review both available triggering event types.
2. Select **User performs an exfiltration activity**.
3. Expand **Select which activities will trigger this policy** and review the selected activity count (8/24).
4. Note the banner indicating some indicators are unavailable because they are turned off at the tenant level, with a **Turn on indicators** action available.
5. Select **Next**.

**Image:**
AP23 (`23-Select-Triggering-Events-for-Insider-Risk-Policy.png`)

**Caption:**
Figure 17.23 – Triggering Event Selection: Exfiltration Activity

**Explanation**

Two triggering event types are available:

- **User matches a data loss prevention (DLP) policy** (not selected) — requires the referenced DLP policy to be configured to generate "High" severity incident reports; one DLP policy is shown as selectable (1 item selected in the dropdown) but this trigger type was not the one activated.
- **User performs an exfiltration activity** (selected) — the policy begins scoring once specific thresholds are met for a defined set of activities.

Under the selected trigger, **8 of 24** possible activities are selected to participate in triggering, including: sending email with attachments to recipients outside the organization, to free public domains, and to self; printing files; creating or copying files to USB; using a browser to upload files to the web; sharing SharePoint files with people outside the organization; and file copied to remote desktop session. **Downloading content from SharePoint** appears visibly disabled/greyed out in the selection list, consistent with the banner's note that some indicators are currently turned off at the tenant level and require enabling via **Turn on indicators** before they can be used as a trigger.

**Why this configuration matters**

Selecting **User performs an exfiltration activity** (rather than DLP match) means this policy's triggering condition is independent of any specific DLP rule — it activates directly from the volume/pattern of exfiltration-style activities, which is more aligned with the "all users, broad coverage" design established in Step 18.

**If another option were selected**

Selecting **User matches a data loss prevention (DLP) policy** instead would tie this policy's activation entirely to a separate DLP policy's "High" severity incident generation — appropriate when DLP is the authoritative source of truth for sensitive content matches, but it introduces a hard dependency on that DLP policy's own configuration and severity tuning.

**Prerequisites**

The **Downloading content from SharePoint** indicator's greyed-out state confirms that not every indicator enabled in Step 7 is automatically available for every use — indicator sub-settings can still individually gate availability at the point of policy configuration; this should be resolved via **Turn on indicators** if this specific activity type is required to trigger this policy.

**Best Practice**

Review and resolve any greyed-out/unavailable indicators before finalizing a policy, and document any that are intentionally left disabled, so their absence is a deliberate decision rather than an overlooked gap.

**Expected Result**

The policy will begin scoring a user's activity once the user performs any of the 8 selected exfiltration-style activities in a pattern that meets the thresholds configured in the next step.

------------------------------------------------------

## Step 24
### Configure Trigger Thresholds for Exfiltration Activities

**Purpose**

Thresholds determine how many daily events of a given triggering activity are required before the policy begins scoring that user — directly controlling sensitivity and false-positive rate for the triggering mechanism itself (distinct from the indicator thresholds configured later in Step 27).

**Procedure**

1. In the **Trigger thresholds** sub-step, review the two available options.
2. Select **Apply built-in thresholds (Recommended)**.
3. Select **Next**.

**Image:**
AP24 (`24-Configure-Trigger-Thresholds-for-Exfiltration-Activities.png`)

**Caption:**
Figure 17.24 – Trigger Threshold Configuration: Built-In (Recommended) Thresholds

**Explanation**

**Apply built-in thresholds**, marked **Recommended**, is selected. The alternative, **Choose your own thresholds**, allows the administrator to manually define the number-of-events-per-day threshold for each selected triggering activity instead of using Microsoft's built-in values.

**Why this configuration matters**

Built-in thresholds represent Microsoft's field-tested defaults across a broad customer base and are the recommended starting point, particularly before the tenant has accumulated enough analytics history (Step 2's 48-hour analytics window, and the broader "Get to know your organization" baseline) to justify custom, organization-specific thresholds.

**If another option were selected**

Selecting **Choose your own thresholds** would allow immediate customization but risks setting thresholds too low (excessive alert volume) or too high (missed detections) without a data-driven baseline to inform those values — a risk explicitly called out by Microsoft's own "Recommended" labeling of the built-in option.

**Best Practice**

Start with built-in thresholds, allow the policy to run and generate a baseline volume of alerts, then transition to custom thresholds informed by actual observed alert quality and investigator feedback.

**Expected Result**

The policy uses Microsoft's recommended, field-validated thresholds to determine when exfiltration-activity triggering begins scoring a user.

------------------------------------------------------

## Step 25
### Select Indicators for the Policy

**Purpose**

Indicators are the specific detectable activities that generate alerts once a user's activity has been triggered into scoring (Steps 23–24). This step scopes exactly which of the tenant-wide indicators (enabled in Steps 7–9) apply to this specific policy.

**Procedure**

1. In the **Indicators** step, review the **Total indicators selected** counter.
2. Review each indicator category and its selected/available count.
3. Use **Choose indicators** to adjust selection if needed.
4. Select **Next**.

**Image:**
AP25 (`25-Configure-Insider Risk-Indicators.png`)

**Caption:**
Figure 17.25 – Indicator Category Selection for the Data Leaks Policy

**Explanation**

At this point in the wizard, **51 of 103** total available indicators are selected. The category breakdown is as follows:

### Indicators Table (as captured at this wizard step)

| Category | Selected / Available | New (Preview) |
|---|---|---|
| Office indicators | 30 / 30 | No |
| Device indicators | 15 / 15 | No |
| Physical access indicators | 1 / 1 | No |
| Microsoft Defender for Cloud Apps indicators | 0 / 3 | No |
| Cloud storage indicators | 0 / 11 | No |
| Cloud service indicators | 0 / 10 | No |
| Generative AI apps indicators | 2 / 7 | Yes |
| Microsoft Fabric indicators | 0 / 14 | Yes |
| Communication compliance indicators | 0 / 5 | Yes |
| Microsoft Entra ID Protection indicators | 2 / 2 | Yes |
| Data loss prevention (DLP) alert indicators | 1 / 1 | Yes |
| Network indicators | 0 / 4 | Yes |

**Why this configuration matters**

The **0-selected** categories (Defender for Cloud Apps, Cloud storage, Cloud service, Microsoft Fabric, Communication compliance, Network) directly correspond to the unmet optional prerequisites identified in Step 16 (no cloud application connectors configured) — these indicator categories exist in the platform but cannot generate meaningful alerts without their respective data connectors in place. Office and Device indicators are fully selected (30/30 and 15/15) reflecting the tenant-wide enablement completed in Steps 7–8.

**If another option were selected**

Manually selecting individual indicators from the 0-selected categories without first connecting their data sources would add indicators to the policy that structurally cannot generate telemetry — a configuration that appears complete in the UI but produces no real detection value.

**Best Practice**

Treat unselected categories as a prioritized backlog for connector onboarding (Defender for Cloud Apps, Microsoft Fabric, network signals) rather than attempting to select their indicators prematurely.

**Expected Result**

The policy is configured with 51 indicators active at this step of the wizard (a number that increases to 74/126 by the final review step — see Step 28 for discussion of this change).

------------------------------------------------------

## Step 26
### Configure Detection Options for Activity Sequences

**Purpose**

Sequence detection identifies multi-step activity chains — for example, downloading a file, obfuscating it, exfiltrating it, and then deleting it — that collectively indicate a higher level of intent than any single activity alone.

**Procedure**

1. In the **Detection options** sub-step, review the **Sequence detection** description (activities performed within a 7-day window).
2. Confirm **Select all** is checked for sequence types.
3. Review the individual sequence patterns listed.
4. Select **Next**.

**Image:**
AP26 (`26-Configure-Detection-Options-for-Activity-Sequences.png`)

**Caption:**
Figure 17.26 – Sequence Detection Configuration

**Explanation**

The portal defines a sequence as *"a group of two or more activities performed one after the other over a period of 7 days that might suggest an elevated risk,"* built from four activity categories: **download, exfiltrate, obfuscate, and delete**. **Select all** is checked, enabling all listed sequence patterns, including: Download from Microsoft 365 location then exfiltrate; Download from Microsoft 365 location, obfuscate, then exfiltrate; Download from Microsoft 365 location, exfiltrate, then delete; Download from Microsoft 365 location, obfuscate, exfiltrate, then delete; Archive then exfiltrate; Archive, obfuscate, then exfiltrate; Archive, exfiltrate, then delete; Archive, obfuscate, exfiltrate, then delete; Downgrade or remove label then exfiltrate; Downgrade or remove label, download, then exfiltrate; Downgrade or remove label, download, exfiltrate, then delete; Downgrade or remove label, download, obfuscate, then exfiltrate; Download from third-party site then exfiltrate; Download from third-party site, obfuscate, then exfiltrate (with additional patterns visible on further scroll in the source portal).

### Detection Options Table

| Detection Type | Window | Selected in This Lab |
|---|---|---|
| Sequence detection (download → exfiltrate) | 7 days | Yes |
| Sequence detection (archive → exfiltrate) | 7 days | Yes |
| Sequence detection (label downgrade/removal → exfiltrate) | 7 days | Yes |
| Sequence detection (third-party download → exfiltrate) | 7 days | Yes |

**Why this configuration matters**

Sequence detection is what distinguishes Insider Risk Management from a simple single-event alerting tool — the label-downgrade-then-exfiltrate sequence, for instance, directly detects a known evasion technique (stripping sensitivity labels specifically to bypass DLP controls before moving the file).

**If another option were selected**

Deselecting specific sequences (for example, the label-downgrade sequences) would blind the policy to that specific multi-step evasion pattern, even though the individual indicators (label removal, exfiltration) remain independently detectable.

**Best Practice**

Enable the full sequence detection library as a baseline; sequence-based alerts are generally higher-confidence/higher-severity than single-indicator alerts and warrant priority investigator attention.

**Expected Result**

The policy can correlate related activities across a 7-day rolling window into a single, higher-confidence sequence-based alert.

------------------------------------------------------

## Step 27
### Configure Indicator Threshold Settings

**Purpose**

This step determines the methodology used to set the numeric thresholds (events per day) for every selected indicator — choosing between Microsoft's generic built-in values, values adjusted to this tenant's actual observed user activity, or fully custom values.

**Procedure**

1. In the **Indicator thresholds** sub-step, review the three available options.
2. Select **Apply thresholds specific to your users' activity (Recommended)**.
3. Select **Next**.

**Image:**
AP27 (`27-Configure-Indicator-Threshold-Settings.png`)

**Caption:**
Figure 17.27 – Indicator Threshold Type Selection

**Explanation**

Three options are presented:

- **Apply thresholds provided by Microsoft** (not selected) — generic built-in thresholds applied to all selected indicators.
- **Apply thresholds specific to your users' activity** (selected, marked **Recommended**) — thresholds are calculated from this tenant's users' recent activity patterns and applied to all built-in indicators selected.
- **Choose your own thresholds** (not selected) — fully custom thresholds, pre-populated with values based on recent user activity patterns as a starting point for manual adjustment.

### Threshold Settings Table

| Threshold Method | Data Source | Selected in This Lab |
|---|---|---|
| Microsoft built-in thresholds | Generic, cross-customer defaults | No |
| Activity-specific thresholds (Recommended) | This tenant's analytics-derived user activity baseline | Yes |
| Fully custom thresholds | Manually specified, pre-populated from tenant baseline | No |

**Why this configuration matters**

This decision directly depends on the analytics engine enabled in Step 5 and Step 2 — activity-specific thresholds are only meaningful once the tenant has accumulated a genuine behavioral baseline; selecting this option confirms the analytics scan (48-hour window, per Step 2) had produced usable baseline data by this point in the workflow.

**If another option were selected**

Selecting **Apply thresholds provided by Microsoft** would ignore this tenant's specific usage patterns in favor of generic cross-customer defaults — a reasonable fallback only if analytics has not yet accumulated sufficient baseline history.

**Best Practice**

Use tenant-specific, activity-based thresholds (as selected here) whenever analytics has had sufficient time to run; this is Microsoft's own recommended default and typically produces a better-calibrated signal-to-noise ratio than generic thresholds.

**Expected Result**

Every selected indicator's threshold is calibrated against this tenant's actual recent user activity rather than a generic cross-customer baseline.

------------------------------------------------------

## Step 28
### Review the Complete Policy Configuration Before Submission

**Purpose**

The final review step consolidates every prior wizard decision into a single summary for verification before the policy is submitted and becomes active.

**Procedure**

1. In the **Review settings and finish** step, review each configuration section: Policy template, Policy name and description, Users/groups/adaptive scopes, Excluded users and groups, Content to prioritize, Triggering event, Policy indicators.
2. Use the **Edit** links to make any final corrections if needed.
3. Select **Submit**.

**Image:**
AP28 (`28-Review-Insider-Risk-Policy-Configuration.png`)

**Caption:**
Figure 17.28 – Final Policy Review Before Submission

**Explanation**

The review summary confirms:

| Setting | Value |
|---|---|
| Policy template | Data leaks |
| Policy name and description | Data Leaks Insider Risk Policy |
| Users, groups and adaptive scopes | All |
| Excluded users and groups | None |
| Content to prioritize | `https://securem365lsb.sharepoint.com/sites/contentTypeHub`, GSM |
| Triggering event | Built-in data leak trigger |
| Policy indicators | 74/126 selected |

The portal notes: *"The policy will take effect immediately after you create it, but may take up to 24 hours to start generating alerts. User productivity won't be impacted in any way."*

**Why this configuration matters**

The final indicator count (**74/126**) is higher than the 51/103 shown mid-wizard in Step 25. This reflects that additional indicator categories (Entra ID Protection, DLP alert indicators, and others activated through the triggering-event and threshold steps) were added to the pool as the wizard progressed through Steps 23–27, and/or that the total available indicator pool itself grew as prerequisite-linked categories became eligible. This document reports both figures exactly as captured rather than reconciling them, consistent with this project's evidence-only documentation standard.

**If another option were selected**

Using any of the **Edit** links at this stage to revert a setting (for example, changing scope back to "Specific users") would require re-validating every downstream step, since indicator availability, thresholds, and triggering events are all interdependent.

**Best Practice**

Always perform this final review with a second qualified reviewer (four-eyes principle) before submission in a production tenant, given that a broad, tenant-wide policy affects monitoring and privacy posture for every user in the organization.

**Expected Result**

The policy is fully configured and ready for submission; selecting **Submit** creates the policy immediately, with alert generation beginning within 24 hours.

------------------------------------------------------

## Step 29
### Confirm the Data Leaks Insider Risk Policy Was Successfully Created

**Purpose**

This step verifies the policy was created successfully and reports an initial **Healthy** operational status, confirming no immediate configuration errors were detected by the platform.

**Procedure**

1. After submission, return to **Policies → User Policies**.
2. Confirm the new policy appears in the list.
3. Review its **Status**, **Users in scope**, **Active alerts**, **Confirmed alerts**, **Actions taken on alerts**, and **Policy alert effectiveness** columns.

**Image:**
AP29 (`29-Data-Leaks-nsider-Risk-Policy-Successfully-Created.png`)

**Caption:**
Figure 17.29 – Data Leaks Insider Risk Policy Successfully Created (Healthy Status)

**Explanation**

The Policies list now shows **1 item**: **Data Leaks Insider Risk Policy**, **Status: Healthy**, with **Users in scope: 0**, **Active alerts: 0**, **Confirmed alerts: 0**, **Actions taken on alerts: 0**, and **Policy alert effectiveness: 0%**. The top counters show **Policy warnings: 0**, **Policy recommendations: 0**, **Healthy policies: 1**.

**Why this configuration matters**

A **Healthy** status confirms the policy passed Microsoft Purview's internal validation (correct scope, valid triggering event, valid indicators) — but the all-zero metrics confirm no scoring activity has yet occurred, consistent with the "up to 24 hours" activation delay noted in Step 28 and the need to explicitly start scoring (Step 30).

**If another option were selected**

A status of **Warning** at this stage would typically indicate a configuration gap — for example, zero indicators selected, or a triggering event referencing a deleted DLP policy — neither of which occurred here.

**Best Practice**

Do not interpret "Healthy" status alone as evidence of active monitoring; confirm the policy has actually begun scoring users (Step 30) and later confirm alert generation before considering the deployment operationally validated.

**Expected Result**

The policy exists in a valid, Healthy configuration state, ready to begin scoring in-scope user activity.

------------------------------------------------------

## Step 30
### Start Activity Scoring for a Selected Test User

**Purpose**

This final step demonstrates initiating activity scoring for a specific user, validating that the newly created policy can be operationally engaged for monitoring rather than remaining purely in a passive, newly created state.

**Procedure**

1. From the **Policies** page, select **Start scoring activity for users**.
2. Select the target policy (**Data Leaks Insider Risk Policy**) and the reason for scoring (**Monitoring User Activity**).
3. Define the **Users in scope for** duration (**5 days**).
4. Select the specific user(s) to score (**Test User 1**).
5. Confirm the **"Scoring activity for 1 user"** success confirmation.

**Image:**
AP30 (`30-Start-Activity-Scoring-for-Selected-Users.png`)

**Caption:**
Figure 17.30 – Scoring Activity Initiated for Test User 1

**Explanation**

A success panel confirms: **"Scoring activity for 1 user."** The panel details:

| Field | Value |
|---|---|
| Policies | Data Leaks Insider Risk Policy |
| Reason for scoring activity | Monitoring User Activity |
| Users in scope for | 5 days |
| Users | Test User 1 |

The panel notes it may take a few hours for the user to appear on the **Users** tab, after which detected activities can be reviewed. A separate banner also confirms **"Analytics scan is complete. Review the pseudonymized results to identify potential risks and view additional insights,"** confirming the analytics engine enabled in Step 5 has completed its initial scan.

**Why this configuration matters**

Explicitly starting scoring for a named test user (rather than waiting passively for the tenant-wide policy to organically pick up activity) is the standard method for functionally validating a brand-new policy without waiting for a real-world triggering event to occur naturally — directly analogous to a smoke test in software deployment.

**If another option were selected**

Choosing a different **Reason for scoring activity** (for example, a departing-employee-specific reason, if available) would populate different metadata on the resulting case file, relevant for later reporting and audit purposes. A different **Users in scope for** duration would change how many days of historical/ongoing activity are captured for the selected user.

**Prerequisites**

An in-scope test user (Test User 1) with representative activity to validate detection.

**Best Practice**

Always run a scoped, time-boxed validation (as done here — 5 days, one named test user) before declaring a new policy production-validated, and formally document the outcome as part of change management records.

**Expected Result**

Test User 1's activity becomes eligible for risk scoring under the Data Leaks Insider Risk Policy, with results expected to populate the Users tab within a few hours.

------------------------------------------------------

