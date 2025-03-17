require("NodeLove.Utils.ClassManager")

---@class SegmentExtension
---@field protected segments number
local SegmentExtension = CreateClass({
    segments = 10
})

-- --------------------------------- --
-- PUBLIC SegmentExtension FUNCTIONS --
-- --------------------------------- --

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