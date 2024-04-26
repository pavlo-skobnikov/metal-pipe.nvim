----------------------- MODULE DEFINITION
local M = {}

------------------ PRIVATE IMPLEMENTATION

-- Gets the absolute path to the metal pipe sound.
---@return string metal_pipe_fp # The path to the metal pipe sound file.
function M.get_metal_pipe_sound_path()
  local cwd_path = debug.getinfo(2, "S").source:sub(2)

  local separator = package.config:sub(1, 1)

  return cwd_path:match("(.*/)") .. "assets" .. separator .. "metal-pipe-falling-sound.mp3"
end

------------------------------ MODULE END
return M
