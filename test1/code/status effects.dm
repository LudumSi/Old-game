//checked

mob
	proc/poisoned()
		poisoned = 1
		var/cycles = 5
		while(poisoned == 1)
			hurtme(rand(1,3))
			src << "You feel ill"
			sleep(600)
			cycles -= 1
			if(cycles <= 0)
				poisoned = 0

	proc/bleeding()
		if(bleeding == 1)
			return
		else if(bleeding == 0)
			bleeding = 1
		while(bleeding == 1)
			sleep(rand(50,200))
			if(bleeding == 1)
				hurtme(1)
				src << "<SPAN CLASS=combat.harm>Blood oozes from your wounds...<SPAN>"
				new/obj/decor/bloodstain(src.loc)
			else
				return

	proc/stunme(time)
		usr.stun = 1

		var/icon/I = new(usr.icon)
		var/icon/O = new(usr.icon)
		I.Turn(90)
		usr.icon = I

		usr << "<SPAN CLASS=combat> You hit the dirt!<SPAN>"
		sleep(time)
		usr.stun = 0

		usr.icon = O



