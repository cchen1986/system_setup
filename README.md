# System Setup

Setting up machines.

## Mac Setup

* Screen manage app - Spectacle
  Download the [Spectacle App](https://www.spectacleapp.com/). Use the following
for screen control.
    - Select Launch Spectacle at login.
    - Center: control-alt-C.
    - Fullscreen: control-alt-enter.
    - Next display: control-alt-commnd-right.
    - Previous display: control-alt-commnd-left.
    - Left half: control-alt-left.
    - Right-half: control-alt-right.
    - Top-half: control-alt-up.
    - Bottom-half: control-alt-down.
    - Upper left: control-alt-U.
    - Lower left: control-alt-J.
    - Upper right: control-alt-K.
    - Lower right: control-alt-L.

* Install Dropbox.

* Open terminal and run setup script `./setup.sh`. NOTE: you may need to run it
  twice in case on-my-zsh quit the install.

* Use iTerm as your default terminal app.

* `vim .vimrc`
  * Install plugins: `:PlugInstall`.
  * Build YouCompleteMe. `cd ~/.vim/plugged/YouCompleteMe`, and run `python install.py --clang-completer`

## Linux Setup
