require("NodeLove.Utils.ClassManager")
local Node = require("NodeLove.CoreNodes.Node")

---@type RootNode|nil
NodeLoveRoot = nil

--- @class RootNode : Node
local RootNode = CreateClass({}, Node)

-- ------------------------- --
-- PUBLIC RootNode FUNCTIONS --
-- ------------------------- --

---creates a new root node
---@return RootNode: the new node
function RootNode:new()
    local new = setmetatable(Node:new(), RootNode)
    ---@cast new RootNode
    return new
end

---updates the node tree
---@param dt number: the time since the last update
function RootNode:update(dt)
    Node.update(self, dt, {})
end

---draws the node tree
function RootNode:draw()
    Node.draw(self, {})
end

---handles an event
---@param event_data any
function RootNode:event(event_data)
    Node.event(self, event_data)
end

---@generic self : RootNode
---@param self self
---makes this node the root node for the update and draw funciton of love2d
---@return self
function RootNode:make_love_root()
    ---@cast self RootNode
    NodeLoveRoot = self
    return self
end

-- -------------------------------------------- --
-- Love2d Functions to trigger the LoveRootNode --
-- -------------------------------------------- --

function love.update(dt)
    if NodeLoveRoot then
        NodeLoveRoot:update(dt)
    end
end

function love.draw()
    if NodeLoveRoot then
        NodeLoveRoot:draw()
    end
end

return RootNode