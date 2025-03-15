---@class Transformation
---@field protected transformation table
---@field protected outdated boolean
---@field protected x number
---@field protected y number
---@field protected angle number
---@field protected sx number
---@field protected sy number
---@field protected ox number
---@field protected oy number
---@field protected kx number
---@field protected ky number
---@field protected __index Transformation
local Transformation = {}
Transformation.__index = Transformation

---creates a new Transformation
---@return Transformation
function Transformation:new()
    local new = setmetatable({}, Transformation)
    new:reset()
    return new
end

---clones a transformation
---@return Transformation
function Transformation:clone()
    local new = setmetatable({}, Transformation)
    for k, v in pairs(self) do
        new[k] = v
    end
    new.transformation = love.math.newTransform()
    new.outdated = true
    return new
end

---resets the transformation
---@return Transformation
function Transformation:reset()
    self.transformation = love.math.newTransform()
    self.outdated = true
    self.x = 0
    self.y = 0
    self.angle = 0
    self.sx = 1
    self.sy = 1
    self.ox = 0
    self.oy = 0
    self.kx = 0
    self.ky = 0
    return self
end

---gets the love2d transformation
---@return table
function Transformation:get_love_transformation()
    if self.outdated then
        self.outdated = false
        self.transformation:setTransformation(
            self.x,
            self.y,
            self.angle,
            self.sx,
            self.sy,
            self.ox,
            self.oy,
            self.kx,
            self.ky
        )
    end
    return self.transformation
end

---sets the x value of the transformation
---@param x number
---@return Transformation
function Transformation:set_x(x)
    self.x = x
    self.outdated = true
    return self
end

---gets the x value of the transformation
---@return number
function Transformation:get_x()
    return self.x
end

---sets the y value of the transformation
---@param y number
---@return Transformation
function Transformation:set_y(y)
    self.y = y
    self.outdated = true
    return self
end

---gets the y value of the transformation
---@return number
function Transformation:get_y()
    return self.y
end

---sets the angle value of the transformation
---@param angle number
---@return Transformation
function Transformation:set_angle(angle)
    self.angle = angle
    self.outdated = true
    return self
end

---gets the angle value of the transformation
---@return number
function Transformation:get_angle()
    return self.angle
end

---sets the sx value of the transformation
---@param sx number
---@return Transformation
function Transformation:set_sx(sx)
    self.sx = sx
    self.outdated = true
    return self
end

---gets the sx value of the transformation
---@return number
function Transformation:get_sx()
    return self.sx
end

---sets the sy value of the transformation
---@param sy number
---@return Transformation
function Transformation:set_sy(sy)
    self.sy = sy
    self.outdated = true
    return self
end

---gets the sy value of the transformation
---@return number
function Transformation:get_sy()
    return self.sy
end

---sets the ox value of the transformation
---@param ox number
---@return Transformation
function Transformation:set_ox(ox)
    self.ox = ox
    self.outdated = true
    return self
end

---gets the ox value of the transformation
---@return number
function Transformation:get_ox()
    return self.ox
end

---sets the sy value of the transformation
---@param oy number
---@return Transformation
function Transformation:set_oy(oy)
    self.oy = oy
    self.outdated = true
    return self
end

---gets the oy value of the transformation
---@return number
function Transformation:get_oy()
    return self.oy
end

---sets the kx value of the transformation
---@param kx number
---@return Transformation
function Transformation:set_kx(kx)
    self.kx = kx
    self.outdated = true
    return self
end

---gets the kx value of the transformation
---@return number
function Transformation:get_kx()
    return self.kx
end

---sets the ky value of the transformation
---@param ky number
---@return Transformation
function Transformation:set_ky(ky)
    self.ky = ky
    self.outdated = true
    return self
end

---gets the ky value of the transformation
---@return number
function Transformation:get_ky()
    return self.ky
end

return Transformation