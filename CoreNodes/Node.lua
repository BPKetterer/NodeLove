require("NodeLove.Utils.ClassManager")
local Group = require("NodeLove.Utils.Group")
local TransformationManager = require("NodeLove.Utils.TransformationManager")
local Transformation = require("NodeLove.Utils.Transformation")

---@class Node
---@field private parent Node|nil
---@field private parents_group_item GroupItem|nil
---@field private children Group
---@field private updates_paused boolean
---@field private drawing_paused boolean
---@field private transformation Transformation|nil
---@field protected update_top function|nil
---@field protected update_bottom function|nil
---@field protected draw_top function|nil
---@field protected draw_bottom function|nil
---@field protected event_handler_top function|nil
---@field protected event_handler_bottom function|nil
local Node = CreateClass({
    updates_paused = false,
    drawing_paused = false
})

---@alias event_type "keypressed"|"keyreleased"|"textinput"|"mousepressed"|"mousereleased"|"mousemoved"|"wheelmoved"|"touchpressed"|"touchreleased"|"touchmoved"|"gamepadpressed"|"gamepadreleased"|"gamepadaxis"|"joystickadded"|"joystickremoved"|"joystickpressed"|"joystickreleased"|"joystickaxis"|"joystickhat"|"resize"|"visible"|"focus"|"mousefocus"|"quit"|"errorhandler"|"threaderror"|"lowmemory"|"filedropped"|"directorydropped"

-- --------------------- --
-- PUBLIC Node FUNCTIONS --
-- --------------------- --

---creates a new node
---@return Node
function Node:new()
    return setmetatable({
        children = Group:new()
    }, Node)
end

---@generic self : Node
---@param self self
---sets the z position within the current parrent
---@param z number
---@return self
function Node:set_z(z)
    ---@cast self Node
    if self.parents_group_item then
        self.parents_group_item:update_priority(z)
    end
    return self
end

---gets the z position within the current parent
---@return number|nil: returns nil, when the node has no parent
function Node:get_z()
    return (self.parents_group_item and self.parents_group_item:get_priority()) or nil
end

---@generic self : Node
---@param self self
---set the parent of a node
---@param parent Node|nil: the new parent
---@param keep_z boolean|nil: when true, keep the z value of the last parent (default: true)
---@return self
function Node:set_parent(parent, keep_z)
    ---@cast self Node
    if parent then
        local z = 0
        if keep_z and self.parents_group_item then
            z = self.parents_group_item:get_priority()
        end
        parent:add_child(self, z)
    end
    return self
end

---@generic self : Node
---@param self self
---unliks the node from it's parent
---@return self
function Node:unlink_parent()
    ---@cast self Node
    self.parents_group_item:remove()
    self.parents_group_item = nil
    self.parent = nil
    return self
end

---gets the parent of the node
---@return Node|nil
function Node:get_parent()
    return self.parent
end

---@generic self : Node
---@param self self
---adds a child
---@param child Node: the new child
---@param z number|nil: the z position of the child (default: 0)
---@return self
function Node:add_child(child, z)
    ---@cast self Node
    if not z then
        z = 0
    end
    if child.parent then
        child:unlink_parent()
    end
    child.parents_group_item = self.children:add(child, z)
    child.parent = self
    return self
end

---gets the children of the node
---@return Group
function Node:get_children()
    return self.children
end

---@generic self : Node
---@param self self
---sets the transformation
---@param transformation Transformation|nil
---@return self
function Node:set_transformation(transformation)
    ---@cast self Node
    self.transformation = transformation
    return self
end

---gets the transformation object for the node (creates one if not existant)
---@return Transformation
function Node:get_transformation()
    if not self.transformation then
        self.transformation = Transformation:new()
    end
    return self.transformation
end

---checks if the node uses a transformation
---@return boolean
function Node:uses_transformation()
    return self.transformation ~= nil
end

---@generic self : Node
---@param self self
---set weather or not the node and its children should be updated or not
---@return self
function Node:set_updates_paused(paused)
    ---@cast self Node
    self.updates_paused = paused
    return self
end

---gets weather or not updates are paused for this node (does not register if a parent is paused)
---@return boolean
function Node:get_updates_paused()
    return self.updates_paused
end

---@generic self : Node
---@param self self
---set weather or not the node and its children should be drawn or not
---@return self
function Node:set_drawing_paused(paused)
    ---@cast self Node
    self.drawing_paused = paused
    return self
end

---gets weather or not drawing is paused for this node (does not register if a parent is paused)
---@return boolean
function Node:get_drawing_paused()
    return self.drawing_paused
end

function Node:transform_position(x, y)
    if self.parent then
        x, y = self.parent:transform_position(x, y)
    end
    if self.transformation then
        x, y = self.transformation:get_love_transformation():inverse():transformPoint(x, y)
    end
    return x, y
end

-- ------------------------ --
-- PROTECTED Node FUNCTIONS --
-- ------------------------ --

---@protected
---updates self and all children
---@param dt number: the time since the last update
---@param update_data any: data passed through the tree to exchange data
function Node:update(dt, update_data)
    if self.updates_paused then
        return
    end
    if self.update_top then
        self:update_top(dt, update_data)
    end
    self.children:for_all_asc(function(child)
        child:update(dt, update_data)
    end, true)
    if self.update_bottom then
        self:update_bottom(dt, update_data)
    end
end

---@protected
---draws self and all children
---@param draw_data any: data passed through the tree to exchange data
function Node:draw(draw_data)
    if self.drawing_paused then
        return
    end
    local apply_transformation = self.transformation ~= nil
    if apply_transformation then
        TransformationManager:apply(self.transformation)
    end
    if self.draw_top then
        self:draw_top(draw_data)
    end
    self.children:for_all_desc(function(child)
        child:draw(draw_data)
    end, false)
    if self.draw_bottom then
        self:draw_bottom(draw_data)
    end
    if apply_transformation then
        TransformationManager:revert()
    end
end

---@protected
---handles an event
---@param type event_type
---@param event_data table
---@return boolean: event has been handled
function Node:event(type, event_data)
    local result = false
    if self.event_handler_top then
        if self:event_handler_top(type, event_data) then
            return true
        end
    end
    self.children:for_all_asc(function(child)
        if not result then --TODO optimise
            result = child:event(type, event_data)
        end
    end, true)
    if result then
        return true
    end
    if self.event_handler_bottom then
        return self:event_handler_bottom(type, event_data)
    end
    return false
end

return Node