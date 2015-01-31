-- Aircraft warning light
	minetest.register_abm( {
		nodenames = {"infrastructure:aircraft_warning_light_bright", "infrastructure:aircraft_warning_light_dark"},
		interval = 2,
		chance = 1,
		action = function(pos, node)
			local node = minetest.env:get_node(pos)
			if node.name == "infrastructure:aircraft_warning_light_bright" then
				minetest.swap_node(pos, {name = "infrastructure:aircraft_warning_light_dark", param2 = node.param2})
			elseif node.name == "infrastructure:aircraft_warning_light_dark" then
				minetest.swap_node(pos, {name = "infrastructure:aircraft_warning_light_bright", param2 = node.param2})
			end
		end
	})

	minetest.register_node("infrastructure:aircraft_warning_light_bright", {
		description = "Aircraft warning light",
		tile_images = {
			"infrastructure_aircraft_warning_light_top_bright.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_aircraft_warning_light_side_bright.png",
			"infrastructure_aircraft_warning_light_side_bright.png",
			"infrastructure_aircraft_warning_light_side_bright.png",
			"infrastructure_aircraft_warning_light_side_bright.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		groups = {cracky = 1},
		light_source = AIRCRAFT_WARNING_LIGHT_LIGHT_RANGE,
		node_box = {
			type = "fixed",
				fixed = {
					{-1/128, 1/4, -1/128, 1/128, 3/8, 1/128},

					{-1/4, -1/8, 0, 1/4, 1/4, 0},
					{0, -1/8, -1/4, 0, 1/4, 1/4},

					{-1/16, -1/8, -1/16, 1/16, 1/16, 1/16},

					{-1/4, -1/4, -1/8, 1/4, -1/8, 1/8},
					{-1/8, -1/4, -1/4, 1/8, -1/8, 1/4},

					{-1/8, -3/8, -1/8, 1/8, -1/4, 1/8},

					{-3/16, -1/2, -3/16, 3/16, -3/8, 3/16}
				}
		},
		selection_box = {
			type = "fixed",
				fixed = {
					{-1/128, 1/4, -1/128, 1/128, 3/8, 1/128},

					{-1/4, -1/8, 0, 1/4, 1/4, 0},
					{0, -1/8, -1/4, 0, 1/4, 1/4},

					{-1/16, -1/8, -1/16, 1/16, 1/16, 1/16},

					{-1/4, -1/4, -1/8, 1/4, -1/8, 1/8},
					{-1/8, -1/4, -1/4, 1/8, -1/8, 1/4},

					{-1/8, -3/8, -1/8, 1/8, -1/4, 1/8},

					{-3/16, -1/2, -3/16, 3/16, -3/8, 3/16}
				}
		}
	})

	minetest.register_node("infrastructure:aircraft_warning_light_dark", {
		tile_images = {
			"infrastructure_aircraft_warning_light_top_dark.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_aircraft_warning_light_side_dark.png",
			"infrastructure_aircraft_warning_light_side_dark.png",
			"infrastructure_aircraft_warning_light_side_dark.png",
			"infrastructure_aircraft_warning_light_side_dark.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		groups = {cracky = 1, not_in_creative_inventory = 1},
		drop = "infrastructure:aircraft_warning_light_bright",
		node_box = {
			type = "fixed",
				fixed = {
					{-1/128, 1/4, -1/128, 1/128, 3/8, 1/128},

					{-1/4, -1/8, 0, 1/4, 1/4, 0},
					{0, -1/8, -1/4, 0, 1/4, 1/4},

					{-1/16, -1/8, -1/16, 1/16, 1/16, 1/16},

					{-1/4, -1/4, -1/8, 1/4, -1/8, 1/8},
					{-1/8, -1/4, -1/4, 1/8, -1/8, 1/4},

					{-1/8, -3/8, -1/8, 1/8, -1/4, 1/8},

					{-3/16, -1/2, -3/16, 3/16, -3/8, 3/16}
				}
		},
		selection_box = {
			type = "fixed",
				fixed = {
					{-1/128, 1/4, -1/128, 1/128, 3/8, 1/128},

					{-1/4, -1/8, 0, 1/4, 1/4, 0},
					{0, -1/8, -1/4, 0, 1/4, 1/4},

					{-1/16, -1/8, -1/16, 1/16, 1/16, 1/16},

					{-1/4, -1/4, -1/8, 1/4, -1/8, 1/8},
					{-1/8, -1/4, -1/4, 1/8, -1/8, 1/4},

					{-1/8, -3/8, -1/8, 1/8, -1/4, 1/8},

					{-3/16, -1/2, -3/16, 3/16, -3/8, 3/16}
				}
		}
	})

	minetest.register_alias("infrastructure:aircraft_warning_light", "infrastructure:aircraft_warning_light_bright")
