

actions = {
	look = function (room)
		print("You are in a room.")
	end,

	sleep = function ()
		print("You are in a room.")
	end,

}


function dostuff(a, b, c, d, e, f, g)
	local x, y = 20, 45

	return x, y
end

input = "sleep"

actions.new_thing = 453

print(#actions)

actions[input]