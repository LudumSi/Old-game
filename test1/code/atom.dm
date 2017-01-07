//Checked

atom

	var/HP

	var/maxHP

	var/destructable = 1

	proc/examined()

	proc/hurtme(dmg)
		if(destructable == 1)
			HP -= dmg
			if(HP <= 0)
				destroy()
				del src


	proc/healme(amount)
		HP += amount
		if(HP >> maxHP)
			HP = maxHP
		if(HP == maxHP)
			repair()

	proc/conditioncheck()

	proc/delay(range,time)
		var/old = usr.loc
		while(usr.loc == old)
			if(conditioncheck() == 1)
				sleep(time)
			else
				return

	proc/destroy()
	proc/repair()

	verb
		examine()
			set src in view()
			usr << "<span class=examine> You examine [src]...</span>"
			usr << "<span class=examine>[desc]</span>"
			src.examined()



