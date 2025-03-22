require("NodeLove.Utils.ClassManager")

---@class Group
---@field package next Group|GroupItem
---@field package prev Group|GroupItem
---@field package item_count number
local Group = CreateClass({
    item_count = 0
})

---@class GroupItem
---@field package next Group|GroupItem
---@field package prev Group|GroupItem
---@field package priority number
---@field package element any
---@field package dead true|nil
---@field package group Group
local GroupItem = CreateClass({
    dead = false
})

-- ---------------------- --
-- PUBLIC Group FUNCTIONS --
-- ---------------------- --

---creates a new group
---@return Group
function Group:new()
    local new = setmetatable({}, Group)
    new.next = new
    new.prev = new
    return new
end

---returns the number of elements in the group
---@return number
function Group:size()
    return self.item_count
end

---adds an element to the group
---@param element any: the element that is added to the group
---@param priority number: the priority of the element
---@return GroupItem: the reference to the item, updating of the priority and removal
function Group:add(element, priority)
    local reference = setmetatable({
        element = element,
        priority = priority,
        group = self
    }, GroupItem)
    self.item_count = self.item_count + 1
    self:insert_right(reference, self)
    return reference
end

---executes a callback for all elements in ascending order of priority
---@param func fun(element:any, priority:number, item:GroupItem) the callback
---@param use_copy boolean|nil when true uses a copy
function Group:for_all_asc(func, use_copy)
    local item = self.prev
    if not use_copy then
        while item ~= self do
            ---@cast item GroupItem
            func(item.element, item.priority, item)
            item = item.prev
        end
    else
        local items = {}
        while item ~= self do
            ---@cast item GroupItem
            table.insert(items, item)
            item = item.prev
        end
        local last_id = self:size()
        local id = 1
        while id <= last_id do
            item = items[id]
            func(item.element, item.priority, item)
            id = id + 1
        end
    end
end

---executes a callback for all elements in descending order of priority
---@param func fun(element:any, priority:number, item:GroupItem) the callback
---@param use_copy boolean|nil when true uses a copy
function Group:for_all_desc(func, use_copy)
    local item = self.next
    if not use_copy then
        while item ~= self do
            ---@cast item GroupItem
            func(item.element, item.priority, item)
            item = item.next
        end
    else
        local items = {}
        while item ~= self do
            ---@cast item GroupItem
            table.insert(items, item)
            item = item.next
        end
        local last_id = self:size()
        local id = 1
        while id <= last_id do
            item = items[id]
            func(item.element, item.priority, item)
            id = id + 1
        end
    end
end

---returns a random item
---@return any element, number priority, GroupItem item
function Group:get_random()
    local position = love.math.random(self.item_count)
    ---@type Group|GroupItem
    local item = self
    while position > 0 do
        position = position - 1
        item = item.next
    end
    ---@cast item GroupItem
    return item.element, item.priority, item
end

-- -------------------------- --
-- PUBLIC GroupItem FUNCTIONS --
-- -------------------------- --

---removes the item from it's group
function GroupItem:remove()
    if self.dead then
        return
    end
    self.dead = true
    self.next.prev = self.prev
    self.prev.next = self.next
    self.group.item_count = self.group.item_count - 1
end

---gets the priority of the item
---@return number
function GroupItem:get_priority()
    return self.priority
end

---updates the item priority
---@param priority number the new priority
function GroupItem:update_priority(priority)
    self.priority = priority
    if self.next.priority and self.next.priority > priority then
        self.next.prev = self.prev
        self.prev.next = self.next
        self.group:insert_right(self, self.next)
    elseif self.prev.priority and self.prev.priority < priority then
        self.next.prev = self.prev
        self.prev.next = self.next
        self.group:insert_left(self, self.prev)
    end
end

-- ---------------- --
-- HIDDEN FUNCTIONS --
-- ---------------- --

---@package
---inserts an item somewhere to the right of an item
---@param reference GroupItem the item that is inserted
---@param from Group|GroupItem the start of the search
function Group:insert_right(reference, from)
    while from.next.priority and from.next.priority > reference.priority do
       from = from.next 
    end
    reference.prev = from
    reference.next = from.next
    from.next.prev = reference
    from.next = reference
end

---@package
---inserts an item somewhere to the left of an item
---@param reference GroupItem the item that is inserted
---@param from Group|GroupItem the start of the search
function Group:insert_left(reference, from)
    while from.prev.priority and from.prev.priority < reference.priority do
       from = from.prev 
    end
    reference.next = from
    reference.prev = from.prev
    from.prev.next = reference
    from.prev = reference
end

return Group