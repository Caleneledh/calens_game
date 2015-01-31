---
---Titanium Mod Version 3.1 By Aqua. Added new Titanium textures. Be nice this is my first mod!!! 
---

---
---blocks
---

minetest.register_node( "titanium:titanium_in_ground", {
	description = "Titanium Ore",
	tile_images = { "default_stone.png^titanium_titanium_in_ground.png" },
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
	drop = 'craft "titanium:titanium" 1',
})

minetest.register_node( "titanium:block", {
	description = "Titanium Block",
	tile_images = { "titanium_block.png" },
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("titanium:glass", {
	description = "Titanium Glass",
	drawtype = "glasslike",
	tile_images = {"titanium_glass.png"},
	light_propagates = true,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=1,cracky=2,oddly_breakable_by_hand=2},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craftitem( "titanium:titanium", {
	description = "Titanium",
	inventory_image = "titanium_titanium.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "titanium:tougher_titanium", {
	description = "Tougher Titanium",
	inventory_image = "tougher_titanium.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_node( "titanium:titanium_plate", {
	description = "Titanium Plate",
	tile_images = { "titanium_plate.png" },
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "titanium:titanium_tv_1", {
	description = "Titanium TV",
	tile_images = { "titanium_tv_1.png" },
	is_ground_content = true,
	groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
	drop = 'titanium:screen_1',
	light_source = 8,
})

minetest.register_node( "titanium:titanium_tv_2", {
	description = "Titanium TV",
	tile_images = { "titanium_tv_2.png" },
	is_ground_content = true,
	groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
	drop = 'titanium:screen_1',
	light_source = 8,
})

minetest.register_abm(
        {nodenames = {"titanium:titanium_tv_1", "titanium:titanium_tv_2"}, 
        interval = 12,
        chance = 1,
        action = function(pos)
		local i = math.random(1,2)
        
			if i== 1 then
				minetest.add_node(pos,{name="titanium:titanium_tv_1"})
			end
		
			if i== 2 then
				minetest.add_node(pos,{name="titanium:titanium_tv_2"})
			end
			
       end 
})
			
---
---tools
---

minetest.register_tool("titanium:sword", {
	description = "Titanium Sword",
	inventory_image = "titanium_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[1]=2.00, [2]=0.60, [3]=0.20}, uses=100, maxlevel=2},
			snappy={times={[2]=0.60, [3]=0.20}, uses=100, maxlevel=1},
			choppy={times={[3]=0.70}, uses=100, maxlevel=0}
		}
	}
})

minetest.register_tool("titanium:axe", {
	description = "Titanium Axe",
	inventory_image = "titanium_axe.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.50, [3]=1.00}, uses=150, maxlevel=2},
			fleshy={times={[2]=1.00, [3]=0.50}, uses=120, maxlevel=1}
		}
	},
})

minetest.register_tool("titanium:shovel", {
	description = "Titanium Shovel",
	inventory_image = "titanium_shovel.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.0, [2]=0.50, [3]=0.50}, uses=150, maxlevel=3}
		}
	},
})
	
	minetest.register_tool("titanium:pick", {
	description = "Titanium Pickaxe",
	inventory_image = "titanium_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=2.4, [2]=1.0, [3]=0.6}, uses=160, maxlevel=3},
			crumbly={times={[1]=2.4, [2]=1.0, [3]=0.6}, uses=160, maxlevel=3},
			snappy={times={[1]=2.4, [2]=1.0, [3]=0.6}, uses=160, maxlevel=3}
		}
	},
})

---
---crafting
---

minetest.register_craft({
	output = 'titanium:pick',
	recipe = {
		{'titanium:titanium', 'titanium:titanium', 'titanium:titanium'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'titanium:axe',
	recipe = {
		{'titanium:titanium', 'titanium:titanium', ''},
		{'titanium:titanium', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'titanium:shovel',
	recipe = {
		{'', 'titanium:titanium', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'titanium:sword',
	recipe = {
		{'', 'titanium:titanium', ''},
		{'', 'titanium:titanium', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'titanium:block',
	recipe = {
		{'titanium:titanium', 'titanium:titanium', 'titanium:titanium'},
		{'titanium:titanium', 'titanium:titanium', 'titanium:titanium'},
		{'titanium:titanium', 'titanium:titanium', 'titanium:titanium'},
	}
})

minetest.register_craft({
	output = 'titanium:titanium 9',
	recipe = {
		{'', 'titanium:block', ''},
	}
})

minetest.register_craft({
	output = 'titanium:glass 3',
	recipe = {
		{'', 'titanium:titanium', ''},
		{'titanium:titanium', 'default:glass', 'titanium:titanium'},
		{'', 'titanium:titanium', ''},
	}
})

minetest.register_craft({
	output = 'titanium:tougher_titanium',
	recipe = {
		{'titanium:titanium', 'titanium:titanium'},
		{'titanium:titanium', 'titanium:titanium'},
	}
})

minetest.register_craft({
	output = 'titanium:titanium_tv_1',
	recipe = {
		{'default:steel_ingot', 'titanium:tougher_titanium', 'default:steel_ingot'},
		{'titanium:tougher_titanium', 'default:glass', 'titanium:tougher_titanium'},
		{'default:steel_ingot', 'titanium:tougher_titanium', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'titanium:titanium_plate 9',
	recipe = {
		{'titanium:titanium', 'titanium:titanium', 'titanium:titanium'},
		{'titanium:titanium', 'titanium:tougher_titanium', 'titanium:titanium'},
		{'titanium:titanium', 'titanium:titanium', 'titanium:titanium'},
	}
})

print("[Titanium Mod] Loaded! By Aqua!")

local function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, ore_per_chunk, height_min, height_max)
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x-minp.x+1)*(y_max-y_min+1)*(maxp.z-minp.z+1)
	local pr = PseudoRandom(seed)
	local num_chunks = math.floor(chunks_per_volume * volume)
	local chunk_size = 3
	if ore_per_chunk <= 4 then
		chunk_size = 2
	end
	local inverse_chance = math.floor(chunk_size*chunk_size*chunk_size / ore_per_chunk)
	--print("generate_ore num_chunks: "..dump(num_chunks))
	for i=1,num_chunks do
		local y0 = pr:next(y_min, y_max-chunk_size+1)
		if y0 >= height_min and y0 <= height_max then
			local x0 = pr:next(minp.x, maxp.x-chunk_size+1)
			local z0 = pr:next(minp.z, maxp.z-chunk_size+1)
			local p0 = {x=x0, y=y0, z=z0}
			for x1=0,chunk_size-1 do
			for y1=0,chunk_size-1 do
			for z1=0,chunk_size-1 do
				if pr:next(1,inverse_chance) == 1 then
					local x2 = x0+x1
					local y2 = y0+y1
					local z2 = z0+z1
					local p2 = {x=x2, y=y2, z=z2}
					if minetest.get_node(p2).name == wherein then
						minetest.set_node(p2, {name=name})
					end
				end
			end
			end
			end
		end
	end
end

minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("titanium:titanium_in_ground", "default:stone", minp, maxp, seed+21,   1/9/9/9,    5, -31000,  -400)
end)
