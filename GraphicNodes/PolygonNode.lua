require("NodeLove.Utils.ClassManager")
local PointsNode = require("NodeLove.GraphicNodes.PointsNode")
local DrawmodeExtension = require("NodeLove.GraphicNodes.Extensions.DrawmodeExtension")

---@class PolygonNode : PointsNode, DrawmodeExtension
local PolygonNode = CreateClass({}, PointsNode, DrawmodeExtension)

-- ---------------------------- --
-- PUBLIC PolygonNode FUNCTIONS --
-- ---------------------------- --

---creates a new polygon node (see https://love2d.org/wiki/love.graphics.polygon)
---@return PolygonNode: the new line node
function PolygonNode:new()
    local new = setmetatable(PointsNode:new(), PolygonNode)
    ---@cast new PolygonNode
    return new
end

-- ------------------------------- --
-- PROTECTED PolygonNode FUNCTIONS --
-- ------------------------------- --

---@protected
---draws the line
function PolygonNode:draw_bottom()
    love.graphics.polygon(self.drawmode, self.points)
end

return PolygonNode