
SMODS.Enhancement {
    key = 'memeglass',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            dollars0 = 1.5,
            odds = 12
        }
    },
    loc_txt = {
        name = 'Meme Glass',
        text = {
            [1] = '{X:money,C:white}$1.5x{} Dollars per card played and scored',
            [2] = '{C:green}1 in 12{} chance to break'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * 1.5
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "X"..tostring(1.5), colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            if SMODS.pseudorandom_probability(card, 'group_0_95b4dc5c', 1, card.ability.extra.odds, 'j_memeifled_memeglass', false) then
                context.other_card.should_destroy = true
                card.should_destroy = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("paper1")
                        SMODS.calculate_effect({message = "Bye bye!"}, card)
                        return true
                    end,
                }))
                
            end
        end
    end
}