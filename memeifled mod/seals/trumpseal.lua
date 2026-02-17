
SMODS.Seal {
    key = 'trumpseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            dollars0 = 5,
            chips0 = -2,
            mult0 = -4
        }
    },
    badge_colour = HEX('4ECDC4'),
    loc_txt = {
        name = 'Trump Seal',
        label = 'Trump Seal',
        text = {
        [1] = '{C:money}+5 Dollars {} for each card scored {C:hearts}-2 Chips and {C:red}-4 Mult)'
    }
},
atlas = 'CustomSeals',
unlocked = true,
discovered = true,
no_collection = false,
calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.play then
        return {
            
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + 5
                local dollar_value = target_dollars - current_dollars
                ease_dollars(dollar_value)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Tariff!", colour = G.C.MONEY})
                return true
            end,
            extra = {
                chips = -2,
                colour = G.C.CHIPS,
                extra = {
                    mult = -4
                }
            }
        }
    end
end
}