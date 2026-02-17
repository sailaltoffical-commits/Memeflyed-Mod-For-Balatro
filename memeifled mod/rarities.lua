SMODS.Rarity {
    key = "original_meme",
    pools = {
        ["Joker"] = true
    },
    default_weight = 1,
    badge_colour = HEX('8b572a'),
    loc_txt = {
        name = "Original meme!"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}