return {
    descriptions = {
        Joker = {
            j_GPJP_ticketToRideJoker = {
                name = "Ticket To Ride",
                text = {
                    "For every card played:",
                    "- if the card is not a face card - stores {C:mult}+#1# {} mult",
                    "- if the card is a face card - gives stored mult and resets",
                    "{C:inactive}(Currently:{} {C:mult}+#2#{} {C:inactive}mult){}"
                },
            },

            j_GPJP_natOneJoker = {
                name = "Natural 1",
                text = {
                    "changes all {C:attention}probabilites{} to {C:green}0{}"
                },
            },

            j_GPJP_knockOffJoker = {
                name = "Knock-off",
                text = {
                    "Copies half of the",
                    "{C:mult}+mult{} {C:chips}+chips{}",
                    "{X:mult,C:white}xmult{} {X:chips,C:white}xchips{}",
                    "given by the {C:attention}Joker{} to the left",
                }
            },

            j_GPJP_michel = {
                name = "Mikel",
                text = {
                    "{C:mult}+#1#{} mult",
                    "{C:green}#2# in #3#{} chance that it's destroyed at the end of the round"
                }
            },

            j_GPJP_gros_joker = {
                name = "Gros Jocher",
                text = {
                    "{C:mult}+#1#{} mult"
                }
            },

            j_GPJP_robo_joker = {
                name = "Robo-Joker",
                text = {
                    "Retriggers all:",
                    "{C:attention}Steel{}, {C:attention}Gold{}",
                    "{C:attention}Lead{}, {C:attention}Copper{}",
                    "cards #1# times"
                },
                unlock = {
                    "Have at least {C:attention}#1#{}",
                    "{C:attetnion}metal cards{}",
                    "in your deck"
                }
            },

            j_GPJP_scrabble = {
                name = "hasbro dont sue",
                text = {
                    "Gives {C:chips}+#1#{} chips",
                    "for every letter in the",
                    "name of the joker to the right",
                    -- "",
                    -- "If the name has more",
                    -- "than {C:attention}#2#{} letters",
                    -- "then gives also {X:chips,C:white}x#3#{} chips",
                    "{C:inactive}(current bonus: {}{C:chips}+#4#{}{C:inactive}){}"
                }
            },



            -- champion jokers
            j_GPJP_titanMonster_t1 = {
                name = "The Titan",
                text = {
                    "Gives {X:mult,C:white}x#2#{} mult",
                    "for every card below deck size",
                    "{C:inactive}(Current value:{} {X:mult,C:white}x#3#{}{C:inactive}){}",
                    "{B:1,V:2,E:1} Ability: {}",
                    "{C:attention} Unending Depths{}"
                }
            }

        },

        twisted_tarot = {
            c_GPJP_twistedTower = {
                name = "The Pit",
                text = {
                    "Enhances {C:attention}#1#{}", "selected card to", "{C:attention}Uranium Card{}"
                },
            },

            c_GPJP_twistedHangedMan = {
                name = "The Impaled",
                text = {
                    "Add a {V:1}Cursed Seal{}", "to {C:attention}#1#{} selected", "card in your hand",
                }
            }
            
        },

        ability = {
            c_GPJP_titanMonster_ability = {
                name = "Unending Depths",
                text = {
                    "Discard every card",
                    "in your hand"
                }
            }
        },
        
        Enhanced = {
            m_GPJP_uraniumEnhance = {
                name = "Uranium",
                text = {
                    "{X:chips,C:white}x#1#{} chips{}",
                    "Has no suit and rank",
                    "Has a {C:green}#3# in #2#{} chance to decay into a #4# card"
                },
            },

            m_GPJP_leadEnhance = {
                name = "Lead",
                text = {
                    "{X:chips,C:white}x#1#{} chips{}",
                    "while this card",
                    "stays in hand"
                },
            },
        },


        Edition = {
            e_GPJP_incorp = {
                name = "Incorporeal",
                text = {"+#1# consumable slot", "destroys itself after the round"}
            },

            -- e_GPJP_incorp_consumable = {
            --     name = "Incorporeal",
            --     text = {"+#1# consumable slot"}
            -- }
        },



        Other = {
            GPJP_cursed_seal = {
                name = "Cursed Seal",
                text = {
                    "Card can't be",
                    "{C:attention}debuffed{} or {C:attention}removed{}",
                },
            },

            undiscovered_twisted_tarot = {
                name = "Not Discovered",
                text = {
                "Find this card",
                "in an unseeded run",
                "to discover it's secrets"
                }
            },

            undiscovered_ability = {
                name = "Not Discovered",
                text = {
                    "Find the source",
                    "of this ability",
                    "to learn what it does"
                }
            }

            
        },

    },


    misc = {
        labels = {
            GPJP_cursed_seal = "Cursed Seal",
            k_GPJP_monsterrarity = "Champion",
            GPJP_incorp = "Incorporeal"

        },

        dictionary = {
            k_GPJP_monsterrarity = "Champion",
            k_twisted_tarot = "Twisted Tarot",
            b_twisted_tarot_cards = "Twisted Tarot Cards",

            k_ability = "Ability",
            b_ability_cards = "Ability Cards"
        }
    },
}