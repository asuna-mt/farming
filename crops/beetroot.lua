
local S = minetest.get_translator("farming")
local a = farming.recipe_items

-- item/seed

minetest.register_craftitem("farming:beetroot", {
	description = S("Beetroot"),
	inventory_image = "farming_beetroot.png",
	groups = {compostability = 48, seed = 2, food_beetroot = 1},
	on_use = minetest.item_eat(1),

	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:beetroot_1")
	end
})

farming.add_eatable("farming:beetroot", 1)

-- crop definition

local def = {
	description = S("Beetroot") .. S(" Crop"),
	drawtype = "plantlike",
	tiles = {"farming_beetroot_1.png"},
	paramtype = "light",
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

minetest.register_node("farming:beetroot_1", table.copy(def))

-- stage 2

def.tiles = {"farming_beetroot_2.png"}
minetest.register_node("farming:beetroot_2", table.copy(def))

-- stage 3

def.tiles = {"farming_beetroot_3.png"}
minetest.register_node("farming:beetroot_3", table.copy(def))

-- stage 4

def.tiles = {"farming_beetroot_4.png"}
minetest.register_node("farming:beetroot_4", table.copy(def))

-- stage 5 (final)

def.tiles = {"farming_beetroot_5.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	max_items = 4, items = {
		{items = {"farming:beetroot"}, rarity = 1},
		{items = {"farming:beetroot"}, rarity = 2},
		{items = {"farming:beetroot"}, rarity = 3},
		{items = {"farming:beetroot"}, rarity = 4}
	}
}
minetest.register_node("farming:beetroot_5", table.copy(def))

-- add to registered_plants

farming.registered_plants["farming:beetroot"] = {
	crop = "farming:beetroot",
	seed = "farming:beetroot",
	minlight = farming.min_light,
	maxlight = farming.max_light,
	steps = 5
}

-- mapgen
farming.register_decoration("beetroot",5)
