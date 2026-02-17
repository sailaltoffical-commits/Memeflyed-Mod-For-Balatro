
SMODS.Joker{ --Nerd
    key = "nerd",
    config = {
        extra = {
            xmult0 = 4,
            mult0 = -10,
            emult0 = 2,
            mult = 50
        }
    },
    loc_txt = {
        ['name'] = 'Nerd',
        ['text'] = {
            [1] = 'Add {X:mult,C:white}((mult * 4) -10)^2+50{} to Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = "memeifled_original_meme",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["memeifled_memeifle_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 4,
                extra = {
                    mult = -10,
                    extra = {
                        e_mult = 2,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            mult = 50,
                            message = "Nerd"
                        }
                    }
                }
            }
        end
    end
}