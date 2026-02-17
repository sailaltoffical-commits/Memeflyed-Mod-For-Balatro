
SMODS.Joker{ --Nyan Cat!
    key = "nyancat",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Nyan Cat!',
        ['text'] = {
            [1] = 'All cards score {X:mult,C:white}1.5{} Mult',
            [2] = '{C:hearts}Hearts{} Turn into {X:enhanced,C:white}polychrome{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
            if context.other_card:is_suit("Hearts") then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition("e_polychrome", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Nyan!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            else
                return {
                    Xmult = 1.5,
                    message = "Nyan!"
                }
            end
        end
    end
}