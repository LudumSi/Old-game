//PLANT SPEEDS HALVED FOR TESTING

/obj/crops
	icon = 'icons/floor.dmi'
	HP = 1
	maxHP = 1
	destructable = 1
	var/state = 1
	var/A = "tallgrass_s"
	var/B = "tallgrass_h"
	var/C = "tallgrass"
	icon_state = "tallgrass"
	destroy = list("harvest")
	var/growtime = 1
	var/mintime = 1
	var/maxtime = 1
	var/seed = /obj/items/materials/seeds/grass
	var/crop = /obj/items/materials/grass
	var/maxcrop = 1
	var/seedcrop = 1
	var/startstate = 1
	proc/grow()
		if(state == 1)
			icon_state = B
			state = 2
		else if(state == 2)
			icon_state = C
			state = 3

	proc/produce(num)
		var/togo = num
		while(togo >> 0)
			new src.crop(src.loc)
			togo -= 1

	New()
		icon_state = A
		growtime = (rand(mintime,maxtime))
		if(startstate == 1)
			sleep(growtime/2)
			grow()
			sleep(growtime/2)
			grow()
		else if(startstate == 2)
			grow()
			sleep(growtime/2)
			grow()
		else if(startstate == 3)
			grow()
			grow()
	Destroyedproc()
		if(state == 1)
			var/obj/items/materials/seeds/S = new src.seed(src.loc)
			S.stack = (1)
		else if(state == 2)
			var/obj/items/materials/seeds/S = new src.seed(src.loc)
			S.stack = (round((rand(1,seedcrop))/2))
			var/obj/items/materials/C = new src.crop(src.loc)
			if(istype(src.crop,/obj/items/materials))
				C.stack = (round(rand(1,maxcrop)/2))
			else
				produce((round(rand(1,maxcrop)/2)))
		else if(state == 3)
			var/obj/items/materials/seeds/S = new src.seed(src.loc)
			S.stack = (rand(1,seedcrop))
			var/obj/items/materials/C = new src.crop(src.loc)
			if(istype(src.crop,/obj/items/materials))
				C.stack = (round(rand(1,maxcrop)))
			else
				produce((round(rand(1,maxcrop))))
	grass
		mintime = 500
		maxtime = 1000
		maxcrop = 10
		seedcrop = 4
		desc = "Some tallish grass"
		icon_state = "tallgrass"

	roses
		mintime = 1000
		maxtime = 2000
		maxcrop = 3
		seedcrop = 2
		desc = "Some red roses"
		icon_state = "roses"
		B = "roses_h"
		C = "roses"
		seed = /obj/items/materials/seeds/roses
		crop = /obj/items/herbs/rose

	buttercups
		mintime = 1000
		maxtime = 2000
		maxcrop = 3
		seedcrop = 2
		desc = "Some yellow buttercups"
		icon_state = "buttercups"
		B = "butter_h"
		C = "buttercups"
		seed = /obj/items/materials/seeds/buttercups
		crop = /obj/items/herbs/buttercup

	bushes
		HP = 10
		maxHP = 10
		destroy = /obj/items/tools/hatchet
		mintime = 2000
		maxtime = 4000
		maxcrop = 3
		seedcrop = 2
		desc = "A small bush. The radiation kills anything bigger..."
		icon_state = "oak"
		A = "oak_saplings"
		B = "oak_h"
		C = "oak"
		seed = /obj/items/materials/seeds/acorn
		crop = /obj/items/materials/logs

	pumpkins
		mintime = 1000
		maxtime = 2000
		maxcrop = 5
		seedcrop = 3
		desc = "Some pumpkins"
		icon_state = "pumpkin"
		A = "tallgrass_s"
		B = "pumpkin_h"
		C = "pumpkin"
		seed = /obj/items/materials.seeds/pumpkin
		crop = /obj/items/herbs/pumpkin