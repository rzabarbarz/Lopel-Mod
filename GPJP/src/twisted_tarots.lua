-- texture atlas
SMODS.Atlas {
    key = "TwistedTarotAtlas",
    path = "TwistedTarotAtlas.png",
    px = 71,
    py = 95
}

-- type
SMODS.ConsumableType {
    key = "twisted_tarot",
    primary_colour = G.C.WHITE,
    secondary_colour = HEX("2A0C75"),

    collection_rows = {5, 6},

    shop_rate = 0.0,


}

-- reverse tower
SMODS.Consumable {
    key = "twistedTower",

    config = {
        max_highlighted = 1,
        mod_conv = "m_GPJP_uraniumEnhance"
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return {vars = { card.ability.max_highlighted} }
    end,

    atlas = "TwistedTarotAtlas",
    pos = { x = 6, y = 1 },

    cost = 4,

    set = "twisted_tarot",

    hidden = true,
    soul_set = "Tarot",
    soul_rate = 0.08,
}

-- reverse hanged man
SMODS.Consumable {
    key = "twistedHangedMan",

    atlas = "TwistedTarotAtlas",
    pos = { x = 2, y = 1 },

    cost = 4,

    set = "twisted_tarot",

    hidden = true,
    soul_set = "Tarot",
    soul_rate = 0.08,

    config = { extra = { seal = "GPJP_Cursed" }, max_highlighted = 1 },
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

        -- conv_card.config.seal

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