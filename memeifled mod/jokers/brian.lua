
SMODS.Joker{ --Brian
    key = "brian",
    config = {
        extra = {
            odds = 2,
            dollars0 = 2,
            odds2 = 6,
            dollars = 0,
            odds3 = 4,
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Brian',
        ['text'] = {
            [1] = '{C:green}1 in 2{} Chance to double money',
            [2] = '{C:green}1 in 4{} Chance to double Mult per played card',
            [3] = '{C:green}1 in 6{} chance to lose all your money'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_memeifled_brian')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_memeifled_brian')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_memeifled_brian')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_3b9ac2c2', 1, card.ability.extra.odds, 'j_memeifled_brian', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars * 2
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Brian!", colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                elseif true then
                    if SMODS.pseudorandom_probability(card, 'group_0_c2da8d48', 1, card.ability.extra.odds2, 'j_memeifled_brian', false) then
                        SMODS.calculate_effect({
                            func = function()
                                
                                local current_dollars = G.GAME.dollars
                                local target_dollars = 0
                                local dollar_value = target_dollars - current_dollars
                                ease_dollars(dollar_value)
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "BRIAN!!!!!", colour = G.C.MONEY})
                                return true
                            end}, card)
                        end
                    end
                end
                if context.individual and context.cardarea == G.play  then
                    if true then
                        if SMODS.pseudorandom_probability(card, 'group_0_cc876edf', 1, card.ability.extra.odds3, 'j_memeifled_brian', false) then
                            SMODS.calculate_effect({Xmult = 2}, card)
                        end
                    end
                end
            end
        }