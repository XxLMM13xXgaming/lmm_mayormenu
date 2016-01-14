LMMMMConfig = {}
LMMMMConfig.DevMode = false
/*
  __  __                        __  __                                                     
 |  \/  |                      |  \/  |                                                    
 | \  / | __ _ _   _  ___  _ __| \  / | ___ _ __  _   _                                    
 | |\/| |/ _` | | | |/ _ \| '__| |\/| |/ _ \ '_ \| | | |                                   
 | |  | | (_| | |_| | (_) | |  | |  | |  __/ | | | |_| |                                   
 |_|  |_|\__,_|\__, |\___/|_|  |_|  |_|\___|_| |_|\__,_|                                   
                __/ |                                                                      
  __  __       |___/        ____                                                           
 |  \/  |         | |      |  _ \       _                                                  
 | \  / | __ _  __| | ___  | |_) |_   _(_)                                                 
 | |\/| |/ _` |/ _` |/ _ \ |  _ <| | | |                                                   
 | |  | | (_| | (_| |  __/ | |_) | |_| |_                                                  
 |_|  |_|\__,_|\__,_|\___| |____/ \__, (_)                                                 
                                   __/ |                                                   
 __   __      _      __  __ __  __|___/___       __   __                     _             
 \ \ / /     | |    |  \/  |  \/  /_ |___ \      \ \ / /                    (_)            
  \ V / __  _| |    | \  / | \  / || | __) |_  __ \ V / __ _  __ _ _ __ ___  _ _ __   __ _ 
   > <  \ \/ / |    | |\/| | |\/| || ||__ <\ \/ /  > < / _` |/ _` | '_ ` _ \| | '_ \ / _` |
  / . \  >  <| |____| |  | | |  | || |___) |>  <  / . \ (_| | (_| | | | | | | | | | | (_| |
 /_/ \_\/_/\_\______|_|  |_|_|  |_||_|____//_/\_\/_/ \_\__, |\__,_|_| |_| |_|_|_| |_|\__, |
                                                        __/ |                         __/ |
                                                       |___/                         |___/ 
*/
LMMMMConfig.MayorCommand = "!mayormenu" -- Command to open the menu

LMMMMConfig.MayorTeamName = "Mayor" -- The menu will work for teams that are the mayor (isMayor function) this is just what the job name is so if you changed it please change here too!

LMMMMConfig.MayorGreatingMessage = "Welcome! You can type ".. LMMMMConfig.MayorCommand .. " to open your control panel!" -- Messgae when someone switches to mayor

LMMMMConfig.MayorCMDS = {} -- At the moment this only supports chat commands so do not put say in it!
LMMMMConfig.MayorCMDS.C1 = { "Lockdown", "/lockdown" }
LMMMMConfig.MayorCMDS.C2 = { "End Lockdown", "/unlockdown" }
LMMMMConfig.MayorCMDS.C3 = { "Reset Laws", "/resetlaws" }