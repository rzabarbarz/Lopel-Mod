return {
    descriptions = {
        Joker = {
            j_lopel_ticketToRideJoker = {
                name = "Ticket To Ride",
                text = {
                    "For every card played:",
                    "- if the card is not a face card - stores {C:mult}+#1# {} mult",
                    "- if the card is a face card - gives stored mult and resets",
                    "{C:inactive}(Currently:{} {C:mult}+#2#{} {C:inactive}mult){}"
                },
            },

            j_lopel_natOneJoker = {
                name = "Natural 1",
                text = {
                    "changes all {C:attention}probabilites{} to {C:green}0{}"
                },
            },
        },

        ReverseTarot = {
            c_lopel_reverseTowerTarot = {
                name = "rewoT ehT",
                text = {
                    "Enhances {C:attention}#1#{}", "selected card to", "{C:attention}Uranium Card{}"
                },
            },
            
        },

        Enhanced = {
            m_lopel_uraniumEnhance = {
                name = "Uranium",
                text = {
                    "{X:chips,C:white}x#1#{} chips{}",
                    "Has no suit and rank",
                    "Has a {C:green}#3# in #2#{} chance to decay into a #4# card"
                },
            },

            m_lopel_leadEnhance = {
                name = "Lead",
                text = {
                    "{X:chips,C:white}x#1#{} chips{}",
                    "while this card",
                    "stays in hand"
                },
            },
        },

    },
}