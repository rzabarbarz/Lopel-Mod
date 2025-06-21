-- texture atlas
SMODS.Atlas {
    key = "JokerAtlas",
    path = "JokerAtlas.png",
    px = 71,
    py = 95
}


-- Ticket To Ride
SMODS.Joker {
    key = "ticketToRideJoker",

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



-- nat 1
SMODS.Joker {
    key = "natOneJoker",

    rarity = 2,

    atlas = "JokerAtlas",
    pos = {x = 2, y = 0},

    cost = 3,
    blueprint_compat = false,

    config = {
        storedProbabilities = {},
        oopsCount = 0,
    },

    add_to_deck = function(self, card, from_debuff)
        card.ability.oopsCount = #SMODS.find_card("j_oops", true)
        for k, v in pairs(G.GAME.probabilities) do
            card.ability.storedProbabilities[k] = v
            G.GAME.probabilities[k] = 0
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        oopsDifference = #SMODS.find_card("j_oops", true) - card.ability.oopsCount

        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = (card.ability.storedProbabilities[k] * (2^oopsDifference))
        end
    end,
}