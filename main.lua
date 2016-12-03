

actions = {
	look = function (room)
		print("You are in a room.")
		print(room)
	end,

	sleep = function ()
		print("You are in a room.")
	end,

}

f = io.open("map.fun", "r")
t = f:read("*all")
f:close()
print(t)

function dostuff(a, b, c, d, e, f, g)
	local x, y = 20, 45

	return x, y
end
