--------------------------------- IMPORTS
local api = vim.api

local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup

local global = vim.g

local play_metal_pipe_sound = require('metal-pipe.sound').play_sound

----------------------- MODULE DEFINITION
local M = {}

------------------ PRIVATE IMPLEMENTATION
autocmd({ 'BufLeave' }, {
  group = augroup('MetalPipeSoundOnSplitChange', { clear = true }),
  pattern = { '*' },
  callback = function()
    if global.metal_pipe_sound_on_window_change then
      play_metal_pipe_sound()
    end
  end,
  desc = 'Play metal pipe sound on window change',
})

autocmd({ 'BufWrite' }, {
  group = augroup('MetalPipeSoundOnBufferWrites', { clear = true }),
  pattern = { '*' },
  callback = function()
    if global.metal_pipe_sound_on_buffer_write then
      play_metal_pipe_sound()
    end
  end,
  desc = 'Play metal pipe sound on buffer writes',
})

autocmd({
  'CursorMoved',
  'CursorMovedI',
  'TextChanged',
  'TextChangedP',
  'CmdlineEnter',
  'CmdlineLeave',
  'CmdlineChanged',
}, {
  group = augroup('MetalPipeSoundOnKeyPress', { clear = true }),
  pattern = { '*' },
  callback = function()
    if global.metal_pipe_sound_on_keypress then
      play_metal_pipe_sound()
    end
  end,
  desc = 'Play metal pipe sound on key presses',
})
----------------------------------------

----------------------- PUBLIC MODULE API
function M.toggle_metal_pipe_sound_on_window_change()
  global.metal_pipe_sound_on_window_change = not global.metal_pipe_sound_on_window_change
end

function M.toggle_metal_pipe_sound_on_buffer_write()
  global.metal_pipe_sound_on_buffer_write = not global.metal_pipe_sound_on_buffer_write
end

function M.toggle_metal_pipe_sound_on_keypress()
  global.metal_pipe_sound_on_keypress = not global.metal_pipe_sound_on_keypress
end

------------------------------ MODULE END
return M
