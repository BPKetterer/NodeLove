---@class DrawmodeExtension
---@field protected drawmode "fill"|"line"
---@field protected __index DrawmodeExtension
local DrawmodeExtension = {}
DrawmodeExtension.__index = DrawmodeExtension

-- ---------------------------------- --
-- PUBLIC DrawmodeExtension FUNCTIONS --
-- ---------------------------------- --

--TODO
function DrawmodeExtension:extend_class(class)
    class.set_drawmode = DrawmodeExtension.set_drawmode
    class.get_drawmode = DrawmodeExtension.get_drawmode
end

---@generic self : DrawmodeExtension
---@param self self
---sets the drawmode
---@param drawmode "fill"|"line"|nil (default: "fill")
---@return self
function DrawmodeExtension:set_drawmode(drawmode)
    self.drawmode = drawmode or "fill"
    return self
end

---gets the drawmode
---@return "fill"|"line"
function DrawmodeExtension:get_drawmode()
    return self.drawmode
end

return DrawmodeExtension