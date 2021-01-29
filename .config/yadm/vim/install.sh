#!/bin/sh

log "Updating vim plugins"
vim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
