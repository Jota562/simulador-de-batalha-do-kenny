local utils = require "utils"
local action = {}

action.list = {}

function action.build()
    -- reset list

    action.list = {}

    local swordatk = {
        description = "Ataque cortante com espada.",
        requirement = nil , 
        execute = function (playerdata, creaturedata)
            -- HitChance
            local successChance = creaturedata.speed == 0 and 1 or playerdata.speed / creaturedata.speed
            local success = math.random() <= successChance 

            -- Damage calc

            local rawdgm = playerdata.attack - math.random() * creaturedata.defense
            local damage = math.max(1, math.ceil(rawdgm))

            -- result

            if success then   
              creaturedata.health = creaturedata.health - damage             
              print(string.format("você atacou a criatura, e causou %d de dano.", damage))

              local healthrate = math.floor((creaturedata.health / creaturedata.maxhealth) *10)              
              print(string.format("%s . %s", creaturedata.name , utils.getProgressBar(healthrate)))
              

            else 
                print(string.format("você errou o o alvo"))
            end    
        end
    }

    -- ataque a distancia 
    local throw = {
        description = "Atirar pedra.",
        requirement = nil , 
        execute = function (playerdata, creaturedata)
            -- HitChance
            local successChance = creaturedata.speed *1.5 == 0 and 1 or playerdata.speed / creaturedata.speed
            local success = math.random() <= successChance 

            -- Damage calc

            local rawdgm = playerdata.attack  - math.random() * creaturedata.defense
            local damage = math.max(1, math.ceil(rawdgm * 0.3))

            -- result

            if success then   
              creaturedata.health = creaturedata.health - damage             
              print(string.format("Com uma bela pontaria voce acertou o %s, e causou %d de dano.",creaturedata.name, damage))

              local healthrate = math.floor((creaturedata.health / creaturedata.maxhealth) *10)              
              print(string.format("%s . %s", creaturedata.name , utils.getProgressBar(healthrate)))
              

            else 
                print(string.format("Errou, errou feio, errou ruuuude."))
            end    
        end
    }

    -- healing 

    local regenPotion = {
        description = "Esquivar e tentar se recuperar.",
        requirement = function(playerData, creatureData)
            return playerData.run >= 1
        end,
        execute = function(playerData, creatureData)
            -- TSe afastar e procurar se repor
            playerData.run = playerData.run - 1

            -- Descansou        
            local regenPoints = 15
            playerData.health = math.min(playerData.maxHealth, playerData.health + regenPoints)
            print(string.format("Voce se afastou e conseguiu pegar folego, agora, de volta a batalha!"))
            

        end
    }

    -- pupulate list 
       action.list [#action.list+1] = swordatk
       action.list [#action.list+1] = regenPotion
       action.list [#action.list+1] = throw
    
end
---lista de ações validas 
---@param playerdata table
---@param creaturedata table
---@return table
function action.getValidActions(playerdata, creaturedata)
    local validActions = {}
    for _, action in pairs(action.list) do
        local requirement = action.requirement
        local isValid = requirement == nil or requirement(playerdata, creaturedata)
        if isValid then 
            validActions [#validActions+1] = action
        end
        
    end
    return validActions

    
end



return action
