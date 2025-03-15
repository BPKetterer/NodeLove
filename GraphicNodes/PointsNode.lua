local Node = require("NodeLove.CoreNodes.Node")

---@class PointsNode : Node
---@field protected points table
---@field protected __index PointsNode
local PointsNode = setmetatable({}, Node)
PointsNode.__index = PointsNode

-- --------------------------- --
-- PUBLIC PointsNode FUNCTIONS --
-- --------------------------- --

---creates a new points node (see https://love2d.org/wiki/love.graphics.points)
---@return PointsNode: the new point node
function PointsNode:new()
    local new = setmetatable(Node:new(), PointsNode)
    ---@cast new PointsNode
    new.points = {}
    return new
end

---@generic self : PointsNode
---@param self self
---clears the points
---@return self
function PointsNode:clear()
    ---@cast self PointsNode
    self.points = {}
    return self
end

---@generic self : PointsNode
---@param self self
---adds a point
---@param x number
---@param y number
---@return self
function PointsNode:add_point(x, y)
    ---@cast self PointsNode
    table.insert(self.points, x)
    table.insert(self.points, y)
    return self
end

---@generic self : PointsNode
---@param self self
---removes a point
---@param id number|nil (default: last)
---@return self
function PointsNode:remove_point(id)
    ---@cast self PointsNode
    if not id then id = self:get_point_count() end
    table.remove(self.points, id * 2 - 1)
    table.remove(self.points, id * 2 - 1)
    return self
end

---@generic self : PointsNode
---@param self self
---sets the x position of a point
---@param id number
---@param x number
---@return self
function PointsNode:set_x(id, x)
    ---@cast self PointsNode
    self.points[id * 2 - 1] = x
    return self
end

---@generic self : PointsNode
---@param self self
---sets the y position of a point
---@param id number
---@param y number
---@return self
function PointsNode:set_y(id, y)
    ---@cast self PointsNode
    self.points[id * 2] = y
    return self
end

---gets x position of a point
---@param id number
---@return string
function PointsNode:get_x(id)
    return self.points[id * 2 - 1]
end

---gets y position of a point
---@param id number
---@return string
function PointsNode:get_y(id)
    return self.points[id * 2]
end

---gets the number of points
---@return number
function PointsNode:get_point_count()
    return #self.points / 2
end

-- ------------------------------ --
-- PROTECTED PointsNode FUNCTIONS --
-- ------------------------------ --

function PointsNode:draw_bottom()
    love.graphics.points(self.points)
end

return PointsNode