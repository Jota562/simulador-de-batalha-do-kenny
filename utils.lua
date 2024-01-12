local utils = {}

function utils.enableutf8()
    os.execute("chcp 65001")
    
end

-- Titulo

function utils.printheader ()
    
print ("================================================================================")
print("                               A lenda da batalha")
print ("================================================================================")
    
end

 -- 
 ---Barra de Progresso
 ---@param attribute number
 ---@return string
 ---
 function  utils.getProgressBar(attribute)
    local fullChar = " ▰"
    local emptyChar = " ▱"

    local result = ""
    for i = 1, 10, 1 do
         if i <= attribute then 
            result = result .. fullChar
         else 
            result = result .. emptyChar
        end
    end

    return result

    end


---staturs criatura
---@param creature table
function utils.bossstats (creature)

   local healthrate = math.floor((creature.health / creature.maxhealth) *10)

    print("|".. creature.name)
    print("|")
    print("|".. creature.description)
    print("| ")
    print("|")
    print("| Atributos")
    print("|    Vida:      " ..utils.getProgressBar(creature.health))
    print("|    Ataque:    " ..utils.getProgressBar(creature.attack))
    print("|    Defesa:    " ..utils.getProgressBar(creature.defense))
    print("|    Velocidade:" ..utils.getProgressBar(creature.speed))
   
end



---pergunda de ação
---@return any
function utils.ask()
    io.write("> ")
    local answer = io.read("*n")
    return answer
    
end
return utils
