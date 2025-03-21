require("NodeLove.Utils.ClassManager")
local Node = require("NodeLove.CoreNodes.Node")
local SegmentExtension = require("NodeLove.GraphicNodes.Extensions.SegmentExtension")
local DrawmodeExtension = require("NodeLove.GraphicNodes.Extensions.DrawmodeExtension")

---@class RectangleNode : Node, SegmentExtension, DrawmodeExtension
---@field protected rx number
---@field protected ry number
---@field protected width number
---@field protected height number
local RectangleNode = CreateClass({
    rx = 0,
    ry = 0,
    width = 0,
    height = 0
}, Node, SegmentExtension, DrawmodeExtension)

-- ------------------------------ --
-- PUBLIC RectangleNode FUNCTIONS --
-- ------------------------------ --

---creates a new point node (see https://love2d.org/wiki/love.graphics.rectangle)
---@return RectangleNode: the new rectangle node
function RectangleNode:new()
    local new = setmetatable(Node:new(), RectangleNode)
    ---@cast new RectangleNode
    return new
end

---@generic self : RectangleNode
---@param self self
---sets the width of the rectangle
---@param width number
---@return self
function RectangleNode:set_width(width)
    self.width = width
    return self
end

---gets the width of the rectangle
---@return number
function RectangleNode:get_width()
    return self.width
end

---@generic self : RectangleNode
---@param self self
---sets the height of the rectangle
---@param height number
---@return self
function RectangleNode:set_height(height)
    self.height = height
    return self
end

---gets the height of the rectangle
---@return number
function RectangleNode:get_height()
    return self.height
end

---@generic self : RectangleNode
---@param self self
---sets the x-axis radius of each round corner
---@param rx number
---@return self
function RectangleNode:set_rx(rx)
    self.rx = rx
    return self
end

---gets the x-axis radius of each round corner
---@return number
function RectangleNode:get_rx()
    return self.rx
end

---@generic self : RectangleNode
---@param self self
---sets the y-axis radius of each round corner
---@param ry number
---@return self
function RectangleNode:set_ry(ry)
    self.ry = ry
    return self
end

---gets the y-axis radius of each round corner
---@return number
function RectangleNode:get_ry()
    return self.ry
end

---@generic self : RectangleNode
---@param self self
---sets their radius of each round corner
---works the same as calling set_rx and r_y
---@param r number
---@return self
function RectangleNode:set_r(r)
    self.rx = r
    self.ry = r
    return self
end

-- --------------------------------- --
-- PROTECTED RectangleNode FUNCTIONS --
-- --------------------------------- --

---@protected
---draws the rectangle
function RectangleNode:draw_bottom()
    love.graphics.rectangle(self.drawmode, 0, 0, self.width, self.height, self.rx, self.ry, self.segments)
end

return RectangleNode