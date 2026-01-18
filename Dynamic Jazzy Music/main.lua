--- STEAMODDED HEADER
--- MOD_NAME: Dynamic Jazzy Music
--- MOD_ID: DynamicJazzyMusic
--- PREFIX: DJM
--- MOD_AUTHOR: [Rose]
--- MOD_DESCRIPTION: This mod uses music made by "Dom Palombi", this makes the boss music, endless mode, buffon and spectral booster packs upbeat and funk jazz, all mentioned being remixes, endless bosses having a new track call "Raise The Stakes" and showdown bosses have one called "FLUSH FIVE"", you can find the music used on the youtube channel "Dom Palombi", please check them out they are amazing musicians!
local DynamicJazzyMusic  = SMODS.current_mod
local config = DynamicJazzyMusic.config

function DynamicJazzyMusic.config_tab()
local vertical_tabs = {}
    return {n=G.UIT.ROOT, config = {padding = 0.0, colour = G.C.BLACK}, nodes = {
		{n = G.UIT.C, config = { align = "cl", minw = G.ROOM.T.w*0, padding = 0.04 }, nodes = {
        create_option_cycle({label = 'Spectral Pack - Planet Pack (Drum and Bass)', current_option = DynamicJazzyMusic.config.DJM_SP_DB , options = {'Off', 'Original', 'Slow Version'}, ref_table = DynamicJazzyMusic.config, ref_value = 'DJM_SP_DB', text_scale=0.5*0.65/(5/6), scale=5/6, no_pips = true, opt_callback = 'cycle_update'}),
        create_toggle({label = 'Buffoon Pack - Tarot Pack (Reggae-Funk)', ref_table = DynamicJazzyMusic.config, ref_value = 'DJM_BP_RF', callback = function() DynamicJazzyMusic:save_config() end}),
		create_toggle({label = 'Boss Blind - Boss Blind (Disco-Funk)', ref_table = DynamicJazzyMusic.config, ref_value = 'DJM_BB_DF', callback = function() DynamicJazzyMusic:save_config() end}),
		create_toggle({label = 'Showdown Ante - Main Theme (Band-Jazz)', ref_table = DynamicJazzyMusic.config, ref_value = 'DJM_SA_BJ', callback = function() DynamicJazzyMusic:save_config() end}),
		create_toggle({label = 'Showdown Blind - Flush Five', ref_table = DynamicJazzyMusic.config, ref_value = 'DJM_SB_FF', callback = function() DynamicJazzyMusic:save_config() end}),
		create_toggle({label = 'Endless Blind - Main Theme (Funk-Fusion)', ref_table = DynamicJazzyMusic.config, ref_value = 'DJM_EB_FF', callback = function() DynamicJazzyMusic:save_config() end}),
		create_toggle({label = 'Endless Shop - Shop (Bossa-Nova)', ref_table = DynamicJazzyMusic.config, ref_value = 'DJM_ES_BN', callback = function() DynamicJazzyMusic:save_config() end}),
		create_toggle({label = 'Endless Boss Blind - Raise The Stakes', ref_table = DynamicJazzyMusic.config, ref_value = 'DJM_EBB_RTS', callback = function() DynamicJazzyMusic:save_config() end})
    }},
    }}
end

function DynamicJazzyMusic.save_config(self)
    SMODS.save_mod_config(self)
end

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
        local check = G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].ability.set == "Spectral"
        if config.DJM_SP_DB == 3 then return check and 0 or false
        else return false end
    end
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_spectral_funk",
    path = "SpectralFunk.ogg",
    select_music_track = function()
        local check = G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].ability.set == "Spectral"
        if config.DJM_SP_DB == 2 then return check and 0 or false
        else return false end
    end
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_buffoon_funk",
    path = "BuffoonFunk.ogg",
    select_music_track = function()
        local check = G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].ability.set == "Joker"
        if config.DJM_BP_RF == true then return check and 0 or false
        else return false end
    end
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_raise_the_stakes",
    path = "RAISETHESTAKES.ogg",
    select_music_track = function()
        local check = G.GAME and G.GAME.blind and G.GAME.round_resets.ante > 8 and (G.GAME.blind.config.blind.boss and not G.GAME.blind.config.blind.boss.showdown)
        if config.DJM_EBB_RTS == true then return check and 1 or false
        else return false end
    end
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_boss_funk",
    path = "BossFunk.ogg",
    select_music_track = function()
        local check = G.GAME and G.GAME.blind and (G.GAME.blind.config.blind.boss and not G.GAME.blind.config.blind.boss.showdown)
        if config.DJM_BB_DF == true then return check and 1 or false
        else return false end
    end
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_first_to_fold",
    path = "FirstToFold.ogg",
    select_music_track = function()
        local check = G.GAME and (G.GAME.blind or G.shop) and G.P_BLINDS[G.GAME.round_resets.blind_choices.Boss].boss.showdown
        if config.DJM_SA_BJ == true then return check and 0 or false
        else return false end
    end
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_flush_five",
    path = "FLUSHFIVE.ogg",
    select_music_track = function()
        local check = G.GAME and G.GAME.blind and (G.GAME.blind.config.blind.boss and G.GAME.blind.config.blind.boss.showdown)
        if config.DJM_SB_FF == true then return check and 2 or false
        else return false end
    end
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_endless",
    path = "Endless.ogg",
    select_music_track = function()
        local check = G.GAME and G.GAME.blind and G.GAME.round_resets.ante > 8 and not G.shop
        if config.DJM_EB_FF == true then return check and 0 or false
        else return false end
    end
})

SMODS.Sound({
    vol = 0.6,
    pitch = 1,
    key = "music_endless_shop",
    path = "EndlessShop.ogg",
    select_music_track = function()
        local check = G.GAME and G.shop and G.GAME.round_resets.ante > 8
        if config.DJM_ES_BN == true then return check and 0 or false
        else return false end
    end
})
