
function table.keys(t)
    local keys = {}
    for k, v in pairs(t) do
        keys[#keys + 1] = k
    end

    return keys
end

function table.containsValue(t, value)
    for _, v in ipairs(t) do
        if v == value then
            return true
        end
    end

    return false
end

function table.compare(this, other)
    local thiskeys = table.keys(this)
    local otherKeys = table.keys(other)

    for k in ipairs(thiskeys) do
        if otherKeys[k] == nil then
            return false
        end
        if other[k] ~= this[k] then
            return false
        end
    end

    return true
end

function table.icompare(this, other)
    if #this ~= #other then
        return false
    end

    for i, v in ipairs(this) do
        if v ~= other[i] then
            return false
        end
    end

    return true
end

function table.merge(this, other)
    local result = {}
    for _, v in ipairs(this) do
        result[#result+1] = v
    end
    for _, v in ipairs(other) do
        result[#result+1] = v
    end

    return result
end

function table.functions(this, filter)
    local result = {}
    for k, v in pairs(this) do
        if type(v) == "function" then
            if filter then
                if k:find(filter) then
                    result[#result+1] = v
                end
            else
                result[#result+1] = v
            end
        end
    end

    return result
end

-- Return the first index with the given value (or nil if not found).
function table.indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end