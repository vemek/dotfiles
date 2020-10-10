#!/usr/bin/env python

import os, shutil

links = {
  'vimrc':                '.vimrc',
  'bash/bashrc':          '.bashrc',
  'bash/bash_aliases':    '.bash_aliases',
  'bash/inputrc':         '.inputrc',
  'git/gitconfig':        '.gitconfig',
  'git/gitignore':        '.gitignore_global',
  'ghci':                 '.ghci',
  'ssh/config':           '.ssh/config',
  'ssh/public_keys':      '.ssh/authorized_keys',
  'ruby/bundle':          '.bundle/config',
  'ruby/gemrc':           '.gemrc',
  'ruby/rubocop.yml':     '.rubocop.yml',
  'tmux.conf':            '.byobu/.tmux.conf',
  'i3/config':            '.config/i3/config',
  'i3/i3status.conf':     '.config/i3/i3status.conf',
  'i3/compton.conf':     '.config/i3status.conf',
  'Xdefaults':            '.Xdefaults',
}

for hard, soft in links.iteritems():
  src = os.path.join(os.path.expanduser('~/src/vemek/dotfiles/'), hard)
  dst = os.path.join(os.path.expanduser('~/'), soft)
  dirname = os.path.dirname(dst)

  if not os.path.exists(dirname):
    os.makedirs(dirname)

  if os.path.exists(dst) or os.path.islink(dst):
    if os.path.islink(dst) or os.path.isfile(dst):
      os.unlink(dst)
    elif os.path.isdir(dst):
      shutil.rmtree(dst)
  os.symlink(src, dst)

