
SMODS.Joker{ --Pepe
    key = "pepe",
    config = {
        extra = {
            PEPEvalue = 30,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pepe',
        ['text'] = {
            [1] = 'Start with {C:red,X:mult,C}#1# XMult{}',
            [2] = 'Lose {X:mult,C:white}1.2x{} Per Round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
    pools = { ["memeifled_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.PEPEvalue, card.ability.extra.var1}}
    end,
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.var1 = (card.ability.extra.var1) + 1
                    return true
                end
            }
        end
        if context.starting_shop  then
            return {
                func = function()
                    card.ability.extra.PEPEvalue = (card.ability.extra.PEPEvalue) / 1.2
                    return true
                end,
                message = "/ 1.2"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.PEPEvalue,
                message = "Pepe!"
            }
        end
    end
}