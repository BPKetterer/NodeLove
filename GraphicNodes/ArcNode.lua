local DrawmodeNode = require("NodeLove.GraphicNodes.DrawmodeNode")

---@class ArcNode : DrawmodeNode
---@field protected arctype "pie"|"open"|"closed"
---@field protected radius number
---@field protected angle1 number
---@field protected angle2 number
---@field protected segments number
---@field protected __index ArcNode
local ArcNode = setmetatable({}, DrawmodeNode)
ArcNode.__index = ArcNode

-- ------------------------ --
-- PUBLIC ArcNode FUNCTIONS --
-- ------------------------- --

---creates a new point node (see https://love2d.org/wiki/love.graphics.arc)
---@param drawmode "fill"|"line"|nil
---@param arctype "pie"|"open"|"closed"|nil
---@param radius number|nil
---@param angle1 number|nil
---@param angle2 number|nil
---@param segments number|nil
---@return ArcNode: the new arc node
function ArcNode:new(drawmode, arctype, radius, angle1, angle2, segments)
    local new = setmetatable(DrawmodeNode:new(drawmode), ArcNode)
    ---@cast new ArcNode
    new.arctype = arctype or "pie"
    new.radius = radius or 10
    new.angle1 = angle1 or 0
    new.angle2 = angle2 or 0
    new.segments = segments or 10
    return new
end

---@generic self : ArcNode
---@param self self
---sets the arctype
---@param arctype "pie"|"open"|"closed"|nil (default: "pie")
---@return self
function ArcNode:set_arctype(arctype)
    self.arctype = arctype or "pie"
    return self
end

---gets the arctype
---@return "pie"|"open"|"closed"
function ArcNode:get_arctype()
    return self.arctype
end

---@generic self : ArcNode
---@param self self
---sets the radius
---@param radius number|nil (default: 10)
---@return self
function ArcNode:set_radius(radius)
    self.radius = radius or 10
    return self
end

---gets the radius
---@return number
function ArcNode:get_radius()
    return self.radius
end

---@generic self : ArcNode
---@param self self
---sets the angle at which the arc begins
---@param angle1 number|nil (default: 0)
---@return self
function ArcNode:set_angle1(angle1)
    self.angle1 = angle1 or 0
    return self
end

---gets the angle at which the arc begins
---@return number
function ArcNode:get_angle1()
    return self.angle1
end

---@generic self : ArcNode
---@param self self
---sets the angle at which the arc terminates
---@param angle2 number|nil (default: 0)
---@return self
function ArcNode:set_angle2(angle2)
    self.angle2 = angle2 or 0
    return self
end

---gets the angle at which the arc terminates
---@return number
function ArcNode:get_angle2()
    return self.angle2
end

---@generic self : ArcNode
---@param self self
---sets the number of segments used for drawing the arc
---@param segments number|nil (default: 10)
---@return self
function ArcNode:set_segments(segments)
    self.segments = segments or 10
    return self
end

---gets the number of segments used for drawing the arc
---@return number
function ArcNode:get_segments()
    return self.segments
end

-- --------------------------- --
-- PROTECTED ArcNode FUNCTIONS --
-- --------------------------- --

---@protected
---draws the arc
function ArcNode:draw_bottom()
    love.graphics.arc(self.drawmode, self.arctype, 0, 0, self.radius, self.angle1, self.angle2, self.segments)
end

return ArcNode