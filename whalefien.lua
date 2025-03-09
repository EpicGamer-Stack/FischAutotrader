
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Fisch Whale Hunter",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Whale Hunter 🐟",
    LoadingSubtitle = "by 🥚",
    Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- Create a custom folder for your hub/game
        FileName = "WhaleHunter"
     },
})




local function sendwebhook(Webhook, Data)

    local jsonData = game:GetService("HttpService"):JSONEncode(Data)
    
    local headers = {
        ["Content-Type"] = "application/json"
    }

    local requestData = {
        Url = Webhook,
        Method = "POST",
        Headers = headers,
        Body = jsonData
    }
    
    -- Using synapse, krnl, fluxus, or universal request function
    local success, response = pcall(function()
        return (syn and syn.request or http_request or request)(requestData)
    end)
end




-- Whale Globals
_G.Summon_Whale = false
_G.Whale_Hunting = false
_G.HuntWhaleDebounce = false

-- Orca Globals
_G.Orca_Hunting = false

-- Kraken Globals
_G.Kraken_Hunting = false
_G.Ancient_Kraken = false

-- Scylla Globals
_G.Scylla_Hunting = false

-- Megalodon Globals
_G.Meg_Hunting = false
_G.Ancient_Meg = false
_G.Phantom_Meg = false
_G.Summon_Phantom = false

--Megalodon Default


local Hunter = Window:CreateTab("Fisch Hunting", "fish-symbol") -- Title, Image
local InfoTab = Window:CreateTab("Misc", "badge-info") -- Title, Imag


local WhaleSection = Hunter:CreateSection("Whale Hunting")
local Hunt_Whales = Hunter:CreateToggle({
    Name = "Hunt Whales",
    CurrentValue = false,
    Flag = "Hunting_Whales", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.Whale_Hunting = Value

        while _G.Whale_Hunting do
            task.wait()

            local whale_pool = workspace.zones.fishing:FindFirstChild("Whales Pool")
           

            if whale_pool then
                whale_pool.CanCollide = true
                if not whale_pool:FindFirstChild("RodEquipCheck") then
                    local rodpart = Instance.new("Part",whale_pool)
                    rodpart.Name = "RodEquipCheck"

                    local toolhasbeenequippedyetlol = false
                    
                    for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                        if tool:IsA("Tool") then

                            for i,folder in tool:GetChildren() do



                                if folder:IsA("Folder") and folder.Name == "events" then



                                    for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                        if v:IsA("Tool") then
                                                v.Parent = game.Players.LocalPlayer.Backpack
                                                tool.Parent = game.Players.LocalPlayer.Character
                                                toolhasbeenequippedyetlol = true
                                                break
                                        end
                                    end

                                    if not toolhasbeenequippedyetlol then
                                        tool.Parent = game.Players.LocalPlayer.Character
                                    end
                                end
                            end


                        
                        end
                    end
                end



                local whale_pos = CFrame.new(whale_pool.CFrame.Position + Vector3.new(0,74,0))
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = whale_pos

                if whale_pool:FindFirstChild("MobySpawn"):FindFirstChild("Whale") then
                        local aurora_successful = false



                 
                        local MobyData = {
                            content = nil,
                            embeds = { {
                              description = "❌",
                              color = nil,
                              author = {
                                name = "Aurora Popped?"
                              },
                              thumbnail = {
                                url = "https://static.wikia.nocookie.net/fisch/images/2/22/Moby.gif/revision/latest?cb=20250301162907"
                              }
                            } },
                            username = "Moby Has Been Found!",
                            attachments = { }
                          }



                    -- To the dickhead who spammed this hook, fuck you. and its a private channel for me only so you're wasting your time.

                    sendwebhook("https://discord.com/api/webhooks/1344393972151222352/aCQgEoLXE9GzIXUtHT92TKQw7sGd4uDv4wsgCoRBwU6ZaD4raAedKwfQYWxLwvszsU-G",MobyData)
                end

            elseif _G.Summon_Whale then
                local found_tempest = false
                    local found_smoke = false
                    local hotbar = game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.hotbar
                    for _,object in hotbar:GetChildren() do
                        if object:IsA("ImageButton") then
                            if object:FindFirstChild("itemname").Text == "Tempest Totem" then
                                found_tempest = true
                            
                                    local tempest_stack = object:FindFirstChild("stack").Text
                                    local tempest_stack_split = string.split(tempest_stack," x")
                                    if tempest_stack_split[1] == "" then
                                        
                                            Rayfield:Notify({
                                                Title = "Notice",
                                                Content = "You have one Tempest Totem. Summoning Has Stopped",
                                                Duration = 6.5,
                                    Image = "fish-symbol",

                                    
                                })
                                break
                        end

                  
                elseif object:FindFirstChild("itemname").Text == "Smokescreen Totem" then
                    found_smoke = true
                   
                        local smoke_stack = object:FindFirstChild("stack").Text
                        local smoke_stack_split = string.split(smoke_stack," x")
                        if smoke_stack_split[1] == "" then
                          
                                Rayfield:Notify({
                                    Title = "Notice",
                                    Content = "You have one Smokescreen Totem. Summoning Has Stopped",
                                    Duration = 6.5,
                                    Image = "fish-symbol",
                                })
                            
                                break
                            
                        end
             
                        

                end
            end
        end




                if found_tempest and found_smoke then
                    for i,v in game.Players.LocalPlayer.Character:GetChildren() do
                        if v:IsA("Tool") then
                            v.Parent = game.Players.LocalPlayer.Backpack
                        end
                    end

           

                    local tempest_totem = game.Players.LocalPlayer.Backpack:FindFirstChild("Tempest Totem")
                local smokescreen_totem = game.Players.LocalPlayer.Backpack:FindFirstChild("Smokescreen Totem")
                    smokescreen_totem.Parent = game.Players.LocalPlayer.Character
                smokescreen_totem:Activate()
                smokescreen_totem.Parent = game.Players.LocalPlayer.Backpack
                task.wait(0.2)
                    tempest_totem.Parent = game.Players.LocalPlayer.Character
                tempest_totem:Activate()
                tempest_totem.Parent = game.Players.LocalPlayer.Backpack	
            
	
                else
                Rayfield:Notify({
                        Title = "Error",
                        Content = "Couldn't Locate Totems In Hotbar",
                        Duration = 6.5,
                        Image = "fish-symbol",
                    })	
                end
                end


            end
        
    end,
 })
 local Summon_Whales = Hunter:CreateToggle({
    Name = "Summon Whales",
    CurrentValue = false,
    Flag = "Summoning_Whales", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.Summon_Whale = Value

        
        
    end,
 })
