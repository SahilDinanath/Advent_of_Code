--split input into two halves x
--get common element x
--get priority of common element x
--sum all the priorities x
local M = {}
function M.split_list(list)
    local length_of_input = #list
    local first_half = string.sub(list, 1, length_of_input / 2)
    local second_half = string.sub(list, length_of_input / 2 + 1, length_of_input)
    return first_half, second_half
end

function M.find_common_elements_in_sets(...)
    local args = { ... }
    local starting_list = args[1]
    for i = 1, #starting_list, 1 do
        local current_word = string.sub(starting_list, i, i)
        local counter = 1

        for j, list in pairs(args) do
            if (string.match(list, current_word) and j ~= 1) then
                counter = counter + 1
            end
        end

        if (counter == #args) then
            print(current_word)
            return current_word
        end
    end
end

--numbers are valued a - z, 1-26 and A-Z, 27-52
function M.get_priority_of_element(element)
    local ascii_value = string.byte(element)
    if (ascii_value > 90) then
        return ascii_value - 96
    end
    return ascii_value - 38
end

function M.get_sum_of_priorities(list_of_elements)
    local sum = 0
    for _, x in pairs(list_of_elements) do
        sum = sum + M.get_priority_of_element(x)
    end
    return sum
end

local function find_sum_of_priority_elements_in_file(file)
    local common_element_list = {}

    for line in file do
        local list_1, list_2 = M.split_list(line)
        local common_element = M.find_common_elements_in_sets(list_1, list_2)
        table.insert(common_element_list, common_element)
    end

    print(M.get_sum_of_priorities(common_element_list))
end

local file = io.lines("input.txt")

local function identify_sum_of_elves_groups_from_file(file)
    local common_element_list = {}

    local counter = 0
    for line in file do
        if (counter % 3 == 0) then
            file.
        end
    end
end

return M
