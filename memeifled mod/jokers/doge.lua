
SMODS.Joker{ --Doge
    key = "doge",
    config = {
        extra = {
            DOGEsellvalue = 7,
            DOGEaddmoney = 0,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Doge',
        ['text'] = {
            [1] = '{C:uncommon}1 in 4 {}chance{} {C:money}0 to 5{} Dollars Per round',
            [2] = '{C:money}25% of sell value{} is added to {C:money}sell value{} each round',
            [3] = '{C:gold}Gold Cards{} Can Give up to {C:money} 0 to +5{} in a {C:uncommon}1 to 4{} chance'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_memeifled_doge') 
        return {vars = {card.ability.extra.DOGEsellvalue, card.ability.extra.DOGEaddmoney, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.buying_card  then
            return {
                func = function()
                    card.ability.extra.DOGEsellvalue = (card.ability.extra.DOGEsellvalue) * 1.25
                    return true
                end,
                message = "Doge Sell Value!",
                extra = {
                    func = function()local my_pos = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card then
                                my_pos = i
                                break
                            end
                        end
                        local target_card = G.jokers.cards[my_pos]
                        target_card.ability.extra_value = card.ability.extra.DOGEsellvalue
                        target_card:set_cost()
                        return true
                    end,
                    message = "Sell Value: $"..tostring(card.ability.extra.DOGEsellvalue),
                    colour = G.C.MONEY
                }
            }
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_8bb9cb7f', 1, card.ability.extra.odds, 'j_memeifled_doge', false) then
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.DOGEaddmoney = pseudorandom('RANGE:0|5', 0, 5)
                        return true
                    end}, card)
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + card.ability.extra.DOGEaddmoney
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "DOGE Blind!", colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }