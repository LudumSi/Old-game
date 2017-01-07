//Split

obj/decor
	layer = 2.01
	var/cleanable = 0
	Clickedproc()
		if(cleanable == 1)
			if("clean" in usr.holding.properties)
				del src

	icon = 'icons/floor.dmi'
	graffiti
		cleanable = 1
		icon_state = "graffiti"
		var/r = 0
		var/g = 0
		var/b = 0
		New()
			src.icon += rgb(r,g,b)
	bloodstain
		icon_state = "blood"
		desc = "blood...hopefully not your own"
		cleanable = 1



