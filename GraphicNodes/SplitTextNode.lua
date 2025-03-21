require("NodeLove.Utils.ClassManager")
local TextNode = require("NodeLove.GraphicNodes.TextNode")

---@class SplitTextNode : TextNode
---@field protected text table
local SplitTextNode = CreateClass({}, TextNode)

-- ------------------------------ --
-- PUBLIC SplitTextNode FUNCTIONS --
-- ------------------------------ --

---creates a new text node using an array for the text(see https://love2d.org/wiki/love.graphics.printf)
---@return SplitTextNode: the new text node
function SplitTextNode:new()
    local new = setmetatable(TextNode:new(), SplitTextNode)
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
---@param txt string|nil (default: "")
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
---@param txt string|nil (default: "")
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