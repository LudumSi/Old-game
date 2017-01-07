//Checked

mob/player

	icon = 'icons/player.dmi'
	icon_state = "player"
	name = "Player"
	desc = "Another player, they look friendly"

	corpsetype = /obj/items/machines/containers/corpse/player
	ghostype = /mob/ghost
	hands = 2
	name = ""
	see_in_dark = 1


	var/newspawned = 1
	var/storage = 0
	var/intent = 0
	var/oldname = "Asswipe"

	Login()
		client.screen.Add(new/obj/buttons/drop,
		new/obj/buttons/holding,
		new/obj/buttons/offhand,
		new/obj/buttons/head,
		new/obj/buttons/chest,
		new/obj/buttons/legs)
		var/obj/H = new/obj/items/admin/hands(usr)
		H.pickup()
		head = new/obj/items/admin/nude(usr)
		chest = new/obj/items/admin/nude(usr)
		legs = new/obj/items/admin/nude(usr)
		head.equip("head")
		chest.equip("chest")
		legs.equip("legs")
		usr.second = new /obj/items/admin/hands
		while(newspawned == 1)
			name = input("What would you like your name to be?") as text
			world << "[name] has joined the world!"
			loc = locate(/turf/construct/floor/rune)
			newspawned = 0

	Stat()
		stat("Health",usr.HP)

	verb
		rotateCW()
			set name = "rotate"
			if (client.dir == NORTH)
				client.dir = EAST
			else if(client.dir == EAST)
				client.dir = SOUTH
			else if(client.dir == SOUTH)
				client.dir = WEST
			else if(client.dir == WEST)
				client.dir = NORTH
		say(msg as text)
			view() << "[name] says, \"[msg]\""
		me(action as text)
			view() << "[name] [action]"




