require("NodeLove.Utils.ClassManager")
local Node = require("NodeLove.CoreNodes.Node")

---@class ImageNode : Node
---@field protected image table|nil
local ImageNode = CreateClass({}, Node)

-- -------------------------- --
-- PUBLIC ImageNode FUNCTIONS --
-- -------------------------- --

---creates a new image node (see https://love2d.org/wiki/love.graphics.newImage)
---@return ImageNode: the new image node
function ImageNode:new()
    local new = setmetatable(Node:new(), ImageNode)
    ---@cast new ImageNode
    return new
end

---loads an image
---@param filename string: the file name
---@param settings table|nil: the settings for the image
function ImageNode:load_image(filename, settings)
    self.image = love.graphics.newImage(filename, settings)
    return self
end

---gets the love2d image of the node
function ImageNode:get_image()
    return self.image
end

---sets the love2d image
function ImageNode:set_image(image)
    self.image = image
    return self
end

-- ----------------------------- --
-- PROTECTED ImageNode FUNCTIONS --
-- ----------------------------- --

---@protected
---draws the image
function ImageNode:draw_bottom()
    love.graphics.draw(self.image, 0, 0)
end

return ImageNode