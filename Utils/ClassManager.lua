---creates a class
---the parents variables and funcitons are copied in a shallow copy
---the parents are copied from left to right
---@param variables table
---@param ... table the parents
---@return table
function CreateClass(variables, ...)
    for _, parent in ipairs({...}) do
        for k, v in pairs(parent) do
            variables[k] = v
        end
    end
    variables.__index = variables
    return variables
end