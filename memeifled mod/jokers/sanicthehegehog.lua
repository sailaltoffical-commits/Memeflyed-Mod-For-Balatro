
SMODS.Joker{ --Sanic the Hegehog
    key = "sanicthehegehog",
    config = {
        extra = {
            sell_value0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Sanic the Hegehog',
        ['text'] = {
            [1] = '{C:default}Changes all {C:clubs}Clubs{C:default} to {C:gold} {C:attention}Gold{} {}{}{}{}cards',
            [2] = '{C:money}+1 sell{} value to Sanic',
            [3] = '',
            [4] = '{C:blue}\"Gotta go fast\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
    pools = { ["memeifled_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_gold)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Fast!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
                local target_card = G.jokers.cards[my_pos]
                target_card.ability.extra_value = (card.ability.extra_value or 0) + 1
                target_card:set_cost()
                return {
                    message = "+"..tostring(1).." Sell Value"
                }
            end
        end
    end
}