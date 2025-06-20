-- texture atlas
SMODS.Atlas {
    key = "EnhancementAtlas",
    path = "EnhancementAtlas.png",
    px = 71,
    py = 95
}

-- uranium
SMODS.Enhancement {
    key = "uraniumEnhance",
    loc_txt = {
        name = "Uranium",
        text = {
            "Has no suit and rank",
            "{X:chips,C:white}x1.5{} chips{}"
        }
    },

    atlas = "EnhancementAtlas",
    pos = { x = 0, y = 0 },

    config = {
        x_chips = 1.5
    },


    no_suit = true,
    no_rank = true,
    replace_base_card = true,
    always_scores = true,

}