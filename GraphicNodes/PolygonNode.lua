local PointsNode = require("NodeLove.GraphicNodes.PointsNode")
local DrawmodeExtension = require("NodeLove.GraphicNodes.Extensions.DrawmodeExtension")

---@class PolygonNode : PointsNode, DrawmodeExtension
---@field protected __index PolygonNode
local PolygonNode = setmetatable({}, PointsNode)
PolygonNode.__index = PolygonNode
DrawmodeExtension:extend_class(PolygonNode)

-- ---------------------------- --
-- PUBLIC PolygonNode FUNCTIONS --
-- ---------------------------- --

---creates a new polygon node (see https://love2d.org/wiki/love.graphics.polygon)
---@param drawmode "fill"|"line"|nil (default: fill)
---@return PolygonNode: the new line node
function PolygonNode:new(drawmode)
    local new = setmetatable(PointsNode:new(), PolygonNode)
    ---@cast new PolygonNode
    new:set_drawmode(drawmode)
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