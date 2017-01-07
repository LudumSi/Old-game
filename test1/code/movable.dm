//Checked

atom/movable

	step_size = 32

	var/atom/inside = null
	var/size = 10

	proc/store(target)
		var/atom/movable/T = target
		if(src.size <= T.size)
			T.contents += src
			T.inside = target

	proc/dump()
		var/turf/T = inside.loc
		src.Move(T)