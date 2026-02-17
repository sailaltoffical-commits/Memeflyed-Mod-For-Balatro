
SMODS.Booster {
    key = 'meme_pack',
    loc_txt = {
        name = "Meme Pack",
        text = {
            [1] = 'A {C:purple}custom{} booster pack with {C:blue}unique{} cards.'
        },
        group_name = "memeifled_boosters"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    kind = 'original_meme',
    group_key = "memeifled_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Joker",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("8b572a"))
        ease_background_colour({ new_colour = HEX('8b572a'), special_colour = HEX("4a90e2"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    