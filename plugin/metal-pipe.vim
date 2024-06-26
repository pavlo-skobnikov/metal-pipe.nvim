" Title:        Metal Pipe Plugin
" Description:  A meme plugin that plays the `metal pipe` sound effect on various editor actions.
" Last Change:  26 April 2024
" Maintainer:   https://github.com/pavlo-skobnikov
"
" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_metalpipeplugin")
    finish
endif
let g:loaded_metalpipeplugin = 1

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=1 PlaySoundAtPath lua require("metal-pipe").play_sound(<f-args>)
command! -nargs=0 PlayMetalPipeSound lua require("metal-pipe").play_metal_pipe_sound()
