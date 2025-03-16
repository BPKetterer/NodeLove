local PointsNode = require("NodeLove.GraphicNodes.PointsNode")

---@class LineNode : PointsNode
---@field protected __index LineNode
local LineNode = setmetatable({}, PointsNode)
LineNode.__index = LineNode

-- ------------------------- --
-- PUBLIC LineNode FUNCTIONS --
-- ------------------------- --

---creates a new line node (see https://love2d.org/wiki/love.graphics.line)
---@return LineNode: the new line node
function LineNode:new()
    local new = setmetatable(PointsNode:new(), LineNode)
    ---@cast new LineNode
    return new
end

-- ---------------------------- --
-- PROTECTED LineNode FUNCTIONS --
-- ---------------------------- --

---@protected
---draws the line
function LineNode:draw_bottom()
    love.graphics.line(self.points)
end

return LineNode