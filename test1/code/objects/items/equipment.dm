//SPLIT

/obj/items/equipment

	equipable = 1
	Equiped()
		layer = FLOAT_LAYER+1
		usr.clothescheck()
	Unequiped()
		layer = 3
		usr.clothescheck()

	head
		slot = 1
		hat
			icon = 'icons/clothing.dmi'
			icon_state = "hat"
			var/r = 0
			var/g = 0
			var/b = 0
			New()
				src.icon += rgb(3,240,3)
			manufactured
				name = "hat"
				New()
			random
				name = "hat"
				New()
					r = rand(0,255)
					g = rand(0,255)
					b = rand(0,255)
					src.icon += rgb(r,g,b)
		tophat
			icon = 'icons/clothing.dmi'
			icon_state = "tophat"
			Equiped()
				layer = FLOAT_LAYER+1
				usr.clothescheck()
		tom
			icon = 'icons/clothing.dmi'
			icon_state = "tom"
		jack
			icon = 'icons/clothing.dmi'
			icon_state = "Jack"
			name = "Jack o' lantern"
			desc = "A lantern desgined to ward off ghosts... spooky!"
			InvClickedproc()
				if(icon_state == "Jack")
					icon_state = "Jack_lit"
				else if(icon_state == "Jack_lit")
					icon_state = "Jack"

	chest
		slot = 2
		shirt
			icon = 'icons/clothing.dmi'
			icon_state = "shirt"
			var/r = 0
			var/g = 0
			var/b = 0
			New()
				src.icon += rgb(240,3,3)
			manufactured
				New()
					name = "shirt"
			random
				name = "shirt"
				New()
					r = rand(0,255)
					g = rand(0,255)
					b = rand(0,255)
					src.icon += rgb(r,g,b)
		vest
			icon = 'icons/clothing.dmi'
			icon_state = "suit_vest"
	legs
		slot = 3
		skirt
			icon = 'icons/clothing.dmi'
			icon_state ="grass_skirt"
		pants
			icon = 'icons/clothing.dmi'
			icon_state = "pants"
			var/r = 0
			var/g = 0
			var/b = 0
			New()
				src.icon += rgb(52,54,128)
			manufactured
				name = "pants"
				New()
			random
				name = "pants"
				New()
					r = rand(0,255)
					g = rand(0,255)
					b = rand(0,255)
					src.icon += rgb(r,g,b)
		suit
			icon = 'icons/clothing.dmi'
			icon_state = "suit"



