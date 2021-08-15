# Dotfiles - powered by YADM

This is my collection of dotfiles. I wanted a relatively easy way to control which packages were installed on different platforms (Debian & macOS, primarily) and dynamically select configurations based on which platform was active. I also wanted a tool that would handle storing symlinks outside of the git tree. [YADM (Yet Another Dotfiles Manager)](https://yadm.io) helps with both of these goals. It also has some cool templating stuff that I have entirely not bothered with yet.

[Check out the bootstrap file to see how the magic happens](https://github.com/vemek/dotfiles/blob/main/.config/yadm/bootstrap).
