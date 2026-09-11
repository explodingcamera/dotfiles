# Agent Instructions

## Any Prose

make it like google dev docs style. More dead prose. No aphorisms, no flourishes. Simple.

## Code Style

- Keep changes concise, pragmatic, and easy to review.
- Prefer clean, medium-length methods over lots of tiny abstractions.
- Avoid adding helpers that are only used once unless they clearly reduce code without adding much complexity.
- Use descriptive names for functions, variables, and modules.
- Avoid adding new dependencies unless they are clearly worth it.

## Docs / Changelogs

- When adding a new feature, add a changelog entry and update the README if applicable.
- Don't add changelog entries for changes to things that have not been part of a released version yet.
- Try to avoid using semicolons, prefer using commas and conjunctions to separate items in a list.

## Rust / Cargo

- `CARGO_HOME` is `~/.local/share/cargo`.
- Add Rust dependencies with `cargo add` instead of manually editing `Cargo.toml`.
- Use the latest version (no version specified when adding) unless there is a clear reason to pin a version.
- pub(super) or higher should have simple doc comments, pub should have more detailed doc comments / potentially examples.

## TypeScript / Bun

- run biome using the `biome` command available in the path

## Code Changes

- Read nearby code first and match existing patterns before introducing new ones.
- Keep edits focused on the requested change.
- Prefer straightforward code over clever abstractions.
- When touching existing code, preserve the current style unless there is a clear reason to change it.

## Refactoring

- If a file is getting too long, roughly 500+ lines, consider whether it should be simplified or split.
- Prefer simplifying the structure before introducing new modules.
- Split files only when it creates clearer boundaries

## Git / Working Tree

- The user may edit, stage, or modify files while you are working.
- Do not assume every uncommitted change was made by you.
- Preserve unrelated user changes and work around them.

## Project State

- The project may still be early-stage and unreleased.
- Migrations or backwards-compatibility changes may not be needed unless explicitly requested or clearly necessary.

## Repo Notes

- `AGENTS.md` or `PLAN.md` may be gitignored.
- They may not show up in grep, git log, or normal tracked-file searches, but they can still be edited and used by agents.
