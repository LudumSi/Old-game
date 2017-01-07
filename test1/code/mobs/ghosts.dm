//Split

/mob/ghost

	density = 0
	hands = 0
	icon = 'icons/player.dmi'
	icon_state = "ghost"
	invisibility = 1
	see_invisible = 1
	alpha = 125

/obj/items/admin/rift
	density = 0
	icon = 'icons/player.dmi'
	icon_state = "rift"
	invisibility = 1
	alpha = 125
	var/list/targets
	var/obj/items/admin/rift/target
	New()
		var/T = /obj/items/admin/rift
		for(T in world)
			src.targets += T
	Rangedproc()
		if(istype(usr,/mob/ghost))
			target = input("Where do you want to go?") in targets
			usr.loc = target.loc
