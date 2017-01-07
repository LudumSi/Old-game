//Checked

mob
	HP = 20
	size = 5

	var/ghostype = /mob/ghost/spirit
	var/hands = 0
	var/bleeding = 0
	var/stun = 0
	var/slow = 0
	var/poisoned = 0
	var/list/equip
	var/obj/holding = null
	var/obj/second = null
	var/obj/chest = null
	var/obj/legs = null
	var/obj/head = null
	var/corpsetype = /obj/items/admin/blooper
	var/armor = 0

	Click(location,control,list/params)
		usr.dir = get_dir(usr,location)
		params = params2list(params)
		if(usr.hands >= 2)
			if (get_dist(src,usr) <= 1)
				if(istype(usr.holding,/obj/items/tools))
					var/obj/items/tools/W = usr.holding
					W.MobAction(src)
				else if(istype(usr.holding,/obj/items/admin/hands))
					usr.loc = locate((src.x),(src.y),(src.z))
				else if("shift" in params)
					Shiftclicked()
				else if("ctrl" in params)
					Ctrlclicked()
				else if("alt"in params)
					Altclicked()
				else
					Clickedproc()

	destroy()
		var/mob/ghost/G = new src.ghostype(src.loc)
		var/obj/items/machines/containers/corpse/C = new src.corpsetype(src.loc)
		C.name = "[name]'s corpse"
		C.desc = "[src.desc]"
		C.desc += "They be lookn' mighty dead"
		view() << "[name] falls on the ground, cold and dead!"
		for(var/obj/items/I in src.contents)
			I.drop()
		G.key = src.key
		client.clearall()

	Move()
		if(stun == 1)
			return
		else
			sleep(slow)
			..()

	proc/clothescheck()
		var/L[3]
		if(head)
			L += head
		if(chest)
			L += chest
		if(legs)
			L += legs
		usr.overlays = L

	proc/swap()
		var/obj/items/H = usr.holding
		var/obj/items/S = usr.second
		H.drop()
		S.drop()
		S.pickup()
		H.offpickup()

	proc/Clickedproc()
	proc/Shiftclicked()
	proc/Altclicked()
	proc/Ctrlclicked()

