//Split these up later

/obj/items/admin

	icon = 'icons/admin.dmi'
	icon_state = "staff"

	teleporter
		verb
			teleport()
				var/targetx = input("What x?") as num
				var/targety = input("What y?") as num
				var/targetz = input("What z?") as num
				usr.x = targetx
				usr.y = targety
				usr.z = targetz
			check()
				usr << "x = [usr.x]"
				usr << "y = [usr.y]"
				usr << "z = [usr.z]"

	jailor
		var/target
		icon_state = "staff2"
		verb
			jail()
				target = input("Who will you jail?") as text
				var/mob/player/t = /mob/player
				if(t.name == target)
					t.Move(locate(/obj/items/admin/jail))

	hands
		icon_state = "naked"
		dropable = 0
		screen_loc = "7,1"
		//use verbs to switch modes? (Grab,steal,harm...)

	nude
		icon_state = "naked"
		dropable = 0
		name = "nothing"

	jail
		icon = 'icons/floor.dmi'
		icon_state = "placeholder"

	stopwatch
		icon = 'icons/admin.dmi'
		icon_state = "watch"
		verb/tinker()
			world.tick_lag = input("What speed shall the world go?") as num

	blooper
		icon = 'icons/admin.dmi'
		icon_state = "wang"
		verb
			taunt()
				world << "The devs fucked up! The devs fucked up!"
		New()
			usr << "Whoops! Somebody fucked up...Enjoy your generic object"

	edge
		layer = 2.98
		icon = 'icons/edges.dmi'
		icon_state = "null"


