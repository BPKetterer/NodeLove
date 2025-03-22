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

---sends an event down the node tree
---@param type event_type
---@param event_data table
function RootNode:event(type, event_data)
    Node.event(self, type, event_data)
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

-- Input Callbacks
function love.keypressed(key, scancode, isrepeat)
    if NodeLoveRoot then
        NodeLoveRoot:event("keypressed", { key = key, scancode = scancode, isrepeat = isrepeat })
    end
end

function love.keyreleased(key, scancode)
    if NodeLoveRoot then
        NodeLoveRoot:event("keyreleased", { key = key, scancode = scancode })
    end
end

function love.textinput(text)
    if NodeLoveRoot then
        NodeLoveRoot:event("textinput", { text = text })
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if NodeLoveRoot then
        NodeLoveRoot:event("mousepressed", { x = x, y = y, button = button, istouch = istouch, presses = presses })
    end
end

function love.mousereleased(x, y, button, istouch, presses)
    if NodeLoveRoot then
        NodeLoveRoot:event("mousereleased", { x = x, y = y, button = button, istouch = istouch, presses = presses })
    end
end

function love.mousemoved(x, y, dx, dy, istouch)
    if NodeLoveRoot then
        NodeLoveRoot:event("mousemoved", { x = x, y = y, dx = dx, dy = dy, istouch = istouch })
    end
end

function love.wheelmoved(x, y)
    if NodeLoveRoot then
        NodeLoveRoot:event("wheelmoved", { x = x, y = y })
    end
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    if NodeLoveRoot then
        NodeLoveRoot:event("touchpressed", { id = id, x = x, y = y, dx = dx, dy = dy, pressure = pressure })
    end
end

function love.touchreleased(id, x, y, dx, dy, pressure)
    if NodeLoveRoot then
        NodeLoveRoot:event("touchreleased", { id = id, x = x, y = y, dx = dx, dy = dy, pressure = pressure })
    end
end

function love.touchmoved(id, x, y, dx, dy, pressure)
    if NodeLoveRoot then
        NodeLoveRoot:event("touchmoved", { id = id, x = x, y = y, dx = dx, dy = dy, pressure = pressure })
    end
end

-- Gamepad Callbacks
function love.gamepadpressed(joystick, button)
    if NodeLoveRoot then
        NodeLoveRoot:event("gamepadpressed", { joystick = joystick, button = button })
    end
end

function love.gamepadreleased(joystick, button)
    if NodeLoveRoot then
        NodeLoveRoot:event("gamepadreleased", { joystick = joystick, button = button })
    end
end

function love.gamepadaxis(joystick, axis, value)
    if NodeLoveRoot then
        NodeLoveRoot:event("gamepadaxis", { joystick = joystick, axis = axis, value = value })
    end
end

-- Joystick Callbacks
function love.joystickadded(joystick)
    if NodeLoveRoot then
        NodeLoveRoot:event("joystickadded", { joystick = joystick })
    end
end

function love.joystickremoved(joystick)
    if NodeLoveRoot then
        NodeLoveRoot:event("joystickremoved", { joystick = joystick })
    end
end

function love.joystickpressed(joystick, button)
    if NodeLoveRoot then
        NodeLoveRoot:event("joystickpressed", { joystick = joystick, button = button })
    end
end

function love.joystickreleased(joystick, button)
    if NodeLoveRoot then
        NodeLoveRoot:event("joystickreleased", { joystick = joystick, button = button })
    end
end

function love.joystickaxis(joystick, axis, value)
    if NodeLoveRoot then
        NodeLoveRoot:event("joystickaxis", { joystick = joystick, axis = axis, value = value })
    end
end

function love.joystickhat(joystick, hat, direction)
    if NodeLoveRoot then
        NodeLoveRoot:event("joystickhat", { joystick = joystick, hat = hat, direction = direction })
    end
end

-- Window Callbacks
function love.resize(w, h)
    if NodeLoveRoot then
        NodeLoveRoot:event("resize", { w = w, h = h })
    end
end

function love.visible(visible)
    if NodeLoveRoot then
        NodeLoveRoot:event("visible", { visible = visible })
    end
end

function love.focus(focus)
    if NodeLoveRoot then
        NodeLoveRoot:event("focus", { focus = focus })
    end
end

function love.mousefocus(focus)
    if NodeLoveRoot then
        NodeLoveRoot:event("mousefocus", { focus = focus })
    end
end

function love.quit()
    if NodeLoveRoot then
        NodeLoveRoot:event("quit", {})
    end
    --return true
end

-- System Callbacks
function love.errorhandler_todo(msg)
    if NodeLoveRoot then
        NodeLoveRoot:event("errorhandler", { msg = msg })
    end
end

function love.threaderror(thread, errorstr)
    if NodeLoveRoot then
        NodeLoveRoot:event("threaderror", { thread = thread, errorstr = errorstr })
    end
end

function love.lowmemory()
    if NodeLoveRoot then
        NodeLoveRoot:event("lowmemory", {})
    end
end

function love.filedropped(file)
    if NodeLoveRoot then
        NodeLoveRoot:event("filedropped", { file = file })
    end
end

function love.directorydropped(dir)
    if NodeLoveRoot then
        NodeLoveRoot:event("directorydropped", { dir = dir })
    end
end

return RootNode