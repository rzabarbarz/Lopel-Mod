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
                local storedBuffer = card.ability.stored
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
        if #SMODS.find_card("j_lopel_natOneJoker", true) > 0 then
            card.ability.oopsCount = SMODS.find_card("j_lopel_natOneJoker", true)[1].ability.oopsCount
            card.ability.storedProbabilities = SMODS.find_card("j_lopel_natOneJoker", true)[1].ability.storedProbabilities
        else
            card.ability.oopsCount = #SMODS.find_card("j_oops", true)
            for k, v in pairs(G.GAME.probabilities) do
                card.ability.storedProbabilities[k] = v
                G.GAME.probabilities[k] = 0
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if #SMODS.find_card("j_lopel_natOneJoker", true) == 0 then
            local oopsDifference = #SMODS.find_card("j_oops", true) - card.ability.oopsCount
            for k, v in pairs(G.GAME.probabilities) do
                G.GAME.probabilities[k] = (card.ability.storedProbabilities[k] * (2^oopsDifference))
            end
        end
    end,
}




-- Knock-off
SMODS.Joker {
    key = "knockOffJoker",

    rarity = 2,

    atlas = "JokerAtlas",
    pos = {x = 3, y = 0},

    cost = 5,
    blueprint_compat = true,

    config = {
        extra = {
            notCompatible = {
                "j_four_fingers",
                "j_mime",
                "j_credit_card",
                "j_marble",
                "j_8_ball",
                "j_dusk",
                "j_chaos",
                "j_delayed_grat",
                "j_hack",
                "j_pareidolia",
                "j_business",
                "j_space",
                "j_egg",
                "j_burglar",
                "j_dna",
                "j_splash",
                "j_sixth_sense",
                "j_faceless",
                "j_superposition",
                "j_seance",
                "j_riff_raff",
                "j_shortcut",
                "j_cloud_9",
                "j_rocket",
                "j_vagabond",
                "j_midas_mask",
                "j_luchador",
                "j_gift",
                "j_turtle_bean",
                "j_reserved_parking",
                "j_mail",
                "j_hallucination",
                "j_juggler",
                "j_drunkard",
                "j_golden",
                "j_diet_cola",
                "j_trading",
                "j_selzer",
                "j_ticket",
                "j_mr_bones",
                "j_sock_and_buskin",
                "j_troubadour",
                "j_certificate",
                "j_smeared",
                "j_hanging_chad",
                "j_rough_gem",
                "j_ring_master",
                "j_blueprint",
                "j_merry_andy",
                "j_oops",
                "j_matador",
                "j_stuntman",
                "j_invisible",
                "j_brainstorm",
                "j_satellite",
                "j_cartomancer",
                "j_astronomer",
                "j_burnt",
                "j_chicot",
                "j_perkeo",
                "j_lopel_natOneJoker",
                "j_lopel_ticketToRideJoker",

            }
        }
    },

    

    calculate = function(self, card, context)
        local other_joker = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
        end

        local otherCompat = false
        if other_joker ~= nil then
            for _, v in pairs(card.ability.extra.notCompatible) do
                if #SMODS.find_card(v, true) > 0 then
                    for _, j in pairs(SMODS.find_card(v, true)) do
                        if j == other_joker then
                            otherCompat = true
                        end
                    end
                end
            end
        else
            otherCompat = true
        end


        if not otherCompat then
            local ret = SMODS.blueprint_effect(card, other_joker, context)

            if ret ~= nil then
                local hasNum = false
                for i, v in pairs(ret) do
                    if type(v) == "string" then
                        local newString = ""
                        local startNum = nil
                        local foundNum = false
                        local foundDot = false
                        for char = 1, #v do
                            local c = v:sub(char, char)
                            if not foundNum then
                                if c:match("%d") then
                                    foundNum = true
                                    startNum = char
                                else
                                    newString = newString..c
                                end
                            else
                                if  c == "." and not foundDot then
                                    foundDot = true
                                elseif c == "." or not c:match("%d") then
                                    local num = tonumber(v:sub(startNum, char-1))
                                    num = num/2
                                    newString = newString..num
                                    newString = newString..c
                                    startNum = nil
                                    foundNum = false
                                    foundDot = false
                                end
                            end
                        end
                        ret[i] = newString
                    
                    
                    elseif type(v) == "number" then
                        hasNum = true
                        ret[i] = v/2
                    end
                end
                
                return ret
            end
        end
    end,

}