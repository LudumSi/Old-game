/obj/machines/furniture/chairs
	//Overlays?
	density = 0
	wooden
		icon_state = "w_chair"
		layer = 2.99
		New()
			if(dir == SOUTH)
				layer = 2.99
			else
				layer = 4.99
		Clickedproc()
			src.dir = usr.dir
			if(dir == SOUTH)
				layer = 2.99
			else
				layer = 4.99
		destroy = list("pry")
		material = /obj/items/materials/planks
		HP = 3
		maxHP = 3