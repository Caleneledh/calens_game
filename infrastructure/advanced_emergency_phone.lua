-- Emergency phone (only if enabled)
	if ENABLE_EMERGENCY_PHONE then
		minetest.register_node("infrastructure:emergency_phone_top", {
			description = "Emergency phone",
			tile_images = {
				"infrastructure_emergency_phone_top.png",
				"infrastructure_emergency_phone_bottom.png",
				"infrastructure_emergency_phone_side.png",
				"infrastructure_emergency_phone_side.png",
				"infrastructure_emergency_phone_side.png",
				"infrastructure_emergency_phone_front.png"
			},
			drawtype = "nodebox",
			drop = "streets:emergencyphone",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky=1,not_in_creative_inventory=1},
			light_source = EMERGENCY_PHONE_LIGHT_RANGE,
			node_box = {
				type = "fixed",
				fixed = {
					{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
					{-0.25, -0.5, -0.3125, -0.1875, 0.5, -0.25},
					{0.1875, -0.5, -0.3125, 0.25, 0.5, -0.25},
					{-0.1875, 0.4375, -0.3125, 0.1875, 0.5, -0.25}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {
					{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
					{-0.25, -0.5, -0.3125, -0.1875, 0.5, -0.25},
					{0.1875, -0.5, -0.3125, 0.25, 0.5, -0.25},
					{-0.1875, 0.4375, -0.3125, 0.1875, 0.5, -0.25},
				}
			},

			after_place_node = function(pos)
				local node = minetest.env:get_node(pos)
				local param2 = node.param2
					node.name = "infrastructure:emergency_phone_bottom"
					minetest.env:add_node(pos, node)
					node.name = "infrastructure:emergency_phone_top"
					pos.y = pos.y+1
					minetest.env:add_node(pos, node)
			end,

			after_dig_node = function(pos)
				local node = minetest.env:get_node(pos)
				local param2 = node.param2
					node.name = "infrastructure:emergency_phone_bottom"
					pos.y = pos.y-1
					minetest.env:remove_node(pos)
			end,

			on_punch = function(pos, node, puncher)
				if dial_handler ~= nil then
					minetest.sound_stop(dial_handler)
					dial_handler = nil
				end
				dial_handler = minetest.sound_play("infrastructure_emergency_phone", {
					pos = pos,
					gain = EMERGENCY_PHONE_VOLUME,
					max_hear_distance = 50
				})
				if (puncher:is_player() and puncher:get_hp() < HEALTH_TO_RESTORING and puncher:get_hp() <= HEALTH_TO_TRIGGER) then
					puncher:set_hp(HEALTH_TO_RESTORING)
					minetest.chat_send_player(puncher:get_player_name(), "You got healed!")
					minetest.chat_send_all("Server: -!- "..puncher:get_player_name().." used an emergency phone at "..pos.x..","..pos.y..","..pos.z);
				end
			end
		})

		minetest.register_node("infrastructure:emergency_phone_bottom", {
			tile_images = {"infrastructure_emergency_phone_bottom.png"},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {not_in_creative_inventory=1},
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}
			},

			after_dig_node = function(pos)
				local node = minetest.env:get_node(pos)
				local param2 = node.param2
					node.name = "infrastructure:emergency_phone_top"
					pos.y = pos.y+1
					minetest.env:remove_node(pos)
			end,
		})

		minetest.register_alias("infrastructure:emergency_phone", "infrastructure:emergency_phone_top")

		minetest.register_abm({
			nodenames = {"streets:emergencyphone"},
			interval = 1,
			chance = 1,
			action = function(pos, node, active_object_count, active_object_count_wider)
				local node = minetest.env:get_node(pos)
				local param2 = node.param2
					node.name = "infrastructure:emergency_phone_bottom"
					minetest.env:add_node(pos, node)
					node.name = "infrastructure:emergency_phone_top"
					pos.y = pos.y+1
					minetest.env:add_node(pos, node)
			end,
		})
	else
		print("Infrastructure mod: -!- Emergency-Phone is disabled!")
	end
