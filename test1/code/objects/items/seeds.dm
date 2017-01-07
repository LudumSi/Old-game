/obj/items/materials/seeds
	var/crop = /obj/crops/grass
	var/soil = /turf/natural/floor/dirt
	verb/plant()
		var/turf/T = usr.loc
		if(T == src.soil)
			new crop(usr.loc)
			stackgrab()
	grass
		name = "grass seeds"
		icon_state = "grass_seeds"
		desc = "Some grass seeds. No, not those kind of grass seeds you fucking stoner"
	roses
		name = "rose seeds"
		icon_state = "rose_seeds"
		crop = /obj/crops/roses
	buttercups
		name = "buttercup seeds"
		icon_state = "bcseeds"
		crop = /obj/crops/buttercups
	acorn
		name = "acorn"
		icon_state = "acorn"
		crop = /obj/crops/bushes
	pumpkin
		name = "pumpkin seeds"
		icon_state = "pumpkin_seed"
		crop = /obj/crops/pumpkins