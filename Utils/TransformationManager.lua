local TransformationManager = {}
local transformation_stack = {}

---adds a transformation to the stack and applies it
---@param transformation Transformation
function TransformationManager:apply(transformation)
    transformation = transformation:get_love_transformation()
    local new_transformation
    if #transformation_stack == 0 then
        new_transformation = transformation
    else
        new_transformation = transformation_stack[#transformation_stack]:clone():apply(transformation)
    end
    table.insert(transformation_stack, new_transformation)
    love.graphics.replaceTransform(new_transformation)
end

---reverts the last transformation
function TransformationManager:revert()
    table.remove(transformation_stack)
    if #transformation_stack > 0 then
        love.graphics.replaceTransform(transformation_stack[#transformation_stack])
    else
        love.graphics.origin()
    end
end

return TransformationManager