
SMODS.Voucher {
    key = 'hampter',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            item_rate0 = 2
        } 
    },
    loc_txt = {
        name = 'Hampter',
        text = {
            [1] = 'X2 More Meme Jokers'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.original_meme_mod = G.GAME.original_meme_mod * 2               
                    return true
                end
            }))
        }
    end
}