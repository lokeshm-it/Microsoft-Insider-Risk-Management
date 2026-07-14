# Lessons Learned — Microsoft Purview Insider Risk Management

## Lessons Learned

- Enabling an indicator at the solution-settings level (Steps 7–9) is necessary but not sufficient — indicators can still be individually unavailable at the policy level (Step 23) if turned off elsewhere, requiring an explicit "Turn on indicators" action.
- The indicator count displayed mid-wizard (51/103 at Step 25) is not necessarily final — the total selected count can change (74/126 at Step 28) as later wizard steps unlock additional indicator eligibility.
- A policy reaching "Healthy" status is a structural validation, not proof of active alerting — explicit test-user scoring (Step 30) is a necessary additional validation step.
- Several of the richest indicator categories (Cloud Apps, Cloud Storage, Cloud Service, Microsoft Fabric, Network) depend entirely on optional connector prerequisites that are easy to overlook if only following the Quick Policy wizard.


## Real-World Scenarios

## Real-World Scenarios

- **Departing employee data theft**: An employee resigns and, in their final two weeks, downloads large volumes of SharePoint content, removes sensitivity labels from several files, and copies files to a USB drive before archiving them — a pattern directly covered by the sequence detection configured in Step 26 (download → obfuscate → exfiltrate) and the Device indicators from Step 8.
- **Accidental oversharing**: A finance employee shares a SharePoint folder containing credit card data with an external partner without realizing the sensitivity of the content — detected via the Credit Card Number SIT prioritization (Step 21) combined with the "sharing SharePoint files with people outside the organization" Office indicator (Step 7).
- **Generative AI data leakage**: An employee pastes proprietary source code or customer data into a public generative AI website — detected via the Risky browsing indicators (Step 9) and Generative AI apps indicators (Step 25).
- **Compromised or malicious insider using evasion techniques**: A user disables endpoint security controls (detected via Defender for Endpoint defense-evasion indicators, Step 9) before exfiltrating data — correlated at higher confidence via sequence detection (Step 26).

