
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
_G.Summon_Whale = false
_G.Whale_Hunting = false
_G.HuntWhaleDebounce = false



local Hunter = Window:CreateTab("Whale Hunter", "fish-symbol") -- Title, Image
local InfoTab = Window:CreateTab("Misc", "badge-info") -- Title, Imag


local Toggle_Hunting = Hunter:CreateSection("Toggle Hunting")
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




