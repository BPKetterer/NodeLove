require("NodeLove.Utils.ClassManager")
local Node = require("NodeLove.CoreNodes.Node")
local SegmentExtension = require("NodeLove.GraphicNodes.Extensions.SegmentExtension")
local DrawmodeExtension = require("NodeLove.GraphicNodes.Extensions.DrawmodeExtension")

---@class EllipseNode : Node, SegmentExtension, DrawmodeExtension
---@field protected radiusx number
---@field protected radiusy number
local EllipseNode = CreateClass({
    radiusx = 10,
    rediusy = 10
}, Node, SegmentExtension, DrawmodeExtension)

-- ---------------------------- --
-- PUBLIC EllipseNode FUNCTIONS --
-- ---------------------------- --

---creates a new ellipse node (see https://love2d.org/wiki/love.graphics.ellipse)
---@return EllipseNode: the new ellipse node
function EllipseNode:new()
    local new = setmetatable(Node:new(), EllipseNode)
    ---@cast new EllipseNode
    return new
end

---@generic self : EllipseNode
---@param self self
---sets the x radius
---@param radiusx number
---@return self
function EllipseNode:set_radiusx(radiusx)
    self.radiusx = radiusx
    return self
end

---@generic self : EllipseNode
---@param self self
---sets the y radius
---@param radiusy number
---@return self
function EllipseNode:set_radiusy(radiusy)
    self.radiusy = radiusy
    return self
end

---gets the x radius
---@return number
function EllipseNode:get_radiusx()
    return self.radiusx
end

---gets the y radius
---@return number
function EllipseNode:get_radiusy()
    return self.radiusy
end

-- --------------------------- --
-- PROTECTED EllipseNode FUNCTIONS --
-- --------------------------- --

---@protected
---draws the ellipse
function EllipseNode:draw_bottom()
    love.graphics.ellipse(self.drawmode, 0, 0, self.radiusx, self.radiusy, self.segments)
end

return EllipseNode