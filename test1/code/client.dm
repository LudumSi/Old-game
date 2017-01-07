//Checked

client

	proc/clearstorage()
		var/obj/buttons/storage/S = null
		for(S in screen)
			screen -= S.C
			del S
		var/obj/buttons/clear/C = null
		for(C in screen)
			del C

	proc/clearall()
		var/obj/buttons/B = null
		for(B in screen)
			del B