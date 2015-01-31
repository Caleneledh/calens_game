-- Crosswalk warning light
	minetest.register_abm( {
		nodenames = {"infrastructure:crosswalk_warning_light_bright", "infrastructure:crosswalk_warning_light_dark"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			local node = minetest.env:get_node(pos)
			if node.name == "infrastructure:crosswalk_warning_light_bright" then
				minetest.swap_node(pos, {name = "infrastructure:crosswalk_warning_light_dark", param2 = node.param2})
			elseif node.name == "infrastructure:crosswalk_warning_light_dark" then
				minetest.swap_node(pos, {name = "infrastructure:crosswalk_warning_light_bright", param2 = node.param2})
			end
		end
	})

	function on_off_light(pos, node)
		local node = minetest.env:get_node(pos)
		if node.name == "infrastructure:crosswalk_warning_light_off" then
			minetest.swap_node(pos, {name = "infrastructure:crosswalk_warning_light_bright", param2 = node.param2})
		elseif (node.name == "infrastructure:crosswalk_warning_light_dark" or node.name == "infrastructure:crosswalk_warning_light_bright") then
			minetest.swap_node(pos, {name = "infrastructure:crosswalk_warning_light_off", param2 = node.param2})
		end
	end

	minetest.register_node("infrastructure:crosswalk_warning_light_off", {
		description = "Crosswalk warning light",
		inventory_image = "infrastructure_crosswalk_warning_light_front_bright.png",
		wield_image = "infrastructure_crosswalk_warning_light_front_bright.png",
		tile_images = {
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_crosswalk_warning_light_back.png",
			"infrastructure_crosswalk_warning_light_front_dark.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 3, not_in_creative_inventory = 0},
		node_box = {
			type = "fixed",
			fixed = {
				{-5/16, -5/16, -1/8, 5/16, 3/8, 1/8},
				{-1/2, -1/2, -1/8, 1/2, 1/2, -1/8},

				{-5/16, 1/4, -5/16, 5/16, 5/16, -1/8},
				{-5/16, 0, -1/4, -1/4, 1/4, -1/8},
				{1/4, 0, -1/4, 5/16, 1/4, -1/8},

				{-1/16, -1/4, 1/8, 1/16, 1/4, 3/8},
				{-1/4, -1/16, 1/8, 1/4, 1/16, 3/8},
				{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.001}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-5/16, -5/16, -1/8, 5/16, 3/8, 1/8},

				{-5/16, 1/4, -5/16, 5/16, 5/16, -1/8},
				{-5/16, 0, -1/4, -1/4, 1/4, -1/8},
				{1/4, 0, -1/4, 5/16, 1/4, -1/8},

				{-1/16, -1/4, 1/8, 1/16, 1/4, 3/8},
				{-1/4, -1/16, 1/8, 1/4, 1/16, 3/8},
				{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.01}
			}
		},

		on_punch = function(pos, node)
			on_off_light(pos, node)
		end,

		mesecons = {effector = {
			action_on = function(pos, node)
				on_off_light(pos, node)
			end,
		}}
	})

	minetest.register_node("infrastructure:crosswalk_warning_light_dark", {
		tile_images = {
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_crosswalk_warning_light_back.png",
			"infrastructure_crosswalk_warning_light_front_dark.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 3, not_in_creative_inventory = 1},
		drop = "infrastructure:crosswalk_warning_light_off",
		node_box = {
			type = "fixed",
			fixed = {
				{-5/16, -5/16, -1/8, 5/16, 3/8, 1/8},
				{-1/2, -1/2, -1/8, 1/2, 1/2, -1/8},

				{-5/16, 1/4, -5/16, 5/16, 5/16, -1/8},
				{-5/16, 0, -1/4, -1/4, 1/4, -1/8},
				{1/4, 0, -1/4, 5/16, 1/4, -1/8},

				{-1/16, -1/4, 1/8, 1/16, 1/4, 3/8},
				{-1/4, -1/16, 1/8, 1/4, 1/16, 3/8},
				{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.001}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-5/16, -5/16, -1/8, 5/16, 3/8, 1/8},

				{-5/16, 1/4, -5/16, 5/16, 5/16, -1/8},
				{-5/16, 0, -1/4, -1/4, 1/4, -1/8},
				{1/4, 0, -1/4, 5/16, 1/4, -1/8},

				{-1/16, -1/4, 1/8, 1/16, 1/4, 3/8},
				{-1/4, -1/16, 1/8, 1/4, 1/16, 3/8},
				{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.01}
			}
		},

		on_punch = function(pos, node)
			on_off_light(pos, node)
		end,

		mesecons = {effector = {
			action_on = function(pos, node)
				on_off_light(pos, node)
			end,
		}}
	})

	minetest.register_node("infrastructure:crosswalk_warning_light_bright", {
		tile_images = {
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_crosswalk_warning_light_back.png",
			"infrastructure_crosswalk_warning_light_front_bright.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 3, not_in_creative_inventory = 1},
		light_source = TRAFFIC_LIGHTS_LIGHT_RANGE,
		drop = "infrastructure:crosswalk_warning_light_off",
		node_box = {
			type = "fixed",
			fixed = {
				{-5/16, -5/16, -1/8, 5/16, 3/8, 1/8},
				{-1/2, -1/2, -1/8, 1/2, 1/2, -1/8},

				{-5/16, 1/4, -5/16, 5/16, 5/16, -1/8},
				{-5/16, 0, -1/4, -1/4, 1/4, -1/8},
				{1/4, 0, -1/4, 5/16, 1/4, -1/8},

				{-1/16, -1/4, 1/8, 1/16, 1/4, 3/8},
				{-1/4, -1/16, 1/8, 1/4, 1/16, 3/8},
				{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.001}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-5/16, -5/16, -1/8, 5/16, 3/8, 1/8},

				{-5/16, 1/4, -5/16, 5/16, 5/16, -1/8},
				{-5/16, 0, -1/4, -1/4, 1/4, -1/8},
				{1/4, 0, -1/4, 5/16, 1/4, -1/8},

				{-1/16, -1/4, 1/8, 1/16, 1/4, 3/8},
				{-1/4, -1/16, 1/8, 1/4, 1/16, 3/8},
				{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.01}
			}
		},

		on_punch = function(pos, node)
			on_off_light(pos, node)
		end,

		mesecons = {effector = {
			action_on = function(pos, node)
				on_off_light(pos, node)
			end,
		}}
	})

	minetest.register_alias("infrastructure:crosswalk_warning_light", "infrastructure:crosswalk_warning_light_off")
