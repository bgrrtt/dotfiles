# Dotfiles LTS

There are many dotfiles; these are mine. \*macOS only.

<!--
## Articles

- What Happens When: Terminal Emulator
- What Happens When: Zshell
-->

## Prerequisites

1. Install xcode-select cli tools. See `/Library/Developer/CommandLineTools/usr/bin/` for installed executables.

   ```zsh
   xcode-select --install
   ```

2. Use `git` to clone this repo into your `$HOME` folder as `.dotfiles`.

   ```zsh
   git clone git@github.com:bgrrtt/dotfiles.git $HOME/.dotfiles
   ```

3. Install Homebrew. See [https://brew.sh](https://brew.sh).

   ```zsh
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   ```

4. Sign in to the Mac App Store.

   ```zsh
   open /System/Applications/App\ Store.app
   ```

## Installation

5. Use the installation script. See [script](./dotfiles/.local/bin/dotfiles_install) for details.

   ```zsh
   zsh ~/.dotfiles/dotfiles/.local/bin/dotfiles_install
   ```

   <!-- - Creates additional folders in `$HOME` directory.
   - Runs `brew bundle --file=~/.dotfiles/brew/.config/brew/Brewfile`. See [script](./brew/.config/brew/Brewfile) and [bundle](https://github.com/Homebrew/homebrew-bundle) for details.
   - Runs `~/.dotfiles/dotfiles/.local/bin/dotfiles_stow_modules`. See [script](./dotfiles/.local/bin/dotfiles_stow_modules) for details.
   - Fixes bash based git completions for Z shell.
   - Ensures VS Code configuration. -->

6) Install macOS settings. See [script](./macos/.local/bin/macos_update_settings) for details.

   ```zsh
   zsh ~/.dotfiles/macos/.local/bin/macos_update_settings
   ```

   <!-- - Super fast key repeat
   - ... -->

7) Use included [zimfw.zsh](./zsh/.zsh.d/.zim/zimfw.zsh) to finish installation of [zimfw](https://github.com/zimfw) on this environment.

   ```zsh
   zsh ~/.dotfiles/zsh/.zsh.d/.zim/zimfw.zsh install
   ```

8) Restart your terminal emulator (kitty) and enjoy.

<!-- ## Usage -->
<!-- ## Packages -->

<!--
### [GNU Stow](https://www.gnu.org/software/stow)

Dotfiles LTS uses `stow`, a "symlink farmer", to mange itself. `stow` applies folder structures, symlinks, and files to a **target** directory (`$HOME`) from one or more "packages" in the (`$HOME/.dotfiles`) **dictionary** directory.

```zsh
stow -d $HOME/.dotfiles -t $HOME -S <package>
```
-->
<!--

- Simulate `stow` with `-n` and increase verbosity to 2 or 3 in order to see changes to your filesystem before actually making changes to your filesystem.

  ```zsh
  stow -n --verbose=2 -d $HOME/.dotfiles -t $HOME -S example
  ```

- Opting for a `-R` instead of `-S` will first "unstow", then "restow" updates in the package since the last `stow`. Additionally, `-D` will remove the exact structure defined in the package.

  ```zsh
  stow -d $HOME/.dotfiles -t $HOME -R <package>
  ```

  ```zsh
  stow -d $HOME/.dotfiles -t $HOME -D <package>
  ``` -->

<!-- See the following articles on using `stow` to setup your own dotfiles:

- [[2012] Brandon Invergo's Guide](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
- ... -->

<!--
- https://stevenrbaker.com/tech/managing-dotfiles-with-gnu-stow.html
- https://zihao.me/post/managing-dotfiles-with-gnu-stow/
- http://juanda.me/managing-your-dotfiles-with-gnu-stow
- https://writingco.de/blog/how-i-manage-my-dotfiles-using-gnu-stow/
- https://github.com/mafrosis/dotfiles/blob/master/install.sh?
- https://github.com/aspiers/shell-env
- https://github.com/aspiers/git-config
- https://github.com/nickjj/dotfiles
- https://github.com/moopet/dotfiles
- https://github.com/PierreMarchand20/dotfiles
-->

<!-- ### [Z shell](http://zsh.sourceforge.net/Doc/Release/zsh_toc.html) and the [Zsh IMproved FrameWork](https://github.com/zimfw)

While Dotfiles 2020 LTS configures a myriad of technologies, the most important is Z shell. The "shell" is the program that gets loaded into/after opening a terminal emulator like Alacritty or iTerm2. [`bash`](https://www.gnu.org/software/bash/) has been the undisputed default shell on many OSs for a long time (and so, still important to understand), but as of 2019, Z shell is the default shell on macOS. -->

<!-- And for [good reasons](https://brandengarrett.com/awareness/zsh). -->

<!--

## Packages

### [Alacritty](https://#)

Super speedy terminal emulator.

### [git](https://#)

Please version control your code. Please use git to do so.

### [Hammerspoon](https://https://www.hammerspoon.org)

MacOS customization like you've always dreamed. Check this out.

### [Karabiner Elements](https://https://karabiner-elements.pqrs.org)

MacOS keyboard customization. Long live the Hyper key!

### [nvim](https://#)

Never in a GUI. Not intended for servers. Used more and more everyday. The sane choice once internalizing certain development principles. Verb, Modifier, Object.

### [sshrc](https://#)

Bring a minimal dotfile configuration with you when entering (and leaving) a server. Contains "compatible" Vim configuration for use on linux servers.

### [tmux](https://#)

A better way to use and organize a terminal emulator. Needed for tabs and splits when using Alacritty.

### [VS Code](https://#)

Text editor. Workhorse. Friend. Enemy.

### [Zsh](http://zsh.sourceforge.net/Doc/Release/zsh_toc.html) and [Zim Framework](https://github.com/zimfw/zimfw)

The terminal emulator's shell interface. Critical. Highly configured through the Zim Framework for zsh.

-->

## Additional Resources

- [mika/zsh-pony](https://github.com/mika/zsh-pony)
- [jlevy/the-art-of-command-line](https://github.com/jlevy/the-art-of-command-line)
- [drduh/macOS-Security-and-Privacy-Guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide)

<!--
## Legacy

- v2019, [bare repo](https://github.com/bgrrtt/dotfiles-2019) (private)
- v2018, [shell scripts](https://github.com/bgrrtt/dotfiles-2018) (private)
- v2017, [macOS-provisioner](https://github.com/bgrrtt/macOS-provisioner) (private)
- v2016, [zimfw](https://github.com/zimfw/zimfw)
- v2015, [prezto](https://github.com/sorin-ionescu/prezto)
- v2014, [yadr](https://github.com/skwp/dotfiles)
-->

<!--
## Inspiration

- https://frkl.io/blog/managing-dotfiles
- https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/
- https://github.com/skwp/dotfiles
- https://github.com/mathiasbynens/dotfiles
- https://github.com/thoughtbot/dotfiles
- https://github.com/thoughtbot/laptop
-->

## License

[MIT](https://choosealicense.com/licenses/mit/)

Copyright © 2022 Branden Garrett
