local DrawmodeNode = require("NodeLove.GraphicNodes.DrawmodeNode")

---@class SegmentNode : DrawmodeNode
---@field protected segments number
---@field protected __index SegmentNode
local SegmentNode = setmetatable({}, DrawmodeNode)
SegmentNode.__index = SegmentNode

-- ---------------------------- --
-- PUBLIC SegmentNode FUNCTIONS --
-- ---------------------------- --

---ABSTRACT
---creates a new node with a segments parameter
---@param drawmode "fill"|"line"|nil (default: fill)
---@param segments number|nil (default: 10)
---@return SegmentNode: the new arc node
function SegmentNode:new(drawmode, segments)
    local new = setmetatable(DrawmodeNode:new(drawmode), SegmentNode)
    ---@cast new SegmentNode
    new.segments = segments or 10
    return new
end

---@generic self : SegmentNode
---@param self self
---sets the number of segments used for drawing the arc
---@param segments number|nil (default: 10)
---@return self
function SegmentNode:set_segments(segments)
    self.segments = segments or 10
    return self
end

---gets the number of segments used for drawing the arc
---@return number
function SegmentNode:get_segments()
    return self.segments
end

return SegmentNode