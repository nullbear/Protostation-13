/obj/item/rod
	name = "rod"
	desc = "a thick bar used for construction."
	icon = 'icons/obj/material/rod.dmi'

	damtype = list("brute" = 1, "edge" = 0, "sharp" = 0.1) // Rods have a rather dull edge, but are still narrow enough that with enough force, you could thrust it through someone/something.

/obj/item/rod/update_icon()
	if (contents.len)
		name = "rods"
		desc = "a stack of thick bars used for construction; there are [contents.len+1] rods in the stack."

		var/icon/I = new/icon('icons/blank.dmi')
		var/icon/J = new/icon('icons/obj/material/rod.dmi')
		var/posx = -6
		var/posy = -6
		J.Blend(material.color, ICON_MULTIPLY)
		I.Blend(I, ICON_OVERLAY, posx, posy)
		for(var/obj/item/rod/R in contents)
			if (posx == 6)
				posx = -6
				posy += 3
			else
				posx += 3
			J = R.icon
			I.Blend(J, ICON_OVERLAY, posx, posy)
		icon = I
	else
		name = "rod"
		desc = "a thick bar used for construction."
		var/icon/I = new/icon('icons/obj/material/rod.dmi')
		I.Blend(material.color, ICON_MULTIPLY)
		icon = I