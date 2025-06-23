-- texture atlas
SMODS.Atlas {
    key = "SealAtlas",
    path = "SealAtlas.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "CursedSealAtlas",
    path = "CursedSealAtlas.png",
    px = 71,
    py = 95
}




-- cursed seal
SMODS.Seal {
    key = "Cursed",
    atlas = "CursedSealAtlas",
    pos = { x = 0, y = 0},
    badge_colour = HEX("1A140F"),
    

    sound = {sound = "crumple1", per = 1.0, vol = 1.0},

    calculate = function (self, card, context)
        

        if context.remove_playing_cards then


            local _message = ""
            if pseudorandom("wrongReference") < G.GAME.probabilities.normal / 1984 then
                _message = "I ALWAYS COME BACK"
            else
                _message = "CURSED"
            end

            return {
                -- add self
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1 -- ?????
                        local _card = copy_card(card, nil, nil, G.playing_card, false)
                        _card:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, _card)
                        G.hand:emplace(_card)
                        _card:start_materialize(nil, true)

                        SMODS.calculate_context({playing_card_added = true, cards = {_card}})

                        return true
                    end,
                })),

                message_card = G.hand.cards[#G.hand.cards],
                colour = HEX("1A140F"),
                message = _message
                
               
            }
        end
    end,

    
    
}

SMODS.current_mod.set_debuff = function (card)
      if card.seal == "lopel_Cursed" then
        return "prevent_debuff"
      end  
end




