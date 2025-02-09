
local S = minetest.get_translator("farming")

-- item/seed

minetest.register_craftitem("farming:soy_pod", {
	description = S("Soy Pod"),
	inventory_image = "farming_soy_pod.png",
	groups = {compostability = 48, seed = 2, food_soy = 1, food_soy_pod = 1, flammable = 2},

	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:soy_1")
	end
})

-- replacement for soy beans that was removed

minetest.register_alias("farming:soy_beans", "farming:soy_pod")

-- crop definition

local def = {
	description = S("Soy") .. S(" Crop"),
	drawtype = "plantlike",
	tiles = {"farming_soy_1.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	sunlight_propagates = true,
	waving = 1,
	walkable = false,
	buildable_to = true,
	drop = "",
	selection_box = farming.select,
	groups = {
		handy = 1, snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	_mcl_hardness = farming.mcl_hardness,
	is_ground_content = false,
	sounds = farming.node_sound_leaves_defaults()
}

-- stage 1

minetest.register_node("farming:soy_1", table.copy(def))

-- stage 2

def.tiles = {"farming_soy_2.png"}
minetest.register_node("farming:soy_2", table.copy(def))

-- stage 3

def.tiles = {"farming_soy_3.png"}
minetest.register_node("farming:soy_3", table.copy(def))

-- stage 4

def.tiles = {"farming_soy_4.png"}
minetest.register_node("farming:soy_4", table.copy(def))

-- stage 5

def.tiles = {"farming_soy_5.png"}
def.drop = {
	max_items = 1, items = {
		{items = {"farming:soy_pod"}, rarity = 1},
	}
}
minetest.register_node("farming:soy_5", table.copy(def))

-- stage 6

def.tiles = {"farming_soy_6.png"}
def.drop = {
	max_items = 3, items = {
		{items = {"farming:soy_pod"}, rarity = 1},
		{items = {"farming:soy_pod"}, rarity = 2},
		{items = {"farming:soy_pod"}, rarity = 3}
	}
}
minetest.register_node("farming:soy_6", table.copy(def))

-- stage 7 (final)

def.tiles = {"farming_soy_7.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	max_items = 5, items = {
		{items = {"farming:soy_pod"}, rarity = 1},
		{items = {"farming:soy_pod"}, rarity = 2},
		{items = {"farming:soy_pod"}, rarity = 3},
		{items = {"farming:soy_pod"}, rarity = 4},
		{items = {"farming:soy_pod"}, rarity = 5}
	}
}
minetest.register_node("farming:soy_7", table.copy(def))

-- add to registered_plants

farming.registered_plants["farming:soy_pod"] = {
	crop = "farming:soy",
	seed = "farming:soy_pod",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 7
}

-- mapgen
farming.register_decoration("soy",7)
