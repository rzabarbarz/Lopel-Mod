-- texture atlas
SMODS.Atlas {
    key = "ReverseTarotAtlas",
    path = "ReverseTarotAtlas.png",
    px = 71,
    py = 95
}

-- type
SMODS.ConsumableType {
    key = "ReverseTarot",
    primary_colour = G.C.WHITE,
    secondary_colour = HEX("2A0C75"),

    shop_rate = 0.0,

    loc_txt = {
        name = "Reverse Tarot",
        collection = "sdraC toraT",
        undiscovered = {
            name = "derevocsiD toN",
            text = {"?????"}

        }

    }
}

-- reverse tower
SMODS.Consumable {
    key = "reverseTowerTarot",

    config = {
        max_highlighted = 1,
        mod_conv = "m_lopel_uraniumEnhance"
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {vars = { card.ability.max_highlighted} }
    end,

    atlas = "ReverseTarotAtlas",
    pos = { x = 6, y = 1 },

    cost = 4,

    set = "ReverseTarot",

    hidden = true,
    soul_set = "Tarot",
    soul_rate = 0.08,
}