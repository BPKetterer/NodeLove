local Node = require("NodeLove.CoreNodes.Node")

---@class ImageNode : Node
---@field protected image table|nil
---@field protected centered boolean
---@field protected __index ImageNode
local ImageNode = setmetatable({}, Node)
ImageNode.__index = ImageNode

-- -------------------------- --
-- PUBLIC ImageNode FUNCTIONS --
-- -------------------------- --

---creates a new image node (see https://love2d.org/wiki/love.graphics.newImage)
---@param filename string|nil: the file name (if no name is given no image is drawn)
---@param settings table|nil: the settings for the image
---@param centered boolean|nil: when true the an intenal offset centeres the image (default: true)
---@return ImageNode: the new image node
function ImageNode:new(filename, settings, centered)
    return self:new_from_image(love.graphics.newImage(filename, settings), centered)
end

---create a new image node based on an existing love2d image
---@param image any: the love2d image
---@param centered boolean|nil: when true the an intenal offset centeres the image (default: true)
---@return ImageNode: the new image node
function ImageNode:new_from_image(image, centered)
    local new = setmetatable(Node:new(), ImageNode)
    ---@cast new ImageNode
    new.image = image
    new.centered = centered ~= false
    return new
end

---gets the love2d image of the node
function ImageNode:get_image()
    return self.image
end

---sets the love2d image
function ImageNode:set_image(image)
    self.image = image
end

-- ----------------------------- --
-- PROTECTED ImageNode FUNCTIONS --
-- ----------------------------- --

---@protected
---draws the image
function ImageNode:draw_bottom()
    if self.centered then
        love.graphics.draw(self.image, -self.image:getWidth()/2, -self.image:getHeight()/2)
    else
        love.graphics.draw(self.image, 0, 0)
    end
end

return ImageNode