obj/machines
	ladder
		var/first = 1
		icon = 'icons/items_1.dmi'
		up
			icon_state = "ladder_u"
			name = "ladder"
			desc = "It is going up"
			Clickedproc()
				if(get_dist(src,usr) == 1)
					usr.x = src.x
					usr.y = src.y
					usr.z += 1
			Handsproc()
				if(get_dist(src,usr) == 1)
					usr.x = src.x
					usr.y = src.y
					usr.z += 1
		down
			name = "ladder"
			icon_state = "ladder_d"
			desc = "It is going down"
			Clickedproc()
				if(get_dist(src,usr) == 1)
					usr.x = src.x
					usr.y = src.y
					usr.z -= 1
			Handsproc()
				if(get_dist(src,usr) == 1)
					usr.x = src.x
					usr.y = src.y
					usr.z -= 1