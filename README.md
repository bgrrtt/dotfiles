# Dotfiles v2020 LTS

There are many dotfiles; these are mine. \*macOS only, for now.

<!-- For other suggestions and opinions, check out [https://brandengarrett.com/uses](https://brandengarrett.com/uses). -->

<!--
## Articles

- What Happens When: Terminal Emulator
- What Happens When: Zshell
- The Single Most Important App for Knowledge Workers (alfred)
- Hyper/Super (CAPSLOCK) Navigation Saved My Life
 -->

<!--

## Inspiration

- https://frkl.io/blog/managing-dotfiles
- https://www.taniarascia.com/setting-up-a-brand-new-mac-for-development/
- https://github.com/skwp/dotfiles
- https://github.com/mathiasbynens/dotfiles

-->

## History

- v2019, [bare repo](https://github.com/bgrrtt/dotfiles-2019)
- v2018, [shell scripts](https://github.com/bgrrtt/dotfiles-2018)
- v2017, [macOS-provisioner](https://github.com/bgrrtt/macOS-provisioner)
- v2016, [zimfw](https://github.com/zimfw/zimfw)
- v2015, [prezto](https://github.com/sorin-ionescu/prezto)
- v2014, [yadr](https://github.com/skwp/dotfiles)


## Prerequisites

1. Install xcode-select. See `/Library/Developer/CommandLineTools/usr/bin/` for currently installed xcode cli tools (executables).

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

5. Use the installation script (or [run scripts manually](#)).

  ```zsh

  ./.dotfiles/dotfiles/.local/bin/dotfiles_install

  ```

<!--
- http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
- https://stevenrbaker.com/tech/managing-dotfiles-with-gnu-stow.html
- https://zihao.me/post/managing-dotfiles-with-gnu-stow/
- http://juanda.me/managing-your-dotfiles-with-gnu-stow
- https://writingco.de/blog/how-i-manage-my-dotfiles-using-gnu-stow/
- https://github.com/mafrosis/dotfiles/blob/master/install.sh?
- https://github.com/aspiers/shell-env
- https://github.com/aspiers/git-config
-
-->

<!--

5. Install module symlinks and directories with GNU `stow`:

   ```zsh
   SYNOPSIS:

      stow [OPTION ...] [-D|-S|-R] PACKAGE

   OPTIONS:

      -d DIR, --dir=DIR     Set stow dir to DIR (default is current dir)
      -t DIR, --target=DIR  Set target to DIR (default is parent of stow dir)

      -S, --stow            Stow the package names that follow this option
      -D, --delete          Unstow the package names that follow this option
      -R, --restow          Restow (like stow -D followed by stow -S)

      -n, --no, --simulate  Do not actually make any filesystem changes
      -v, --verbose[=N]     Increase verbosity (levels are from 0 to 5)
      -h, --help            Show this help

   Stow home page: <http://www.gnu.org/software/stow/>
   ```

   _Simulate `stow` with `-n` and increase verbosity to 2 or 3 with `--verbose=N` to see changes to your filesystem before actually making changes to your filesystem with the following modules._

   ```zsh
   stow -n --verbose=2 -d $HOME/.dotfiles -t $HOME -S example
   ```

   Modules:

   - **Alacritty**

     Super speedy terminal emulator.

     ```zsh
     stow -d $HOME/.dotfiles -t $HOME -S alacritty
     ```

   - **bin**

     Scripts and tools I've built or gathered from others.

     ```zsh
     stow -d $HOME/.dotfiles -t $HOME -S bin
     ```

   - **git**

     Please version control your code. Please use git to do so.

     ```zsh
     stow -d $HOME/.dotfiles -t $HOME -S git
     ```

   - **Hammerspoon**

     MacOS customization like you've always dreamed. Check this out.

     ```zsh
     stow -d $HOME/.dotfiles -t $HOME -S hammerspoon
     ```

   - **Karabiner Elements**

     MacOS keyboard customization. Long live the Hyper key!

     ```zsh
     stow -d $HOME/.dotfiles -t $HOME -S karabiner
     ```

   - **nvim**

     Never in a GUI. Not intended for servers. Used more and more everyday. The sane choice once internalizing certain development principles. Verb, Modifier, Object.

     ```zsh
     stow -d $HOME/.dotfiles -t $HOME -S nvim
     ```

   - **sshrc**

     Bring a minimal dotfile configuration with you when entering (and leaving) a server. Contains "compatible" Vim configuration for use on linux servers.

     ```zsh
     stow -d $HOME/.dotfiles -t $HOME -S sshrc
     ```

   - **tmux**

     A better way to use and organize a terminal emulator. Needed for tabs and splits when using Alacritty.

     ```zsh
     stow -d $HOME/.dotfiles -t $HOME -S sshrc
     ```

   - **VS Code**

     TK. Text editor. Workhorse. Friend. Enemy.

     ```zsh
     stow -d $HOME/.dotfiles -t $HOME -S vscode
     ```

   - **zsh**

     The terminal emulator's shell interface. Critical. Highly configured through the Zim Framework for zsh.

     ```zsh
     stow -d $HOME/.dotfiles -t $HOME -S zsh
     ```

-->

## MacOS Configuration

6. Use the macOS settings script.

  ```zsh

  ./.dotfiles/macos/.local/bin/macos_update_settings

  ```
<!--
## WAIT! Manual Configuration Required

7. TK.

-->

## Security

- https://github.com/drduh/macOS-Security-and-Privacy-Guide

## License

[MIT](https://choosealicense.com/licenses/mit/)

<!--

## TODO

- [https://github.com/nickjj/dotfiles](https://github.com/nickjj/dotfiles)
- [https://github.com/moopet/dotfiles](https://github.com/moopet/dotfiles)

-->
