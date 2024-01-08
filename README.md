# Puppet Development Container

[![Maintained by betadots GmbH](https://img.shields.io/badge/Maintained%20by-betadots%20GmbH-blue.svg)](https://www.betadots.de)
[![QA🚦](https://github.com/betadots/pdc/actions/workflows/ci.yaml/badge.svg)](https://github.com/betadots/pdc/actions/workflows/ci.yaml)
[![Build and publish a 🛢️ container](https://github.com/betadots/pdc/actions/workflows/build_container.yml/badge.svg)](https://github.com/betadots/pdc/actions/workflows/build_container.yml)

This repository contains the code for the betadots Puppet Development Container (PDC).

## Usage

```shell
docker run -ti --rm ghcr.io:betadots/pdc:latest bash
```

Rather than using bash directly, you have the option to mount the repository and run a script.

Included fixed software versions, see: [build_versions.json](build_versions.json)

For any given container tag you can lookup the specific versions here: `https://github.com/betadots/pdc/blob/$TAG/build_versions.json`
