obj/machines/window
	icon = 'icons/wall.dmi'
	icon_state = "thinwindow"
	var/blocked_dir = 0
	alpha = 125
	New()
		if(dir == NORTH)
			blocked_dir = SOUTH
		if(dir == SOUTH)
			blocked_dir = NORTH
		if(dir == EAST)
			blocked_dir = WEST
		if(dir == WEST)
			blocked_dir = EAST
	Cross(atom/movable/O)
		if(istype(O,/mob/ghost))
			return 1
		else
			if(get_dir(src,O) == blocked_dir)
				return 0
			else
				return 1
	Uncross(atom/movable/O)
		if(istype(O,/mob/ghost))
			return 1
		else
			if(O.dir == blocked_dir)
				return 0
			else
				return 1
	north
		dir = NORTH
	south
		dir = SOUTH
	east
		dir = EAST
	west
		dir = WEST


	frame
		layer = 2.98
		opacity = 0
		density = 1
		icon_state = "blinds_o"
		name = "Window frame"
		blinds
			var/A = "blinds_o"
			var/B = "blinds_c"
			var/state = 2
			proc
				//Close and Open
				// 1 is closed, 2 is open
				closewindowproc(B)
					sleep(1)
					opacity = 1
					state = 1
					icon_state = B
					//Closed
				openwindowproc(A)
					sleep(1)
					opacity = 0
					state = 2
					icon_state = A
					//Open
			Clickedproc()
				if (get_dist(src,usr) == 1)
					if(state == 1)
						openwindowproc(A)
					else if (state == 2)
						closewindowproc(B)
