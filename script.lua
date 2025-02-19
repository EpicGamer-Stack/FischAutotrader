
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
    Name = "Fisch AutoTrader V.2",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Fisch AutoTrader V.2",
    LoadingSubtitle = "by 🥚",
    Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

})

local InfoTab = Window:CreateTab("Info", "badge-info") -- Title, Imag
local AutoTraderTab = Window:CreateTab("AutoTrader", "arrow-right-left") -- Title, Image

_G.PLR = nil

function TradeCommon()
    local fish = {}

    local plr = game.Players.LocalPlayer
    local backpack = game.Players.LocalPlayer.Backpack

    local inventory = game.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll
    for _, v in pairs(inventory:GetChildren()) do
        local favourited = v:FindFirstChild("favourited")
        if favourited and not favourited.Visible then
            if v:FindFirstChild("raritystar") then
                if v:FindFirstChild("raritystar").ImageColor3 == Color3.fromRGB(255, 255, 255) then
            
                    if v:FindFirstChild("item") then
                        local GUILINK = v:FindFirstChild("item").Value
                        table.insert(fish,v)
                        
                        for _,item in backpack:GetChildren() do
                            
                            if item:FindFirstChild("link") and item:FindFirstChild("link").Value == GUILINK and item:FindFirstChild("offer") then
                                repeat task.wait() until plr.Character:FindFirstChildOfClass("Tool") == nil
                                item.Parent = plr.Character
                                item.offer:FireServer(game.Players:FindFirstChild(_G.PLR))
                                item.Parent = plr.Backpack
                            end
                        end
                       
                    end
                end
            end
        end
    end
end


function TradeUncommon()
    local fish = {}

    local plr = game.Players.LocalPlayer
    local backpack = game.Players.LocalPlayer.Backpack

    local inventory = game.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll
    for _, v in pairs(inventory:GetChildren()) do
        local favourited = v:FindFirstChild("favourited")
        if favourited and not favourited.Visible then
            if v:FindFirstChild("raritystar") then
                if v:FindFirstChild("raritystar").ImageColor3 == Color3.fromRGB(161, 255, 169) then
            
                    if v:FindFirstChild("item") then
                        local GUILINK = v:FindFirstChild("item").Value
                        table.insert(fish,v)
                        
                        for _,item in backpack:GetChildren() do
                            
                            if item:FindFirstChild("link") and item:FindFirstChild("link").Value == GUILINK then
                                repeat task.wait() until plr.Character:FindFirstChildOfClass("Tool") == nil
                                item.Parent = plr.Character
                                item.offer:FireServer(game.Players:FindFirstChild(_G.PLR))
                                item.Parent = plr.Backpack
                            end
                        end
                       
                    end
                end
            end
        end
    end
end



function TradeUnusual()
    local fish = {}

    local plr = game.Players.LocalPlayer
    local backpack = game.Players.LocalPlayer.Backpack

    local inventory = game.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll
    for _, v in pairs(inventory:GetChildren()) do
        local favourited = v:FindFirstChild("favourited")
        if favourited and not favourited.Visible then
            if v:FindFirstChild("raritystar") then
                if v:FindFirstChild("raritystar").ImageColor3 == Color3.fromRGB(192, 135, 198) then
            
                    if v:FindFirstChild("item") then
                        local GUILINK = v:FindFirstChild("item").Value
                        table.insert(fish,v)
                        
                        for _,item in backpack:GetChildren() do
                            
                            if item:FindFirstChild("link") and item:FindFirstChild("link").Value == GUILINK then
                                repeat task.wait() until plr.Character:FindFirstChildOfClass("Tool") == nil
                                item.Parent = plr.Character
                                item.offer:FireServer(game.Players:FindFirstChild(_G.PLR))
                                item.Parent = plr.Backpack
                            end
                        end
                       
                    end
                end
            end
        end
    end
end