local OrcaSection = Hunter:CreateSection("Orca Hunting")
local Hunt_Orcas = Hunter:CreateToggle({
    Name = "Hunt Orcas",
    CurrentValue = false,
    Flag = "Hunting_Orcas", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.Orca_Hunting = Value

        while _G.Orca_Hunting do
            task.wait()

            local orca_pool = workspace.zones.fishing:FindFirstChild("Orcas Pool")
            

            if orca_pool then
                orca_pool.CanCollide = true
                if not orca_pool:FindFirstChild("RodEquipCheck") then
                    local rodpart = Instance.new("Part",orca_pool)
                    rodpart.Name = "RodEquipCheck"

                    local toolhasbeenequippedyetlol = false
                    
                    for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                        if tool:IsA("Tool") then

                            for i,folder in tool:GetChildren() do



                                if folder:IsA("Folder") and folder.Name == "events" then



                                    for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                        if v:IsA("Tool") then
                                                v.Parent = game.Players.LocalPlayer.Backpack
                                                tool.Parent = game.Players.LocalPlayer.Character
                                                toolhasbeenequippedyetlol = true
                                                break
                                        end
                                    end

                                    if not toolhasbeenequippedyetlol then
                                        tool.Parent = game.Players.LocalPlayer.Character
                                    end
                                end
                            end


                        
                        end
                    end
                end



                local orca_pos = CFrame.new(orca_pool.CFrame.Position + Vector3.new(0,74,0))
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = orca_pos

           
            end
        end
    end,
 })

 local KrakenSection = Hunter:CreateSection("Kraken Hunting")
 local Hunt_Krakens = Hunter:CreateToggle({
     Name = "Hunt Krakens",
     CurrentValue = false,
     Flag = "Hunting_Krakens", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
     Callback = function(Value)
         _G.Kraken_Hunting = Value
 
         while _G.Kraken_Hunting do
             task.wait()
 
             local kraken_pool = workspace.zones.fishing:FindFirstChild("Kraken Pool")
             local ancient_pool = workspace.zones.fishing:FindFirstChild("Ancient Kraken Pool")


                if _G.Ancient_Kraken then
                    if ancient_pool then
                        ancient_pool.CanCollide = true
                        if not ancient_pool:FindFirstChild("RodEquipCheck") then
                            local rodpart = Instance.new("Part",ancient_pool)
                            rodpart.Name = "RodEquipCheck"
        
                            local toolhasbeenequippedyetlol = false
                            
                            for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                                if tool:IsA("Tool") then
        
                                    for i,folder in tool:GetChildren() do
        
        
        
                                        if folder:IsA("Folder") and folder.Name == "events" then
        
        
        
                                            for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                                if v:IsA("Tool") then
                                                        v.Parent = game.Players.LocalPlayer.Backpack
                                                        tool.Parent = game.Players.LocalPlayer.Character
                                                        toolhasbeenequippedyetlol = true
                                                        break
                                                end
                                            end
        
                                            if not toolhasbeenequippedyetlol then
                                                tool.Parent = game.Players.LocalPlayer.Character
                                            end
                                        end
                                    end
        
        
                                
                                end
                            end
                        end
        
        
        
                        local ancient_pos = CFrame.new(ancient_pool.CFrame.Position + Vector3.new(0,74,0))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ancient_pos
        
                    
                    elseif kraken_pool then

                            kraken_pool.Anchored = true
                            if not kraken_pool:FindFirstChild("RodEquipCheck") then
                                local rodpart = Instance.new("Part",kraken_pool)
                                rodpart.Name = "RodEquipCheck"
            
                                local toolhasbeenequippedyetlol = false
                                
                                for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                                    if tool:IsA("Tool") then
            
                                        for i,folder in tool:GetChildren() do
            
            
            
                                            if folder:IsA("Folder") and folder.Name == "events" then
            
            
            
                                                for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                                    if v:IsA("Tool") then
                                                            v.Parent = game.Players.LocalPlayer.Backpack
                                                            tool.Parent = game.Players.LocalPlayer.Character
                                                            toolhasbeenequippedyetlol = true
                                                            break
                                                    end
                                                end
            
                                                if not toolhasbeenequippedyetlol then
                                                    tool.Parent = game.Players.LocalPlayer.Character
                                                end
                                            end
                                        end
            
            
                                    
                                    end
                                end
                            end
                            local kraken_pos = CFrame.new(kraken_pool.CFrame.Position + Vector3.new(0,74,0))
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = kraken_pos
        
                    
                    

                    end
                else
                    if kraken_pool then
                        kraken_pool.CanCollide = true
                        if not kraken_pool:FindFirstChild("RodEquipCheck") then
                            local rodpart = Instance.new("Part",kraken_pool)
                            rodpart.Name = "RodEquipCheck"

                            local toolhasbeenequippedyetlol = false
                            
                            for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                                if tool:IsA("Tool") then
        
                                    for i,folder in tool:GetChildren() do
        
        
        
                                        if folder:IsA("Folder") and folder.Name == "events" then
        
        
        
                                            for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                                if v:IsA("Tool") then
                                                        v.Parent = game.Players.LocalPlayer.Backpack
                                                        tool.Parent = game.Players.LocalPlayer.Character
                                                        toolhasbeenequippedyetlol = true
                                                        break
                                                end
                                            end
        
                                            if not toolhasbeenequippedyetlol then
                                                tool.Parent = game.Players.LocalPlayer.Character
                                            end
                                        end
                                    end
        
        
                                
                                end
                            end
                        end
        
        
        
                        local kraken_pos = CFrame.new(kraken_pool.CFrame.Position + Vector3.new(0,74,0))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = kraken_pos
        
                    
                    end
                end


         end
     end,
  })
 
  local Hunt_Ancients = Hunter:CreateToggle({
      Name = "Hunt Ancient Krakens",
      CurrentValue = false,
      Flag = "Hunting_Ancient_Krakens", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
      Callback = function(Value)
          _G.Ancient_Kraken = Value
  
          
          
      end,
   })

