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
alias update='paru -Syu && notify-send -t 4000 "Update" "System aktualisiert ✓"'

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
eval "$(zoxide init zsh)"
eval "$(zoxide init zsh)"

ENABLE_CORRECTION="false"
