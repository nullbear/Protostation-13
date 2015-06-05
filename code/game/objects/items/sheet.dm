/obj/item/sheet
	name = "sheet"
	desc = "a thin sheet used for construction."
	icon = 'icons/obj/material/sheet.dmi'

	damtype = list("brute" = 1, "edge" = 0.1, "sharp" = 0) // Sheets have a tiny chance to slice, but not very deep.

/obj/item/sheet/update_icon()
	if (contents.len)
		name = "sheets"
		desc = "a stack of thin sheets used for construction; there are [contents.len+1] sheets in the stack."

		var/icon/I = new/icon('icons/blank.dmi')
		var/icon/J
		if (istype(material, /datum/material/enforced))
			J = new/icon('icons/obj/material/sheet_r.dmi')
		else
			J = new/icon('icons/obj/material/sheet.dmi')
		var/posy = -6
		J.Blend(material.color, ICON_MULTIPLY)
		I.Blend(I, ICON_OVERLAY, 0, posy)
		for(var/obj/item/sheet/S in contents)
			posy += 1

			J = S.icon
			if (isEven(posy))
				J.Blend(rgb(10,10,10))
			I.Blend(J, ICON_OVERLAY, 0, posy)
		icon = I
	else
		name = "sheet"
		desc = "a thin sheet used for construction."
		var/icon/I
		if (istype(material, /datum/material/enforced))
			I = new/icon('icons/obj/material/sheet_r.dmi')
		else
			I = new/icon('icons/obj/material/sheet.dmi')
		I.Blend(material.color, ICON_MULTIPLY)
		icon = I