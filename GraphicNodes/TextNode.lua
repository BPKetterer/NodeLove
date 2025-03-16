local Node = require("NodeLove.CoreNodes.Node")

---@class TextNode : Node
---@field protected text string
---@field protected font table
---@field protected limit number
---@field protected align_mode "left"|"right"|"center"
---@field protected __index TextNode
local TextNode = setmetatable({}, Node)
TextNode.__index = TextNode

-- ------------------------- --
-- PUBLIC TextNode FUNCTIONS --
-- ------------------------- --

---creates a new text node (see https://love2d.org/wiki/love.graphics.printf)
---@param font table|nil: the choosen font or nil to use default (at current time)
---@param limit number|nil the width limit in pixel (default: 10000)
---@param align_mode "left"|"right"|"center"|nil the alginment of the text (default: "left")
---@return TextNode: the new text node
function TextNode:new(font, limit, align_mode)
    local new = setmetatable(Node:new(), TextNode)
    ---@cast new TextNode
    new.text = ""
    new.font = font or love.graphics.getFont()
    new.align_mode = align_mode or "left"
    new.limit = limit or 10000
    return new
end

---@generic self : TextNode
---@param self self
---sets the text
---@return self
function TextNode:clear()
    ---@cast self TextNode
    self.text = ""
    return self
end

---@generic self : TextNode
---@param self self
---sets the text
---@param txt string|nil
---@return self
function TextNode:set_text(txt)
    ---@cast self TextNode
    self.text = txt or ""
    return self
end

---gets the text as a string
---@return string
function TextNode:get_text(section)
    return self.text
end

---@generic self : TextNode
---@param self self
---the width limit in pixel
---@param limit number|nil (default: 10000)
---@return self
function TextNode:set_limit(limit)
    ---@cast self TextNode
    self.limit = limit or 10000
    return self
end

---gets the width limit in pixel
---@return number
function TextNode:get_limit()
    return self.limit
end

---gets the used width
---@return number
function TextNode:get_width()
    return select(1, self.font:getWrap(self.text, self.limit))
end

---gets the line count
---@return number
function TextNode:get_line_count()
    return #select(2, self.font:getWrap(self.text, self.limit))
end

---gets the height in pixel used by the text
---@return number
function TextNode:get_height()
    return self:get_line_count() * self.font:getHeight()
end

---@generic self : TextNode
---@param self self
---sets the align mode
---@param align_mode "left"|"right"|"center"|nil (default: "left")
---@return self
function TextNode:set_align_mode(align_mode)
    ---@cast self TextNode
    self.align_mode = align_mode or "left"
    return self
end

---gets the align_mode
---@return "left"|"right"|"center"
function TextNode:get_align_mode()
    return self.align_mode
end

---@generic self : TextNode
---@param self self
---sets the font
---@param font table|nil when nil use current default
---@return self
function TextNode:set_font(font)
    ---@cast self TextNode
    if not font then
        font = love.graphics.getFont()
    end
    self.font = font
    return self
end

---gets the font
---@return table|nil
function TextNode:get_font()
    return self.font
end

-- ---------------------------- --
-- PROTECTED TextNode FUNCTIONS --
-- ---------------------------- --

---@protected
---draws the text
function TextNode:draw_bottom()
    love.graphics.printf(self.text, self.font or love.graphics.getFont(), 0, 0, self.limit, self.align_mode)
end

return TextNode