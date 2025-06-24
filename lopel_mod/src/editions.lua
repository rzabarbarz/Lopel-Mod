-- incorporeal (for cards that are tomporary/shouldnt take up a slot)
SMODS.Edition {
    key = "incorp",
    shader = false,

    in_shop = false,

    apply_to_float = true,

    config = {card_limit = 1},

    loc_vars = function (self, info_queue, card)
        return {vars = {card.edition.card_limit}}
    end

}