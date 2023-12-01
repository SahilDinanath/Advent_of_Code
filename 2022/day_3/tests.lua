local lua_unit = require('luaunit')
local rucksack = require('rucksack_reorganization')

function test_split_input()
    local first_half, second_half = rucksack.split_list("abcdef")
    lua_unit.assertEquals(first_half, "abc")
    lua_unit.assertEquals(second_half, "def")
end

function test_find_common_element()
    local common_letter_1 = rucksack.find_common_elements_in_sets("abc", "dea")
    local common_letter_2 = rucksack.find_common_elements_in_sets("abc", "dea", "zxa")
    lua_unit.assertEquals(common_letter_1, "a")
    lua_unit.assertEquals(common_letter_2, "a")
end

function test_get_priority_of_element(element)
    local priority_lower_case, priority_upper_case =
        rucksack.get_priority_of_element("a"),
        rucksack.get_priority_of_element("A")
    lua_unit.assertEquals(priority_lower_case, 1)
    lua_unit.assertEquals(priority_upper_case, 27)
end

function test_get_sum_of_priorites()
    local test_list = { "a", "b", "C", "D" }
    local sum = rucksack.get_sum_of_priorities(test_list)
    lua_unit.assertEquals(sum, 1 + 2 + 29 + 30)
end

os.exit(lua_unit.LuaUnit.run())
