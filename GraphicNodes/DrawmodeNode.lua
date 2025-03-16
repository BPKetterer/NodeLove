local Node = require("NodeLove.CoreNodes.Node")

---@class DrawmodeNode : Node
---@field protected drawmode "fill"|"line"
---@field protected __index DrawmodeNode
local DrawmodeNode = setmetatable({}, Node)
DrawmodeNode.__index = DrawmodeNode

-- ----------------------------- --
-- PUBLIC DrawmodeNode FUNCTIONS --
-- ----------------------------- --

---ABSTRACT
---creates a new node with a Drawmode
---@param drawmode "fill"|"line"|any
---@return DrawmodeNode: the new point node
function DrawmodeNode:new(drawmode)
    local new = setmetatable(Node:new(), DrawmodeNode)
    ---@cast new DrawmodeNode
    new:set_drawmode(drawmode)
    return new
end

---@generic self : DrawmodeNode
---@param self self
---sets the drawmode
---@param drawmode "fill"|"line"|nil (default: "fill")
---@return self
function DrawmodeNode:set_drawmode(drawmode)
    self.drawmode = drawmode or "fill"
    return self
end

---gets the drawmode
---@return "fill"|"line"
function DrawmodeNode:get_drawmode()
    return self.drawmode
end

return DrawmodeNode