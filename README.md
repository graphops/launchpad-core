# Launchpad Core

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

**WARNING: Launchpad is ALPHA quality software. We are rapidly iterating to create the best UX for Indexers. Expect API-breaking changes for the next few weeks. Contributors are very welcome.**

## Introduction

Launchpad is a toolkit for running a Graph Protocol Indexer on Kubernetes. It aims to provide the fastest path to production multi-chain indexing, with sane security and performance defaults. It should work well whether you have a single host or twenty.

There are two components to be aware of:

1. Starter ([`graphops/launchpad-starter`](https://github.com/graphops/launchpad-starter)): A starting point for every new Launchpad deployment. It uses a submodule to import all templated definitions from Core.
2. Core (this repo): Templated tasks, release definitions, scripts and other components

If you are looking to use Launchpad, please go to [`launchpad-starter`](https://github.com/graphops/launchpad-starter).

## Contributing

We welcome and appreciate your contributions! Please see the [Contributor Guide](/CONTRIBUTING.md), [Code Of Conduct](/CODE_OF_CONDUCT.md) and [Security Notes](/SECURITY.md) for this repository.

## See also

- [`graphops/launchpad-core`](https://github.com/graphops/launchpad-core)
- [`graphops/helm-charts`](https://github.com/graphops/helm-charts)
