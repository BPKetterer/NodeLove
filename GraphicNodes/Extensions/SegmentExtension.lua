---@class SegmentExtension
---@field protected segments number
---@field protected __index SegmentExtension
local SegmentExtension = {}
SegmentExtension.__index = SegmentExtension

-- --------------------------------- --
-- PUBLIC SegmentExtension FUNCTIONS --
-- --------------------------------- --

---TODO
function SegmentExtension:extend_class(class)
    class.set_segments = SegmentExtension.set_segments
    class.get_segments = SegmentExtension.get_segments
end

---@generic self : SegmentExtension
---@param self self
---sets the number of segments used for drawing the arc
---@param segments number|nil (default: 10)
---@return self
function SegmentExtension:set_segments(segments)
    self.segments = segments or 10
    return self
end

---gets the number of segments used for drawing the arc
---@return number
function SegmentExtension:get_segments()
    return self.segments
end

return SegmentExtension