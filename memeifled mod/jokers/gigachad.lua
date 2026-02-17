
SMODS.Joker{ --(Giga) Chad
    key = "gigachad",
    config = {
        extra = {
            repetitions0 = 4,
            mult0 = 69
        }
    },
    loc_txt = {
        ['name'] = '(Giga) Chad',
        ['text'] = {
            [1] = 'Repeats first card played 4 times',
            [2] = '{X:mult,C:white}+69 Mult{} Per hand played',
            [3] = 'Gives the {X:tarot,C:white}Strength{} Tarrot Card Per Round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        if context.setting_blind  then
            return {
                func = function()
                    
                    for i = 1, 1 do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                end
                                
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Tarot', edition = 'e_negative', key = 'c_strength'})                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "CHAD", colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    repetitions = 4,
                    message = "CHAD"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 69
            }
        end
    end
}