local digtime = 0.5
minetest.register_item(":", {
			  type = "none",
			  wield_image = "wieldhand.png",
			  wield_scale = {x=1,y=1,z=2.5},
			  range = 10,
			  tool_capabilities = {
			     full_punch_interval = 0.5,
			     max_drop_level = 3,
			     groupcaps = {
				crumbly = {times={[1]=digtime, [2]=digtime, [3]=digtime}, uses=0, maxlevel=3},
				cracky = {times={[1]=digtime, [2]=digtime, [3]=digtime}, uses=0, maxlevel=3},
				snappy = {times={[1]=digtime, [2]=digtime, [3]=digtime}, uses=0, maxlevel=3},
				choppy = {times={[1]=digtime, [2]=digtime, [3]=digtime}, uses=0, maxlevel=3},
				oddly_breakable_by_hand = {times={[1]=digtime, [2]=digtime, [3]=digtime}, uses=0, maxlevel=3},
			     },
			     damage_groups = {fleshy = 10},
			  }
})
