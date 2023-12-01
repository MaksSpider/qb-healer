# qb-healer
Simple healer ped script for QBCore

# creating new ped
[1] = { 
ped = 's_m_m_doctor_01', -- ped name from https://docs.fivem.net/docs/game-references/ped-models/
scenario = 'WORLD_HUMAN_CLIPBOARD', -- scenario name from https://wiki.rage.mp/index.php?title=Scenarios
coords = vector4(3578.67, 3766.32, 29.98, 244.62), -- location
shouldRevive = true, -- should revive or only heal hp
time = 10000, -- time to wait
price = 100, -- price of this action, if 0 then its free
blip = { -- nil to disable, https://docs.fivem.net/docs/game-references/blips/ 
  name = "Healer", -- name of blip
  color = 1, -- color of blip
  sprite = 1, -- sprite of blip
  scale = 1.0  -- scale of blip
  } 
}
