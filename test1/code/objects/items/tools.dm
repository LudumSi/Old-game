obj/items/tools
	var/mindmg = 1
	var/maxdmg = 2
	var/attackmsg = "attacks"
	proc/MobAction(target)
		//Consider making attack mesage properties-based
		var/mob/T = target
		T.hurtme(rand((mindmg),(maxdmg)) - T.armor)
		if("sharp" in src.properties)
			T.bleeding()
		view() << "<span class=combat>[usr.name] [attackmsg] [T.name]!<span>"
		target << "<span class=harm>[usr.name] [attackmsg] you!<span>"

	icon = 'icons/tools.dmi'
	hammer
		properties = list("hammer")
		icon_state = "hammer"
		attackmsg = "hammers"
	sickle
		properties = list("sharp","harvest")
		icon_state = "sickle"
		attackmsg = "harvests"
	hatchet
		properties = list("sharp","chop")
		icon_state = "hatchet"
		attackmsg = "chops"
	mop
		properties = list("clean")
		icon_state = "mop"
		attackmsg = "mops up"

	pickaxe
		properties = list("sharp","mine")
		icon_state = "pickaxe"
		attackmsg = "digs into"

	crowbar
		properties = list("sharp","pry")
		icon_state = "crowbar"
		attackmsg = "pries into"
		MobAction(target)
			//Consider making attack mesage properties-based
			var/mob/T = target
			T.hurtme(rand((mindmg),(maxdmg)) - T.armor)
			if("sharp" in src.properties)
				T.bleeding()
			view() << "<span class=combat>[usr.name] [attackmsg] [T.name]!<span>"
			target << "<span class=harm>[usr.name] [attackmsg] you!<span>"
			T.stunme(rand(10,30))
	pen
		properties = list("sharp","writes")
		mindmg = 1
		maxdmg = 1
		icon_state = "pen"
		attackmsg = "stabs"
	knife
		properties = list("sharp","carve")
		mindmg = 1
		maxdmg = 4

