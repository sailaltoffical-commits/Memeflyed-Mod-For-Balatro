
SMODS.Joker{ --Knuckles
    key = "knuckles",
    config = {
        extra = {
            xmult0 = 2,
            sell_value0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Knuckles',
        ['text'] = {
            [1] = '{X:mult,C:white}2X{} Mult per {C:clubs}Clubs{} Card',
            [2] = '{C:money}1 sell value{} to all jokers if {C:dark_edition}Sanic the Hegehog{} is owned',
            [3] = ''
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then
                return {
                    Xmult = 2
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_sanicthehegehog" then 
                        return true
                    end
                end
            end)() then
                return {
                    func = function()
                        for i, target_card in ipairs(G.jokers.cards) do
                            if target_card.set_cost then
                                target_card.ability.extra_value = (card.ability.extra_value or 0) + 1
                                target_card:set_cost()
                            end
                        end
                        return true
                    end,
                    message = "All Jokers +"..tostring(1).." Sell Value"
                }
            end
        end
    end
}