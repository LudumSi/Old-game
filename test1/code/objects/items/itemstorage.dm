//SPLIT

/obj/items/storage

	storage = 10

	InvClickedproc()
		if(istype(usr.holding,/obj/items/admin/hands))
			acess()
		else
			putinside()
	Shiftclicked()
		if(istype(usr.holding,/obj/items/admin/hands))
			acess()
		else
			putinside()
	bag
		name = "bag"
		desc = "A bag, for holding things"
		liftable = 1
		icon_state = "bag"
		var/r = 0
		var/g = 0
		var/b = 0
		density = 0
		layer = 3

		New()
			src.icon += rgb(r,g,b)
		manufactured
			New()
		random
			New()
				r = rand(0,255)
				g = rand(0,255)
				b = rand(0,255)
				src.icon += rgb(r,g,b)
	box
		storage = 5
		icon_state = "box_l"
