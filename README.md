<div align="center">

<!-- Replace with your own logo or remove -->
<img src="https://placehold.co/120x120/0f172a/38bdf8?text=TN&font=montserrat" alt="template-node logo" width="120" height="120" />

<h1>template-node</h1>

<p><strong>Production-ready Node.js + TypeScript starter</strong><br/>
Strict types · Fast tests · Zero-config linting · Automated releases</p>

[![CI](https://github.com/todie/template-node/actions/workflows/ci.yml/badge.svg)](https://github.com/todie/template-node/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Node ≥ 22](https://img.shields.io/badge/node-%E2%89%A522-brightgreen?logo=node.js&logoColor=white)](https://nodejs.org)
[![pnpm](https://img.shields.io/badge/pnpm-managed-f69220?logo=pnpm&logoColor=white)](https://pnpm.io)
[![TypeScript](https://img.shields.io/badge/TypeScript-strict-3178c6?logo=typescript&logoColor=white)](https://typescriptlang.org)
[![Biome](https://img.shields.io/badge/Biome-lint%20%2B%20format-60a5fa?logo=biome&logoColor=white)](https://biomejs.dev)
[![codecov](https://codecov.io/gh/todie/template-node/branch/main/graph/badge.svg)](https://codecov.io/gh/todie/template-node)

</div>

---

## todie Template Family

This is the **TypeScript/Node** template. Part of the todie.io standardized project scaffolding.

| Template | Language | Repo |
|----------|----------|------|
| template-rust | Rust | [todie/template-rust](https://github.com/todie/template-rust) |
| template-python | Python 3.12+ | [todie/template-python](https://github.com/todie/template-python) |
| **template-node** | TypeScript/Node | *you are here* |
| template-terraform | Terraform/IaC | [todie/template-terraform](https://github.com/todie/template-terraform) |

All templates follow the [todie.io SOP](https://github.com/todie) — consistent CI/CD, linting, security scanning, release automation, and commit discipline across every project.

---

## Overview

`template-node` is a [GitHub template repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) that gives you a fully wired Node.js project in seconds:

| Feature | Tool |
|---|---|
| Language | TypeScript 5 — strict + extras |
| Test runner | Vitest with V8 coverage |
| Lint + format | Biome (replaces ESLint + Prettier) |
| Pre-commit | Husky + lint-staged |
| Package manager | pnpm |
| Releases | release-please (changelog + npm publish) |
| Container | Multi-stage Docker with dumb-init |
| CI | GitHub Actions |

---

## Quick Start

1. Click **Use this template** → **Create a new repository**
2. Clone your new repo and install:

```bash
git clone https://github.com/<you>/<your-repo>
cd <your-repo>
pnpm install
```

3. Start building:

```bash
pnpm run build        # compile TypeScript
pnpm test             # run tests
```

---

## Development

### Prerequisites

- **Node.js 22+** — use [nvm](https://github.com/nvm-sh/nvm) or [fnm](https://github.com/Schniz/fnm): `nvm use`
- **pnpm** — `corepack enable && corepack prepare pnpm@latest --activate`

### Setup

```bash
pnpm install          # install deps + activate husky pre-commit hook
```

### Commands

| Command | Description |
|---|---|
| `pnpm run build` | Compile TypeScript → `dist/` |
| `pnpm run build:watch` | Compile in watch mode |
| `pnpm test` | Run tests once |
| `pnpm run test:watch` | Run tests in watch mode |
| `pnpm run test:coverage` | Run tests with coverage report |
| `pnpm run lint` | Check with Biome |
| `pnpm run lint:fix` | Auto-fix with Biome |
| `pnpm run typecheck` | Type-check without emitting |

### Project Layout

```
template-node/
├── src/              # TypeScript source
│   └── index.ts
├── tests/            # Unit tests
│   └── index.test.ts
├── dist/             # Compiled output  (git-ignored)
├── coverage/         # Coverage report  (git-ignored)
├── .github/
│   └── workflows/
│       ├── ci.yml          # Lint → typecheck → test → audit
│       └── release.yml     # release-please + npm publish
├── biome.json        # Lint + format config
├── tsconfig.json     # TypeScript config
├── vitest.config.ts  # Test config
└── Dockerfile        # Multi-stage production image
```

---

## Docker

```bash
# Build the image
docker build -t my-app .

# Run
docker run --rm -p 3000:3000 my-app
```

The image uses a multi-stage build:

- **Builder** — installs deps with `pnpm fetch` (cache-friendly), compiles TypeScript
- **Runtime** — minimal `node:22-slim`, `dumb-init` as PID 1, non-root user

---

## CI/CD

### Continuous Integration

Every push and pull request to `main` runs:

```
pnpm install --frozen-lockfile
  → biome check          (lint + format)
  → tsc --noEmit         (type-check)
  → vitest --coverage    (tests + coverage upload to Codecov)
  → pnpm audit           (dependency vulnerability scan)
```

### Releases

Powered by [release-please](https://github.com/googleapis/release-please-action):

1. Merge conventional commits to `main`
2. release-please opens a **Release PR** with an updated `CHANGELOG.md` and bumped version
3. Merging the Release PR creates a GitHub Release **and** publishes to npm

Commit types that bump versions:

| Prefix | Version bump |
|---|---|
| `fix:` | patch |
| `feat:` | minor |
| `feat!:` / `BREAKING CHANGE:` | major |

---

## License

[MIT](LICENSE) © 2026 [todie.io](https://todie.io)
