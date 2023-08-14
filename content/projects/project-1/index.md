+++
title = "Darker Dots"
date = 2023-04-11

[taxonomies]
categories = ["software"]
tags = ["software", "ricing"]
+++

My most important dotfiles, containing all my workflows!

<!-- more -->

If you want to skip the long explanation of my design philosophies, jump off[^1].

First and foremost, my setup. I use Fedora with GNOME as my default work laptop. 


# Plymouth Themes

I use a custom plymouth theme from this repository. A lot of cool themes are available here. Choose one to your liking.

```sh
git clone https://github.com/adi1090x/plymouth-themes.git
# now mv all of that in /usr/share/plymouth/themes

sudo plymouth-set-default-theme -R angular
```

# Extensions

These are the important gnome shell extensions I use. 

- [Clipboard indicator tudmotu](https://extensions.gnome.org/extension/779/clipboard-indicator/)
- [Gesture Improvements](https://extensions.gnome.org/extension/4245/gesture-improvements/)
- [gTile](https://extensions.gnome.org/extension/28/gtile/)
- [Just Perfection](https://extensions.gnome.org/extension/3843/just-perfection/)
- [pop shell](https://github.com/pop-os/shell)
- [Media Controls](https://extensions.gnome.org/extension/4470/media-controls/)
- [Open Weather](https://extensions.gnome.org/extension/750/openweather/)
- [Removable Drive Menu](https://extensions.gnome.org/extension/7/removable-drive-menu/)
- [Rounded Window corners](https://extensions.gnome.org/extension/5237/rounded-window-corners/)
- [User Themes](https://extensions.gnome.org/extension/19/user-themes/)
- [TopHat](https://extensions.gnome.org/extension/5219/tophat/)
- [Workspace Indicator](https://extensions.gnome.org/extension/21/workspace-indicator/)

I removed all the default system installations and installed pop shell as a system install. 

# GTK Windows

Open DCONF editor and navigate to `/org/gnome/desktop/wm/preferences`. Over there change the `button-layout` to `':'`. This removes all the buttons from the top bar. I use keybindings to minimize, maximize and close my windows, so I don't need them. 

> Do **NOT** set it to `''` otherwise sushi file previewer in Nautilus will stop working.[^2]

To set up the keybindings, follow the instructions in the `README` of the repo.

Install `Adw-GTK3` and `Adw-GTK3-dark`, both as flatpaks and as local files. Use them and [gradience](https://gradienceteam.github.io/) to achieve a coherent look on the desktop. I personally use `alpha-black` theme from their custom presets repo but with a lower contrast. Once again, the json is available in the repo.

## Firefox and Librewolf

I use both of them as flatpaks. To style them use the stylesheet provided in the repositories. Find your browser profiles in `/var/app/<firefox folder>/.mozilla/firefox/<alphanumeric-string>.default-release/`. If `chrome` folder doesn't exist create one. Put the `userChrome.css` there. 

I use `mdbook` as a local content management system. My home page is there and the entire notebook is hosted on `localhost` so that I can access it without internet anytime. THe home page is also there in the repository in the `/home` folder. The autostart script is there for starting mdbook as soon as I log in to my gnome session.

# ZSH and other terminal stuff

I use zsh instead of bash. My zshrc is there in the repository. It uses a custom prompt, the main thing about which is the screensaver equivalent and the git prompt. The screen times out after 2 minutes and starts [pipes-rs](https://github.com/lhvy/pipes-rs). 

The git prompt tells you if your changes are unstanged or if there are untracked files (the branch name is yellow and there is a star), if there are staged but uncommitted changes (denoted by a circle), and also if it is ahead or behind the origin in terms of commits.

I also use [peaclock](https://github.com/octobanana/peaclock) and [calcurse](https://www.calcurse.org/). I use calcurse as my scheduler and to-do list. It is integrated with conky that displays it on my desktop.

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

It is there in the repository. You can also join the [Telegram Themes Channel](https://t.me/tgthemes). Open it in telegram and you'll get the option to install the theme.

---

[^1] [My dotfiles](https://gitlab.com/InnocentZero/darker-dots)

[^2] [Look here for a relevant issue on gitlab](https://gitlab.gnome.org/GNOME/sushi/-/issues/36)
