//Checked

mob/ghost/spirit
	icon_state = "spirit"

	New()
		src.icon += rgb(rand(0,255),rand(0,255),rand(0,255))

	bound
		var/atom/boundto = null
		var/mob/host = null
		New()
			host = locate(/mob/ghost)
			host.key = src.key
			del host
		verb/say(msg as text)
			view() << " [boundto.name] hisses,<I> \"[msg]\"</I>"