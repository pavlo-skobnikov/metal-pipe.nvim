# 🗣️🗣️🗣️ Metal Pipe 🗣️🗣️🗣️

📢 Sound 👏 effect 👏 driven 👏 coding 👏 for 👏 NeoVim 📢

> [For those who don't know](https://knowyourmeme.com/memes/metal-pipe-falling-sound-effect).

![Metal Pipe](https://i.kym-cdn.com/entries/icons/original/000/043/027/metalpipefalling.jpg)

## What in the World Is This?

Bored with your NeoVim experience? Want to spice it up somehow? Well, look no further!

This is a NeoVim plugin that allows you to play the greatest sound to have ever been discovered by
humans ([the metal pipe falling sound effect](https://youtu.be/iDLmYZ5HqgM?si=ouLT-UwmkPib02GM)), as well as any other sound effect you want
to play, whenever you want to play it.

## Features 💫

- 📣 Play the metal pipe sound effect whenever you want.
- 📣 Play any sound file that you have on your computer whenever you want.

## Installation 🚀

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'pavlo-skobnikov/metal-pipe.nvim'
```

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
  'pavlo-skobnikov/metal-pipe.nvim',
  event = 'VeryLazy',
}
```

## Usage 🦅

After installing, you have access to two commands.

### Vim Commands

- `:PlayMetalPipeSound`
- `:PlaySoundAtPath <~/path/to/sound/file>`

### Lua API

```lua
require('metal-pipe').play_metal_pipe_sound()
require('metal-pipe').play_sound('<~/path/to/sound/file>')
```

### Examples

#### Playing Metal Pipe Sound on Key Mapping

```lua
vim.keymap.set('n', '<leader>mp', function()
  require('metal-pipe').play_metal_pipe_sound()
end, { desc = "Play Metal Pipe Sound" })
```

#### Creating an Autocommand to Play Metal Pipe Sound when Saving Files

```lua
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PlayMetalPipeOnBufferWrite', { clear = true }),
  pattern = { '*' },
  callback = function() require('metal-pipe').play_metal_pipe_sound() end,
  desc = "Play a sound when a buffer is written to disk",
})
```
