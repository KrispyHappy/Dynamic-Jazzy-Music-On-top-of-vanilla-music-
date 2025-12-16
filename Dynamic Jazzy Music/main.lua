--- STEAMODDED HEADER
--- MOD_NAME: Dynamic Jazzy Music
--- MOD_ID: DynamicJazzyMusic
--- PREFIX: DJM
--- MOD_AUTHOR: [Rose]
--- MOD_DESCRIPTION: This mod uses music made by "Dom Palombi", this makes the boss music, endless mode, buffon and spectral booster packs upbeat and funk jazz, all mentioned being remixes, endless bosses having a new track call "Raise The Stakes" and showdown bosses have one called "FLUSH FIVE"", you can find the music used on the youtube channel "Dom Palombi", please check them out they are amazing musicians!
if SMODS.Atlas then
  SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 34,
    py = 34
  })
end

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_spectral_funk_slow",
    path = "SpectralFunkSlow.ogg",
    select_music_track = function()
        return (G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].ability.set == "Spectral") and 0 or false
    end,
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_buffoon_funk",
    path = "BuffoonFunk.ogg",
    select_music_track = function()
        return (G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].ability.set == "Joker") and 0 or false
    end,
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_raise_the_stakes",
    path = "RAISETHESTAKES.ogg",
    select_music_track = function()
        return (G.GAME and G.GAME.blind and G.GAME.round_resets.ante > 8 and (G.GAME.blind.config.blind.boss and not G.GAME.blind.config.blind.boss.showdown)) and 1 or false
    end,
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_boss_funk",
    path = "BossFunk.ogg",
    select_music_track = function()
        return (G.GAME and G.GAME.blind and (G.GAME.blind.config.blind.boss and not G.GAME.blind.config.blind.boss.showdown)) and 1 or false
    end,
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_first_to_fold",
    path = "FirstToFold.ogg",
    select_music_track = function()
        return ((G.GAME or (G.GAME and G.shop)) and G.GAME.round_resets.ante == (8 or 16 or 24 or 32)) and 0 or false
    end,
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_flush_five",
    path = "FLUSHFIVE.ogg",
    select_music_track = function()
        return (G.GAME and G.GAME.blind and (G.GAME.blind.config.blind.boss and G.GAME.blind.config.blind.boss.showdown)) and 2 or false
    end,
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_endless",
    path = "Endless.ogg",
    select_music_track = function()
        return (G.GAME and G.GAME.blind and G.GAME.round_resets.ante > 8 and not G.shop) and 0 or false
    end,
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_endless_shop",
    path = "EndlessShop.ogg",
    select_music_track = function()
        return (G.GAME and G.shop and G.GAME.round_resets.ante > 8) and 0 or false
    end,
})
