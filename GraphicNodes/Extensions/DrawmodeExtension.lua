require("NodeLove.Utils.ClassManager")

---@class DrawmodeExtension
---@field protected drawmode "fill"|"line"
local DrawmodeExtension = CreateClass({
    drawmode = "fill"
})

-- ---------------------------------- --
-- PUBLIC DrawmodeExtension FUNCTIONS --
-- ---------------------------------- --

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