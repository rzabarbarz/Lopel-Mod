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

-- reverse hanged man
SMODS.Consumable {
    key = "reverseHangedManTarot",

    atlas = "ReverseTarotAtlas",
    pos = { x = 2, y = 1 },

    cost = 4,

    set = "ReverseTarot",

    hidden = true,
    soul_set = "Tarot",
    soul_rate = 0.08,

    config = { extra = { seal = "lopel_Cursed" }, max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted, colours = {HEX("1A140F")}} }
    end,
    use = function(self, card, area, copier)
        -- sendInfoMessage(type(G.P_SEALS["Cursed"]), "chuj")
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_seal(card.ability.extra.seal, false, true)
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,



}