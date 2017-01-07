// TODO: Rename procs to be less barf
obj/machines/doors
	desc = "A door. It opens and closes. Ctrl-click to lock and unlock,Shift-click to change the password. "
	density = 1
	opacity = 1
	icon = 'icons/doors.dmi'
	var/password = "password"
	var/state = 1
	var/lock = 0
	var/password_attempt = "null"
	var/A = "closed"
	var/B = "halfopen"
	var/C = "open"
	var/lockable = 0
	desc = "Shift-click to change password, Control-click to lock"
	proc
		//Locking crap
		lockdoor()
			if (lockable == 1)
				lock = 1
			else
				usr << "This door may not be locked!"
		unlockdoor()
			password_attempt = input("Enter password") as text
			if (lock == 1)
				if(password_attempt == password)
					lock = 0
				else
					usr << "Wrong password!"
			else
				usr << "This door may not be locked!"
		//Password crap
		passwordopen()
			password_attempt = input("Enter password") as text
			if(password_attempt == password)
				opendoorproc(B,C)
			else
				usr << "Wrong password!"
		changepasswordproc()
			password_attempt = input("Enter password") as text
			if(password_attempt == password)
				password = input("New password?") as text
			else
				usr << "Wrong password"
		//Close and Open
		// 1 is closed, 2 is half-closed, 3 is open
		closedoorproc(A,B)
			sleep(1)
			density = 1
			state = 2
			icon_state = B
			//Half-open
			sleep(1)
			opacity = 1
			state = 1
			icon_state = A
			//Closed
		opendoorproc(B,C)
			sleep(1)
			opacity = 0
			state = 2
			icon_state = B
			//Half-open
			sleep(1)
			density = 0
			state = 3
			icon_state = C
			//Open
	Ctrlclicked()
		if(lock == 1)
			unlockdoor()
			usr << "You unlock the door"
			src in view() << "[usr] unlocks the door"
		else if(lock == 0)
			lockdoor()
			usr << "You lock the door"
			src in view() << "[usr] locks the door"
	Shiftclicked()
		changepasswordproc()
		usr << "You change the password on the door..."
	Clickedproc()
		if(state == 1)
			if(lock == 1)
				passwordopen(B,C)
			else if(lock == 0)
				opendoorproc(B,C)
		else if (state == 3)
			closedoorproc(A,B)
	/*
	Click(location,control,shift)
		shift
			changepasswordproc()
		if (get_dist(src,usr) == 1)
			if(state == 1)
				if(lock == 1)
					passwordopen(B,C)
				else if(lock == 0)
					opendoorproc(B,C)
			else if (state == 3)
				closedoorproc(A,B)
	*/
	//verb
		// Old, use in emergencies
		/*
		opendoor()
			set src in range(1)
			set hidden = 1
			if(state == 1)
				if(lock == 0)
					opendoorproc(B,C)
				else if(lock == 1)
					passwordopen(B,C)
		closedoor()
			set src in range(1)
			set hidden = 1
			if(state == 3)
				closedoorproc(A,B)

		changepassword()
			set src in range(1)
			set name = "Change Password"
			if(lock == 1)
				changepasswordproc()

		lock()
			set src in range(1)
			lockdoor()
		unlock()
			set src in range(1)
			unlockdoor()
		*/
	wood
		material = /obj/items/materials/planks
		destroy = list("pry")
		repair = /obj/items/tools/hammer
		HP = 8
		maxHP = 8
		name = "Wooden Door"
		icon_state = "closed"
		New()
			desc += "A hefty wooden door"
		locked
			desc = "A hefty wooden door. It is locked"
			lockable = 1
			lock = 1
		Destroyedproc()
			var/obj/items/materials/planks/I = new(src.loc)
			I.stack = 1
	closet
		name = "Closet Door"
		icon_state = "closet_c"
		New()
			desc += "The door to a closet"
		A = "closet_c"
		B = "closet_h"
		C = "closet_o"
	secret
		name = "brick wall"
		icon = 'icons/wall.dmi'
		icon_state = "brick"
		desc = "A strong brick wall"
		A = "brick"
		B = "brick_h"
		C = "brick_o"




