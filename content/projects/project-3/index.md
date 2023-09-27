+++
title = "SwayDark, tiling dotfiles for power users"
date = 2023-09-01

[taxonomies]
categories = ["software"]
tags = ["software", "ricing"]
+++

Getting coding superpowers with this dark theme!

<!-- more -->

If you just want the dotfiles, skip here[^1]. If some files are missing, go here[^3].

# Plymouth Themes

I use a custom plymouth theme from this repository. A lot of cool themes are available here. Choose one to your liking.

```sh
git clone https://github.com/adi1090x/plymouth-themes.git
# now mv all of that in /usr/share/plymouth/themes

sudo plymouth-set-default-theme -R angular
```
# Sway config

It is mostly arranged and commented enough for you to set up. In any case:
- `variables` contain some of the definitions and the rofi command.
- `systemd-services` are there to fix a bug with firefox. Unfortunately I cannot find the link to the discussion, but if you do I'll be glad.
- `output` should honestly not be a separate file. It will only make sense to have it if you use multiple displays. I use wpaperd and an autotiling script to split the window based on the dimensions of the window. The script is included in the `.bin` folder.
- `input` is for my trackpad configuration.
- `swaylock` contains the config for how to activate swaylock. Before sleeping, `grim` takes a screenshot of the current workspace which is blurred by `convert` command. Then swaylock uses it as the background.
- `keybinds` are the most detailed of them all. It is divided accordingly.
- `bindings-brightness` is meant to override a system config file that sent a notification every time I increased or decreased brightness/sound. This file sends it to `wob` instead.
- `autostart` is for starting applications when sway starts.
- `windows` is for window decorations and related config.
- `bar` is for setting waybar and using `nm-applet` and `blueman`.

# Waybar 

Pretty much the standard fedora config that is recoloured and rearranged.

# GTK Windows

Open DCONF editor and navigate to `/org/gnome/desktop/wm/preferences`. Over there change the `button-layout` to `':'`. This removes all the buttons from the top bar. I use keybindings to minimize, maximize and close my windows, so I don't need them. 

> Do **NOT** set it to `''` otherwise sushi file previewer in Nautilus will stop working.[^2]


## Firefox and Librewolf

I use both of them as flatpaks. To style them use the stylesheet provided in the repositories. Find your browser profiles in `/var/app/<firefox folder>/.mozilla/firefox/<alphanumeric-string>.default-release/`. If `chrome` folder doesn't exist create one. Put the `userChrome.css` there. 

I use `mdbook` as a local content management system. My home page is there and the entire notebook is hosted on `localhost` so that I can access it without internet anytime. THe home page is also there in the repository in the `/home` folder. The autostart script is there for starting mdbook as soon as I log in to my gnome session.


# ZSH and other terminal stuff

I use zsh instead of bash. My zshrc is there in the repository. It uses a custom prompt, the main thing about which is the screensaver equivalent and the git prompt. The screen times out after 2 minutes and starts [pipes-rs](https://github.com/lhvy/pipes-rs). 

The git prompt tells you if your changes are unstaged or if there are untracked files (the branch name is yellow and there is a star), if there are staged but uncommitted changes (denoted by a circle), and also if it is ahead or behind the origin in terms of commits.

I also use [peaclock](https://github.com/octobanana/peaclock) and [calcurse](https://www.calcurse.org/). I use calcurse as my scheduler and to-do list. It is integrated with conky that displays it on my desktop. Calcurse schedule and todo also sync with syncthing and are opened using termux on my phone.

# Flatpaks

I only use flatpaks for all applications if possible. I prefer user installations, but system doesn't really make a difference either.

Obviously you'd be needing flatseal and flatsweep.

Install both Adw-Gtk3 and Adw-Gtk3-dark as application themes for greater visual consistency.

## Common Errors and Issues

The icons may not render properly if a custom icon theme is used. For that you need to give it filesystem permissions so that it can access the icons. 

Using flatseal give it read-only permissions to the icons directory. Alternatively, the less recommended way is to use the below command.

```sh 
sudo flatpak override --filesystem=$HOME/.local/share/icons
```

This is for the case when your icons are in `.local/share/icons`. If they are somewhere else you need to set change the path appropriately.

## Telegram Theme

It is there in the repository. You can also join the [Telegram Themes Channel](https://t.me/tgthemes). Open it in telegram and you'll get the option to install the theme. You can also customize the theme yourself to get the required colours through the application itself.

--

[^1] [My dotfiles](https://gitlab.com/InnocentZero/swaydark)

[^2] [Look here for a relevant issue on gitlab](https://gitlab.gnome.org/GNOME/sushi/-/issues/36)

[^3] [Old dotfiles](https://gitlab.com/InnocentZero/darker-dots/-/tree/main)
