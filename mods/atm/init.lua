-- Copyright (c) 2016, 2017, 2018 Gabriel Pérez-Cerezo, licensed under WTFPL.
-- Wire Transfers (c) 2018 Hans von Smacker
-- Large ATMs (C) 2017 Hans von Smacker

atm = {
  balance = {},
  startbalance = 200,
  pending_transfers = {},
  completed_transactions = {},
  pth = minetest.get_worldpath().."/atm_accounts",
  pth_wt = minetest.get_worldpath().."/atm_wt_transactions"
}


local modpath = minetest.get_modpath("atm")

dofile(modpath .. "/common.lua")
dofile(modpath .. "/forms.lua")
dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/receive_fields.lua")
dofile(modpath .. "/receive_fields_wt.lua")
dofile(modpath .. "/crafts.lua")
dofile(modpath .. "/interest.lua")
