/obj/items/materials/planks
	icon_state = "plank"
	build = list(/obj/machines/doors/wood,/turf/construct/wall/wood)
	conditioncheck()
		var/old = usr.holding
		if(usr.holding == old)
			return 1
		else
			return 0
	proc/build()
		if(stackcheck() == 1)
			var/atom/target = input("What would you like to construct?") in src.build
			delay(0,5)
			if(istype(target,/obj))
				new target.type(usr.loc)
			else if(istype(target,/turf))
				new target.type(locate(usr.x,usr.y,usr.z))
			stackgrab()
		else
			return
	InvClickedproc()
		if("hammer" in usr.holding.properties)
			build()





