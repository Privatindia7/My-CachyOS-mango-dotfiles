source /usr/share/cachyos-fish-config/cachyos-config.fish

# Fastfetch läuft bereits durch fish_greeting in CachyOS-Config
# Keine extra fastfetch Zeile nötig!
set -x EDITOR micro
set -x VISUAL micro
set -x SUDO_EDITOR micro
set -x __GL_GSYNC_ALLOWED 0
set -x __GL_VRR_ALLOWED 0
set -x GBM_BACKEND nvidia-drm
set -x __GLX_VENDOR_LIBRARY_NAME nvidia
set -x WLR_NO_HARDWARE_CURSORS 1

if status is-login
    and test -z "$WAYLAND_DISPLAY"
    and test (tty) = /dev/tty1
    exec mango
end

set -x __GL_GSYNC_ALLOWED 0
set -x __GL_VRR_ALLOWED 0
set -x GBM_BACKEND nvidia-drm
set -x __GLX_VENDOR_LIBRARY_NAME nvidia
set -x WLR_NO_HARDWARE_CURSORS 1
