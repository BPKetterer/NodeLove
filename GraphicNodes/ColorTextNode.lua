require("NodeLove.Utils.ClassManager")
local SplitTextNode = require("NodeLove.GraphicNodes.SplitTextNode")

---@class ColorTextNode : SplitTextNode
local ColorTextNode = CreateClass({}, SplitTextNode)

-- ------------------------------ --
-- PUBLIC ColorTextNode FUNCTIONS --
-- ------------------------------ --

---creates a new text node using an array for the text(see https://love2d.org/wiki/love.graphics.printf)
---@return ColorTextNode: the new text node
function ColorTextNode:new()
    local new = setmetatable(SplitTextNode:new(), ColorTextNode)
    ---@cast new ColorTextNode
    new.text = {}
    return new
end

---@generic self : ColorTextNode
---@param self self
---adds a section to the end with the given text
---@param txt string|nil
---@param color table|nil (default: white)
---@return self
function ColorTextNode:add_text(txt, color)
    ---@cast self ColorTextNode
    table.insert(self.text, color or {1, 1, 1})
    table.insert(self.text, txt or "")
    return self
end

---@generic self : ColorTextNode
---@param self self
---removes a text section
---@param section number|nil (default last)
---@return self
function ColorTextNode:remove_text(section)
    ---@cast self ColorTextNode
    if not section then section = self:get_section_count() end
    table.remove(self.text, section * 2 - 1)
    table.remove(self.text, section * 2 - 1)
    return self
end

---@generic self : ColorTextNode
---@param self self
---sets the text of a section
---@param section number
---@param txt string|nil
---@return self
function ColorTextNode:set_text(section, txt)
    ---@cast self ColorTextNode
    self.text[section * 2] = txt or ""
    return self
end

---get the text of a section
---@param section number
---@return string
function ColorTextNode:get_text(section)
    ---@cast self ColorTextNode
    return self.text[section * 2]
end

---@generic self : ColorTextNode
---@param self self
---sets the color of a section
---@param section number
---@param color table|nil (default: white)
---@return self
function ColorTextNode:set_color(section, color)
    ---@cast self ColorTextNode
    self.text[section * 2 - 1] = color or {1, 1, 1}
    return self
end

---get the color of a section
---@param section number
---@return table
function ColorTextNode:get_color(section)
    ---@cast self ColorTextNode
    return self.text[section * 2 - 1]
end

---gets the number of sections
---@return number
function ColorTextNode:get_section_count()
    return #self.text / 2
end

return ColorTextNode