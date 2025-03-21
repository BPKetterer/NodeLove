require("NodeLove.Utils.ClassManager")
local Node = require("NodeLove.CoreNodes.Node")

---@class PointNode : Node
local PointNode = CreateClass({}, Node)

-- -------------------------- --
-- PUBLIC PointNode FUNCTIONS --
-- -------------------------- --

---creates a new point node (see https://love2d.org/wiki/love.graphics.points)
---@return PointNode: the new point node
function PointNode:new()
    local new = setmetatable(Node:new(), PointNode)
    ---@cast new PointNode
    return new
end

-- ----------------------------- --
-- PROTECTED PointNode FUNCTIONS --
-- ----------------------------- --

---@protected
---draws the point
function PointNode:draw_bottom()
    love.graphics.points(0, 0)
end

return PointNode