require("NodeLove.Utils.ClassManager")
local CircleNode = require("NodeLove.GraphicNodes.CircleNode")

---@class ArcNode : CircleNode
---@field protected arctype "pie"|"open"|"closed"
---@field protected radius number
---@field protected angle1 number
---@field protected angle2 number
local ArcNode = CreateClass({
    arctype = "pie",
    angle1 = 0,
    angle2 = 0
}, CircleNode)

-- ------------------------ --
-- PUBLIC ArcNode FUNCTIONS --
-- ------------------------ --

---creates a new point node (see https://love2d.org/wiki/love.graphics.arc)
---@return ArcNode: the new arc node
function ArcNode:new()
    local new = setmetatable(CircleNode:new(), ArcNode)
    ---@cast new ArcNode
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

-- --------------------------- --
-- PROTECTED ArcNode FUNCTIONS --
-- --------------------------- --

---@protected
---draws the arc
function ArcNode:draw_bottom()
    love.graphics.arc(self.drawmode, self.arctype, 0, 0, self.radius, self.angle1, self.angle2, self.segments)
end

return ArcNode