local ScyllaSection = Hunter:CreateSection("Scylla Hunting")
local Hunt_Scylla = Hunter:CreateToggle({
    Name = "Hunt Syclla",
    CurrentValue = false,
    Flag = "Hunting_Scylla", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.Scylla_Hunting = Value

        while _G.Scylla_Hunting do
            task.wait()

            local scylla_pool = workspace.zones.fishing:FindFirstChild("Forsaken Veil - Scylla")
            

            if scylla_pool then
                scylla_pool.CanCollide = true
                if not scylla_pool:FindFirstChild("RodEquipCheck") then
                    local rodpart = Instance.new("Part",scylla_pool)
                    rodpart.Name = "RodEquipCheck"

                    local toolhasbeenequippedyetlol = false
                    
                    for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                        if tool:IsA("Tool") then

                            for i,folder in tool:GetChildren() do



                                if folder:IsA("Folder") and folder.Name == "events" then



                                    for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                        if v:IsA("Tool") then
                                                v.Parent = game.Players.LocalPlayer.Backpack
                                                tool.Parent = game.Players.LocalPlayer.Character
                                                toolhasbeenequippedyetlol = true
                                                break
                                        end
                                    end

                                    if not toolhasbeenequippedyetlol then
                                        tool.Parent = game.Players.LocalPlayer.Character
                                    end
                                end
                            end


                        
                        end
                    end
                end



                local scylla_pos = CFrame.new(scylla_pool.CFrame.Position + Vector3.new(0,74,0))
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = scylla_pos

           
            end
        end
    end,
 })

 local MegSection = Hunter:CreateSection("Meg Hunting")
 local Hunt_Meg = Hunter:CreateToggle({
     Name = "Hunt Meg",
     CurrentValue = false,
     Flag = "Hunting_Meg", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
     Callback = function(Value)
         _G.Meg_Hunting = Value
 
         while _G.Meg_Hunting do
             task.wait()
 
                  



                local meg_pool = workspace.zones.fishing:FindFirstChild("Megalodon Default")
                local meg_ancient_pool = workspace.zones.fishing:FindFirstChild("Megalodon Ancient")
                local meg_phantom_pool = workspace.zones.fishing:FindFirstChild("Megalodon Phantom")

                if _G.Ancient_Meg then
                    if meg_ancient_pool then
                        meg_ancient_pool.CanCollide = true
                        if not meg_ancient_pool:FindFirstChild("RodEquipCheck") then
                            local rodpart = Instance.new("Part",meg_ancient_pool)
                            rodpart.Name = "RodEquipCheck"
        
                            local toolhasbeenequippedyetlol = false
                            
                            for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                                if tool:IsA("Tool") then
        
                                    for i,folder in tool:GetChildren() do
        
        
        
                                        if folder:IsA("Folder") and folder.Name == "events" then
        
        
        
                                            for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                                if v:IsA("Tool") then
                                                        v.Parent = game.Players.LocalPlayer.Backpack
                                                        tool.Parent = game.Players.LocalPlayer.Character
                                                        toolhasbeenequippedyetlol = true
                                                        break
                                                end
                                            end
        
                                            if not toolhasbeenequippedyetlol then
                                                tool.Parent = game.Players.LocalPlayer.Character
                                            end
                                        end
                                    end
        
        
                                
                                end
                            end
                        end
        
        
        
                        local ancient_meg_pos = CFrame.new(meg_ancient_pool.CFrame.Position + Vector3.new(0,3,0))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ancient_meg_pos
        
                    
                    
        
                    
                    

                    end
              
                    if meg_pool then
                        meg_pool.CanCollide = true
                        if not meg_pool:FindFirstChild("RodEquipCheck") then
                            local rodpart = Instance.new("Part",meg_pool)
                            rodpart.Name = "RodEquipCheck"

                            local toolhasbeenequippedyetlol = false
                            
                            for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                                if tool:IsA("Tool") then
        
                                    for i,folder in tool:GetChildren() do
        
        
        
                                        if folder:IsA("Folder") and folder.Name == "events" then
        
        
        
                                            for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                                if v:IsA("Tool") then
                                                        v.Parent = game.Players.LocalPlayer.Backpack
                                                        tool.Parent = game.Players.LocalPlayer.Character
                                                        toolhasbeenequippedyetlol = true
                                                        break
                                                end
                                            end
        
                                            if not toolhasbeenequippedyetlol then
                                                tool.Parent = game.Players.LocalPlayer.Character
                                            end
                                        end
                                    end
        
        
                                
                                end
                            end
                        end
        
        
        
                        local meg_pos = CFrame.new(meg_pool.CFrame.Position + Vector3.new(0,3,0))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = meg_pos
        
                    
                    end
                end

                if _G.Phantom_Meg then
                    if meg_phantom_pool then
                        meg_phantom_pool.CanCollide = true
                        if not meg_phantom_pool:FindFirstChild("RodEquipCheck") then
                            local rodpart = Instance.new("Part",meg_phantom_pool)
                            rodpart.Name = "RodEquipCheck"
        
                            local toolhasbeenequippedyetlol = false
                            
                            for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                                if tool:IsA("Tool") then
        
                                    for i,folder in tool:GetChildren() do
        
        
        
                                        if folder:IsA("Folder") and folder.Name == "events" then
        
        
        
                                            for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                                if v:IsA("Tool") then
                                                        v.Parent = game.Players.LocalPlayer.Backpack
                                                        tool.Parent = game.Players.LocalPlayer.Character
                                                        toolhasbeenequippedyetlol = true
                                                        break
                                                end
                                            end
        
                                            if not toolhasbeenequippedyetlol then
                                                tool.Parent = game.Players.LocalPlayer.Character
                                            end
                                        end
                                    end
        
        
                                
                                end
                            end
                        end
        
        
        
                        local phantom_meg_pos = CFrame.new(meg_phantom_pool.CFrame.Position + Vector3.new(0,3,0))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = phantom_meg_pos
        
                    
                    elseif meg_pool then

                            meg_pool.CanCollide = true
                            if not meg_pool:FindFirstChild("RodEquipCheck") then
                                local rodpart = Instance.new("Part",meg_pool)
                                rodpart.Name = "RodEquipCheck"
            
                                local toolhasbeenequippedyetlol = false
                                
                                for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                                    if tool:IsA("Tool") then
            
                                        for i,folder in tool:GetChildren() do
            
            
            
                                            if folder:IsA("Folder") and folder.Name == "events" then
            
            
            
                                                for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                                    if v:IsA("Tool") then
                                                            v.Parent = game.Players.LocalPlayer.Backpack
                                                            tool.Parent = game.Players.LocalPlayer.Character
                                                            toolhasbeenequippedyetlol = true
                                                            break
                                                    end
                                                end
            
                                                if not toolhasbeenequippedyetlol then
                                                    tool.Parent = game.Players.LocalPlayer.Character
                                                end
                                            end
                                        end
            
            
                                    
                                    end
                                end
                            end
                            local meg_pos = CFrame.new(meg_pool.CFrame.Position + Vector3.new(0,3,0))
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = meg_pos
        
                    
                    

                    end
                end

                if meg_pool then
                    meg_pool.CanCollide = true
                    if not meg_pool:FindFirstChild("RodEquipCheck") then
                        local rodpart = Instance.new("Part",meg_pool)
                        rodpart.Name = "RodEquipCheck"

                        local toolhasbeenequippedyetlol = false
                        
                        for _,tool in game.Players.LocalPlayer.Backpack:GetChildren() do
                            if tool:IsA("Tool") then
    
                                for i,folder in tool:GetChildren() do
    
    
    
                                    if folder:IsA("Folder") and folder.Name == "events" then
    
    
    
                                        for _,v in game.Players.LocalPlayer.Character:GetChildren() do
                                            if v:IsA("Tool") then
                                                    v.Parent = game.Players.LocalPlayer.Backpack
                                                    tool.Parent = game.Players.LocalPlayer.Character
                                                    toolhasbeenequippedyetlol = true
                                                    break
                                            end
                                        end
    
                                        if not toolhasbeenequippedyetlol then
                                            tool.Parent = game.Players.LocalPlayer.Character
                                        end
                                    end
                                end
    
    
                            
                            end
                        end
                    end
    
    
    
                    local meg_pos = CFrame.new(meg_pool.CFrame.Position + Vector3.new(0,3,0))
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = meg_pos
    
                
                end


                if _G.Summon_Phantom then
                    task.wait()
                    if not meg_phantom_pool then
                        
                    
                    local found_sundial = false
                    local found_eclipse = false
                        local hotbar = game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.hotbar
                        for _,object in hotbar:GetChildren() do
                            if object:IsA("ImageButton") then
                                if object:FindFirstChild("itemname").Text == "Sundial Totem" then
                                    found_sundial = true
                                
                                        local sundial_stack = object:FindFirstChild("stack").Text
                                        local sundial_stack_split = string.split(sundial_stack," x")
                                        if sundial_stack_split[1] == "" then
                                            
                                                Rayfield:Notify({
                                                    Title = "Notice",
                                                    Content = "You have one Sundial Totem. Summoning Has Stopped",
                                                    Duration = 6.5,
                                        Image = "fish-symbol",

                                        
                                    })
                                    break
                                end
                                elseif object:FindFirstChild("itemname").Text == "Eclipse Totem" then
                                    found_eclipse = true
                                
                                        local e_stack = object:FindFirstChild("stack").Text
                                        local e_stack_split = string.split(e_stack," x")
                                        if e_stack_split[1] == "" then
                                            
                                                Rayfield:Notify({
                                                    Title = "Notice",
                                                    Content = "You have one Eclipse Totem. Summoning Has Stopped",
                                                    Duration = 6.5,
                                        Image = "fish-symbol",

                                        
                                    })
                                    break
                                end
                                end
                            end
                        end


                    if found_sundial and found_eclipse then
                
                        for i,v in game.Players.LocalPlayer.Character:GetChildren() do
                            if v:IsA("Tool") then
                                v.Parent = game.Players.LocalPlayer.Backpack
                            end
                        end



                   
                            local eclipse_totem = game.Players.LocalPlayer.Backpack:FindFirstChild("Eclipse Totem")      
                            local sundial_totem = game.Players.LocalPlayer.Backpack:FindFirstChild("Sundial Totem")
                            sundial_totem.Parent = game.Players.LocalPlayer.Character
                            sundial_totem:Activate()
                            sundial_totem.Parent = game.Players.LocalPlayer.Backpack        
                            task.wait(1)
                            eclipse_totem.Parent = game.Players.LocalPlayer.Character
                            eclipse_totem:Activate()
                            eclipse_totem.Parent = game.Players.LocalPlayer.Backpack        
                    


                    end
                    end
                end


               
         end
     end,
  })
 
  local Hunt_Ancient_Megs = Hunter:CreateToggle({
      Name = "Hunt Ancient Meg",
      CurrentValue = false,
      Flag = "Hunting_Ancient_Meg", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
      Callback = function(Value)
          _G.Ancient_Meg = Value
  
          
          
      end,
   })

 
   local Hunt_Phantom_Megs = Hunter:CreateToggle({
    Name = "Hunt Phantom Meg",
    CurrentValue = false,
    Flag = "Hunting_Phantom_Meg", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.Phantom_Meg = Value

        
        
    end,
 })

 local Summon_Phantom_Megs = Hunter:CreateToggle({
    Name = "Summon Phantom Meg",
    CurrentValue = false,
    Flag = "Summon_Phantom_Meg", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.Summon_Phantom = Value

        
        
    end,
 })



 local InfoTheme = InfoTab:CreateSection("Gui Theme")
 local Dropdown = InfoTab:CreateDropdown({
    Name = "Set Theme",
    Options = {"Default","AmberGlow","Amethyst","Bloom","DarkBlue","Green","Light","Ocean","Serenity"},
    CurrentOption = {"Ocean"},
    MultipleOptions = false,
    Flag = "GuiTheme", 
    Callback = function(Options)
        Window.ModifyTheme(Options[1])
    end,
 })





 local InfoDeleteGui = InfoTab:CreateSection("Delete Gui")
 local DeleteGui = InfoTab:CreateButton({
     Name = "Destroy UI",
     Callback = function()
         Rayfield:Destroy()
     end,
  })

Rayfield:LoadConfiguration()




