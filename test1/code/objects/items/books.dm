/obj/items/paper

	icon = 'icons/items_1.dmi'
	icon_state = "paper"
	var/blank = 1
	var/notes = null
	InvClickedproc()
		if(istype(usr.holding,/obj/items/tools/pen))
			if(blank == 1)
				notes = input("What would you like to write?") as message
				icon_state = "paper_w"
			else
				notes += input("What would you like to add?") as message
		else
			usr << browse("[notes]")

