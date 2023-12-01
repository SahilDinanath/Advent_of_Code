local file = io.lines("input.txt")
local number = 0
local max_number = -1
--checks to see if file exists
if file == nil then
	print("file not found")
	return
end

for line in file do
	if line ~= "" then
		number = number + tonumber(line)
	else
		if number > max_number then
			max_number = number
		end
		number = 0
	end
end
print(max_number)
