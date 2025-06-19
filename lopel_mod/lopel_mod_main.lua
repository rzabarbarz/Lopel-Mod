

-- joker texture atlas
SMODS.Atlas {
    key = "JokerAtlas",
    path = "JokerAtlas.png",
    px = 71,
    py = 95
}




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

    discovered = true,

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