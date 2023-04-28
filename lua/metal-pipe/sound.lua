-- Imports
local async = require("plenary.async")

-- Creates an object for the module.
local M = {}

-- Sets the path to the metal pipe sound
local function get_metal_pipe_sound_path()
  local cwd_path = debug.getinfo(2, "S").source:sub(2)

  local separator = package.config:sub(1, 1)

  return cwd_path:match("(.*/)") .. "assets" .. separator .. "metal-pipe-falling-sound.mp3"
end

local metal_pipe_sound_path = get_metal_pipe_sound_path()
----------------------------------------

-- Functions to return the command for playing the metal pipe sound for different OSes
local function compose_mac_sound_playing_command(path)
  return "!afplay " .. path
end

local function compose_linux_sound_playing_command(path)
  return "!aplay " .. path
end

local function compose_windows_sound_playing_command(path)
  return "!powershell -c (New-Object Media.SoundPlayer '" .. path .. "').PlaySync();"
end
----------------------------------------

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

local compiling_sound_playing_command =
  get_os_specific_sound_playing_function()(metal_pipe_sound_path)

-- Plays the metal pipe sound
function M.play_sound()
  vim.cmd(compiling_sound_playing_command)
end

return M
