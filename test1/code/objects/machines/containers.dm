//Peek verb, for checking contents
/obj/machines/containers
	icon = 'icons/items_1.dmi'
	var/A = "box_o"
	var/B = "box"
	var/opened = 0
	var/locked = 0
	var/password = null
	var/password_attempt = null
	var/lockable = 1
	icon_state = "box"
	verb
		lock()
			set src in range(1)
			if(lockable == 1)
				if(opened == 0)
					if(locked == 0)
						password = input("What password?") as text
						locked = 1
		unlock()
			set src in range(1)
			if(opened == 0)
				if(locked == 1)
					password_attempt = input("Enter password") as text
					if(password_attempt == password)
						locked = 0
	proc
		empty()
			var/turf/T = (src.loc)
			T.contents += src.contents
		fill()
			var/turf/T = (src.loc)
			var/atom/movable/I
			for(I in T.contents)
				I.store(src)
		open()
			opened = 1
			icon_state = A
			empty()
		close()
			opened = 0
			icon_state = B
			fill()
	Clickedproc()
		if (opened == 0)
			open()
		else if(opened == 1)
			if(istype(usr.holding,/obj/items/admin/hands))
				close()
			else
				var/obj/items/G = usr.holding
				G.drop()
				G.Move(src.loc)

	box
		var/list/startcontents
		material = /obj/items/materials/planks
		name = "chest"
		A = "box_o"
		B = "box"
		icon_state = "box"
		repair = list("pry")
		destroy = /obj/items/tools/crowbar
		HP = 5
		maxHP = 5
		New()
			contents = startcontents

		building
			New()
				new/obj/items/materials/planks(src)
				new/obj/items/materials/planks(src)
				new/obj/items/materials/planks(src)
				new/obj/items/materials/planks(src)
				new/obj/items/tools/hammer(src)
				new/obj/items/tools/hammer(src)
		destruction
			New()
				new/obj/items/tools/crowbar(src)
				new/obj/items/tools/pickaxe(src)
				new/obj/items/tools/crowbar(src)
				new/obj/items/tools/pickaxe(src)
		farming
			New()
				new/obj/items/tools/sickle(src)
				new/obj/items/materials/seeds/grass(src)
				new/obj/items/tools/sickle(src)
				new/obj/items/materials/seeds/grass(src)
				new/obj/items/tools/hatchet(src)
				new/obj/items/tools/hatchet(src)
		art
			New()
				new/obj/items/crayon/random(src)
				new/obj/items/crayon/random(src)
				new/obj/items/crayon/random(src)
				new/obj/items/crayon/random(src)
		medical
			New()
				new/obj/items/tools/healing/bandages(src)
				new/obj/items/tools/healing/medicine(src)
				new/obj/items/tools/healing/bandages(src)
				new/obj/items/tools/healing/medicine(src)
		cleaning
			New()
				new/obj/items/tools/mop(src)
				new/obj/items/tools/mop(src)

	wardrobe
		//For storing clothes
		name= "wardrobe"
		desc = "A closet which stores clothes."
		A = "wardrobe_o"
		B = "wardrobe"
		destroy = list("pry")
		icon_state = "wardrobe"
		lockable = 1
		open()
			opened = 1
			icon_state = A
			empty()
			density = 0
		close()
			opened = 0
			icon_state = B
			fill()
			density = 1
	statue
		name = "statue"
		desc = "A statue of someome"
		B = "statue"
		A = "statue_o"
		icon_state = "statue"
		logans
			name = "statue of Littlethomcat"
			desc = "A statue of Littlethomcat, to whom promises have been kept"
			New()
				new/obj/items/equipment/head/tom(src)
	cupboard
		desc = "A simple cabinet in which to store things"


