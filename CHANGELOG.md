# Changelog

All notable changes to this project will be documented in this file.

## [v3.2.0](https://github.com/betadots/pdc/tree/v3.2.0) (2024-09-13)

[Full Changelog](https://github.com/betadots/pdc/compare/v3.1.0...v3.2.0)

**Implemented enhancements:**

- feat: update versions, set defaults to puppet8 [\#64](https://github.com/betadots/pdc/pull/64) ([rwaffen](https://github.com/rwaffen))
- feat: Update CI, add jq [\#61](https://github.com/betadots/pdc/pull/61) ([rwaffen](https://github.com/rwaffen))
- add puppet tools repo, to get bolt from central repo [\#60](https://github.com/betadots/pdc/pull/60) ([rwaffen](https://github.com/rwaffen))
- update puppet, termini, terraform and bolt [\#59](https://github.com/betadots/pdc/pull/59) ([rwaffen](https://github.com/rwaffen))

**Merged pull requests:**

- fix: LegacyKeyValueFormat Dockerfile lint warning [\#65](https://github.com/betadots/pdc/pull/65) ([rwaffen](https://github.com/rwaffen))

## [v3.1.0](https://github.com/betadots/pdc/tree/v3.1.0) (2024-06-18)

[Full Changelog](https://github.com/betadots/pdc/compare/v3.0.0...v3.1.0)

**Implemented enhancements:**

- Update puppet, puppetdb-termini, terraform, pdk and bolt to latest versions [\#55](https://github.com/betadots/pdc/pull/55) ([rwaffen](https://github.com/rwaffen))
- update terraform for release 8 image [\#52](https://github.com/betadots/pdc/pull/52) ([rwaffen](https://github.com/rwaffen))

**Closed issues:**

- Replacement for Vox Pupuli testing Container? [\#49](https://github.com/betadots/pdc/issues/49)
- need newer ruby for puppet 8 gems [\#48](https://github.com/betadots/pdc/issues/48)

**Merged pull requests:**

- add toc and license link to readme [\#57](https://github.com/betadots/pdc/pull/57) ([rwaffen](https://github.com/rwaffen))
- Update readme/release notes [\#56](https://github.com/betadots/pdc/pull/56) ([rwaffen](https://github.com/rwaffen))
- Bump docker/build-push-action from 5 to 6 [\#54](https://github.com/betadots/pdc/pull/54) ([dependabot[bot]](https://github.com/apps/dependabot))

## [v3.0.0](https://github.com/betadots/pdc/tree/v3.0.0) (2024-04-16)

[Full Changelog](https://github.com/betadots/pdc/compare/v2.1.0...v3.0.0)

**Breaking changes:**

- update puppet versions, drop gems again, update github workflows [\#50](https://github.com/betadots/pdc/pull/50) ([rwaffen](https://github.com/rwaffen))

**Implemented enhancements:**

- Add modulesync to Container Image [\#45](https://github.com/betadots/pdc/pull/45) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- use same version for puppet package and rubygem [\#46](https://github.com/betadots/pdc/pull/46) ([rwaffen](https://github.com/rwaffen))

## [v2.1.0](https://github.com/betadots/pdc/tree/v2.1.0) (2024-03-12)

[Full Changelog](https://github.com/betadots/pdc/compare/v2.0.0...v2.1.0)

**Implemented enhancements:**

- Add rubygems for module testing [\#43](https://github.com/betadots/pdc/pull/43) ([rwaffen](https://github.com/rwaffen))

## [v2.0.0](https://github.com/betadots/pdc/tree/v2.0.0) (2024-02-02)

[Full Changelog](https://github.com/betadots/pdc/compare/v1.1.0...v2.0.0)

**Breaking changes:**

- Clean up repo, remove not needed code [\#41](https://github.com/betadots/pdc/pull/41) ([rwaffen](https://github.com/rwaffen))

**Implemented enhancements:**

- Update container build and update terraform binary [\#39](https://github.com/betadots/pdc/pull/39) ([rwaffen](https://github.com/rwaffen))

**Closed issues:**

- add trivy scanning [\#37](https://github.com/betadots/pdc/issues/37)

**Merged pull requests:**

- Create CONTRIBUTING.md [\#40](https://github.com/betadots/pdc/pull/40) ([rwaffen](https://github.com/rwaffen))
- add trivy [\#38](https://github.com/betadots/pdc/pull/38) ([rwaffen](https://github.com/rwaffen))

## [v1.1.0](https://github.com/betadots/pdc/tree/v1.1.0) (2024-01-26)

[Full Changelog](https://github.com/betadots/pdc/compare/v1.0.1...v1.1.0)

**Implemented enhancements:**

- Update puppet agent, puppet-termini and terraform [\#35](https://github.com/betadots/pdc/pull/35) ([rwaffen](https://github.com/rwaffen))
- update terraform to 1.6.6 [\#33](https://github.com/betadots/pdc/pull/33) ([rwaffen](https://github.com/rwaffen))

**Closed issues:**

- also push to dockerhub [\#29](https://github.com/betadots/pdc/issues/29)

**Merged pull requests:**

- Bump peter-evans/dockerhub-description from 3 to 4 [\#34](https://github.com/betadots/pdc/pull/34) ([dependabot[bot]](https://github.com/apps/dependabot))
- Update docu [\#32](https://github.com/betadots/pdc/pull/32) ([rwaffen](https://github.com/rwaffen))

## [v1.0.1](https://github.com/betadots/pdc/tree/v1.0.1) (2024-01-09)

[Full Changelog](https://github.com/betadots/pdc/compare/v1.0.0...v1.0.1)

**Implemented enhancements:**

- update pdk version and Gemfile [\#28](https://github.com/betadots/pdc/pull/28) ([tuxmea](https://github.com/tuxmea))

**Closed issues:**

- Allow the use of PDC with CD4PE [\#27](https://github.com/betadots/pdc/issues/27)

**Merged pull requests:**

- Also push to dockerhub [\#30](https://github.com/betadots/pdc/pull/30) ([rwaffen](https://github.com/rwaffen))

## [v1.0.0](https://github.com/betadots/pdc/tree/v1.0.0) (2023-11-29)

[Full Changelog](https://github.com/betadots/pdc/compare/v8.2.0...v1.0.0)

**Merged pull requests:**

- Update build\_container.yml and Dockerfile [\#25](https://github.com/betadots/pdc/pull/25) ([rwaffen](https://github.com/rwaffen))
- Update voxpupuli-acceptance requirement from ~\> 2.1 to ~\> 3.0 [\#24](https://github.com/betadots/pdc/pull/24) ([dependabot[bot]](https://github.com/apps/dependabot))
- update ci to use v2 [\#23](https://github.com/betadots/pdc/pull/23) ([rwaffen](https://github.com/rwaffen))
- add build step to build development tag again [\#22](https://github.com/betadots/pdc/pull/22) ([rwaffen](https://github.com/rwaffen))
- add terraform 1.6.2 [\#21](https://github.com/betadots/pdc/pull/21) ([rwaffen](https://github.com/rwaffen))

## [v8.2.0](https://github.com/betadots/pdc/tree/v8.2.0) (2023-10-06)

[Full Changelog](https://github.com/betadots/pdc/compare/v7.26.0...v8.2.0)

**Merged pull requests:**

- add if to build major versions depending on tag version name [\#19](https://github.com/betadots/pdc/pull/19) ([rwaffen](https://github.com/rwaffen))

## [v7.26.0](https://github.com/betadots/pdc/tree/v7.26.0) (2023-10-06)

[Full Changelog](https://github.com/betadots/pdc/compare/7.25.0-rc.1...v7.26.0)

**Merged pull requests:**

- Extend Dockerfile with additional labels [\#18](https://github.com/betadots/pdc/pull/18) ([bastelfreak](https://github.com/bastelfreak))
- purge unneeded files in Dockerfile [\#17](https://github.com/betadots/pdc/pull/17) ([bastelfreak](https://github.com/bastelfreak))
- Install ca-certificates in Dockerfile [\#16](https://github.com/betadots/pdc/pull/16) ([bastelfreak](https://github.com/bastelfreak))
- update container test build gha [\#15](https://github.com/betadots/pdc/pull/15) ([rwaffen](https://github.com/rwaffen))
- update container build gha [\#14](https://github.com/betadots/pdc/pull/14) ([rwaffen](https://github.com/rwaffen))
- use Jammy packages on Ubuntu 22.04, not Focal [\#13](https://github.com/betadots/pdc/pull/13) ([bastelfreak](https://github.com/bastelfreak))
- Run CI on PRs and merged to main [\#12](https://github.com/betadots/pdc/pull/12) ([bastelfreak](https://github.com/bastelfreak))
- Test Gem installation in CI [\#11](https://github.com/betadots/pdc/pull/11) ([bastelfreak](https://github.com/bastelfreak))
- Add bolt to Dockerfile [\#10](https://github.com/betadots/pdc/pull/10) ([bastelfreak](https://github.com/bastelfreak))
- Bump docker/build-push-action from 4 to 5 [\#9](https://github.com/betadots/pdc/pull/9) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump docker/login-action from 2.1.0 to 3.0.0 [\#8](https://github.com/betadots/pdc/pull/8) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump actions/checkout from 3 to 4 [\#7](https://github.com/betadots/pdc/pull/7) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump ubuntu from 20.04 to 22.04 [\#6](https://github.com/betadots/pdc/pull/6) ([dependabot[bot]](https://github.com/apps/dependabot))
- dependabot: check for github actions, docker and gems [\#5](https://github.com/betadots/pdc/pull/5) ([bastelfreak](https://github.com/bastelfreak))
- Update ra10ke requirement from ~\> 2.0 to ~\> 3.0 [\#4](https://github.com/betadots/pdc/pull/4) ([dependabot[bot]](https://github.com/apps/dependabot))
- Update voxpupuli-test requirement from ~\> 6.0 to ~\> 7.0 [\#3](https://github.com/betadots/pdc/pull/3) ([dependabot[bot]](https://github.com/apps/dependabot))
- Update r10k requirement from ~\> 3.15 to ~\> 4.0 [\#2](https://github.com/betadots/pdc/pull/2) ([dependabot[bot]](https://github.com/apps/dependabot))

## [7.25.0-rc.1](https://github.com/betadots/pdc/tree/7.25.0-rc.1) (2023-07-11)

[Full Changelog](https://github.com/betadots/pdc/compare/3782c73e9407d86394a27e959cb84731290db4e3...7.25.0-rc.1)

**Merged pull requests:**

- Update voxpupuli-acceptance requirement from ~\> 1.2 to ~\> 2.1 [\#1](https://github.com/betadots/pdc/pull/1) ([dependabot[bot]](https://github.com/apps/dependabot))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
