local file = io.lines("input.txt")

if file == nil then
	return 0
end

local function get_shape_value(shape)
	local score = 0
	if (shape == 'A' or shape == 'X') then
		score = 1
	elseif (shape == 'B' or shape == 'Y') then
		score = 2
	else
		score = 3
	end
	return score
end

--lowest to highest
local function get_player_win_score(player, opponent)
	player = get_shape_value(player)
	opponent = get_shape_value(opponent)

	--tie
	if (player == opponent) then
		return 3
	end

	--win
	if (player == 1 and opponent == 3) then
		return 6
	elseif (player == 2 and opponent == 1) then
		return 6
	elseif (player == 3 and opponent == 2) then
		return 6
	end
	--loss
	return 0
end

local player_score = 0

for line in file do
	local opponent, player = string.match(line, "(%a)%s(%a)")
	player_score = player_score + get_shape_value(player)
	player_score = player_score + get_player_win_score(player, opponent)
end

print(player_score)
