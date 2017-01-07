/obj/machines/vending
	desc = "A vending machine. It gives you stuff. "
	var/choice = null
	var/obj/product = null
	var/list/products

	Clickedproc()
		product = input("What would you like?") in src.products
		new product.type(src.loc)

	shirt
		name = "Cloths O' Matic"
		icon = 'icons/items_1.dmi'
		icon_state = "cloths"

		products = list(new/obj/items/equipment/chest/shirt/manufactured,
		new/obj/items/storage/bag/manufactured,
		new/obj/items/equipment/legs/pants/manufactured,
		new/obj/items/equipment/head/hat/manufactured)

		Clickedproc()
			product = input("What would you like?") in src.products
			var/obj/items/equipment/I = new product.type(src)
			choice = input("What color?") as color
			I.icon += choice
			I.loc = src.loc
	tools
		icon = 'icons/items_1.dmi'
		icon_state = "tool"
		products = list(new/obj/items/tools/hammer,
		new/obj/items/tools/crowbar)







