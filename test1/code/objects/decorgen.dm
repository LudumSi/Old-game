//Split, reorganize

/obj/decor
	plains
		var/kind = null
		New()
			kind = rand(1,10)
			if(kind == 1)
				new /obj/crops/grass(src.loc)
				del src
			if(kind == 2)
				var/obj/items/materials/stone/I = new(src.loc)
				I.stack = 1
				del src
			if(kind == 3)
				new /obj/crops/buttercups(src.loc)
				del src
			else
				del src
	ore
		var/kind = null
		New()
			kind = rand(1,10)
			if(kind == 1)
				new /turf/natural/wall/cave/ore/iron(src.loc)
				del src
			else if(kind <= 3)
				new /obj/machines/rubble(src.loc)
				del src
			else
				new /turf/natural/wall/cave(src.loc)
				del src