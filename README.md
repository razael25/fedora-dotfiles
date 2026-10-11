# fedora-dotfiles

Fedora (Sway + Alacritty + Zsh) dotfiles. Flat layout mirroring `$HOME` — clone and copy/symlink.

## Contents

- Shell: `.zshrc`, `.bashrc`, `.bash_profile`, `.bash_logout`, `.p10k.zsh`, `.gitconfig`
- `.config/alacritty/alacritty.toml` — Gruvbox dark, JetBrainsMono Nerd Font
- `.config/sway/` — sway config + `config.d/` (outputs, gaps, fx, autotiling, bar, swayidle)
- `.config/rofi/config.rasi`
- `.config/fastfetch/config.jsonc`
- `.config/mpv/` (`mpv.conf`, `input.conf`), `.config/htop/htoprc`, `.config/kanshi/config`
- `.config/noctalia/config.toml`, `.config/opencode/opencode.jsonc`, `.config/glow/glow.yml`
- `.config/gtk-3.0/`, `gtk-4.0/`, `Thunar/`, `mimeapps.list`, `user-dirs.*`, `pavucontrol.ini`
- `.config/environment.d/`, `autostart/`, `systemd/user/dunst.service`
- `.local/bin/autotiling`, `autotiling-once`

## Excluded on purpose (secrets / machine-specific / heavy)

`.ssh/`, `.config/gh/`, `.config/opencode/service.json`, `.cache/`, `.mozilla/`,
browser profiles (chrome/edge/helium), `.oh-my-zsh/`, history files
(`.bash_history`, `.zsh_history`), `*.bak-*`, `*.zwc`, `ff2mpv/` (separate repo).

## Install

```bash
git clone https://github.com/razael25/fedora-dotfiles.git ~/fedora-dotfiles
cd ~/fedora-dotfiles
./install.sh
```

`install.sh` backs up existing files to `~/.dotfiles.bak-<timestamp>/` then symlinks everything.
To copy instead of symlink: `./install.sh --copy`.

## Requirements

- `zsh`, [oh-my-zsh](https://ohmyzsh.sh) + `powerlevel10k`, plugins `zsh-autosuggestions` + `zsh-syntax-highlighting`
- `sway`, `alacritty`, `rofi-wayland`, `fastfetch`, `mpv`, `kanshi`, `autotiling` (pip: `pip install autotiling`)
- Fonts: JetBrainsMono Nerd Font
