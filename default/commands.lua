minetest.register_chatcommand("hotbar", {
	params = "[size]",
	description = "Sets the size of your hotbar",
	func = function(name, slots)
		if slots == "" then slots = 16 end
		if type(tonumber(slots)) ~= "number" or tonumber(slots) < 1 or tonumber(slots) > 23 then
			minetest.chat_send_player(name, "[_] Hotbar size must be between 1 and 23.")
			return
		end
		local player = minetest.get_player_by_name(name)
		player:hud_set_hotbar_itemcount(tonumber(slots))
		minetest.chat_send_player(name, "[_] Hotbar size set to " .. tonumber(slots) .. ".")
	end,
})

