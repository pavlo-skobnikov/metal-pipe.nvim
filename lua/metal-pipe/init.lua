--------------------------------- IMPORTS
local sound = require("metal-pipe.sound")

----------------------- MODULE DEFINITION
-- Top-level plugin's module object.
local M = {}

------------------- PLUGIN API DEFINITION
M.play_sound = sound.play_sound

------------------------------ MODULE END
return M
