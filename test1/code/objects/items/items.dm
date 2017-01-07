//SPLIT

obj/items
	liftable = 1
	size = 1
	torch
		icon = 'icons/items_1.dmi'
		icon_state = "torch"
		luminosity = 3
		desc = "A lit torch"
		var/lit = 1
		Clickedproc()
			if(lit == 1)
				extinguish()
			else
				light()
		verb
			extinguish()
				set src in range(1)
				luminosity = 0
				icon_state = "torchout"
				desc = "An unlit torch"
				lit = 0
				if(src.loc == usr)
					usr.luminosity -= 3
			light()
				set src in range(1)
				luminosity = 3
				icon_state = "torch"
				desc = "A lit torch"
				lit = 1
				if(src.loc == usr)
					usr.luminosity += 3
	records
		icon = 'icons/items_1.dmi'
		icon_state = "records"
		desc = "Important records, not for your eyes"
		verb
			mameself()
				set src in range(1)
				var/oldname = "Asswipe"
				oldname = usr.name
				usr.name = input("What would you like your name to be?") as text
				world << "[oldname] has changed their name to [usr.name]!"
	rubber_ball
		icon_state = "rubber ball"
		magic
			var/bound = 0
			InvClickedproc()
				if(bound == 0)
					var/mob/ghost/spirit/bound/B = new(src)
					B.boundto = src
					bound = 1
	crayon
		name = "crayon"
		icon_state = "crayon"
		var/r = 0
		var/g = 0
		var/b = 0
		New()
			src.icon += rgb(r,g,b)
		manufactured
			New()
		random
			New()
				r = rand(0,255)
				g = rand(0,255)
				b = rand(0,255)
				src.icon += rgb(r,g,b)
	dumbbutton
		name = "Toy button"
		icon_state = "redbutton"
		InvClickedproc()
			var/choice = rand(1,4)
			var/msg = "Hey"
			if(choice == 1)
				msg = "Waaaaaaaasuuuuuup?!"
			if(choice == 2)
				msg = "What's cooking good looking?"
			if(choice == 3)
				msg = "Drink the sake of the keyboar"
			if(choice == 4)
				msg = "Ia Ia Cthulhu Fhtagn!"
			view() << "[name] says, \"[msg]\""












