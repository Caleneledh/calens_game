-- Automatic warning device
local sound_handles = {}
local function play_bell(pos)
	local pos_hash = minetest.hash_node_position(pos)
	sound_handles[pos_hash] = minetest.sound_play("infrastructure_ebell",
			{pos = pos, gain = AUTOMATIC_WARNING_DEVICE_VOLUME, loop = true, max_hear_distance = 30,})

end

local function stop_bell(pos, node)
	local pos_hash = minetest.hash_node_position(pos)
	local sound_handle = sound_handles[pos_hash]
	if sound_handle then
		minetest.sound_stop(sound_handle)
		sound_handles[pos_hash] = nil
	end
end
	function left_light_direction(pos, param2)
		if param2 == 0 then
			pos.x = pos.x - 1
		elseif param2 == 1 then
			pos.z = pos.z + 1
		elseif param2 == 2 then
			pos.x = pos.x + 1
		elseif param2 == 3 then
			pos.z = pos.z - 1
		end
	end

	function right_light_direction(pos, param2)
		if param2 == 0 then
			pos.x = pos.x + 2
		elseif param2 == 1 then
			pos.z = pos.z - 2
		elseif param2 == 2 then
			pos.x = pos.x - 2
		elseif param2 == 3 then
			pos.z = pos.z + 2
		end
	end

	function lights_enabled(pos, node)
		local node = minetest.env:get_node(pos)
		local param2 = node.param2
		if (node.name == "infrastructure:automatic_warning_device_middle_center_3") then
			minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_center_2", param2 = node.param2})
			left_light_direction(pos, param2)
			minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_left_2", param2 = node.param2})
			right_light_direction(pos, param2)
			minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_right_1", param2 = node.param2})
		elseif node.name == "infrastructure:automatic_warning_device_middle_center_2" then
			minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_center_3", param2 = node.param2})
			left_light_direction(pos, param2)
			minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_left_1", param2 = node.param2})
			right_light_direction(pos, param2)
			minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_right_2", param2 = node.param2})
		end
	end

	function lights_disabled(pos, node)
		local node = minetest.env:get_node(pos)
		local param2 = node.param2
		minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_center_1", param2 = node.param2})
		left_light_direction(pos, param2)
		minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_left_1", param2 = node.param2})
		right_light_direction(pos, param2)
		minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_right_1", param2 = node.param2})
	end

	function activate_lights(pos, node)
		pos.y = pos.y + 2
		local node = minetest.env:get_node(pos)
		if node.name == "infrastructure:automatic_warning_device_middle_center_1" then
			play_bell(pos)
			minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_center_2", param2 = node.param2})
		elseif (node.name == "infrastructure:automatic_warning_device_middle_center_2" or node.name == "infrastructure:automatic_warning_device_middle_center_3") then
			stop_bell(pos,node)
			lights_disabled(pos, node)
		end
	end

	minetest.register_abm( {
		nodenames = {"infrastructure:automatic_warning_device_middle_center_2", "infrastructure:automatic_warning_device_middle_center_3"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
				lights_enabled(pos,node)
			end
	})

		minetest.register_node("infrastructure:automatic_warning_device_top", {
			tile_images = {
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_automatic_warning_device_top_side.png",
				"infrastructure_automatic_warning_device_top_side.png",
				"infrastructure_automatic_warning_device_top_side.png",
				"infrastructure_automatic_warning_device_top.png"
			},
			on_destruct = stop_bell,
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky = 3, not_in_creative_inventory = 1},
			node_box = {
				type = "fixed",
				fixed = {
					{-1/16, -1/2, -1/16, 1/16, 0, 1/16},
					{-1/8, 0, -1/8, 1/8, 3/8, 1/8},
					{-1/4, 1/8, -1/4, 1/4, 1/4, 1/4},
					{-1/2, -1/2, -1/16, 1/2, 0, -1/16},
					{-1/8, -1/2, -1/16, 1/8, -1/4, 1/8}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {0, 0, 0, 0, 0, 0}
			}
		})

	for i = 1, 2 do
		local groups = {}
		groups = {cracky = 3, not_in_creative_inventory = 1}

		if (i == 1) then
			LIGHT_SOURCE = 0
		else
			LIGHT_SOURCE = AUTOMATIC_WARNING_DEVICE_LIGHT_RANGE
		end

		minetest.register_node("infrastructure:automatic_warning_device_middle_right_"..tostring(i), {
			tile_images = {
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_automatic_warning_device_middle_right_side.png",
				"infrastructure_automatic_warning_device_middle_right_"..tostring(i)..".png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			light_source = LIGHT_SOURCE,
			node_box = {
				type = "fixed",
				fixed = {
					{-1/2, -1/2, -1/16, -1/4, 1/2, -1/16},
					{-1/2, -5/16, -1/16, -7/16, 1/16, 3/16},
					{-1/2, 1/32, -5/16, -15/32, 3/32, -1/16},
					{-15/32, -1/8, -3/16, -13/32, 1/32, -1/16}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {0, 0, 0, 0, 0, 0}
			}
		})

		minetest.register_node("infrastructure:automatic_warning_device_middle_left_"..tostring(i), {
			tile_images = {
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_automatic_warning_device_middle_left_side.png",
				"infrastructure_automatic_warning_device_middle_left_"..tostring(i)..".png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			light_source = LIGHT_SOURCE,
			node_box = {
				type = "fixed",
				fixed = {
					{1/4, -1/2, -1/16, 1/2, 1/2, -1/16},
					{7/16, -5/16, -1/16, 1/2, 1/16, 3/16},
					{15/32, 1/32, -5/16, 1/2, 3/32, -1/16},
					{13/32, -1/8, -3/16, 15/32, 1/32, -1/16}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {0, 0, 0, 0, 0, 0}
			}
		})
	end

	for i = 1, 3 do
		local groups = {}
		groups = {cracky = 3, not_in_creative_inventory = 1}

		if (i == 1) then
			LIGHT_SOURCE = 0
		else
			LIGHT_SOURCE = AUTOMATIC_WARNING_DEVICE_LIGHT_RANGE
		end

		minetest.register_node("infrastructure:automatic_warning_device_middle_center_"..tostring(i), {
			tile_images = {
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_automatic_warning_device_middle_center_side.png",
				"infrastructure_automatic_warning_device_middle_center_side.png",
				"infrastructure_automatic_warning_device_middle_center_side.png",
				"infrastructure_automatic_warning_device_middle_center_"..tostring(i)..".png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			light_source = LIGHT_SOURCE,
			node_box = {
				type = "fixed",
				fixed = {
					{-1/16, -1/2, -1/16, 1/16, 1/2, 1/16},
					{-1/2, -1/2, -1/16, 1/2, 1/2, -1/16},
					{-1/2, -5/16, -1/16, -3/16, 1/16, 3/16},
					{3/16, -5/16, -1/16, 1/2, 1/16, 3/16},
					{-3/16, -3/16, -1/16, 3/16, -1/16, 1/8},
					{-1/2, 1/32, -5/16, -7/32, 3/32, -1/16},
					{-7/32, -1/8, -3/16, -5/32, 1/32, -1/16},
					{7/32, 1/32, -5/16, 1/2, 3/32, -1/16},
					{5/32, -1/8, -3/16, 7/32, 1/32, -1/16}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {0, 0, 0, 0, 0, 0}
			}
		})
	end

		minetest.register_node("infrastructure:automatic_warning_device_middle", {
			tile_images = {
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_automatic_warning_device_middle_side.png",
				"infrastructure_automatic_warning_device_middle_side.png",
				"infrastructure_automatic_warning_device_middle_side.png",
				"infrastructure_automatic_warning_device_middle.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky = 3, not_in_creative_inventory = 1},
			node_box = {
				type = "fixed",
				fixed = {
					{-1/16, -1/2, -1/16, 1/16, 1/2, 1/16},
					{-3/8, -3/8, -1/8, 3/8, 3/8, -1/16},
					{-1/8, -1/8, -1/16, 1/8, 1/8, 1/8}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {0, 0, 0, 0, 0, 0}
			}
		})

		minetest.register_node("infrastructure:automatic_warning_device_bottom", {
			description = "Automatic warning device",
			inventory_image = "infrastructure_automatic_warning_device.png",
			wield_image = "infrastructure_automatic_warning_device.png",
			tile_images = {
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_automatic_warning_device_bottom.png",
				"infrastructure_automatic_warning_device_bottom.png",
				"infrastructure_automatic_warning_device_bottom.png",
				"infrastructure_automatic_warning_device_bottom.png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky = 3},
			node_box = {
				type = "fixed",
				fixed = {
					{-1/16, 0, -1/16, 1/16, 1/2, 1/16},
					{-1/2, -1/2, -1/4, 1/2, -3/8, 1/4},
					{-1/4, -1/2, -1/2, 1/4, -3/8, 1/2},
					{-1/8, -3/8, -1/8, 1/8, 0, 1/8}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {
				-- top
					{-1/8, 0 + 3, -1/8, 1/8, 3/8 + 3, 1/8},
					{-1/4, 1/8 + 3, -1/4, 1/4, 1/4 + 3, 1/4},
					{-1/8, -1/2 + 3, -1/16 + 0.01, 1/8, -1/4 + 3, 1/8},
				-- middle center, left and right
					{-9/16, -5/16 + 2, -1/16, -3/16, 1/16 + 2, 3/16},
					{3/16, -5/16 + 2, -1/16, 9/16, 1/16 + 2, 3/16},

					{-3/16, -3/16 + 2, -1/16 + 0.01, 3/16, -1/16 + 2, 1/8},

					{-1/2, 1/32 + 2, -5/16, -7/32, 3/32 + 2, -1/16 - 0.01},
					{-7/32, -1/8 + 2, -3/16, -5/32, 1/32 + 2, -1/16 - 0.01},
					{13/32 - 1, -1/8 + 2, -3/16, 15/32 - 1, 1/32 + 2, -1/16 - 0.01},

					{7/32, 1/32 + 2, -5/16, 1/2, 3/32 + 2, -1/16 - 0.01},
					{5/32, -1/8 + 2, -3/16, 7/32, 1/32 + 2, -1/16 - 0.01},
					{-15/32 + 1, -1/8 + 2, -3/16, -13/32 + 1, 1/32 + 2, -1/16 - 0.01},
				-- middle
					{-3/8, -3/8 + 1, -1/8, 3/8, 3/8 + 1, -1/16},
					{-1/8, -1/8 + 1, -1/16, 1/8, 1/8 + 1, 1/8},
				-- bottom
					{-1/2, -1/2, -1/4, 1/2, -3/8, 1/4},
					{-1/4, -1/2, -1/2, 1/4, -3/8, 1/2},
					{-1/8, -3/8, -1/8, 1/8, 0, 1/8},
				-- post
					{-1/16, 0, -1/16, 1/16, 3, 1/16}
				}
			},

			on_construct = function(pos)
				local node = minetest.env:get_node(pos)
				local param2 = node.param2

				local meta = minetest.get_meta(pos)
				meta:set_string("formspec", "field[channel;Channel;${channel}]")

				pos.y = pos.y + 1
				node.name = "infrastructure:automatic_warning_device_middle"
				minetest.env:add_node(pos, node)

				pos.y = pos.y + 2
				node.name = "infrastructure:automatic_warning_device_top"
				minetest.env:add_node(pos, node)

				pos.y = pos.y - 1
				node.name = "infrastructure:automatic_warning_device_middle_center_1"
				minetest.env:add_node(pos, node)

				left_light_direction(pos, param2)
				node.name = "infrastructure:automatic_warning_device_middle_left_1"
				minetest.env:add_node(pos, node)

				right_light_direction(pos, param2)
				node.name = "infrastructure:automatic_warning_device_middle_right_1"
				minetest.env:add_node(pos, node)
			end,

			on_destruct = function(pos)
				local node = minetest.env:get_node(pos)
				local param2 = node.param2
				pos.y=pos.y+2
				stop_bell(pos, node)
				pos.y=pos.y-2

				for i = 1, 3 do
					pos.y = pos.y + 1
					minetest.env:remove_node(pos)
				end

				pos.y = pos.y - 1

				left_light_direction(pos, param2)
				minetest.env:remove_node(pos)

				right_light_direction(pos, param2)
				minetest.env:remove_node(pos)
			end,

			on_punch = function(pos, node)
				activate_lights(pos, node)
			end,

			on_receive_fields = function(pos, formname, fields, sender)
				if (fields.channel) then
					minetest.get_meta(pos):set_string("channel", fields.channel)
					minetest.get_meta(pos):set_string("state", "Off")
				end
			end,

			digiline = {
				receptor = {},
				effector = {
					action = function(pos, node, channel, msg)
						local setchan = minetest.get_meta(pos):get_string("channel")
						if setchan ~= channel then
							return
						end
						if (msg=="bell_on") then
							play_bell(pos)
						elseif (msg=="bell_off") then
							stop_bell(pos,node)
						elseif (msg=="lights_on") then
							pos.y = pos.y + 2
							local node = minetest.env:get_node(pos)
							if node.name == "infrastructure:automatic_warning_device_middle_center_1" then
								minetest.swap_node(pos, {name = "infrastructure:automatic_warning_device_middle_center_2", param2 = node.param2})
							end
						elseif (msg=="lights_off") then	
							pos.y = pos.y + 2
							local node = minetest.env:get_node(pos)
							if (node.name == "infrastructure:automatic_warning_device_middle_center_2" or node.name == "infrastructure:automatic_warning_device_middle_center_3") then
								lights_disabled(pos, node)
							end
						end
					end
				}
			}
		})




	minetest.register_alias("infrastructure:automatic_warning_device", "infrastructure:automatic_warning_device_bottom")
	minetest.register_alias("awd", "infrastructure:automatic_warning_device_bottom")
