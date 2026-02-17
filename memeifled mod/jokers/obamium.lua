
SMODS.Joker{ --Obamium
    key = "obamium",
    config = {
        extra = {
            emult0 = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Obamium',
        ['text'] = {
            [1] = '{X:tarot,C:white}1,2^ Mult{} Per Card Played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
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
        if context.individual and context.cardarea == G.play  then
            return {
                e_mult = 1.2,
                message = "OBAMA"
            }
        end
    end
}