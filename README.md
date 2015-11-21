# Dotfiles

Colourful & robust OS X configuration files and utilities for web development. Forked from [Paul Miller's dotfiles](https://dotfiles.github.io/) and modified for ease of use. Quickly bootstrap your system with the goods you need to succeed.

It can be run multiple times on the same machine safely. It installs, upgrades, or skips packages based on what is already installed on the machine.

## Features

- Greatly customized zsh with auto-completion and syntax highlighting
- Automated installation of common developer console and OS X apps
- Colorful themes for OS X Terminal and Sublime Text
- Additional Web security and ad blocking behavior (optional)
- A bunch of useful git extras

![](https://cloud.githubusercontent.com/assets/574696/3210643/80f11554-eed7-11e3-8c8f-5509bc304fc7.png)

![](https://cloud.githubusercontent.com/assets/574696/3210642/7ecc9a00-eed7-11e3-9357-27c2a8576f80.png)

## What it sets up

- A `~/Development` directory with dotfiles recursively cloned
- [Dropbox] for personal file sharing
- [Flux] for adjusting your Mac's display color so you can sleep better
- [Git] for distributed source control management
- [Google Chrome Canary] for browser debugging on the edge
- [Homebrew] for managing operating system libraries
- [Homebrew Cask] for quickly installing Mac apps from the command line
- [Homebrew Services] so you can easily stop, start, and restart services
- [htop] as a replacement for `top`
- [hub] for interacting with the GitHub API
- [Screenhero] screen sharing for collaboration in teams
- [Spectacle] for zero-config window management
- [Spotify] because every coder is at least a part-time audiophile
- [Sublime Text 3] with [SoDaReloaded theme] for coding all the things
- [Quick Look Plugins] from someone awesome
- [Zsh] as your shell with the following powerful features:
    - **ZERO DEPENDENCIES!**
    - `z` to allow [jumping between directories](http://habd.as/installing-using-rupaz/)
    - `rm` moves file to the OS X trash
    - Automatic setting up of terminal tab / window title to current dir
    - Sexy syntax highlighting and translucency
    - Auto-completion
    - A bunch of useful functions:
        - `extract archive.tar.bz` — unpack any archive (supports many extensions)
        - `ram safari` — show app RAM usage
        - `openfiles` — real-time disk usage monitoring with `dtrace`.
        - `loc py coffee js html css` — count lines of code
        in current dir in a colourful way.
        - `ff file-name-or-pattern` - fast recursive search for a file name in directories.
        - `curl http://site/v1/api.json | json` - pretty-print JSON
        - `aes-enc`, `aes-dec` - safely encrypt files.
    - Neat git extras:
        - Opinionated `git log`, `git graph`
        - `gcp` for fast `git commit -m ... && git push`
        - `git pr <pull-req> [origin]` for fetching pull request branches
        - `git cleanup` — clean up merged git branches. Very useful if
        you’re doing github pull requests in topic branches.
        - `git summary` — outputs commit email statistics.
        - `git release` — save changes, tag commit. If used on node.js project, also push to npm.
        - `git url` - opens GitHub repo for current git repo.
        - `git-changelog`, `git-setup` etc.
    - [homesick](https://github.com/technicalpickles/homesick) /
      [homeshick](https://github.com/andsens/homeshick)-compatible

## Getting started

1. Perform steps in [Building system from scratch](#building-system-from-scratch)
1. Fork this repo
1. Modify `.gitconfig` for your GitHub account
1. Review `bootstrap.sh` and customize to your liking
1. Run the single-shot installation script

## Installation

When ready run the installer, replacing `username` with your own once repo is forked customized:

```
curl --silent https://raw.githubusercontent.com/username/dotfiles/master/install.sh | sh
```

Where `username` is your GitHub username.

## File structure

* `bin` — files that are symlinked to any directory with binaries in `$PATH`
* `etc` — various stuff like OS X text substitutions / hosts backup
* `git-extras` — useful git functions, defined in `home/gitconfig`
* `home` — files that are symlinked to `$HOME` directory
* `sublime` — Sublime Text theme & settings
* `terminal` — terminal theme & prompt

## Building system from scratch

* Install [Source Code Pro](https://github.com/adobe-fonts/source-code-pro) font.
* Install Xcode from the App Store & Xcode CLI Tools.
* Change Terminal.app theme to `terminal/paulmillr.terminal`.
* Change default shell to ZSH: `chsh -s /bin/zsh`.
* Insert proper hosts from `etc/hosts` to system’s `/etc/hosts`.
* Unmap critical shortcut keys for [Sublime Text column selection](https://www.sublimetext.com/forum/viewtopic.php?f=3&t=8775) and up/down code shifting.
* Download the Yosemite style [Sublime Text icon](https://dribbble.com/shots/1840393-Sublime-Text-Yosemite-Icon?list=searches&tag=sublime_text) (usage instructions included with download)
* Install Sublime packages with Package Control: "Babel, Babel Snippets, Git, Theme - SoDaReloaded"

## License

The MIT license.

Copyright (c) 2015 Josh Habdas (http://habd.as)<br />
Copyright (c) 2013 Paul Miller (http://paulmillr.com/)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[Bundler]: http://bundler.io/
[Dropbox]: https://www.dropbox.com/
[Flux]: https://justgetflux.com/
[Git]: https://git-scm.com/
[Google Chrome Canary]: https://www.google.com/chrome/browser/canary.html
[Homebrew]: http://brew.sh/
[Homebrew Cask]: http://caskroom.io/
[Homebrew Services]: https://github.com/gapple/homebrew-services
[htop]: http://hisham.hm/htop/
[hub]: https://github.com/github/hub
[Screenhero]: https://screenhero.com/
[Spectacle]: https://www.spectacleapp.com
[Spotify]: https://www.spotify.com/
[Sublime Text 3]: http://www.sublimetext.com/3
[SoDaReloaded theme]: https://packagecontrol.io/packages/Theme%20-%20SoDaReloaded
[Quick Look Plugins]: http://github.com/sindresorhus/quick-look-plugins
[Zsh]: http://www.zsh.org/
