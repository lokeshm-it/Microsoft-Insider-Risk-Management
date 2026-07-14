# Best Practices — Microsoft Purview Insider Risk Management

## Best Practices

| Area | Best Practice |
|---|---|
| Role-based access | Assign named users to the specific functional role groups (Analysts, Investigators, Approvers, Auditors) rather than relying solely on the broad base Insider Risk Management group |
| Privacy | Default to pseudonymized usernames; document who is authorized to un-mask identities and under what conditions |
| Rollout strategy | Pilot with a scoped user population before expanding to "All users, groups, and adaptive scopes" in production |
| Thresholds | Prefer tenant-specific, analytics-derived thresholds over generic Microsoft defaults once sufficient baseline data exists |
| Content prioritization | Keep the prioritized SIT and SharePoint site list current as new regulated data types or sensitive sites are identified |
| Connector coverage | Track unmet optional prerequisites (cloud app connectors, physical badging, Microsoft Fabric) as a prioritized backlog rather than leaving them permanently unconfigured |
| Validation | Always run a scoped test-user scoring exercise before declaring a new policy production-ready |

## Security Best Practices

| # | Practice | Rationale |
|---|---|---|
| 1 | Enforce least-privilege role group assignment | Prevents any single administrator from having end-to-end visibility across detection, investigation, and approval stages |
| 2 | Keep pseudonymization enabled by default | Reduces privacy risk during initial alert triage |
| 3 | Require multi-person review before policy submission | A tenant-wide policy affects monitoring posture for the entire organization |
| 4 | Periodically review the Unallowed domains list | Domain-based risk amplification degrades in value if the list becomes stale |
| 5 | Correlate Insider Risk Management with DLP and Communication Compliance | Cross-solution correlation (as supported by Adaptive Protection, Step 4) produces stronger evidence than any single solution in isolation |
| 6 | Review Defender for Endpoint data-sharing consent with privacy/legal stakeholders | This consent creates a new cross-solution data flow that should be formally approved |

