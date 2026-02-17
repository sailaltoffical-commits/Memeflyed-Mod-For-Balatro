
SMODS.Shader({ key = 'laminated', path = 'laminated.fs' })

SMODS.Edition {
    key = 'memey',
    shader = 'laminated',
    config = {
        extra = {
            dollars0 = 1.5,
            xmult0 = 1.5
        }
    },
    in_shop = false,
    weight = 1.75,
    apply_to_float = true,
    sound = { sound = "voice1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Memey',
        label = 'Memey',
        text = {
            [1] = ''
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
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
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            SMODS.calculate_effect({balance = true}, card)
            return {
                Xmult = 1.5
            }
        end
    end
}