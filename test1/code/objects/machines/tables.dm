obj/machines/furniture
	var/edgetype = null

	proc/connect()
		var/turf/N = locate(src.x,(src.y + 1),src.z)
		var/turf/E = locate((src.x + 1),src.y,src.z)
		var/turf/S = locate(src.x,(src.y - 1),src.z)
		var/turf/W = locate((src.x - 1),src.y,src.z)
		var/turf/NE = locate((src.x + 1),(src.y + 1),src.z)
		var/turf/NW = locate((src.x - 1),(src.y + 1),src.z)
		var/turf/SE = locate((src.x + 1),(src.y - 1),src.z)
		var/turf/SW = locate((src.x - 1),(src.y - 1),src.z)
		if(src.type in N.contents)
			src.overlays += new/image('icons/edges.dmi',icon_state = src.edgetype,dir = NORTH)
		if(src.type in S)
			src.overlays += new/image('icons/edges.dmi',icon_state = src.edgetype,dir = EAST)
		if(src.type in E)
			src.overlays += new/image('icons/edges.dmi',icon_state = src.edgetype,dir = SOUTH)
		if(src.type in W)
			src.overlays += new/image('icons/edges.dmi',icon_state = src.edgetype,dir = WEST)
		if(src.type in NE.contents)
			if(src.type in N.contents)
				if(src.type in E.contents)
					src.overlays += new/image('icons/edges.dmi',icon_state = src.edgetype,dir = NORTHEAST)
		if(src.type in NW.contents)
			if(src.type in N.contents)
				if(src.type in W.contents)
					src.overlays += new/image('icons/edges.dmi',icon_state = src.edgetype,dir = NORTHWEST)
		if(src.type in SE.contents)
			if(src.type in S.contents)
				if(src.type in E.contents)
					src.overlays += new/image('icons/edges.dmi',icon_state = src.edgetype,dir = SOUTHEAST)
		if(src.type in SW.contents)
			if(src.type in S.contents)
				if(src.type in W.contents)
					src.overlays += new/image('icons/edges.dmi',icon_state = src.edgetype,dir = SOUTHWEST)





	desk
		edgetype = "table"
		destroy = /obj/items/tools/hatchet
		repair = /obj/items/tools/hammer
		HP = 5
		maxHP = 5
		name = "table"
		icon = 'icons/items_1.dmi'
		icon_state = "desk"
		desc = "A nice table"
		New()
			connect()
		Destroyedproc()
			var/obj/items/materials/planks/I = new(src.loc)
			I.stack = 1
			connect()
			for(var/obj/machines/furniture/desk/N in range(1))
				N.connect()
		Clickedproc()
			if(!(istype(usr.holding,/obj/items/admin/hands)))
				var/obj/items/i = usr.holding
				i.drop()
				i.Move(src.loc)