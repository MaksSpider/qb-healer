# qb-healer
Simple healer ped script for QBCore

# Creating new ped
[1] = { 
ped = 's_m_m_doctor_01', -- ped name from https://docs.fivem.net/docs/game-references/ped-models/ </br>
scenario = 'WORLD_HUMAN_CLIPBOARD', -- scenario name from https://wiki.rage.mp/index.php?title=Scenarios </br>
coords = vector4(3578.67, 3766.32, 29.98, 244.62), -- location </br>
shouldRevive = true, -- should revive or only heal hp </br>
time = 10000, -- time to wait </br>
price = 100, -- price of this action, if 0 then its free </br>
blip = { -- nil to disable, https://docs.fivem.net/docs/game-references/blips/ </br>
  name = "Healer", -- name of blip </br>
  color = 1, -- color of blip </br>
  sprite = 1, -- sprite of blip </br>
  scale = 1.0  -- scale of blip </br>
  } 
}
