-- Warning light
	minetest.register_abm( {
		nodenames = {"infrastructure:warning_light_bright", "infrastructure:warning_light_dark"},
		interval = 2,
		chance = 1,
		action = function(pos, node)
			local node = minetest.env:get_node(pos)
			if node.name == "infrastructure:warning_light_bright" then
				minetest.swap_node(pos, {name = "infrastructure:warning_light_dark", param2 = node.param2})
			elseif node.name == "infrastructure:warning_light_dark" then
				minetest.swap_node(pos, {name = "infrastructure:warning_light_bright", param2 = node.param2})
			end
		end
	})

	minetest.register_node("infrastructure:warning_light_bright", {
		description = "Warning light",
		tile_images = {
			"infrastructure_warning_light_top.png",
			"infrastructure_warning_light_bottom.png",
			"infrastructure_warning_light_right.png",
			"infrastructure_warning_light_left.png",
			"infrastructure_warning_light_back.png",
			"infrastructure_warning_light_front_bright.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 1},
		light_source = WARNING_LIGHT_LIGHT_RANGE,
		node_box = {
			type = "fixed",
				fixed = {
					{-5/16, -3/8, 0, 5/16, 0, 0},

					{-1/4, -5/16, 0, 0, -1/16, 1/8},

					{1/16, -1/2, -1/8, 5/16, -1/4, 1/8},

					{-1/16, -1/2, -1/16, 1/16, -3/8, 1/16}
				}
		},
		selection_box = {
			type = "fixed",
				fixed = {
					{-5/16, -3/8, 0, 5/16, 0, 0},

					{-1/4, -5/16, 0 + 0.01, 0, -1/16, 1/8},

					{1/16, -1/2, -1/8, 5/16, -1/4, 1/8},

					{-1/16, -1/2, -1/16, 1/16, -3/8, 1/16}
				}
		}
	})

	minetest.register_node("infrastructure:warning_light_dark", {
		tile_images = {
			"infrastructure_warning_light_top.png",
			"infrastructure_warning_light_bottom.png",
			"infrastructure_warning_light_right.png",
			"infrastructure_warning_light_left.png",
			"infrastructure_warning_light_back.png",
			"infrastructure_warning_light_front_dark.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 1, not_in_creative_inventory = 1},
		drop = "infrastructure:warning_light_bright",
		node_box = {
			type = "fixed",
				fixed = {
					{-5/16, -3/8, 0, 5/16, 0, 0},

					{-1/4, -5/16, 0, 0, -1/16, 1/8},

					{1/16, -1/2, -1/8, 5/16, -1/4, 1/8},

					{-1/16, -1/2, -1/16, 1/16, -3/8, 1/16}
				}
		},
		selection_box = {
			type = "fixed",
				fixed = {
					{-5/16, -3/8, 0, 5/16, 0, 0},

					{-1/4, -5/16, 0 + 0.01, 0, -1/16, 1/8},

					{1/16, -1/2, -1/8, 5/16, -1/4, 1/8},

					{-1/16, -1/2, -1/16, 1/16, -3/8, 1/16}
				}
		}
	})

	minetest.register_alias("infrastructure:warning_light", "infrastructure:warning_light_bright")
