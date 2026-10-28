# user

Primary Unix account, per-user packages, git identity, and `gh` for `config.common.username`. REAPER, PipeWire tools, and guitar apps live in `music/` when that module is enabled.

- `default.nix` — `users.users` (`isNormalUser`, groups, packages), HM wrapper (git)
- `home-manager.nix` — `gh`, generic shell integration for HM programs

Requires **`./common`** only. Enables NetworkManager, `nixpkgs.config.allowUnfree`, and default `system.stateVersion` (`26.05`). Does not set login shell (see `shell/`) or GNOME dconf (see `desktop/`). Set the account password on the host.
