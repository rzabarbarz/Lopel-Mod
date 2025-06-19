

-- joker texture atlas
SMODS.Atlas {
    key = "JokerAtlas",
    path = "JokerAtlas.png",
    px = 71,
    py = 95
}

-- consumable texture atlas
SMODS.Atlas {
    key = "ConsumableAtlas",
    path = "ConsumableAtlas.png",
    px = 71,
    py = 95
}

-- enhancemet texture atlas
SMODS.Atlas {
    key = "EnhancementAtlas",
    path = "EnhancementAtlas.png",
    px = 71,
    py = 95
}


-- JOKERS

-- Stop The Bus
SMODS.Joker {
    key = "stopTheBusJoker",
    loc_txt = {
        name = "Stop The Bus",
        text = {
            "Stores {C:mult}+#1# {} Mult for every card played that isn't a face card",
            "When a face card is played adds stored mult and resets",
            "{C:inactive}(Currently:{} {C:mult}+#2#{} {C:inactive}mult){}"
        }
    },


    config = {
        increment = 3,
        stored = 0,
    },

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.increment , card.ability.stored} }
    end,

    rarity = 2,

    atlas = "JokerAtlas",
    pos = {x = 0, y = 0},

    cost = 3,
    blueprint_compat = false,

    -- discovered = true,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_face() then
                storedBuffer = card.ability.stored
                card.ability.stored = 0
                return {
                    mult = storedBuffer,
                    message_card = card,
                    message = "Reset"
                }
            
            else
                card.ability.stored = card.ability.stored + card.ability.increment
                return {
                    message_card = card,
                    colour = G.C.MULT,
                    message = "+mult"
                }
            end
        end
        

    end


}




-- CONSUMABLES

-- REVERSE TAROT

-- reverse tower
SMODS.Consumable {
    key = "reverseTowerTarot",
    loc_txt = {
        name = "rewoT ehT",
        text = {
            "Enhances {C:attention}#1#{} card into {C:attention}Uranium Card{}"
        }
    },

    config = {
        maxHighlited = 1,
        extra = "uraniumEnhance"
    },

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.maxHighlited} }
    end,

    atlas = "ConsumableAtlas",
    pos = { x = 0, y = 0 },

    cost = 4,

    set = "ReverseTarot",

    hidden = true,
    soul_set = "Tarot",
    soul_rate = 0.08,

    can_use = function(self, card)
        return (table.getn(G.hand.highlited) == card.ability.maxHighlited)
    end,

    use = function(self, card, area, copier)
        for i = 1, card.ability.max_highlighted do
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true end }))
            
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.hand.highlighted[i]:set_enhancement(card.ability.extra, nil, true)
                return true end }))
            
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end,

}




-- CONSUMABLE TYPES

-- reverse tarot
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



-- ENHANCEMETS

-- uranium card

SMODS.Enhancement {
    key = "uraniumEnhance",
    loc_txt = {
        name = "Uranium",
        text = {
            "Has no suit and rank",
            "{B:chips}x1.5{} chips"
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


}
