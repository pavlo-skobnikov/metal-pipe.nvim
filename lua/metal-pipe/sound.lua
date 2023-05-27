----------------------- MODULE DEFINITION
local M = {}

------------------ PRIVATE IMPLEMENTATION
-- Gets the absolute path to the metal pipe sound.
local function get_metal_pipe_sound_file_path()
  local plug_path = debug.getinfo(2, 'S').source:sub(2)

  local separator = package.config:sub(1, 1)

  return plug_path:match '(.*/)' .. 'assets' .. separator .. 'metal-pipe-falling-sound.mp3'
end

-- Command-composing functions for sound
-- playing. Each resulting command tries
-- not to induce any additional dependencies.
local function get_sound_cmd_mac(path)
  return 'afplay ' .. path
end

local function get_sound_cmd_linux(path)
  return 'aplay ' .. path
end

local function get_sound_cmd_windows(path)
  return "powershell -c (New-Object Media.SoundPlayer '" .. path .. "').PlaySync();"
end

-- Determines the correct command-composing
-- function based on the current OS.
local function get_os_specific_sound_playing_fn()
  local os = jit.os

  if os == 'OSX' then
    return get_sound_cmd_mac
  elseif os == 'Linux' then
    return get_sound_cmd_linux
  elseif os == 'Windows' then
    return get_sound_cmd_windows
  end
end

-- The command to play the metal pipe sound.
-- Evaluated once at startup.
local compiling_sound_playing_command =
  get_os_specific_sound_playing_fn()(get_metal_pipe_sound_file_path())

----------------------- PUBLIC MODULE API
-- Plays the metal pipe sound in a
-- non-blocking way.
function M.play_metal_pipe_sound()
  vim.fn.jobstart(compiling_sound_playing_command)
end

------------------------------ MODULE END
return M
