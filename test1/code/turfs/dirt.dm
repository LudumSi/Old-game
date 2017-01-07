/turf/natural/floor/dirt
	desc = "Some dirt"
	icon = 'icons/floor.dmi'
	icon_state = "dirt_c"
	var/center = 0
	edgelayer = 0

	proc/masscheck(location,obj_type)
		var/list/A[0]
		var/list/B = location
		for(var/atom/C in B)
			if(C.type == obj_type)
				A += C
			return A.len

	New()
		turfsmooth()





