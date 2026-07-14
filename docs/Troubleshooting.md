# Troubleshooting — Microsoft Purview Insider Risk Management

## Troubleshooting

| Symptom | Likely Cause | Resolution |
|---|---|---|
| "You currently aren't assigned to a role group that allows you to view alerts" banner (AP14) | No user assigned to a role group with alert-viewing permission (Analysts, Investigators, or equivalent) | Assign the appropriate user(s) to a role group with the **View Insider Risk Management Alerts** role, per Step 13 |
| Certain indicators greyed out during triggering-event selection (AP23) | Indicator turned off at the tenant/solution-settings level | Use the **Turn on indicators** action shown in the wizard, or enable the indicator in Policy indicators settings (Step 7–9) |
| Zero indicators selected in Defender for Cloud Apps, Cloud storage, Cloud service, Microsoft Fabric, Communication compliance, or Network categories (AP25) | Underlying connector/prerequisite not configured (cloud app connectors, Fabric, network signal sources) | Connect the relevant data source before expecting these indicators to generate alerts |
| Policy shows Healthy but zero users in scope / zero alerts | Policy recently created; alert generation can take up to 24 hours; scoring must be explicitly started for users to appear | Wait for the stated processing window and confirm scoring was started (Step 30) |
| Unallowed/third-party domains show "No domains added yet" | Domains lists were never populated | Populate both lists as part of ongoing governance (Step 11–12) |


## Common Mistakes


- Assuming all users in the base **Insider Risk Management** role group have full alert-viewing capability without checking the specialized role groups (Analysts, Investigators) required for actual alert triage — as flagged directly by the portal's own warning banner in Step 14.
- Selecting indicators from unconnected categories (for example, Cloud storage) expecting them to generate alerts without first onboarding the underlying connector.
- Treating "Healthy" policy status as equivalent to "actively generating alerts," when in fact alert generation can take up to 24 hours and requires activity scoring to be initiated for relevant users.
- Leaving the Unallowed domains and Third-party domains lists empty indefinitely, reducing the effectiveness of several domain-aware indicators.
- Deploying a tenant-wide ("All users") policy as the very first policy without a pilot phase, which can generate an unmanageable alert volume for an under-resourced investigation team.

