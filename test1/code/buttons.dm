//Split

/obj/buttons
	icon = 'icons/admin.dmi'
	drop
		icon_state = "drop"
		Click()
			var/obj/items/I = usr.holding
			I.drop()
		screen_loc = "13,1"
	holding
		icon_state = "holding"
		screen_loc = "7,1"
		Click()
			var/obj/items/I = usr.holding
			I.InvClickedproc()
	offhand
		icon_state = "holding"
		screen_loc = "6,1"
		New()
			var/icon/I = new(src.icon,src.icon_state)
			I.Flip(EAST)
			src.icon = I
		Click()
			if(istype(usr.holding,/obj/items/admin/hands))
				if(istype(usr.second,/obj/items/admin/hands))
					if(!(istype(usr.holding,usr.second)))
						return
				else
					usr.swap()
			else
				usr.swap()

	head
		icon_state = "buttonbase"
		screen_loc = "2,1"
		Click()
			var/obj/items/I = usr.holding
			var/obj/items/H = usr.head
			if(!(istype(usr.holding,/obj/items/admin/hands)))
				if(istype(usr.head,/obj/items/admin/nude))
					if(I.slot == 1)
						I.equip("head")
						src.overlays += image(I.icon,icon_state = I.icon_state)
			else
				if(!(istype(usr.head,/obj/items/admin/nude)))
					H.unequip()
					src.overlays = null
	chest
		icon_state = "buttonbase"
		screen_loc = "3,1"
		Click()
			var/obj/items/I = usr.holding
			var/obj/items/C = usr.chest
			if(!(istype(usr.holding,/obj/items/admin/hands)))
				if(istype(usr.chest,/obj/items/admin/nude))
					if(I.slot == 2)
						I.equip("chest")
						src.overlays += image(I.icon,icon_state = I.icon_state)
			else if(!(istype(usr.chest,/obj/items/admin/nude)))
				C.unequip()
				src.overlays = null
	legs
		icon_state = "buttonbase"
		screen_loc = "4,1"
		Click()
			var/obj/items/I = usr.holding
			var/obj/items/L = usr.legs
			if(!(istype(usr.holding,/obj/items/admin/hands)))
				if(istype(usr.legs,/obj/items/admin/nude))
					if(I.slot == 3)
						I.equip("legs")
						src.overlays += image(I.icon,icon_state = I.icon_state)
			else
				if(!(istype(usr.legs,/obj/items/admin/nude)))
					L.unequip()
					src.overlays = null
	storage
		icon_state = "buttonbase"
		screen_loc = "1,2"
		var/pos = 1
		var/obj/items/C = null
		Click()
			var/obj/items/I = usr.holding
			if(istype(I,/obj/items/admin/hands))
				C.loc = usr.loc
				src.overlays = null
				usr.client.screen -= C
				C.pickup()
	clear
		icon_state = "clear"
		screen_loc = "1,1"
		Click()
			usr.client.clearstorage()






