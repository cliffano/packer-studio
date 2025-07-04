# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 2.13.0 - 2025-07-06
### Added
- Add Gemini CLI

### Changed
- Upgrade Bob to 4.0.0

### Removed
- Remove ImageMagick (shifted to packer-kon-tiki)

## 2.12.0 - 2025-06-21
### Added
- Re-add ImageMagick

## 2.11.1 - 2025-04-21
### Fixed
- Reverted .poetry/bin from PATH

## 2.11.0 - 2025-04-19
### Added
- Add .poetry/bin and .venv/bin to PATH of the baked image

## 2.10.0 - 2025-04-12
### Added
- Add net-tools
- Add telnet and vim versions info

## 2.9.0 - 2025-01-24
### Changed
- Upgrade node.js to 23.5.0
- Upgrade Bob to 3.1.0

## 2.8.0 - 2024-12-27
### Added
- Add pipx
- Add /root/.local/bin to PATH for pipx-installed packages

### Changed
- Upgrade Ubuntu to 24.04
- Replace ansible.builtin.pip with community.general.pipx

## 2.7.0 - 2024-11-16
### Added
- Re-add /opt/poetry-venv/bin and /opt/poetry/bin: to PATH

## 2.6.0 - 2024-11-09
### Added
- Re-add python3-venv

## 2.5.0 - 2024-11-01
### Added
- Add /usr/local/node/ symlink to version specific node path

## 2.4.1 - 2024-11-01
### Fixed
- Fix checkmake inclusion in PATH
- Fix virtualenv installation by switching to Python package

## 2.4.0 - 2024-10-28
### Added
- Add checkmake installation

## 2.3.0 - 2024-10-20
### Added
- Add awscli Python package
- Add vim package

## 2.2.0 - 2024-09-27

## 2.1.0 - 2024-09-22
### Added
- Add python3-venv to Python provisions

### Fixed
- Fix env PATH to include provisioned software

## 2.0.1 - 2024-09-04
### Fixed
- Fix publish GH Action workflow

## 2.0.0 - 2024-09-04
### Added
- Add Packer plugins for Docker and Ansible

### Changed
- Replace Packer template format to HCL2
- Replace Puppet with Ansible for provisioning

## 1.15.0 - 2024-03-04
### Added
- Add python3.8-venv package

## 1.14.0 - 2024-01-15
### Added
- Add temporary bundler pin to v2.4.22 to support Ruby 2.7.x

### Changed
- Upgrade RTK to 3.1.1
- Upgrade Terraform to 1.6.6
- Upgrade Packer to 1.10.0

## 1.13.0 - 2023-10-14
### Changed
- Upgrade RTK to 3.1.0

## 1.12.1 - 2023-07-30
### Fixed
- Fix publish GH Action to use studio:1.10.0

## 1.12.0 - 2023-07-30
### Added
- Add puppet-masterless Packer plugin installation

### Changed
- Upgrade RTK to 3.0.0

## 1.11.0 - 2023-07-14
### Changed
- Upgrade node.js to 20.x
- Upgrade Packer to 1.9.1
- Upgrade Terraform to 1.5.3

## 1.10.0 - 2023-03-04
### Added
- Add libyaml-dev

### Changed
- Switch sdkman Puppet module to use cliffano/puppet-sdkman fork

## 1.9.0 - 2023-02-13
### Changed
- Upgrade node.js to 18.x

## 1.8.0 - 2023-02-04
### Changed
- Upgrade Go to 1.20
- Upgrade Packer to 1.8.5
- Upgrade Terraform to 1.3.7

## 1.7.0 - 2022-10-15
### Added
- Add ImageMagick
- Add GH CLI
- Add bat ripgrep du-dust bottom exa

## 1.6.0 - 2022-08-07
### Added
- Add checkmake
- Add Bob
- Add info script to list down all versions of provisioned software

## 1.5.0 - 2022-07-01
### Added
- Add yq

## 1.4.0 - 2022-04-12
### Added
- Add TFLint
- Add Checkov

## 1.3.0 - 2022-01-30
### Changed
- Upgrade Go to 1.17
- Upgrade Packer to 1.7.9
- Upgrade Terraform to 1.1.4
- Upgrade node.js to 16.x

## 1.2.1 - 2022-01-19
### Fixed
- Fix missing exec permission for publish entrypoint script

## 1.2.0 - 2022-01-19
### Added
- Add release-* and publish-* GitHub Actions

### Changed
- Move Ruby dependencies to Gemfile
- Upgrade Packer to 1.7.8
- Upgrade Terraform to 1.1.2
- Replace Docker provisioning to follow docker.com guide

## 1.1.0 - 2021-06-05
### Added
- Initial version
