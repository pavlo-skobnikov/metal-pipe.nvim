--------------------------------- IMPORTS
local api = vim.api

local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup

local g = vim.g

local metal_pipe_sound_fn = require('metal-pipe.sound').play_metal_pipe_sound

----------------------- MODULE DEFINITION
local M = {}

------------------ PRIVATE IMPLEMENTATION
local function play_on_condition_fn_wrapper(condition)
  return function()
    if condition then
      metal_pipe_sound_fn()
    end
  end
end

autocmd({ 'BufLeave', 'CmdlineLeave' }, {
  group = augroup('MetalPipeSoundOnBufferFocusChange', { clear = true }),
  pattern = { '*' },
  callback = play_on_condition_fn_wrapper(g.metal_pipe_on_buf_focus_change),
  desc = 'Play metal pipe sound on buffer focus changes',
})

autocmd({ 'BufWrite' }, {
  group = augroup('MetalPipeSoundOnBufferWrite', { clear = true }),
  pattern = { '*' },
  callback = play_on_condition_fn_wrapper(g.metal_pipe_on_buffer_write),
  desc = 'Play metal pipe sound on buffer writes',
})

autocmd({ 'CursorMoved', 'CursorMovedI', 'CmdlineChanged' }, {
  group = augroup('MetalPipeSoundOnCursorMovements', { clear = true }),
  pattern = { '*' },
  callback = play_on_condition_fn_wrapper(g.metal_pipe_on_cursor_movement),
  desc = 'Play metal pipe sound on cursor movements',
})

----------------------- PUBLIC MODULE API
function M.toggle_metal_pipe_sound_on_buffer_focus_change()
  g.metal_pipe_on_buf_focus_change = not g.metal_pipe_on_buf_focus_change
end

function M.toggle_metal_pipe_sound_on_buffer_write()
  g.metal_pipe_on_buffer_write = not g.metal_pipe_on_buffer_write
end

function M.toggle_metal_pipe_sound_on_cursor_movement()
  g.metal_pipe_on_cursor_movement = not g.metal_pipe_on_cursor_movement
end

------------------------------ MODULE END
return M
