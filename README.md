# dotfiles

Arch Linux + Sway (Wayland). Включает: sway, foot, fuzzel, fish, DankMaterialShell, ly.

## Установка

```sh
yay -S --needed sway swaybg swayidle swaylock autotiling foot fuzzel fish vim thunar firefox ly azote quickshell-git matugen-bin dgop-bin dms-shell-git
cp -rT .config ~/.config && cp -rT .local ~/.local && sudo cp -rT etc /etc && dconf load /org/gnome/desktop/interface/ < dconf/interface.ini
```
