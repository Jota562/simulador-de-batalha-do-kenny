local utils = require "utils"
local action = {}

action.list = {}

function action.build()
    -- reset list

    action.list = {}
    -- ataque padrão 

    local Dig = {
        description = "Escavação compulsiva",
        requirement = nil , 
        execute = function (playerdata, creaturedata)
            -- HitChance
            local successChance = playerdata.speed == 0 and 1 or creaturedata.speed / playerdata.speed
            local success = math.random() <= successChance 

            -- Damage calc

            local rawdgm = creaturedata.attack - math.random() * playerdata.defense
            local damage = math.max(1, math.ceil(rawdgm))

            -- result

            if success then   
              playerdata.health = playerdata.health - damage             
              print(string.format("O chão tremeu e %s caiu em um buraco, tomando %s de dano." , playerdata.name, damage))

              local healthrate = math.floor((playerdata.health / playerdata.maxHealth) *10)              
              print(string.format("%s . %s", playerdata.name , utils.getProgressBar(healthrate)))
              

            else 
                print(string.format("%s percebeu o buraco e saltou pra longe evitando de cair", playerdata.name))
            end    
        end
    }

    -- ataque a distancia 
    local HighJump = {
        description = "Saltoo rapido",
        requirement = nil , 
        execute = function (playerdata, creaturedata)
            -- HitChance
            local successChance = playerdata.speed  == 0 and 1 or creaturedata.speed / playerdata.speed
            local success = math.random() <= successChance 

            -- Damage calc

            local rawdgm = creaturedata.attack  - math.random() * playerdata.defense
            local damage = math.max(1, math.ceil(rawdgm * 0.5))

            -- result

            if success then   
              playerdata.health = playerdata.health - damage             
              print(string.format("%s salta de um buraco no chão e atingindo %s e causando %s de dano.",creaturedata.name ,playerdata.name, damage))

              local healthrate = math.floor((playerdata.health / playerdata.maxHealth) *10)              
              print(string.format("%s . %s", playerdata.name , utils.getProgressBar(healthrate)))
              

            else 
                print(string.format("%s se esquiva e %s passa direto sem conseguir acertar", playerdata.name, creaturedata.name))
            end    
        end
    }


    
    -- pupulate list 
       action.list [#action.list+1] = Dig
       action.list [#action.list+1] = HighJump
    
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
