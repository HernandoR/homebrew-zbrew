# HernandoR/homebrew-zerobrew

Homebrew tap for [HernandoR/zerobrew](https://github.com/HernandoR/zerobrew), a
maintained fork of [lucasgelfond/zerobrew](https://github.com/lucasgelfond/zerobrew),
which its original authors marked as unmaintained.

```bash
brew install HernandoR/zerobrew/zerobrew
```

Installs both `zb` and `zbx` from the fork's GitHub release. `zbx` resolves `zb`
as a sibling executable, so the two must stay in the same directory.

## Current version

**This tap currently installs `v0.3.3-rc.1`, which is a pre-release.** It is the
only release the fork has published so far. The formula will be repointed at
`0.3.3` when that ships.

To install a stable build instead, build from source:

```bash
git clone https://github.com/HernandoR/zerobrew.git
cd zerobrew
just install
```

## Verifying a download

Release artifacts carry build provenance attestations:

```bash
gh attestation verify --repo HernandoR/zerobrew "$(brew --prefix)/bin/zb"
```

Checksums for every artifact are published as `SHA256SUMS` on each
[release](https://github.com/HernandoR/zerobrew/releases).
