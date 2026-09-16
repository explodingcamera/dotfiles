# Agent Instructions

## Prose

- Use Google developer documentation style: plain, direct, and without aphorisms or flourishes.

## Code

- Read nearby code first. Match its patterns and preserve its style unless there is a clear reason to change it.
- Keep changes focused, concise, pragmatic, and easy to review.
- Prefer straightforward code and clean, medium-length methods over clever abstractions or many small helpers.
- Avoid single-use helpers unless they clearly reduce code without adding much complexity.
- Follow the language and ecosystem's idioms for naming, structure, and API design. Use descriptive names for functions, variables, and modules.
- Keep test names concise. Name the behavior being verified without restating every setup detail.
- Avoid new dependencies unless they are clearly worthwhile.
- For files around 500 lines or longer, consider simplifying or splitting them. Simplify first, and split only at clear boundaries.

## Documentation and changelogs

- For new features, add a changelog entry and update the README when applicable.
- Do not add changelog entries for unreleased functionality.
- Avoid semicolons in prose. Use commas or conjunctions in lists.

## Rust and Cargo

- `CARGO_HOME` is `~/.local/share/cargo`.
- Add dependencies with `cargo add` rather than editing `Cargo.toml`.
- Use the latest version unless there is a clear reason to pin one.
- Prefer `impl` methods when behavior naturally belongs to a type or uses its state. Use free functions for standalone operations.
- Add simple doc comments to `pub(super)` or higher items. Give `pub` items more detail and examples when useful.

## TypeScript and Bun

- Run Biome with the `biome` command available in `PATH`.

## Working tree

- The user may edit or stage files while you work. Do not assume uncommitted changes are yours.
- Preserve unrelated changes and work around them.

## Project state

- The project may be early-stage and unreleased.
- Add migrations or backward compatibility only when requested or clearly necessary.
- Check for `AGENTS.md` and `PLAN.md` directly. They may be gitignored and absent from search results, tracked-file lists, or Git history.
