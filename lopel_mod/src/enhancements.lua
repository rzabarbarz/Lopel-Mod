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
            "{X:chips,C:white}x#1#{} chips{}",
            "Has no suit and rank",
            "Has a {C:green}#3# in #2#{} chance to decay into a #4# card"
        }
    },

    atlas = "EnhancementAtlas",
    pos = { x = 0, y = 0 },

    config = {
        x_chips = 1.5,
        extra = {
            decayChance = 3,
            decayEffectName = "Lead",
            decayEffect = "m_lopel_leadEnhance",
            hasDecayed = false,
        }
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.x_chips, card.ability.extra.decayChance, G.GAME.probabilities.normal, card.ability.extra.decayEffectName}}
    end,

    no_suit = true,
    no_rank = true,
    replace_base_card = true,
    always_scores = true,


    calculate = function(self, card, context) 
        if context.main_scoring and context.cardarea == G.play then
            if pseudorandom("uranium fever") < G.GAME.probabilities.normal / card.ability.extra.decayChance then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('tarot1')
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))

                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:set_ability(G.P_CENTERS[card.ability.extra.decayEffect])
                                return true
                            end,
                        }))
                        return true
                    end,
                    message = "Decayed",
                }
            end
        end

    end,

}


-- lead
SMODS.Enhancement {
    key = "leadEnhance",
    loc_txt = {
        name = "Lead",
        text = {
            "{X:chips,C:white}x#1#{} chips{}",
            "while this card",
            "stays in hand"
            }
    },

    atlas = "EnhancementAtlas",
    pos = { x = 1, y = 0},

    config = {
        h_x_chips = 1.25
        -- extra = {decayEffect = "m_lopel_leadEnhance"}
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.h_x_chips}}
    end,



}