===============================
Personal Unix configuration repository
===============================

This repository contains my own personal settings used for Unix machines.
If this happens to be useable for anyone else, feel free to copy shamelessly.

Usage
-----

Install using `install` script. Host specific configurations are kept separately:

~/.bashrc.local
   Additions to .bashrc

~/.local/bin
   Added to PATH if this directory exists

~/.environment.local
   Host specific environment variables.
   Keep simple, since it will be used by more shells than bash.

./.aliases.local
   Host specific aliases.
   Keep simple, since it will be used by more shells than bash.

bash
----

Functions below will store all short-cuts in ~/.marks as symbolic links.

mark NAME
   Creates a short-cut NAME pointing to current working directory

unmark NAME
   Remove short-cut NAME

marks
   List all short-cuts

jump NAME
   Jump to directory pointed to be NAME

tmux
----

ctrl-a
   Prefix key replacing ctrl-b

ctrl-a |
   Split window horizontally

ctrl-a -
   Split window horizontally


vim
---

ctrl-j
   Previous buffer

ctrl-k
   Next buffer

f1
   Toggle file browser side-bar

f2
   Toggle code tag browser side-bar

f3
   Toggle undo tree browser side-bar

Troubleshooting
---------------

`files` directory looks empty
   Add `-A` flag to ls, to show files beginning with period, i.e. most files.

`install` refuses to update a file
   It will not modify an already existing file. Rename it (for backup purposes) and re-run `install`.
