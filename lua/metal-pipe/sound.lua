----------------------- MODULE DEFINITION
local M = {}

------------------ PRIVATE IMPLEMENTATION
-- Gets the absolute path to the metal pipe sound.
local function get_metal_pipe_sound_path()
  local cwd_path = debug.getinfo(2, "S").source:sub(2)

  local separator = package.config:sub(1, 1)

  return cwd_path:match("(.*/)") .. "assets" .. separator .. "metal-pipe-falling-sound.mp3"
end

-- Command-composing functions for sound
-- playing. Each resulting command tries
-- not to induce any additional dependencies.
local function compose_mac_sound_playing_command(path)
  return "afplay " .. path
end

local function compose_linux_sound_playing_command(path)
  return "aplay " .. path
end

local function compose_windows_sound_playing_command(path)
  return "powershell -c (New-Object Media.SoundPlayer '" .. path .. "').PlaySync();"
end

-- Determines the correct command-composing
-- function based on the current OS.
local function get_os_specific_sound_playing_function()
  local operating_system = jit.os

  if operating_system == "OSX" then
    return compose_mac_sound_playing_command
  elseif operating_system == "Linux" then
    return compose_linux_sound_playing_command
  elseif operating_system == "Windows" then
    return compose_windows_sound_playing_command
  end
end

-- The command to play the metal pipe sound.
-- Evaluated once at startup.
local compiling_sound_playing_command =
  get_os_specific_sound_playing_function()(get_metal_pipe_sound_path())
----------------------------------------

----------------------- PUBLIC MODULE API
-- Plays the metal pipe sound in a
-- non-blocking way.
function M.play_sound()
  vim.fn.jobstart(compiling_sound_playing_command)
end

------------------------------ MODULE END
return M
