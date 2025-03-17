require("NodeLove.Utils.ClassManager")
local PointsNode = require("NodeLove.GraphicNodes.PointsNode")

---@class LineNode : PointsNode
local LineNode = CreateClass({}, PointsNode)

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