function TradeRare()
    local fish = {}

    local plr = game.Players.LocalPlayer
    local backpack = game.Players.LocalPlayer.Backpack

    local inventory = game.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll
    for _, v in pairs(inventory:GetChildren()) do
        local favourited = v:FindFirstChild("favourited")
        if favourited and not favourited.Visible then
            if v:FindFirstChild("raritystar") then
                if v:FindFirstChild("raritystar").ImageColor3 == Color3.fromRGB(119, 108, 181) then
            
                    if v:FindFirstChild("item") then
                        local GUILINK = v:FindFirstChild("item").Value
                        table.insert(fish,v)
                        
                        for _,item in backpack:GetChildren() do
                            
                            if item:FindFirstChild("link") and item:FindFirstChild("link").Value == GUILINK then
                                repeat task.wait() until plr.Character:FindFirstChildOfClass("Tool") == nil
                                item.Parent = plr.Character
                                item.offer:FireServer(game.Players:FindFirstChild(_G.PLR))
                                item.Parent = plr.Backpack
                            end
                        end
                       
                    end
                end
            end
        end
    end
end


function TradeLegendary()
    local fish = {}

    local plr = game.Players.LocalPlayer
    local backpack = game.Players.LocalPlayer.Backpack

    local inventory = game.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll
    for _, v in pairs(inventory:GetChildren()) do
        local favourited = v:FindFirstChild("favourited")
        if favourited and not favourited.Visible then
            if v:FindFirstChild("raritystar") then
                if v:FindFirstChild("raritystar").ImageColor3 == Color3.fromRGB(240, 181, 109) then
            
                    if v:FindFirstChild("item") then
                        local GUILINK = v:FindFirstChild("item").Value
                        table.insert(fish,v)
                        
                        for _,item in backpack:GetChildren() do
                            
                            if item:FindFirstChild("link") and item:FindFirstChild("link").Value == GUILINK then
                                repeat task.wait() until plr.Character:FindFirstChildOfClass("Tool") == nil
                                item.Parent = plr.Character
                                item.offer:FireServer(game.Players:FindFirstChild(_G.PLR))
                                item.Parent = plr.Backpack
                            end
                        end
                       
                    end
                end
            end
        end
    end
end

function TradeMythical()
    local fish = {}
    local fishtools = {}
    local plr = game.Players.LocalPlayer
    local backpack = game.Players.LocalPlayer.Backpack

    local inventory = game.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll
    for _, v in pairs(inventory:GetChildren()) do
        local favourited = v:FindFirstChild("favourited")
        if favourited and not favourited.Visible then
            if v:FindFirstChild("raritystar") then
                if v:FindFirstChild("raritystar").ImageColor3 == Color3.fromRGB(255, 62, 120) then
            
                    if v:FindFirstChild("item") then
                        local GUILINK = v:FindFirstChild("item").Value
                        table.insert(fish,v)
                        
                        for _,item in backpack:GetChildren() do
                            
                            if item:FindFirstChild("link") and item:FindFirstChild("link").Value == GUILINK then
                                repeat task.wait() until plr.Character:FindFirstChildOfClass("Tool") == nil
                                item.Parent = plr.Character
                                item.offer:FireServer(game.Players:FindFirstChild(_G.PLR))
                                item.Parent = plr.Backpack
                            end
                        end
                       
                    end
                end
            end
        end
    end
end

function TradeLimited()
    local fish = {}
    local fishtools = {}
    local plr = game.Players.LocalPlayer
    local backpack = game.Players.LocalPlayer.Backpack

    local inventory = game.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll
    for _, v in pairs(inventory:GetChildren()) do
        local favourited = v:FindFirstChild("favourited")
        if favourited and not favourited.Visible then
            if v:FindFirstChild("raritystar") then
                if v:FindFirstChild("raritystar").ImageColor3 == Color3.fromRGB(54, 73, 159) then
            
                    if v:FindFirstChild("item") then
                        local GUILINK = v:FindFirstChild("item").Value
                        table.insert(fish,v)
                        
                        for _,item in backpack:GetChildren() do
                            
                            if item:FindFirstChild("link") and item:FindFirstChild("link").Value == GUILINK then
                                repeat task.wait() until plr.Character:FindFirstChildOfClass("Tool") == nil
                                item.Parent = plr.Character
                                item.offer:FireServer(game.Players:FindFirstChild(_G.PLR))
                                item.Parent = plr.Backpack
                            end
                        end
                       
                    end
                end
            end
        end
    end
