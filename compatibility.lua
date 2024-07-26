
local S = farming.translate

--= Helpers

local eth = minetest.get_modpath("ethereal")
local alias = function(orig, new)
	minetest.register_alias(orig, new)
end

--= Add {eatable} group to default apple, blueberries and brown mushroom

local function add_grp(item, hp)

	local def = minetest.registered_items[item]

	if def then

		def.groups.eatable = hp
		def.description = def.description .. " (♥" .. hp .. ")"

		minetest.override_item(item, {
			description = def.description,
			groups = def.groups
		})
	end
end

add_grp("default:apple", 2)
add_grp("default:blueberries", 1)
add_grp("flowers:mushroom_brown", 1)
add_grp("flowers:mushroom_red", -5)


--= Aliases

-- Banana
if eth then
	alias("farming_plus:banana_sapling", "ethereal:banana_tree_sapling")
	alias("farming_plus:banana_leaves", "ethereal:bananaleaves")
	alias("farming_plus:banana", "ethereal:banana")
else
	minetest.register_node(":ethereal:banana", {
		description = S("Banana") .. " (♥2)",
		drawtype = "torchlike",
		tiles = {"farming_banana_single.png"},
		inventory_image = "farming_banana_single.png",
		wield_image = "farming_banana_single.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0.2, 0.2}
		},
		groups = {
			food_banana = 1, fleshy = 3, dig_immediate = 3, flammable = 2, eatable = 2
		},
		is_ground_content = false,
		on_use = minetest.item_eat(2),
		sounds = farming.sounds.node_sound_leaves_defaults()
	})

	minetest.register_node(":ethereal:bananaleaves", {
		description = S("Banana Leaves"),
		tiles = {"farming_banana_leaf.png"},
		inventory_image = "farming_banana_leaf.png",
		wield_image = "farming_banana_leaf.png",
		paramtype = "light",
		waving = 1,
		groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
		is_ground_content = false,
		sounds = farming.sounds.node_sound_leaves_defaults()
	})

	alias("farming_plus:banana_sapling", "default:sapling")
	alias("farming_plus:banana_leaves", "ethereal:bananaleaves")
	alias("farming_plus:banana", "ethereal:banana")
end

-- Carrot
alias("farming_plus:carrot_seed", "farming:carrot")
alias("farming_plus:carrot_1", "farming:carrot_1")
alias("farming_plus:carrot_2", "farming:carrot_4")
alias("farming_plus:carrot_3", "farming:carrot_6")
alias("farming_plus:carrot", "farming:carrot_8")
alias("farming_plus:carrot_item", "farming:carrot")

-- Cocoa
alias("farming_plus:cocoa_sapling", "farming:cocoa_beans")
alias("farming_plus:cocoa_leaves", "default:leaves")
alias("farming_plus:cocoa", "default:apple")
alias("farming_plus:cocoa_bean", "farming:cocoa_beans")

-- Orange
alias("farming_plus:orange_1", "farming:tomato_1")
alias("farming_plus:orange_2", "farming:tomato_4")
alias("farming_plus:orange_3", "farming:tomato_6")

if eth then
	alias("farming_plus:orange_item", "ethereal:orange")
	alias("farming_plus:orange", "ethereal:orange")
	alias("farming_plus:orange_seed", "ethereal:orange_tree_sapling")
else
	minetest.register_node(":ethereal:orange", {
		description = S("Orange") .. " (♥4)",
		drawtype = "plantlike",
		tiles = {"farming_orange.png"},
		inventory_image = "farming_orange.png",
		wield_image = "farming_orange.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.3, -0.2, 0.2, 0.2, 0.2}
		},
		groups = {
			food_orange = 1, fleshy = 3, dig_immediate = 3, flammable = 2, eatable = 4
		},
		is_ground_content = false,
		on_use = minetest.item_eat(4),
		sounds = farming.sounds.node_sound_leaves_defaults()
	})

	alias("farming_plus:orange_item", "ethereal:orange")
	alias("farming_plus:orange", "ethereal:orange")
	alias("farming_plus:orange_seed", "default:sapling")
end

-- Potato
alias("farming_plus:potato_item", "farming:potato")
alias("farming_plus:potato_1", "farming:potato_1")
alias("farming_plus:potato_2", "farming:potato_2")
alias("farming_plus:potato", "farming:potato_3")
alias("farming_plus:potato_seed", "farming:potato")

-- Pumpkin
alias("farming:pumpkin_seed", "farming:pumpkin_slice")
alias("farming:pumpkin_face", "farming:jackolantern")
alias("farming:pumpkin_face_light", "farming:jackolantern_on")
alias("farming:big_pumpkin", "farming:jackolantern")
alias("farming:big_pumpkin_side", "air")
alias("farming:big_pumpkin_top", "air")
alias("farming:big_pumpkin_corner", "air")
alias("farming:scarecrow", "farming:jackolantern")
alias("farming:scarecrow_light", "farming:jackolantern_on")
alias("farming:pumpkin_flour", "farming:pumpkin_dough")

-- Rhubarb
alias("farming_plus:rhubarb_seed", "farming:rhubarb")
alias("farming_plus:rhubarb_1", "farming:rhubarb_1")
alias("farming_plus:rhubarb_2", "farming:rhubarb_2")
alias("farming_plus:rhubarb", "farming:rhubarb_3")
alias("farming_plus:rhubarb_item", "farming:rhubarb")

-- Strawberry
alias("farming_plus:strawberry_item", "ethereal:strawberry")
alias("farming_plus:strawberry_seed", "ethereal:strawberry")
alias("farming_plus:strawberry_1", "ethereal:strawberry_1")
alias("farming_plus:strawberry_2", "ethereal:strawberry_3")
alias("farming_plus:strawberry_3", "ethereal:strawberry_5")
alias("farming_plus:strawberry", "ethereal:strawberry_7")

-- Tomato
alias("farming_plus:tomato_seed", "farming:tomato")
alias("farming_plus:tomato_item", "farming:tomato")
alias("farming_plus:tomato_1", "farming:tomato_2")
alias("farming_plus:tomato_2", "farming:tomato_4")
alias("farming_plus:tomato_3", "farming:tomato_6")
alias("farming_plus:tomato", "farming:tomato_8")

-- Weed
alias("farming:weed", "default:grass_2")
