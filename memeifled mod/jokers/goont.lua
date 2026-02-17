
SMODS.Joker{ --Goont
    key = "goont",
    config = {
        extra = {
            Randomizer = 0,
            Highest = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Goont',
        ['text'] = {
            [1] = 'Adds 50-100 {X:chips,C:white}chips{} Per hand',
            [2] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = "memeifled_original_meme",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["memeifled_memeifle_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.Randomizer, card.ability.extra.Highest, card.ability.extra.var1}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.var1 = (card.ability.extra.var1) + pseudorandom('RANGE:50|100', 50, 100)
        end
    end
}