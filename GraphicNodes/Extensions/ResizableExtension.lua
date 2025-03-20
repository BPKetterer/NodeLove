require("NodeLove.Utils.ClassManager")

---@class ResizableExtension
---@field protected width number
---@field protected height number
local ResizableExtension = CreateClass({
    width = 10,
    height = 10
})

-- ----------------------------------- --
-- PUBLIC ResizableExtension FUNCTIONS --
-- ----------------------------------- --

---@generic self : ResizableExtension
---@param self self
---sets the width
---@param width number
---@return self
function ResizableExtension:set_width(width)
    self.width = width
    return self
end

---gets the width
---@return number
function ResizableExtension:get_width()
    return self.width
end

---@generic self : ResizableExtension
---@param self self
---sets the height
---@param height number
---@return self
function ResizableExtension:set_height(height)
    self.height = height
    return self
end

---gets the height
---@return number
function ResizableExtension:get_height()
    return self.height
end

return ResizableExtension