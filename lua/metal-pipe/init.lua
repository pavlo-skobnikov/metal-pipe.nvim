--------------------------------- IMPORTS
local assets_resolver = require("metal-pipe.assets_path_resolver")
local sound_player = require("metal-pipe.sound_player")

----------------------- MODULE DEFINITION
-- Top-level plugin's module object.
local M = {}

------------------- PLUGIN API DEFINITION

-- Plays the sound file found a the give path.
---@param path string # Path to a sound file.
function M.play_sound(path)
  sound_player.player:play_sound(path)
end

-- Plays the greates sound to ever exist.
function M.play_metal_pipe_sound()
  local metal_pipe_fp = assets_resolver.get_metal_pipe_sound_path()

  sound_player.player:play_sound(metal_pipe_fp)
end

------------------------------ MODULE END
return M
