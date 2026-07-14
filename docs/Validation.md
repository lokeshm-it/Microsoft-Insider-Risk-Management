# Validation — Microsoft Purview Insider Risk Management

## Expected Results

Upon completion of all 30 steps, the tenant has:

- Insider Risk Management analytics enabled at both tenant and user aggregation levels.
- Solution-wide privacy (pseudonymization), policy indicators (Office, Device, Defender for Endpoint, Risky browsing), intelligent detections, and domain configuration in place.
- Visibility into seven built-in Insider Risk Management role groups, with a documented gap in specialized role assignment.
- One **Healthy**, tenant-wide **Data Leaks Insider Risk Policy**, triggered by exfiltration activity, using tenant-specific thresholds, prioritized SharePoint and Credit Card Number content, and full sequence detection.
- Activity scoring actively initiated for one named test user as an operational validation step.

## Validation

### Validation Checklist

| # | Validation Item | Evidence | Result |
|---|---|---|---|
| 1 | Analytics enabled (tenant + user level) | AP05 | Pass |
| 2 | Privacy/pseudonymization configured | AP06 | Pass |
| 3 | Office, Device, Defender, Risky Browsing indicators enabled tenant-wide | AP07–AP09 | Pass |
| 4 | Intelligent detections thresholds and alert volume configured | AP10–AP12 | Pass |
| 5 | Role groups reviewed for RBAC readiness | AP13 | Partial — specialized groups have 0 assigned users |
| 6 | Policy created from Data Leaks quick policy template | AP15–AP16 | Pass |
| 7 | Policy scoped to all users | AP18 | Pass |
| 8 | Content prioritization configured (SharePoint site + SIT) | AP19–AP21 | Pass |
| 9 | Triggering event and thresholds configured | AP23–AP24 | Pass |
| 10 | Indicators and sequence detection configured | AP25–AP26 | Pass |
| 11 | Tenant-specific indicator thresholds applied | AP27 | Pass |
| 12 | Policy submitted and reaches Healthy status | AP28–AP29 | Pass |
| 13 | Activity scoring started for a test user | AP30 | Pass |
| 14 | Alert generation confirmed for the test user | Not shown in available screenshots | **Not validated in this lab** |

