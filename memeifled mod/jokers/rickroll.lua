
SMODS.Joker{ --Rick Roll
    key = "rickroll",
    config = {
        extra = {
            odds = 4,
            card_draw0 = -2,
            odds2 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Rick Roll',
        ['text'] = {
            [1] = '{C:green}1 in 4{} Chance that played {C:hearts}Hearts{} give you a {C:dark_edition}negative{} {X:tarot,C:white} \"lovers\"{} Tarrot card',
            [2] = '{C:green}1 in 2{} chance to subtract {C:red}-2{} cards from your hand per hand played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_memeifled_rickroll')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_memeifled_rickroll')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                if SMODS.pseudorandom_probability(card, 'group_0_c1814880', 1, card.ability.extra.odds, 'j_memeifled_rickroll', false) then
                    for i = 1, 1 do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                end
                                
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Tarot', edition = 'e_negative', key = 'c_lovers'})                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and localize('k_plus_tarot') or nil, colour = G.C.PURPLE})
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if G.hand and #G.hand.cards > 0 then
                    SMODS.draw_cards(-2)
                end
                return {
                    message = "+"..tostring(-2).." Cards Drawn"
                }
            end
        end
    end
}