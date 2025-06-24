-- texture atlas
SMODS.Atlas {
    key = "MonsterAtlas",
    path = "ChampionAtlas.png",
    px = 71,
    py = 95
}

-- joker rarity
SMODS.Rarity {
    key = "monsterRarity",
    badge_colour = HEX("FCCD49"),
    
}


-- ability consumable type
SMODS.ConsumableType {
    key = "ability",
    primary_colour = HEX("7E7E7E"),
    secondary_colour = HEX("DDDDDD"),

    collection_rows = {5, 6},

    shop_rate = 0.0,
}







-- the Titan
-- tier 1
SMODS.Joker {
    key = "titanMonster_t1",
    atlas = "MonsterAtlas",
    pos = {x=0, y=0},
    rarity = "lopel_monsterRarity",

    config = {
        extra = {
            ability_card = "c_lopel_titanMonster_ability",
        }
    },

    loc_vars = function (self, info_queue, card)
        return { vars = {card.ability.extra.ability_card, colours = {HEX("DDDDDD"), HEX("7E7E7E")}}}
    end,

    calculate = function (self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                func = function ()
                    SMODS.add_card({
                        area = G.consumeables,
                        key = "c_lopel_titanMonster_ability",
                        edition = "e_lopel_incorp"
                    })
                    return true
                end
            }))
        end
    end
}

-- tier 2
SMODS.Joker {
    key = "titanMonster_t2",
    atlas = "MonsterAtlas",
    pos = {x=1, y=0},
    rarity = "lopel_monsterRarity"
}

-- ability card
SMODS.Consumable {
    key = "titanMonster_ability",
    atlas = "MonsterAtlas",
    pos = {x=2, y=0},
    set = "ability",
    cost = 0,

    config = {},


    calculate = function (self, card, context)
        if context.end_of_round and context.cardarea == G.consumeables then
            SMODS.destroy_cards(card)
        end
    end,

    use = function (self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.FUNCS.draw_from_hand_to_discard()
                return true
            end
        }))
    end,

    can_use = function (self, card)
        return #G.hand.cards > 0
    end

}