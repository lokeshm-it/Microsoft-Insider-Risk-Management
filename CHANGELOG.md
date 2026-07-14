# Changelog

All notable changes to this repository are documented in this file, following [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) conventions with date-based entries.

## [1.0.0] - 2026-07-08

### Added
- Initial repository build: README.md with full 30-step implementation walkthrough, architecture diagram, case study, certification mapping, badges
- `docs/` — Architecture, Implementation-Guide (full exhaustive 30-step SOP), Validation, Troubleshooting, Lessons-Learned, Best-Practices, References
- `scripts/` — Connect-SecurityComplianceCenter.ps1, Verify-InsiderRiskPolicy.ps1, Validate-InsiderRiskConfiguration.ps1
- `diagrams/` — Architecture.mmd, Workflow.mmd, PolicyFlow.mmd (Mermaid)
- `images/` — 30 screenshots documenting Insider Risk Management solution settings, role groups, and the full Data Leaks policy creation wizard
- LICENSE, CONTRIBUTING.md, SECURITY.md

### Lab Timeline (from screenshot evidence)
- Solution overview, recommendations, and Analytics/Privacy/Policy indicator/Intelligent detections settings configured
- Insider Risk Management role groups reviewed (7 built-in groups; only base group has an assigned user)
- Data Leaks quick policy created: named, scoped to all users, content-prioritized (Team Site, Credit Card Number), exfiltration-triggered, built-in trigger thresholds, 74/126 indicators, full sequence detection, tenant-specific indicator thresholds
- Policy submitted and reached Healthy status
- Activity scoring started for Test User 1 (5-day scope) to validate the deployment
