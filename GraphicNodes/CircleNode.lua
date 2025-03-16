local SegmentNode = require("NodeLove.GraphicNodes.SegmentNode")

---@class CircleNode : SegmentNode
---@field protected radius number
---@field protected __index CircleNode
local CircleNode = setmetatable({}, SegmentNode)
CircleNode.__index = CircleNode

-- --------------------------- --
-- PUBLIC CircleNode FUNCTIONS --
-- --------------------------- --

---creates a new point node (see https://love2d.org/wiki/love.graphics.arc)
---@param drawmode "fill"|"line"|nil (default: fill)
---@param radius number|nil (default: 10)
---@param segments number|nil (default: 10)
---@return CircleNode: the new arc node
function CircleNode:new(drawmode, radius, segments)
    local new = setmetatable(SegmentNode:new(drawmode, segments), CircleNode)
    ---@cast new CircleNode
    new.radius = radius or 10
    return new
end

---@generic self : CircleNode
---@param self self
---sets the radius
---@param radius number|nil (default: 10)
---@return self
function CircleNode:set_radius(radius)
    self.radius = radius or 10
    return self
end

---gets the radius
---@return number
function CircleNode:get_radius()
    return self.radius
end

-- --------------------------- --
-- PROTECTED ArcNode FUNCTIONS --
-- --------------------------- --

---@protected
---draws the arc
function CircleNode:draw_bottom()
    love.graphics.circle(self.drawmode, 0, 0, self.radius, self.segments)
end

return CircleNode