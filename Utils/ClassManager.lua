---creates a class
---the parents variables and funcitons are copied in a shallow copy
---in case of conflicts the leftmost carries
---@param variables table
---@param ... table the parents
---@return table
function CreateClass(variables, ...)
    for _, parent in ipairs({...}) do
        for k, v in pairs(parent) do
            if not variables[k] then
                variables[k] = v
            end
        end
    end
    variables.__index = variables
    return variables
end