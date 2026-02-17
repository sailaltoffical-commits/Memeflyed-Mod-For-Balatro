
SMODS.Joker{ --Troll Face
    key = "trollface",
    config = {
        extra = {
            XMult = 2,
            Chips = 50,
            dollars0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Troll Face',
        ['text'] = {
            [1] = 'Gains {X:mult,C:white}#1#x{} Mult per ante',
            [2] = 'Gains {X:chips,C:white}#2#{} Chips per antie',
            [3] = 'Lose Half Your{C:money} Money{} Per Round',
            [4] = 'Start with'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.XMult, card.ability.extra.Chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.XMult
            }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    card.ability.extra.XMult = (card.ability.extra.XMult) * 2
                    return true
                end,
                message = "Troll",
                extra = {
                    func = function()
                        card.ability.extra.Chips = (card.ability.extra.Chips) + 50
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars / 2
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "/"..tostring(2), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}