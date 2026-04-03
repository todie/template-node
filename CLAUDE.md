# template-node

Production-ready Node.js + TypeScript project template.

## Stack

| Tool | Purpose |
|------|---------|
| TypeScript 5 | Type-safe JavaScript |
| Vitest | Fast unit testing |
| Biome | Linting + formatting (replaces ESLint + Prettier) |
| Husky + lint-staged | Pre-commit hooks |
| pnpm | Fast, disk-efficient package manager |
| release-please | Automated changelog + GitHub releases |

## Commands

```bash
pnpm install          # Install dependencies
pnpm run build        # Compile TypeScript → dist/
pnpm run build:watch  # Watch mode
pnpm test             # Run tests once
pnpm run test:watch   # Watch mode
pnpm run test:coverage # Run tests with coverage report
pnpm run lint         # Check lint + format
pnpm run lint:fix     # Auto-fix lint + format issues
pnpm run typecheck    # Type-check without emitting
```

## Project structure

```
src/           TypeScript source files
tests/         Unit tests (co-located or in this directory)
dist/          Compiled output (git-ignored)
coverage/      Coverage report (git-ignored)
```

## Configuration

- **TypeScript**: strict mode + `noUncheckedIndexedAccess` + `exactOptionalPropertyTypes`
- **Biome**: 100-char line width, 2-space indent, double quotes, organise imports
- **Vitest**: 80% coverage thresholds across lines/functions/branches/statements

## CI/CD

- **CI workflow**: lint → typecheck → test → audit → upload coverage to Codecov
- **Release workflow**: release-please creates changelog PRs; merging triggers npm publish


## Related Templates

| Language | Repository |
|----------|------------|
| Rust | [todie/template-rust](https://github.com/todie/template-rust) |
| Python | [todie/template-python](https://github.com/todie/template-python) |
| Terraform | [todie/template-terraform](https://github.com/todie/template-terraform) |
