obj/halfbuilt
	destructable = 1
	liftable = 0
	icon = 'icons/halfbuilt.dmi'
	var/A = "wood"
	var/B = null
	var/result = null
	New()
		icon_state = A
	repair()
		new result(src.loc)
		del src



