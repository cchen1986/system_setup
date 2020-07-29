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

* From now on, use iTerm2 as your default terminal app.
  * "Command + ," to go to iTerm2 preference.
  * Enable "Option + left, Option + right" for word navigation, go to "Profiles",
    and find "Option <-". Change the Action to: "Send Escape Sequence", "ESC+":
    f. Same for "Option ->", set it to "ESC+": b.
  * Enable "Option + delete" for word deletion: "Command ," -> "Keys" -> "Add".
    "Option + Delete": Action = "Send Hex Code". Value should be "0x17" for word
    deletion.

* `vim .vimrc`
  * Install plugins: `:PlugInstall`.
  * Build YouCompleteMe. `cd ~/.vim/plugged/YouCompleteMe`, and run `python install.py --clang-completer`

## Linux Setup
