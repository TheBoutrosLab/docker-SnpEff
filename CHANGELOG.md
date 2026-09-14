# Changelog
All notable changes to the tool_name Docker file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]
### Changed
- Update base Ubuntu image version to `v24.04`
- Switch to GitHub Packages registry in `CICD-base.yaml`
- Update `metadata.yaml` and `PULL_REQUEST_TEMPLATE.md` and replace Docker Hub with GitHub Packages in the template
- Changed something but it is not part of the last release.
- Update to use `miniforge` for builder, version `26.1.1-2`
- Install tool into tool-specific env dir

### Added
- Add `Docker-build-release.yaml`
- Add `image_name` to `metadata.yaml`

---

## [1.0.0] - YYYY-MM-DD
### Added
- For new features.
- Added item 1.

### Changed
- For changes in existing functionality.
- Changed item 1.

### Deprecated
- For soon-to-be removed features.

### Removed
- For now removed features.
- Removed item 1.

### Fixed
- For any bug fixes.
- Fixed item 1.

### Security
- In case of vulnerabilities.
