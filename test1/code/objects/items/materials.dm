//SPLIT

obj/items/materials

	var/list/craft
	var/list/build
	var/stack = 10
	var/choice = null
	var/drop = 0

	verb/dropsome()
		set name = "drop #"
		stackdrop()

	proc
		stackcheck(num)
			if(num >> stack)
				usr << "There isn't enough"
				return 0
			else
				return 1
		stackmerge(target)
			var/obj/items/materials/T = target
			if(istype(src,T))
				T.stack += src.stack
				src.stackgrab(src.stack)
		stackdrop()
			drop = input("How many will you drop?") as num
			stackgrab(drop)
			var/obj/items/materials/M = new src.type(src.loc)
			M.stack = drop
		stackgrab(number)
			if(stack >> number)
				stack = (stack - number)
			else if(stack == number)
				del src
			else if(stack << number)
				usr << "There isn't enough [name]!"
	examined()
		usr << "<span class=examine>There are [stack] items remaining <span>"
	icon = 'icons/items_1.dmi'
	Clickedproc()
		if(istype(usr.holding,src))
			stackmerge(usr.holding)
	grass
		stack = 10
		icon_state = "grass"
		verb/craft()
			new /obj/items/equipment/legs/skirt(src.loc)
			stackgrab()
	stone
		stack = 10
		icon_state = "rocks"
		proc/placeit()
			new /obj/machines/rubble(usr.loc)
		verb
			place()
				placeit()
				stackgrab()
	iron
		stack = 10
		icon_state = "iron"
	logs
		icon_state = "logs"
		stack = 10
		Clickedproc()
			if(istype(usr.holding,/obj/items/tools/hatchet))
				var/obj/items/materials/planks/P = new(src.loc)
				P.stack = 2
				stackgrab(1)




