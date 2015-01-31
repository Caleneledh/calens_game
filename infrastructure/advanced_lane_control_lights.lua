-- Lane control lights
	function lane_control_change(pos, node)
		local node = minetest.env:get_node(pos)
		if node.name == "infrastructure:lane_control_lights_1" then
			minetest.swap_node(pos, {name = "infrastructure:lane_control_lights_2", param2 = node.param2})
		elseif node.name == "infrastructure:lane_control_lights_2" then
			minetest.swap_node(pos, {name = "infrastructure:lane_control_lights_3", param2 = node.param2})
		elseif node.name == "infrastructure:lane_control_lights_3" then
			minetest.swap_node(pos, {name = "infrastructure:lane_control_lights_4", param2 = node.param2})
		elseif node.name == "infrastructure:lane_control_lights_4" then
			minetest.swap_node(pos, {name = "infrastructure:lane_control_lights_5", param2 = node.param2})
		elseif node.name == "infrastructure:lane_control_lights_5" then
			minetest.swap_node(pos, {name = "infrastructure:lane_control_lights_1", param2 = node.param2})
		end
	end

	for i = 1, 5 do
		local groups = {}
		if i == 1 then 
			groups = {cracky = 3}
		else
			groups = {cracky = 3, not_in_creative_inventory = 1}
		end

		minetest.register_node("infrastructure:lane_control_lights_"..tostring(i), {
			description = "Lane control lights",
			tile_images = {
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_lane_control_lights_"..tostring(i)..".png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky = 3, not_in_creative_inventory = 1},
			light_source = TRAFFIC_LIGHTS_LIGHT_RANGE,
			drop = "infrastructure:lane_control_lights_1",
			node_box = {
				type = "fixed",
					fixed = {
						{-7/16, -7/16, -1/8, 7/16, 7/16, 1/8},
						{-7/16, 0, -1/4, -3/8, 7/16, -1/8},
						{3/8, 0, -1/4, 7/16, 7/16, -1/8},
						{-7/16, 3/8, -5/16, 7/16, 7/16, -1/8},
						{-1/16, -1/4, 0, 1/16, 1/4, 1/2 - 0.001},
						{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.001},
						{-1/4, -1/16, 0, 1/4, 1/16, 1/2 - 0.001}
					}
			},
			selection_box = {
				type = "fixed",
					fixed = {
						{-7/16, -7/16, -1/8, 7/16, 7/16, 1/8},
						{-7/16, 0, -1/4, -3/8, 7/16, -1/8},
						{3/8, 0, -1/4, 7/16, 7/16, -1/8},
						{-7/16, 3/8, -5/16, 7/16, 7/16, -1/8},
						{-1/16, -1/4, 0, 1/16, 1/4, 1/2 - 0.001},
						{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.001},
						{-1/4, -1/16, 0, 1/4, 1/16, 1/2 - 0.001}
					}

			},

			on_punch = function(pos, node)
				lane_control_change(pos, node)
			end,

			mesecons = {effector = {
				action_on = function (pos, node)
					lane_control_change(pos, node)
				end,
			}}
		})
	end

	minetest.register_alias("infrastructure:lane_control_lights", "infrastructure:lane_control_lights_1")
