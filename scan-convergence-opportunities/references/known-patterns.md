# Known Convergence Patterns

A living catalog of artifact types that exhibit validity-fitness duality. Each entry has characteristic structural rules (validity) and quality dimensions (fitness). The scanner matches project artifacts against these patterns.

This catalog grows from use. When the scanner discovers a new pattern through structural isomorphism, it asks the user whether to add it here.

## Catalog

### API surface
**Validity:** Spec compliance, required fields, type correctness, authentication rules, versioning policy, error response structure
**Fitness:** Developer experience, naming consistency across endpoints, discoverability, error message clarity, how natural it feels to integrate with
**Audience:** API consumers (internal developers, external partners, SDK users)

### Database schemas and migrations
**Validity:** Referential integrity, type constraints, index requirements, not-null enforcement, migration reversibility
**Fitness:** Data modeling quality, query performance patterns, how well the schema serves the application layer, naming conventions
**Audience:** Backend developers, DBAs, anyone writing queries

### Component libraries
**Validity:** Prop types, accessibility requirements (WCAG), required variants and states, responsive breakpoints
**Fitness:** Design consistency across components, usability patterns, composability, how intuitive the API is for developers consuming the library
**Audience:** Frontend developers, designers reviewing implementations

### Infrastructure configs
**Validity:** Security policies, resource limits, required tags/labels, network rules, compliance requirements
**Fitness:** Operational clarity, cost efficiency, team conventions, how readable the config is for on-call debugging
**Audience:** Platform/DevOps engineers, on-call responders

### Documentation
**Validity:** Factual accuracy, required sections present, link validity, code examples that compile/run
**Fitness:** Readability, audience fit, completeness for the reader's level, how well it answers the questions someone actually has
**Audience:** Developers onboarding, users following guides, contributors reading architecture docs

### Test suites
**Validity:** Coverage thresholds met, assertions present (not just "runs without error"), no skipped/disabled tests without reason
**Fitness:** Test design quality, maintainability, whether tests actually verify meaningful behavior vs implementation details, how quickly a failing test tells you what's wrong
**Audience:** Developers reading tests to understand behavior, CI systems, code reviewers

### CI/CD pipelines
**Validity:** Required stages present (lint, test, security scan, build), approval gates configured, secrets not exposed
**Fitness:** Pipeline design, feedback speed, developer experience of the CI process, how fast you know if your change is safe
**Audience:** Every developer who pushes code

### API client SDKs
**Validity:** Type safety, method signatures match API spec, error types cover all API error codes
**Fitness:** Ergonomics, naming conventions, how natural it feels to use, documentation coverage of common use cases
**Audience:** Developers consuming the SDK

### Configuration schemas
**Validity:** Valid value ranges, required fields, type correctness, no deprecated options used
**Fitness:** Sensible defaults, documentation of each option, discoverability of features, how easy it is to configure correctly
**Audience:** Operators, developers configuring the system

### Data pipelines
**Validity:** Schema validation at boundaries, null handling, deduplication rules, idempotency guarantees
**Fitness:** Data quality, lineage clarity, monitoring coverage, how debuggable the pipeline is when something goes wrong
**Audience:** Data engineers, analysts consuming the output, on-call responders

### Academic papers
**Validity:** Mathematical correctness, proof completeness, notation consistency, citation completeness, journal formatting compliance
**Fitness:** Logical chain clarity, prose quality for the target journal's audience, coherence across sections
**Audience:** Journal referees, field researchers
