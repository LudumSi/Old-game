//SPLIT

/obj/items/tools/healing
	mindmg = 3
	maxdmg = 6
	attackmsg = "heals"
	medicine
		icon = 'icons/items_1.dmi'
		icon_state = "medicine"
		MobAction(target)
			var/mob/T = target
			T.healme(rand(mindmg,maxdmg))
	bandages
		mindmg = 0
		maxdmg = 0
		icon = 'icons/items_1.dmi'
		icon_state = "bandages"
		MobAction(target)
			var/mob/T = target
			if(T.bleeding == 1)
				T.bleeding = 0
				usr << "You patch [T] up"
				drop()
				del src
			else
				usr << "They aren't bleeding!"
