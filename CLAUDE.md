# CLAUDE.md — TypeScript/Node Project (from todie/template-node)

## Template Family
This project was scaffolded from [todie/template-node](https://github.com/todie/template-node).
See also: [template-rust](https://github.com/todie/template-rust) | [template-python](https://github.com/todie/template-python) | [template-terraform](https://github.com/todie/template-terraform)

## Setup
- `pnpm install` — install dependencies (uses pnpm, not npm/yarn)
- `pnpm install --frozen-lockfile` — CI-style install (no lockfile changes)

## Build & Run
- `pnpm build` — compile TypeScript
- `pnpm start` — run the built output
- `pnpm dev` — development mode (if configured)

## Test
- `pnpm test` — run tests with Vitest (10x faster than Jest)
- `pnpm test -- --run` — run once without watch mode
- `pnpm test -- --coverage` — with coverage report
- `pnpm test -- -t "test name"` — run specific test

## Lint & Format
- `pnpm run lint` — run Biome check (lint + format, 56x faster than ESLint)
- `pnpm run format` — auto-format with Biome
- `npx biome check .` — direct Biome invocation
- `npx biome check . --write` — lint + format with auto-fix
- Husky + lint-staged runs Biome on pre-commit

## Type Checking
- `pnpm run typecheck` or `tsc --noEmit` — strict TypeScript checking
- tsconfig.json has: strict, noUncheckedIndexedAccess, exactOptionalPropertyTypes

## Security
- `pnpm audit` — dependency vulnerability scan
- Socket.dev GitHub App recommended for supply chain monitoring

## CI Pipeline
CI runs on every PR: pnpm install → biome check → tsc --noEmit → vitest → pnpm audit.

## Release
Uses release-please for automated semver. Write conventional commits:
- `feat:` → minor bump, `fix:` → patch bump, `feat!:` → major bump
- `chore:`, `docs:`, `refactor:`, `test:`, `ci:` → no version bump

## Commit Discipline
- One logical change per commit
- One commit stack per feature branch
- File a PR for each feature branch
- Never bundle unrelated changes
- Never push directly to main

## Architecture Notes
- Biome replaces ESLint + Prettier (single tool, zero config)
- Vitest replaces Jest (native ESM, native TypeScript, compatible API)
- pnpm prevents phantom dependencies (content-addressable store)
- Docker: multi-stage with dumb-init as PID 1 for proper signal handling
- Node 22+ required (see .nvmrc)
