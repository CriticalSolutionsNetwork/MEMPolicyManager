# Changelog for MemPolicyManager

The format is based on and uses the types of changes according to [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Added access token authentication
- Added User Managed Identity auth - Needs Testing
- Added System Manged Identity auth - Needs Testing
- Added Environment variable auth - Needs Testing

### Changed

- Updated authentication logic to support new authentication methods and parameters in `Get-EmMdmGraphAuth`.

## [0.1.3] - 2024-07-28

### Fix

- Corrected the authentication logic in Get-EmMdmGraphAuth and its related private functions and classes.
- Ensured the functions generate a proper authentication object compatible with Connect-MgGraph.

## [0.1.0] - 2024-07-22

### Added

- First commit of working module and help documentation.
- Added as public module to PowerShell Gallery.
