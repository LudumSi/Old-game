//SPLIT

/obj/items/herbs
	rose
		desc = "A pretty yet thorny rose"
		icon_state = "rose"
	buttercup
		desc = "A buttery butter cup"
		icon_state = "buttercup"
	pumpkin
		desc = "A big orange pumpkin"
		icon_state = "pumpkin"
		Clickedproc()
			if("carve" in usr.holding.properties)
				new/obj/items/equipment/head/jack(usr.loc)
				del src

