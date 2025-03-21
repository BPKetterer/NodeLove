require("NodeLove.Utils.ClassManager")
local Node = require("NodeLove.CoreNodes.Node")
local SegmentExtension = require("NodeLove.GraphicNodes.Extensions.SegmentExtension")
local DrawmodeExtension = require("NodeLove.GraphicNodes.Extensions.DrawmodeExtension")

---@class CircleNode : Node, SegmentExtension, DrawmodeExtension
---@field protected radius number
local CircleNode = CreateClass({
    radius = 10
}, Node, SegmentExtension, DrawmodeExtension)

-- --------------------------- --
-- PUBLIC CircleNode FUNCTIONS --
-- --------------------------- --

---creates a new point node (see https://love2d.org/wiki/love.graphics.circle)
---@return CircleNode: the new circle node
function CircleNode:new()
    local new = setmetatable(Node:new(), CircleNode)
    ---@cast new CircleNode
    return new
end

---@generic self : CircleNode
---@param self self
---sets the radius
---@param radius number
---@return self
function CircleNode:set_radius(radius)
    self.radius = radius
    return self
end

---gets the radius
---@return number
function CircleNode:get_radius()
    return self.radius
end

-- ------------------------------ --
-- PROTECTED CircleNode FUNCTIONS --
-- ------------------------------ --

---@protected
---draws the circle
function CircleNode:draw_bottom()
    love.graphics.circle(self.drawmode, 0, 0, self.radius, self.segments)
end

return CircleNode