# dotfiles

Arch Linux + Sway (Wayland). Includes: sway, foot, fuzzel, fish, DankMaterialShell, ly.

## Install

Base packages (official repo):

```sh
sudo pacman -S --needed sway foot fuzzel fish vim thunar firefox ly ttf-jetbrains-mono-nerd papirus-icon-theme
```

AUR (via yay):

```sh
yay -S --needed autotiling azote quickshell-git matugen-bin dgop-bin dms-shell-git
```

Deploy configs:

```sh
cp -rT .config ~/.config && sed -i "s|HOME_PLACEHOLDER|$HOME|g" ~/.config/DankMaterialShell/settings.json
```

```sh
cp -rT .local ~/.local && fc-cache -f
```

```sh
sudo cp -rT etc /etc
```

GTK dark theme:

```sh
dconf load /org/gnome/desktop/interface/ < dconf/interface.ini
```

Enable ly on boot:

```sh
sudo systemctl enable ly.service
```
