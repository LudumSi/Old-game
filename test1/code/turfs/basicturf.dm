turf
	natural
		floor
			edgelayer = -1
			desc = "The ground"
			density = 0
			opacity = 0
			grass
				desc = "A lovely patch of grass"
				icon = 'icons/floor.dmi'
				icon_state = "grass"
				edgelayer = 1
				edgetype = "grass"
			cave
				desc = "A rough cavern floor"
				icon = 'icons/floor.dmi'
				icon_state = "cave"
		wall
			desc = "A barrier"
			icon = 'icons/wall.dmi'
			density = 1
			opacity = 1
			cave
				destructable = 1
				name = "stone wall"
				desc = "A rough stone wall"
				icon_state = "cave"
				destroy = list("mine")
				material = /obj/items/materials/stone
				ore
					iron
						name = "stone wall"
						desc = "A rough stone wall"
						icon_state = "cave"
						material = /obj/items/materials/iron
	construct
		var/markable = 1
		Clickedproc()
			if(markable == 1)
				if(istype(usr.holding,/obj/items/crayon))
					var/obj/items/crayon/H = usr.holding
					var/obj/decor/graffiti/I = new(locate(src.x,src.y,src.z))
					I.icon_state = "graffiti_f"
					I.icon += rgb(H.r,H.g,H.b)
					I.name = input("What does the graffiti say?") as text
					usr << "You write [I.name] on the wall."
		destructable = 1
		edgelayer = -10
		floor
			desc = "Some flooring"
			density = 0
			opacity = 0
			icon = 'icons/floor.dmi'
			wood
				name = "Wood floor"
				desc = "A well-made wooden floor"
				icon_state = "wood"
				repair = /obj/items/tools/hammer
				destroy = list("pry")
				material = /obj/items/materials/planks
				HP = 5
				maxHP = 5
				tile
					name = "Wood tile floor"
					desc = "A floor made out of wooden tiles"
					icon_state = "w_tile"
			lit
				markable = 0
				desc = "Some glowy, flashy, dance-y floor"
				name = "Dance floor"
				icon_state = "party"
			cobble
				edgetype = "stone"
				name = "Cobbles"
				desc = "Some stone on the ground"
				icon_state = "cobbles"
				ornate
					name = "Ornate Stonework"
					desc = "Somebody put a lot of time into this..."
					icon_state = "ornate"
			asphalt
				name = "Asphalt"
				desc = "Black, rough, assphalt"
				icon_state = "asphalt"
			marble
				name = "Marble tiles"
				desc = "Esquisite marble tiles. Fancy!"
				icon_state = "marble"
			rune
				markable = 0
				name = "Runed floor"
				desc = "A glowing, runed floor"
				icon_state = "rune"
				Ghostclick()
					if(istype(usr,/mob/ghost))
						var/mob/player/P = new(locate(src.x,src.y,src.z))
						P.key = usr.key
						del usr

			carpet
				markable = 0
				name = "Carpeted floor"
				desc = "A lush, carpeted floor"
				icon_state = "carpet"
				blue
					New()
						src.icon += rgb(15,50,105)
				green
					New()
						src.icon += rgb(50,105,15)
				red
					New()
						src.icon += rgb(105,15,15)
			cult
				name = "Eerie floor"
				desc = "A floor with odd glyphs in it"
				icon_state = "cultfloor"
				runed
					icon_state = "cultfloor_r"
					Enter(atom/movable/O)
						if(istype(O,/mob/ghost))
							return 0
						else
							return 1

		wall
			desc = "A wall"
			icon = 'icons/wall.dmi'
			density = 1
			opacity = 1
			brick
				name = "brick wall"
				desc = "A strong brick wall"
				icon_state = "brick"
				/*
				New()
					var/U = locate(src.x,(src.y - 1),src.z)
					if(!(istype(U,src.type)))
						icon_state = "brickfront"
				*/
				secret
					name = "brick wall"
					density = 0
				stone
					icon_state = "stonebricks"
			stainedglass
				markable = 0
				name = "stained glass window"
				opacity = 0
				luminosity = 2
				icon_state = "stainedglass"
			wood
				name = "wooden wall"
				desc = "A wall, made of wood"
				icon_state = "wood"
				repair = /obj/items/tools/hammer
				destroy = list("pry")
				material = /obj/items/materials/planks
				HP = 10
				maxHP = 10
			cult
				name = "Eerie wall"
				desc = "A wall with odd glyphs on it..."
				icon_state = "cultwall"
				destructable = 0
				Enter(atom/movable/O)
					if(istype(O,/mob/ghost))
						return 0
					else if(O.density == 1)
						return 0
					else if(O.density == 0)
						return 1












