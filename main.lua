-- dependencias 
local player = require("player.player")
local utils = require("utils")
local verminoide = require("Veminho.verminoide")
local verminoideactions = require("Veminho.action")
local playerActions = require ("player.action")


local boss = verminoide
local bossActions = verminoideactions


-- utils


utils.enableutf8()

-- header 
utils.printheader()

-- introdução
print([["Após um surto de bompaca, nosso querido Kenny se encontra em uma outra realidade, e precisa lutar para conseguir tomar banho com a Princesa Kitty"

                                                              .--""--. 
                                                            .'        '.   
                                                           /   .'``'.   \  
                                                          |  .'/.\/.\'.  | 
                                                          |  :| _/\_ |;  | 
                                                          \  '.\ _ _/.'  / 
                                                          _\            /_
                                                         /_   `-./\.-'   _\  
                                                        (__/            \__) 
                                                          |              |
                                                          '--------------'
                                                             K E N N Y        
]])

print ("   ")

print([["- O lendario guerreiro Kenny que desafia o coliseu para poder se casar com minha filha a princesa Kitty, enfretara em sua primeira batalha a criatura que devorou metade do meu batalhão de soldados exploradores da lua, uma grande fera, O VERMINOIDE VERMELHOOOOOO!"]])

    print("  ")

-- Jogador/ personagens jogaveis

-- build
playerActions.build()
bossActions.build()

-- criatura
utils.bossstats(boss)

while true do

    print ([[ 
O você fará agora?
    ]])
    local validPlayerActions = playerActions.getValidActions(player, boss)
    for i, action  in pairs(validPlayerActions) do
        print(string.format("%d. %s ", i, action.description))
        
    end
    local chosenIndex = utils.ask()
    local choseaction = validPlayerActions[chosenIndex]

    local isActionValid = choseaction ~= nil

    if isActionValid then
        choseaction.execute(player, boss)

        else 

            print("Acho que nao entendeu a pergunta, deixa eu repetir.")
        
    end


    if boss.health <=0 then
        print("")
        print("E com grende bravura, Kenny conseguiu derrotar a criatura e agora se banha ao lado da princesa Kitty")
        print([[
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⡴⠋⠀⠀⣸⣩⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠁⢠⣀⡀⠀⠀⢀⡞⣁⣄⠀⢀⣿⣿⣿⣿⣿⣿⣭⡙⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⢸⠇⠉⠙⠒⣾⠋⠀⠀⠃⢸⣿⣿⣿⣿⣿⣿⣿⣿⡎⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⣼⠀⠀⠀⣸⠃⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠿⢻⣿⣷⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⢎⡄⠀⢠⡏⠀⠀⠀⠀⢸⠿⣯⣍⠉⠁⣠⣤⣌⣿⣿⣾⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⢽⣿⣿⡄⣼⠁⠀⠀⠀⠀⣸⠀⠀⠁⠀⠀⠋⠀⢈⣿⣿⣟⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠉⠀⡟⠀⠀⠀⠀⠀⡿⣆⣠⡆⢀⠀⡄⢠⡆⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠀⠀⡏⠈⠉⠂⠸⣄⡻⠞⢹⣿⣿⡟⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⢀⡇⢤⣄⣈⣃⣰⠃⢀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢸⣧⡀⠑⠭⢝⣩⣴⣿⣿⣿⣿⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢸⣿⡿⠳⠟⣿⣿⣿⣿⣿⣿⡏⡏⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⢸⣟⣧⡀⠀⢻⣿⣿⣿⣿⠻⢿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡀⠀⠀⠀⠀⢸⠹⡼⣿⠦⣄⣙⡿⢿⣿⣇⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠈⠆⣿⡊⠳⣄⠉⠁⢀⠙⣟⡟⢓⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢷⣄⠂⠀⠀⠀⢸⡇⣱⢛⡷⣦⣀⡑⣼⣞⣷⣷⣽⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣦⡀⠀⠈⣿⢹⣲⣾⣿⣿⡙⣽⢿⣽⣯⢺⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣶⣄⣿⡜⣼⣿⣿⣷⡷⣝⣼⣿⣯⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣵⢿⣿⣿⣿⣇⣷⣿⣿⣕⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣟⣦⣗⣟⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⡿⣻⣿⣿⣿⣿⣻⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⡝⣻⣿⠏⣩⡾⣿⣿⣿⣿⣿⣾⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣵⠟⢷⡲⢆⣿⣿⣿⣿⣿⣟⢤⣣⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡴⠋⠀⠀⠈⢷⣿⣿⣿⣿⡿⣿⡟⢞⣽⠋⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⠋⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⡇⡿⣟⡾⠁⠀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠋⠀⠀⠀⠀⠀⠀⠀⠀⣯⣿⣿⣿⢋⣼⡾⠁⠀⠀⠀⠀⠘⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁⠀⠀⠀⠀⠀⠀⠠⣀⠀⢹⣿⣹⣿⡗⣼⢁⡤⠂⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠈⠣⣸⢲⣎⣍⣹⡷⠋⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣏⠉⢹⡏⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⠇⠀⠀⠀⠀⠀⠀⠀⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡅⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣄⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣸⠃⠀⠀⠀⠀⠀⠀ 
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢳⡀⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]])
        break
    end 
     
    print()
    local validBossAction = bossActions.getValidActions(player, boss)
    local bossActions = validBossAction[math.random(#validBossAction)]
    bossActions.execute(player, boss)

    if player.health <= 0 then
        print("")
        print("Puta merda eles mataram o Kenny.")
        print("PLATEIA: FILHOOOS DA PUTAAAAAA!")
        break
    end
end
 

