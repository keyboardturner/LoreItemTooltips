local LoreItemTooltips, LIT = ...
local match = string.match
local strsplit = strsplit
local logoImage = "Interface/AddOns/LoreItemTooltips/LITImage.blp"

LitDB = LitDB or {
	R = 1,
	G = 0.82,
	B = 0,
}

local function ShowColorPicker(r, g, b, a, changedCallback)
	ColorPickerFrame.hasOpacity, ColorPickerFrame.opacity = (a ~= nil), a;
	ColorPickerFrame.previousValues = {r,g,b,a};
	ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = changedCallback, changedCallback, changedCallback;
	ColorPickerFrame:SetColorRGB(r,g,b);
	ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
	ColorPickerFrame:Show();
end

local defR,defG,defB = 1,0.82,0;

local function myColorCallback(restore)
	local newR, newG, newB, newA; -- I forgot what to do with the alpha value but it's needed to not swap RGB values
	if restore then
	 -- The user bailed, we extract the old color from the table created by ShowColorPicker.
		newR, newG, newB, newA = unpack(restore);
	else
	 -- Something changed
		newA, newR, newG, newB = OpacitySliderFrame:GetValue(), ColorPickerFrame:GetColorRGB();
	end

 -- Update our internal storage.
local r, g, b = newR, newG, newB;
LitDB.R, LitDB.G, LitDB.B = r, g, b;
 -- And update any UI elements that use this color...
end

local function GameTooltip_OnTooltipSetItem(tooltip)
	local _, link = tooltip:GetItem()
	if not link then return; end
	
	local itemString = match(link, "item[%-?%d:]+")
	if not itemString then return end
	local _, itemId = strsplit(":", itemString)

	if itemId == "0" and TradeSkillFrame ~= nil and TradeSkillFrame:IsVisible() then
		if (GetMouseFocus():GetName()) == "TradeSkillSkillIcon" then
			itemId = GetTradeSkillItemLink(TradeSkillFrame.selectedSkill):match("item:(%d+):") or nil
		else
			for i = 1, 8 do
				if (GetMouseFocus():GetName()) == "TradeSkillReagent"..i then
					itemId = GetTradeSkillReagentItemLink(TradeSkillFrame.selectedSkill, i):match("item:(%d+):") or nil
					break
				end
			end
		end
	end

	local itemText = LIT.ItemIdTable[itemId]
	if type(itemText) == "number" then
		itemText = LIT.ItemIdTable[itemText]
	end

	if itemText then
		tooltip:AddLine(itemText , LitDB.R, LitDB.G, LitDB.B, 1)
	end
end

local LitText = "|T" .. logoImage .. ":14|t" .. "|cffffd100Lore Item Tooltips|r: "

local function round(number, decimals)
	return (("%%.%df"):format(decimals)):format(number)
end

local _dummy, core = ...; -- handles slash commands

core.commands = {
	["reset"] = function()
		print(LitText .. "Colours have been reset! Previous values were:" .. "\nRGB(0-1) - |cffff7f7f" .. round(LitDB.R,2) .. "|r, |cff7fff7f" .. round(LitDB.G,2) .. "|r, |cff7f7fff" .. round(LitDB.B,2) .. "|r\nRGB(0-255) - |cffff7f7f" .. round(LitDB.R*255) .. "|r, |cff7fff7f" .. round(LitDB.G*255) .. "|r, |cff7f7fff" .. round(LitDB.B*255) .. "|r")
		LitDB.R,LitDB.G,LitDB.B = defR,defG,defB
	end,

    ["color"] = function()
    	ShowColorPicker(LitDB.R, LitDB.G, LitDB.B, nil, myColorCallback);
    	print(LitText .. "Current values: " .. "\nRGB(0-1) - |cffff7f7f" .. round(LitDB.R,2) .. "|r, |cff7fff7f" .. round(LitDB.G,2) .. "|r, |cff7f7fff" .. round(LitDB.B,2) .. "|r\nRGB(0-255) - |cffff7f7f" .. round(LitDB.R*255) .. "|r, |cff7fff7f" .. round(LitDB.G*255) .. "|r, |cff7f7fff" .. round(LitDB.B*255) .. "|r")
	end,

    ["help"] = function()
		print(LitText .. "Type |cffffe880/lit|r, |cffffe880/litt|r, or |cffffe880/loreitemtooltips|r to bring up the color picker. Do |cffffe880/lit reset|r to reset the colors to the default game yellow flavor text. Special thanks to those who contributed in |cffffe880/lit credits|r!")
	end,

	["credits"] = function()
		print(LitText .. "Special thanks to the following people who helped contribute to this project!" .. "\n|cffffe880Rheä-WyrmrestAccord(US)|r - 81 items")
	end,

	["credit"] = function()
		core.commands.credits();
	end,
};

local function HandleSlashCommands(str)
	if (#str == 0) then
		core.commands.color();
		return;
	end
	
	local args = {};
	for _dummy, arg in ipairs({ string.split(' ', str) }) do
		if (#arg > 0) then
			table.insert(args, arg);
		end
	end
	
	local path = core.commands; -- required for updating found table.
	
	for id, arg in ipairs(args) do
	
		if (#arg > 0) then --if string length is greater than 0
			arg = arg:lower();          
			if (path[arg]) then
				if (type(path[arg]) == "function") then             
					-- all remaining args passed to our function!
					path[arg](select(id + 1, unpack(args))); 
					return;                 
				elseif (type(path[arg]) == "table") then                
					path = path[arg]; -- another sub-table found!
				end
			else
				core.commands.help();
				return;
			end
		end
	end
end

function core:init(event, name)
	if (name ~= "LoreItemTooltips") then return end 

	SLASH_LOREITEMTOOLTIPS1 = "/loreitemtooltips"
	SLASH_LOREITEMTOOLTIPS2 = "/lit"
	SLASH_LOREITEMTOOLTIPS3 = "/litt"
	SLASH_LOREITEMTOOLTIPS4 = "/loreitemtooltip"
	SlashCmdList.LOREITEMTOOLTIPS = HandleSlashCommands;
end

local events = CreateFrame("Frame");
events:RegisterEvent("ADDON_LOADED");
events:SetScript("OnEvent", core.init);

GameTooltip:HookScript("OnTooltipSetItem", GameTooltip_OnTooltipSetItem)
ItemRefTooltip:HookScript("OnTooltipSetItem", GameTooltip_OnTooltipSetItem)