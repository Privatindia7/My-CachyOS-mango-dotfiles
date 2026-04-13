source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# Editors
export EDITOR=micro
export VISUAL=micro
export SUDO_EDITOR=micro

# NVIDIA/Wayland
export __GL_GSYNC_ALLOWED=0
export __GL_VRR_ALLOWED=0
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1

# Aliases

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
eval "$(zoxide init zsh)"
eval "$(zoxide init zsh)"

ENABLE_CORRECTION="false"
setopt NULL_GLOB
alias neofetch='fastfetch'
unset zle_bracketed_paste

# --- DEINE CUSTOM SETTINGS ---

# 1. Micro statt Nano
export EDITOR='micro'
alias nano='micro'

# 2. Update Alles Alias

# 3. Tilde/Sonderzeichen Fix

# 4. Script-Verzeichnis auflisten
# Sucht in ~/scripts und ~/.config nach relevanten Files
function script() {
    echo "Deine Scripte und Configs:"
    find ~/scripts ~/.config -maxdepth 2 \( -name "*.sh" -o -name "*.cfg" -o -name "*.conf" \) 2>/dev/null
}

# 5. Autoexec Shortcut
# Öffnet die CS2 Autoexec (Pfad ggf. anpassen)
alias autoexec='micro ~/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive/game/csgo/cfg/autoexec.cfg'


# --- VICTORS SCRIPT-ZENTRALE ---

# Listet alle deine wichtigen Scripte und Configs auf
function script() {
    echo -e "\033[1;34m=== Deine Scripte (~/.local/bin) ===\033[0m"
    ls ~/.local/bin/*.sh
    echo -e "\n\033[1;32m=== Wichtige Configs ===\033[0m"
    echo "~/.zshrc"
    echo "~/.local/share/Steam/steamapps/common/Counter-Strike Global Offensive/game/csgo/cfg/autoexec.cfg"
    find ~/.config/mango ~/.config/cachyos -name "*.conf" 2>/dev/null
}

# Direkt-Aliase für deine Scripte
alias cleanup='micro ~/.local/bin/pacman-cleanup.sh'
alias ds='micro ~/.local/bin/dotfiles-sync.sh'
alias gs='micro ~/.local/bin/gamescope-auto.sh'
alias fallout='micro ~/.local/bin/mo2-fallout3.sh'
alias crashlog='micro ~/.local/bin/proton-crashlog.sh'

# Falls du ein Script direkt AUSFÜHREN willst (ohne micro):
alias run-cleanup='bash ~/.local/bin/pacman-cleanup.sh'
alias run-ds='bash ~/.local/bin/dotfiles-sync.sh'

source ~/.zsh_interactive_scripts
export PATH="$HOME/.local/bin:$PATH"
alias update='sudo pacman -Syu --noconfirm && paru -Syu --noconfirm'

# Fish-style Ctrl+L: Zeile leeren + Bildschirm löschen
function smart-clear() {
    zle kill-buffer
    zle clear-screen
}
zle -N smart-clear
bindkey "^L" smart-clear
alias tilde="cd ~"
alias gc='micro ~/.config/ghostty/config'
alias ghostty-config='micro ~/.config/ghostty/config'

# Zsh "Paste-Magic" ausschalten (verhindert Backslashes beim Einfügen)

# Tilde nicht als Globbing-Zeichen interpretieren
unsetopt BEEP

# --- FINAL FIXES ---
# Verhindert Fehlermeldungen bei Sonderzeichen (wie ~)
unsetopt NOMATCH
# Verhindert das automatische Escapen von URLs und Pfaden
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
