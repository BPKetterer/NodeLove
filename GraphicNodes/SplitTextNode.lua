local TextNode = require("NodeLove.GraphicNodes.TextNode")

---@class SplitTextNode : TextNode
---@field protected text table
---@field protected __index TextNode
local SplitTextNode = setmetatable({}, TextNode)
SplitTextNode.__index = SplitTextNode

-- ------------------------------ --
-- PUBLIC SplitTextNode FUNCTIONS --
-- ------------------------------ --

---creates a new text node using an array for the text(see https://love2d.org/wiki/love.graphics.printf)
---@param font table|nil: the choosen font or nil to use default (at current time)
---@param limit number|nil the width limit in pixel (default: 10000)
---@param align_mode string|nil the alginment of the text (default: "left")
---@return SplitTextNode: the new text node
function SplitTextNode:new(font, limit, align_mode)
    local new = setmetatable(TextNode:new(font, limit, align_mode), SplitTextNode)
    ---@cast new SplitTextNode
    new.text = {}
    return new
end

---@generic self : SplitTextNode
---@param self self
---sets the text
---@return self
function SplitTextNode:clear()
    ---@cast self SplitTextNode
    self.text = {}
    return self
end

---@generic self : SplitTextNode
---@param self self
---adds a section to the end with the given text
---@param txt string|nil
---@return self
function SplitTextNode:add_text(txt)
    ---@cast self SplitTextNode
    table.insert(self.text, txt or "")
    return self
end

---@generic self : SplitTextNode
---@param self self
---removes a text section
---@param section number|nil (default: last)
---@return self
function SplitTextNode:remove_text(section)
    ---@cast self ColorTextNode
    if not section then section = self:get_section_count() end
    table.remove(self.text, section)
    return self
end

---@generic self : SplitTextNode
---@param self self
---sets the text of a section
---@param section number
---@param txt string|nil
---@return self
function SplitTextNode:set_text(section, txt)
    ---@cast self SplitTextNode
    self.text[section] = txt or ""
    return self
end

---gets the text of a section
---@param section number
---@return string
function SplitTextNode:get_text(section)
    return self.text[section]
end

---gets the number of sections
---@return number
function SplitTextNode:get_section_count()
    return #self.text
end

return SplitTextNode