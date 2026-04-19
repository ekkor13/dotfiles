# dotfiles

Arch Linux + Sway (Wayland). Includes: sway, foot, fuzzel, fish, DankMaterialShell, ly.

## Install

Base packages (official repo):

```sh
sudo pacman -S --needed sway swaybg swayidle swaylock foot fuzzel fish vim thunar firefox ly
```

AUR (via yay):

```sh
yay -S --needed autotiling azote quickshell-git matugen-bin dgop-bin dms-shell-git
```

Deploy configs:

```sh
cp -rT .config ~/.config
```

```sh
cp -rT .local ~/.local
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
