--------------------------------- IMPORTS
local sound = require 'metal-pipe.sound'
local triggers = require 'metal-pipe.triggers'
local config = require 'metal-pipe.config'

----------------------- MODULE DEFINITION
-- Top-level plugin's module object.
local M = {}

------------------- PLUGIN API DEFINITION
M.play_sound = sound.play_sound
M.toggle_metal_pipe_sound_on_window_change = triggers.toggle_metal_pipe_sound_on_window_change
M.toggle_metal_pipe_sound_on_buffer_write = triggers.toggle_metal_pipe_sound_on_buffer_write
M.toggle_metal_pipe_sound_on_keypress = triggers.toggle_metal_pipe_sound_on_keypress
M.setup = config.setup

------------------------------ MODULE END
return M
