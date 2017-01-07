//Think about moving ALL locking/password stuff up...
obj/machines
	destructable = 1
	Destroyedproc()
		usr << "You take apart [name]"
		view() << "[usr.name] takes apart [name]"
		new material(src.loc)
	layer = 2.99
	density = 1
	opacity = 0
	statue
		icon = 'icons/items_1.dmi'
		icon_state = "statue"
		desc = "A statue of someone"
	sign
		var
			locked = 0
			lockable = 1
			password = "null"
			password_attempt = "null"
			unlockable = 1
		icon = 'icons/items_1.dmi'
		icon_state = "sign"
		desc = "A sign... with words"
		proc
			lock()
				if (lockable == 1)
					password = input("What would you like the password to be?") as text
					locked = 1
					usr << "You lock the sign"
			unlock()
				password_attempt = input("Enter password")
				if (password_attempt == password)
					locked = 0
					usr << "You unlock the sign"
		Clickedproc()
			if (locked == 1)
				if (unlockable == 1)
					unlock()
			else if (locked == 0)
				name = input("What will the sign say?") as text
		Ctrlclicked()
			if (lockable == 1)
				lock()
		Shiftclicked()
			if (locked == 0)
				desc = input("What will the sign desciption say?") as text
	pillar
		icon = 'icons/items_1.dmi'
		icon_state = "pillar"
		desc = "A mighty pillar"
		oblesk
			icon = 'icons/wall.dmi'
			icon_state = "oblisk"
			desc = "A strange eldirct oblesk,,,"
	rubble
		destructable = 1
		destroy = /obj/items/tools/pickaxe
		material = /obj/items/materials/stone
		HP = 2
		maxHP = 2
		icon = 'icons/floor.dmi'
		icon_state = "rubble"
		Destroyedproc()
			var/obj/items/materials/stone/I = new(src.loc)
			I.stack = 1
		Clickedproc()
			usr.x = x
			usr.y = y
			sleep(2)
		New()
			var/num = rand(1,4)
			if(num == 1)
				dir = NORTH
			else if(num == 2)
				dir = SOUTH
			else if(num == 3)
				dir = EAST
			else if(num == 4)
				dir = WEST
		wood
			icon = 'icons/halfbuilt.dmi'
			icon_state = "wood_h"
			Destroyedproc()
				var/obj/items/materials/planks/I = new(src.loc)
				I.stack = 1












