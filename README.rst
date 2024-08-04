===============================
Personal Unix configuration repository
===============================

This repository contains my own personal settings used for Unix machines.
If this happens to be useable for anyone else, feel free to copy shamelessly.

Usage
=====

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

./.gitconfig.local
   User settings

After install script has been run, do the following:

1. Run `vim` and enter the following command:

   :PluginUpdate

Window manager
==============

If Wayland is detected then Sway will be assumed, and configurations for this
window manager will be installed.

If X11 is detected then i3 will be assumed, and configurations for this window
manager will be installed.

bash
====

Functions below will store all short-cuts in ~/.marks as symbolic links.

mark NAME
   Creates a short-cut NAME pointing to current working directory

unmark NAME
   Remove short-cut NAME

marks
   List all short-cuts

jump NAME
   Jump to directory pointed to be NAME

Window manager (Sway or Regolith)
=================================

All keystrokes in combination with windows key (denoted M below).

=====            ===========================
Key              Basics
=====            ===========================
M-Ret            Launch terminal
M-d              Launch application
M-S-c            Reload configuration
M-S-e            Logout
M-Esc            Screen lock

=====            ===========================
Key              Window
=====            ===========================
M-h, M-Left      Select left window
M-j, M-Down      Select lower window
M-k, M-Up        Select upper window
M-l, M-Right     Select right window
M-S-h, M-S-Left  Move window left
M-S-j, M-S-Down  Move window down
M-S-k, M-S-Up    Move window up
M-S-l, M-S-Right Move window right
M-b              Split horizontally
M-v              Split vertically
M-f              Toggle fullscreen
M-S-q            Kill focused window
M-r              Enter resize mode

=====            ===========================
Key              Window resize mode
=====            ===========================
M-h, M-Left      Shrink width with 10 pixels
M-j, M-Down      Grow height with 10 pixels
M-k, M-Up        Shrink height with 10 pixels
M-l, M-Right     Grow width with 10 pixels
M-Ret, M-Esc     Exit resize mode

=====            ===========================
Key              Workspace
=====            ===========================
M-0..9           Select workspace 1..10 (0 = 10)
M-S-0..9         Move current window to workspace 1..10 (0 = 10)
M-s              Layout: stacking
M-w              Layout: tabbed
M-e              Layout: split, toggle between horizontally and vertically
M-S-Space        Toggle between tiling and floating
M-a              Select parent

=====            ===========================
Key              Scratchpad
=====            ===========================
M-S-Minus        Move current window to scratchpad
M-minus          Show next window stored in scratchpad


Regolith
========

=====      ===========================
Key        Description
=====      ===========================
<M-x>      Select tab layout
<PrntScrn> Run `flameshot --gui --path ~/Pictures` to do a screenshot
<M-w>      Layout: tabbed
<M-e>      Layout: default
<M-s>      Layout: stacked
<M-x>      Layout: Tabbed custom
<M-r>      Resize mode
<M-a>      Focus parent
<M-d>      Dmenu
<M-f>      Full screen toggle
<M-h>      Horizontal split
<M-v>      Vertical split
<M-j>      Select window left
<M-k>      Select window down
<M-l>      Select window up
<M-ö>      Select window right
<M-Ret>    New terminal
<M-Sp>     Choose application
<M-Q>      Kill window
<M-A-q>    Terminate application
<M-E>      Exit Regolith
<M-R>      Restart Regolith
<M-J>      Move window left
<M-K>      Move window down
<M-L>      Move window up
<M-Ö>      Move window right
=====      ===========================


tmux
====

=====   ===========================
Key     Description
=====   ===========================
<C-a>   Prefix key replacing ctrl-b
<C-a>|  Split window horizontally
<C-a>-  Split window horizontally
=====   ===========================

vim
===

======   ==================
Key      General
======   ==================
f1       Toggle file browser side-bar
f2       Toggle code tag browser side-bar
f3       Toggle undo tree browser side-bar
======   ==================

======   ==================
Key      Buffers
======   ==================
<C-j>    Previous buffer
<C-k>    Next buffer
======   ==================

======   ==================
Key      Tags
======   ==================
<C-]>    Jump to tag
g]       Get list of matching tags
g<C-]>   Jump to tag if only one match, otherwise list matching tags
<C-t>    Return from a tag jump
<C-W>    Open tag in preview window
:tag     Get list of tags previously jumped to
======   ==================

======   ==================
Key      Auto-completion
======   ==================
<C-n>    First/next completion
<C-p>    Previous completion

======   ==================
Key      Moving
======   ==================
[a       `:previous`
]a       `:next`
[A       `:first`
]A       `:last`
[b       `:bprevious`
]b       `:bnext`
[B       `:bfirst`
]B       `:blast`
[l       `:lprevious`
]l       `:lnext`
[L       `:lfirst`
]L       `:llast`
[<C-L>   `:lpfile`
]<C-L>   `:lnfile`
[q       `:cprevious`
]q       `:cnext`
[Q       `:cfirst`
]Q       `:clast`
[<C-Q>   `:cpfile` (Note that <C-Q> only works in a terminal if you disable
]<C-Q>   `:cnfile` flow control: stty -ixon)
[t       `:tprevious`
]t       `:tnext`
[T       `:tfirst`
]T       `:tlast`
[<C-T>   `:ptprevious`
]<C-T>   `:ptnext`
[f       Go to the file preceding the current one alphabetically in the current file's directory.  In
         the quickfix window, equivalent to `:colder`.
]f       Go to the file succeeding the current one alphabetically in the current file's directory.  In
         the quickfix window, equivalent to `:cnewer`.
[n       Go to the previous SCM conflict marker or diff/patch hunk. Try d[n inside a conflict.
]n       Go to the next SCM conflict marker or diff/patch hunk. Try d]n inside a conflict.
======   ==================

Troubleshooting
===============

`files` directory looks empty
   Add `-A` flag to ls, to show files beginning with period, i.e. most files.

`install` refuses to update a file
   It will not modify an already existing file. Rename it (for backup purposes) and re-run `install`.
