--Weapons!

-- Light Steel Stuffs:
minetest.register_tool("futureweapons:sword_lightsteel_blue", {
	description = "Blue LightSteel Sword",
	inventory_image = "sword_lightsteel_blue.png",
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.75, [2]=2.75, [3]=2.85}, uses=10, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.75, [3]=0.75}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2.50},
	},
})

minetest.register_tool("futureweapons:sword_lightsteel_red", {
	description = "Red LightSteel Sword",
	inventory_image = "sword_lightsteel_red.png",
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.35, [2]=2.10, [3]=2.85}, uses=10, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.75, [3]=0.75}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2.50},
	},
})

minetest.register_tool("futureweapons:lasergun_blue", {
	description = "This Is Just A weapon For Mobs , You shouldnt be able to get this  ",
	inventory_image = "blue_laser_gun_.png",
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.75, [2]=2.75, [3]=2.85}, uses=10, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.75, [3]=0.75}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2.50},
	},
})

minetest.register_tool("futureweapons:lasergun_red", {
	description = "This Is Just A weapon For Mobs , You shouldnt be able to get this  ",
	inventory_image = "red_laser_gun_.png",
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=3.75, [2]=2.75, [3]=2.85}, uses=10, maxlevel=1},
			snappy={times={[1]=2.75, [2]=1.75, [3]=0.75}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2.50},
	},
})
--And the crafts...
minetest.register_craft({
	output = 'futureweapons:sword_lightsteel_blue',
	recipe = {
		{'futureores:blue_crystal', 'futureores:lightsteel_ingot', ''},
		{'', 'futureores:lightsteel_ingot', ''},
		{'', 'default:steel_ingot', ''},
	}
})

minetest.register_craft({
	output = 'futureweapons:sword_lightsteel_red',
	recipe = {
		{'futureores:red_crystal', 'futureores:lightsteel_ingot', ''},
		{'', 'futureores:lightsteel_ingot', ''},
		{'', 'default:steel_ingot', ''},
	}
})