end


local InfoDeleteGui = InfoTab:CreateSection("Delete Gui")
local DeleteGui = InfoTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end,
 })
 local InfoUsage = InfoTab:CreateSection("How To Use")
 local Info1 = InfoTab:CreateLabel("Select Fish - Only Trades Unfavourited Fish.", "tally-1")
 local Info2 = InfoTab:CreateLabel("Select Player.", "tally-2")
 local Info3 = InfoTab:CreateLabel("Fire AutoTrader.", "tally-3")
 
 local InventoryDropdown
 local PlayerDropdownSection = AutoTraderTab:CreateSection("Select Player")
 local PlayerDropdown = AutoTraderTab:CreateDropdown({
    Name = "Player List",
    Options = {},
    CurrentOption = {},
    MultipleOptions = false,
    Flag = "Player", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)
        _G.PLR = Options[1]
    end,
 })
 local PlayerDropdownRefresh = AutoTraderTab:CreateButton({
    Name = "Refresh Player List",
    Callback = function()
        local new_list = {}
        for _,player in game:GetService("Players"):GetChildren() do
            if player ~= game:GetService("Players").LocalPlayer then
                table.insert(new_list,player.Name)
            end
        end
        PlayerDropdown:Refresh(new_list)
    end
 })





 local FishSelectorSection = AutoTraderTab:CreateSection("Select Fish")

 local SearchBar = AutoTraderTab:CreateInput({
    Name = "Item Name",
    CurrentValue = "",
    PlaceholderText = "",
    RemoveTextAfterFocusLost = false,
    Flag = "Search",
    Callback = function(Text)
        local inventory = game.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll
        for _, v in pairs(inventory:GetChildren()) do
            local favourited = v:FindFirstChild("favourited")
            if favourited and not favourited.Visible and string.find(v.Name,Text) then
                        if v:FindFirstChild("item") then
                            local GUILINK = v:FindFirstChild("item").Value
                       
                            local plr = game.Players.LocalPlayer
                            local backpack = game.Players.LocalPlayer.Backpack



                            for _,item in backpack:GetChildren() do
                                if item:FindFirstChild("link") and item:FindFirstChild("link").Value == GUILINK then
                                    repeat task.wait() until plr.Character:FindFirstChildOfClass("Tool") == nil
                                    item.Parent = plr.Character
                                    item.offer:FireServer(game.Players:FindFirstChild(_G.PLR))
                                    item.Parent = plr.Backpack
                                end
                            end
                           
                        end
                    end
        end
    end,
 })
 local COMMMON = AutoTraderTab:CreateButton({
    Name = "Trade Commons",
    Callback = function()
      
        TradeCommon()
        
    end
 })



 local UNCOMMON = AutoTraderTab:CreateButton({
    Name = "Trade Uncommons",
    Callback = function()
      
        TradeUncommon()
        
    end
 })




 local UNUSUAL = AutoTraderTab:CreateButton({
    Name = "Trade Unusuals",
    Callback = function()
      
        TradeUnusual()
        
    end
 })




 local RARE = AutoTraderTab:CreateButton({
    Name = "Trade Rares",
    Callback = function()
      
        TradeRare()
        
    end
 })



 local LEGENDARY = AutoTraderTab:CreateButton({
    Name = "Trade Legendaries",
    Callback = function()
      
        TradeLegendary()
        
    end
 })



 local MYTHIC = AutoTraderTab:CreateButton({
    Name = "Trade Mythicals",
    Callback = function()
      
        TradeMythical()
        
    end
 })

 local LIMITED = AutoTraderTab:CreateButton({
    Name = "Trade LIMITED",
    Callback = function()
      
        TradeLimited()
        
    end
 })



 local new_list = {}
 for _,player in game:GetService("Players"):GetChildren() do
     if player ~= game:GetService("Players").LocalPlayer then
         table.insert(new_list,player.Name)
     end
 end
 PlayerDropdown:Refresh(new_list)
