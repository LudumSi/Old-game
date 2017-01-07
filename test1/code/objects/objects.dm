obj
	//Pickup and inventory
	icon = 'icons/items_1.dmi'
	size = 5

	var/list/properties
	var/liftable = 0
	var/slot = 1
	var/equiped = 0
	var/dropable = 1
	var/equipable = 0
	var/storage = 0
	var/repair = /obj/items/admin/blooper
	var/list/destroy = null
	var/material = /obj/items/admin/blooper

	destroy()
		Destroyedproc()
		del src

	Click(location,control,list/params)
		usr.dir = get_dir(usr,location)
		params = params2list(params)
		if (get_dist(src,usr) <= 1)
			if(usr.hands >= 2)
				//Making and Breaking
				var/i
				for(i in usr.holding.properties)
					if(i in src.destroy)
						hurtme(1)
				if(istype(usr.holding,repair))
					healme()
				//Click functions
				if("shift" in params)
					Shiftclicked()
				else if("ctrl" in params)
					Ctrlclicked()
				else if("alt"in params)
					Altclicked()
				else
					Clickedproc()
				//Picking up for items
				if(istype(src,/obj/items))
					if(src.loc == usr)
						InvClickedproc()
					else if(istype(usr.holding,/obj/items/admin/hands))
						if(liftable == 1)
							pickup()
			else
				Handsproc()
		else
			Rangedproc()

	proc/pickup()
		src.Move(usr)
		usr.holding = src
		usr.client.screen += src
		src.screen_loc = "7,1"

	proc/offpickup()
		src.Move(usr)
		usr.second = src
		usr.client.screen += src
		src.screen_loc = "6,1"

	proc/drop()
		if(dropable == 1)
			if(loc == usr)
				if(usr.holding == src)
					src.Move(usr.loc)
					usr.holding = new/obj/items/admin/hands
					usr.client.screen -= src
					if(equiped == 1)
						unequip()
					dir = SOUTH
				else if(usr.second == src)
					usr.client.clearstorage()
					src.Move(usr.loc)
					usr.client.screen -= src
					if(equiped == 1)
						unequip()
					dir = SOUTH

	proc/Equiped()

	proc/Unequiped()

	proc/equip(target)
		if(equipable == 1)
			src.drop()
			usr << "You put on [src]"
			usr.client.screen += src
			if(target == "head")
				usr.head = src
				src.screen_loc = "2,1"
			if(target == "chest")
				usr.chest = src
				src.screen_loc = "3,1"
			if(target == "legs")
				usr.legs = src
				src.screen_loc = "4,1"
			Equiped()
			equiped = 1

	proc/unequip()
		usr << "You take off [src]"
		if(usr.head == src)
			usr.head = new/obj/items/admin/nude
		if(usr.chest == src)
			usr.chest = new/obj/items/admin/nude
		if(usr.legs == src)
			usr.legs = new/obj/items/admin/nude
		usr.client.screen -= src
		Unequiped()
		equiped = 0
		src.pickup()

	//Destructability
	proc
		Clickedproc()
		Destroyedproc()
		Shiftclicked()
		Altclicked()
		Ctrlclicked()
		Repairedproc()
		InvClickedproc()
		Rangedproc()
		Handsproc()

	proc/acess()
		var/obj/items/I = null
		usr.client.clearstorage()
		var/list/L = contents
		if(!(L.len == 0))
			usr.client.screen.Add(new/obj/buttons/clear)
			for(I in src.contents)
				var/obj/buttons/storage/B = new
				var/pos = 1 + L.Find(I)
				B.screen_loc = "1,[pos]"
				B.C = I
				B.pos = pos
				usr.client.screen.Add(B)
				I.screen_loc = "1,[pos]"
				usr.client.screen.Add(I)

	proc/putinside()
		var/obj/items/H = usr.holding
		var/list/L = src.contents
		if(!(L.len >= src.storage))
			if(H.size << src.size)
				H.drop()
				H.store(src)
				usr << "You put the [H.name] into the [src.name]"
			else
				usr << "The [H.name] is too big for the [src.name]"
		else
			usr << "The [src.name] is full"






