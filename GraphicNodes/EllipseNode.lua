local SegmentNode = require("NodeLove.GraphicNodes.SegmentNode")

---@class EllipseNode : SegmentNode
---@field protected radiusx number
---@field protected radiusy number
---@field protected __index EllipseNode
local EllipseNode = setmetatable({}, SegmentNode)
EllipseNode.__index = EllipseNode

-- ---------------------------- --
-- PUBLIC EllipseNode FUNCTIONS --
-- ---------------------------- --

---creates a new ellipse node (see https://love2d.org/wiki/love.graphics.ellipse)
---@param drawmode "fill"|"line"|nil (default: fill)
---@param radiusx number|nil (default: 10)
---@param radiusy number|nil (default: 10)
---@param segments number|nil (default: 10)
---@return EllipseNode: the new ellipse node
function EllipseNode:new(drawmode, radiusx, radiusy, segments)
    local new = setmetatable(SegmentNode:new(drawmode, segments), EllipseNode)
    ---@cast new EllipseNode
    new.radiusx = radiusx or 10
    new.radiusy = radiusy or 10
    return new
end

---@generic self : EllipseNode
---@param self self
---sets the x radius
---@param radiusx number|nil (default: 10)
---@return self
function EllipseNode:set_radiusx(radiusx)
    self.radiusx = radiusx or 10
    return self
end

---@generic self : EllipseNode
---@param self self
---sets the y radius
---@param radiusy number|nil (default: 10)
---@return self
function EllipseNode:set_radiusy(radiusy)
    self.radiusy = radiusy or 10
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