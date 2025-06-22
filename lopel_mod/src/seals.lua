-- texture atlas
SMODS.Atlas {
    key = "SealAtlas",
    path = "SealAtlas.png",
    px = 71,
    py = 95
}




-- cursed seal
SMODS.Seal {
    key = "Cursed",
    atlas = "SealAtlas",
    pos = { x = 0, y = 0},
    badge_colour = HEX("1A140F"),

    sound = {sound = "crumple1", per = 1.0, vol = 1.0},
}


