
SMODS.Joker{ --Painful Herald
    key = "painfulherald",
    config = {
        extra = {
            odds = 12
        }
    },
    loc_txt = {
        ['name'] = 'Painful Herald',
        ['text'] = {
            [1] = '{C:green}1 in 12{} to crash the game',
            [2] = '{C:uncommon}1 in 4{} to get a random tarrot card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_memeifled_painfulherald') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_32cb0905', 1, card.ability.extra.odds, 'j_memeifled_painfulherald', false) then
                    error("EasternFarmer Was Here")
                    
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            for i = 1, 1 do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        end
                        
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Tarot', edition = 'e_negative', })                            
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
            delay(0.6)
            return {
                message = created_consumable and localize('k_plus_tarot') or nil
            }
        end
    end
}