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
  'sshconfig':            '.ssh/config',
  'ruby/bundle':          '.bundle/config',
  'ruby/gemrc':           '.gemrc',
  'boom':                 '.boom',
  'ruby/rubocop.yml':     '.rubocop.yml',
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

