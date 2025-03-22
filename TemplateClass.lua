require("NodeLove.Utils.ClassManager")
local Node = require("NodeLove.CoreNodes.Node")

---@class TODO_CLASS_NAME : Node
local TODO_CLASS_NAME = CreateClass({}, Node)

-- --------------------------- --
-- PUBLIC TODO_CLASS_NAME FUNCTIONS --
-- --------------------------- --

---TODO
---@return TODO_CLASS_NAME: the new circle node
function TODO_CLASS_NAME:new()
    local new = setmetatable(Node:new(), TODO_CLASS_NAME)
    ---@cast new TODO_CLASS_NAME
    return new
end

---@generic self : TODO_CLASS_NAME
---@param self self
---sets the radius
---@return self

-- ------------------------------ --
-- PROTECTED TODO_CLASS_NAME FUNCTIONS --
-- ------------------------------ --

return TODO_CLASS_NAME