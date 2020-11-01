local match = string.match
local strsplit = strsplit

local ItemIdTable = {

--Draenei
	--Ammen Vale
	["24414"] = "\"Survey the extent of the islands and report back. Remember, do not get caught! Do not fail me, Candress!\"\n - S", -- Blood Elf Plans
	["23003"] = "\"Survey the extent of the islands and report back. Remember, do not get caught! Do not fail me, Candress!\"\n - S", -- Blood Elf Plans


	--Azuremyst Isle
	["23614"] = "\"Mmmm, very tasty.\"", -- Red Snapper - Very Tasty!
	["23672"] = "\"Filled to the brim with tasty red snapper, unlike other boxes...\"", --Crate of Red Snapper
	["23685"] = "\"Said to hold medicinal properties, these vines can be ground into a powerful healing ointment.\"", -- Root Trapper Vine
	["23692"] = "\"Found near the base of the azure pine trees, the Azure Snapdragon holds claim to being a cure-all. The bulb glows with a faint teal dust.\"", -- Azure Snapdragon Bulb
	["23757"] = "\"Arrr... Dinner tonight be crab gumbo!\"", -- Skittering Crawler Meat
	["23791"] = "\"Clumps of leaves from the nearby purple and azure trees.\"", -- Pile of Leaves
	["23790"] = "\"Often a habitat for wildlife, this tree hollow was never claimed as a home by any animal.\"", -- Hollowed Out Tree
	["23779"] = "\"You're unsure what these relics are exactly, but you do know that these things can get damaged and broken.\"", -- Ancient Relic
	["23759"] = "\"It seems similar to elven script you've seen before, but there is definitely something different about it.\"", -- Rune Covered Tablet
	["23792"] = "\"Wood you beleaf it? You get to spruce yourself up to find who committed treeson!\"", -- Tree Disguise Kit
	["23789"] = "\"A grisly sight to behold, very little remains. You're able to identify humanoid bones.\"", -- Remains of Cowlen's Family
	["23849"] = "\"The food-stuffs of the Stillpine Furbolg.\"", -- Stillpine Grain
	["23845"] = "\"This piece appears to be especially durable.\"", -- Ravager Hide
	["23860"] = "\"The glistening snow-white hide appears to be one of toughest you've encountered.\"", -- The Kurken's Hide

	--Bloodmyst Isle
	["24040"] = "\"Distinctive in their appearance, they appear to grow all around. You can't help but feel your blood tingle upon touching it.\"", -- Blood Mushroom
	["24041"] = "\"Found in the aquatic rivers, the Stinkhorn Striker feed upon the fungus' tendrils.\"", -- Aquatic Stinkhorn
	["24042"] = "\"The mushroom appears as though it's breathing.\"", -- Ruinous Polyspore
	["24043"] = "\"A scaly, gray base and a thick, slimy brown top, these seem to emanate some sort of Fel puff.\"", -- Fel Cone Fungus
	["23994"] = "\"The spines are sharp and ooze a deadly toxin.\"", -- Thorny Constrictor Vine
	["24026"] = "\"Tainted with the red crystals of the Exodar, the bear meat can be purified and safely eaten.\"", -- Elder Brown Bear Flank
	["23984"] = "\"Can be turned in to Vindicator Boros in Blood Watch.\"", -- Irradiated Crystal Shard
	["24025"] = "\"Splintered and discolored with irradiated crystal shards. You can't help but feel the behavior of this bear was influenced by pain and suffering.\"", -- Deathclaw's Paw
	["24153"] = "\"You can feel some sort of magical tether trying to pull itself away, yet it remains bound to reality.\"", -- Bloodcursed Soul
	["24049"] = "\"Named after the nearby veridian dragons, the mushroom emits a green glow.\"", -- Ysera's Tear
	["23846"] = "\"The box is dirtied and ancient.\"", -- Nolkai's Box
	["24237"] = "\"Though battered and blooded, the pages are legible.\"", -- Galaen's Journal
	["24236"] = "\"An assortment of bandages, healing crystals, potions, salves, and other miscellaneous supplies.\"", -- Medical Supplies

--Blood Elf
	--Sunstrider Isle
	["20482"] = "\"All but a remnant of the control the blood elves held over these creatures. Perhaps these can be refashioned?\"", -- Arcane Sliver
	["20471"] = "\"A belonging of Solanian. Details of sickly green Necrotic runes and other insidious magics cover the parchment.\"", -- Scroll of Scourge Magic
	["20470"] = "\"A belonging of Solanian. As you peer into the orb, glimpses of visions stir within. You can't quite make out what they are.\"", -- Solanian's Scrying Orb
	["20472"] = "\"A belonging of Solanian. This journal details vigil over the Sunwell over the years.\"", -- Solanian's Journal
	["20474"] = "\"Solanian gave you this satchel for you to keep.\"", -- Sunstrider Book Satchel
	["20799"] = "\"The result of one whose insatiable magic addiction got the best of him.\"", -- Felendren's Head

	--Ruins of Silvermoon
	["20743"] = "\"Capable of exploding with enough force to blow a hole in the city walls. Handle with care!\"", -- Unstable Mana Crystal
	["21808"] = "\"Still useful and quite powerful.\"", -- Arcane Core
	["20804"] = "\"Spattered with blood, but otherwise undamaged.\"", -- Erona's Package
	["21781"] = "\"Wanted for repeated crimes against the general populace of Silvermoon City and murder of two guards.\"", -- Thaelis' Head
	["21807"] = "\"A letter kept confidential to be delivered to Ley-Keeper Caidanis.\"", -- Unmarked Letter

	--Eversong
	["22414"] = "\"The book is waterlogged and ruined.\"", -- Antheol's Elemental Grimoire
	["20765"] = "\"Detailed drawings of an arcane sanctum with notes written in Dwarven.\"", -- Incriminating Documents
	["20764"] = "\"Bearded and angry, the spy has been dealt with.\"", -- Prospector Anvilward's Head
	["20772"] = "\"A high quality pelt. Adventurers travel far just to poach the springpaw lynx.\"", -- Springpaw Pelt
	["23228"] = "\"The initials L.R. are etched on to the pendant.\"", -- Old Whitebark's Pendant
	["28209"] = "\"The initials L.R. are etched on to the pendant.\"", -- Old Whitebark's Pendant
	["20771"] = "\"Steeped with necrotic energy, these clumps of soil from the Dead Scar draw the Scourge towards it.\"", -- Tainted Soil sample
	["22735"] = "\"Valuable data concluding Apprentice Mirvveda's research, indicating the Dead Scar is irreversible.\"", -- Research Notes
	
	--Tor'Watha
	["20759"] = "\"Light, strong and well-balanced, this hammer appears to be crafted using magic.\"", -- Otembe's Hammer
	["20760"] = "\"As described, his head is pretty ugly.\"", -- Chieftan Zul'Marosh's Head
	["23249"] = "\"The plans appear to be in Zandali, marking Farstrider Retreat and Fairbreeze Village.\"", -- Amani Invasion Plans

	--Sunsail Anchorage
	["22413"] = "\"An assortment of swords, glaives, arrows, staves, and daggers. The armaments are meticulously crafted to display gold and red metals.\"", -- Sin'dorei Armaments
	["22487"] = "\"Having led the siege upon Sunsail Anchorage, Aldaron's deformed head emanates fel energy.\"", -- Aldaron's Head
	["21757"] = "\"Ask a murloc head anything you want to, they won't answer, they can't talk.\"", --Grimscale Murloc Head

	--Ghostlands
	["22570"] = "\"Infected with the plague, these bloodsamples from the nearby ghostclaw and mistbats can be distilled into a serum.\"", -- Plagued Blood Sample
	["22717"] = "\"A warning from Regent Lord Lor'themar Theron, to be delivered to Arcanist Vandril.\"", -- Letter from Silvermoon
	["22894"] = "\"At least you don't need to bring back the knuckles.\"", -- Knucklerot's Head
	["22893"] = "\"The eyeball still seems to be looking around.\"", -- Luzran's Head
	["22580"] = "\"Despite all it's been through, the mana essence is still rather powerful.\"", -- Crystallized Mana Essence
	["22579"] = "\"These little bones may hold the secrets of the plague!\"", -- Plagued Murloc Spine
	["22641"] = "\"Rumor has it that the Amani eat the hearts of their enemies to gain their strength. Despite this, it may be unwise to eat this particular heart.\"", -- Rotting Heart
	["22642"] = "\"Necrotic magic appears to coalesce within this dust.\"", -- Spinal Dust
	["22778"] = "\"Side effects may include temporary joint stiffness.\"", -- Scourgebane Infusion
	["22779"] = "\"Enough to really make the undead feel your slap.\"", -- Scourgebane Draught
	["22674"] = "\"Worn by the denizens of Suncrown Village to subjugate the water elementals.\"", -- Wavefront Medallion
	["22675"] = "\"Worn by the denizons of Suncrown Village to subjugate the water elementals.\"", -- Bundle of Medallions
	["22706"] = "\"There are many details about powerful artifacts, mysterious places, and details of the Scourge and Necromancy within.\"", -- Dar'Khan's Journal
	["22599"] = "\"Imbued with the power of the Sunwell, this is one of three artifacts created by Belo'vir Salonar during the Troll Wars. Though thought to be objects of myth and legend, evidently they exist.\"", -- Stone of Flame
	["22598"] = "\"Imbued with the power of the Sunwell, this is one of three artifacts created by Belo'vir Salonar during the Troll Wars. Though thought to be objects of myth and legend, evidently they exist.\"", -- Stone of Light
	["22628"] = "\"Capable of ridding most forms of alchemically induced stupor.\nSide effects may include: confusion, nausea, and temporary blindness.\"", -- Janeda's Restorative Draught
	["22653"] = "\"A traitor to the Kingdom of Quel'Thalas, Dar'Khan Drathir was responsible for allowing the Scourge to penetrate the Ban'dinoriel - the gates of the elven kingdom. Though he has been killed many times before, perhaps this will be the last.\"", -- Dar'Khan's Head
	["23929"] = "\"Pertaining to the news of Dar'Khan Drathir.\"", -- Letter from Lor'themar Theron
	["23930"] = "\"Pertaining to the news of Dar'Khan Drathir.\"", -- Letter Sealed by Sylvanas

--Outland
	--Hellfire Peninsula (Horde)
	["28024"] = "\"A request for aid against the Burning Legion.\"", -- Orion's Report
	["67419"] = "\"Just a little bent and rusty, but otherwise usable.\"", -- Salvaged Metal
	["30327"] = "\"Tainted with demonic corruption, the cannibalistic orcs once decorated themselves with the bones of their enemies.\"", -- Bonechewer Blood
	["67420"] = "\"Just a little burnt and charred, but otherwise usable.\"", -- Salvage Wood
	["28478"] = "\"Designed by the goblins of Area 52, these primers use the power of demons against them.\"", -- To'arch's Primers
	["28106"] = "\"Designed by the goblins of Area 52, these primers use the power of demons against them.\"", -- Kingston's Primers
	["28513"] = "\"Filled with demonic power.\"", -- Demonic Rune Stone
	["28132"] = "\"Look out below!\"", -- Area 52 Special
	["30326"] = "\"Tainted with demonic corruption, the cannibalistic orcs once decorated themselves with the bones of their enemies.\"", -- Bonechewer Blood Samples
	["30404"] = "\"Once practitioners of dark blood magic, the ritualistic orcs now serve the Fel Horde.\"", -- Bleeding Hollow Blood Sample
	["30425"] = "\"Once practitioners of dark blood magic, the ritualistic orcs now serve the Fel Horde.\"", -- Bleeding Hollow Blood
	["30430"] = "\"Free of the curse magic of the Bleeding Hollow warlocks.\"", -- Boiled Blood
	["31374"] = "\"Red, spiky, and corrupted!\"", -- Worg Master's Head
	["31550"] = "\"Details pertaining to the corruption of the fel orcs.\"", -- Albreck's Findings
	["31463"] = "\"Green!\"", -- Zezzak's Shard
	["31607"] = "\"Written eloquently.\"", -- Demoniac Scryer Reading
	["31606"] = "\"You feel as though you're being watched.\"", -- Demoniac Scryer
	["31702"] = "\"The banner is fancier looking than that of the Fel Horde.\"", -- Challenge From the Horde
	["23550"] = "\"It seems Orcish, but uncorrupted.\"", -- Heavy Stone Axe
	["29051"] = "\"The dust appears to absorb light and looks as though it will fade at any moment.\"", -- Warp Nether
	["23268"] = "\"Nothing like a little alchemical ingredients to give it some extra flavor!\"", -- Purification Mixture
	["28116"] = "\"Some of these parts don't look remotely recoverable.\"", -- Zeppelin Debris
	["28554"] = "\"Why would fel orcs steal parts and leave them in a worm-infested gorge?\"", -- Shredder Spare Parts
	["30794"] = "\"It stinks.\"", -- Shredder Keys
	["23569"] = "\"A sealed welcoming letter to the Horde.\"", -- Letter from the Mag'har
	["23339"] = "\"The book does not recount any research, but rather the escapades with another young woman.\"", -- Arelion's Journal
	["23269"] = "\"It froths and bubbles violently, as if it were angry.\"", -- Felblood Sample
	["29476"] = "\"Emanates with a sickly, evil aura.\"", -- Crimson Crystal Shard
	["29478"] = "\"Appears to contain the powers of nature within.\"", -- Seed of Revitalization
	["23336"] = "\"Just holding this sample makes you feel angry.\"", -- Helboar Blood Sample
	["23337"] = "\"Finally, a cure for the helboars!\"", -- Cenarion Antidote
	["29501"] = "\"Jagged and fel-infused metal.\"", -- Sha'naar Key
	["29113"] = "\"Could this be the source of the Broken's corruption?\"", -- Demonic Essence
	["29513"] = "\"Once a symbol of the Dreghood tribe, it's now infused with the power of the Elements.\"", -- Staff of the Dreghood Elders
	["23358"] = "\"Used by anchorites to signal a safe area for their rituals.\"", -- Signaling Gem
	["23480"] = "\"A lit torch is a torch that is lit or else it is not a lit torch.\"", -- Lit Torch
	["23486"] = "\"A very tiny bird.\"", -- Caged Female Kaliri Hatchling
	["23483"] = "\"Ancient arcane scripture is written on these scrolls.\"", -- Haal'eshi Scroll

	--Zangarmarsh (Horde)
	["24382"] = "\"A progress report on Swamprat Post.\"", -- Zurai's Report
	["24401"] = "\"Can be handed in to Lauranna Thar'well at the Cenarion Refuge, Zangarmarsh.\"", -- Unidentified Plant Parts

--Mounts
	--Swift Hawkstriders
	["29223"] = "\"Their plumage is more beautiful than any other. Subtlety is for the birds! I mean... other birds.\"\n - Viera Sunwhisper",
	["28936"] = "\"Their plumage is more beautiful than any other. Subtlety is for the birds! I mean... other birds.\"\n - Viera Sunwhisper",
	["29224"] = "\"Their plumage is more beautiful than any other. Subtlety is for the birds! I mean... other birds.\"\n - Viera Sunwhisper",

	--Hawkstriders
	["29221"] = "\"Some of our brethren prefer horses, but the hawkstrider will always be the true symbol of Silvermoon.\"\n - Winaestra",
	["29220"] = "\"Some of our brethren prefer horses, but the hawkstrider will always be the true symbol of Silvermoon.\"\n - Winaestra",
	["28927"] = "\"Some of our brethren prefer horses, but the hawkstrider will always be the true symbol of Silvermoon.\"\n - Winaestra",
	["29222"] = "\"Some of our brethren prefer horses, but the hawkstrider will always be the true symbol of Silvermoon.\"\n - Winaestra",

	--Swift Elekks
	["29745"] = "\"An alpha member of the herd, this elekk is a prime example of the mighty creatures which thunder through Northern Nagrand.\"",
	["29746"] = "\"An alpha member of the herd, this elekk is a prime example of the mighty creatures which thunder through Northern Nagrand.\"",
	["29747"] = "\"An alpha member of the herd, this elekk is a prime example of the mighty creatures which thunder through Northern Nagrand.\"",

	--Elekks
	["28481"] = "\"Patient and strong, the Elekk exemplify the Draenei attitude towards the hardships of life.\"",
	["29744"] = "\"Patient and strong, the Elekk exemplify the Draenei attitude towards the hardships of life.\"",
	["29743"] = "\"Patient and strong, the Elekk exemplify the Draenei attitude towards the hardships of life.\"",

};


--this is horrible and I hate it but idk here we go
if litR == nil then
	litR = 1
end
if litG == nil then
	litG = .82
end
if litB == nil then
	litB = 0
end

function ShowColorPicker(r, g, b, a, changedCallback)
	ColorPickerFrame.hasOpacity, ColorPickerFrame.opacity = (a ~= nil), a;
	ColorPickerFrame.previousValues = {r,g,b,a};
	ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = changedCallback, changedCallback, changedCallback;
	ColorPickerFrame:SetColorRGB(r,g,b);
	ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
	ColorPickerFrame:Show();
end

local defR,defG,defB = 1,.82,0;

local function myColorCallback(restore)
	local newR, newG, newB, newA;
	if restore then
	 -- The user bailed, we extract the old color from the table created by ShowColorPicker.
		newR, newG, newB, newA = unpack(restore);
	else
	 -- Something changed
		newA, newR, newG, newB = OpacitySliderFrame:GetValue(), ColorPickerFrame:GetColorRGB();
	end

 -- Update our internal storage.
r, g, b, a = newR, newG, newB, newA;
litR, litG, litB = r, g, b;
 -- And update any UI elements that use this color...
end

local function GameTooltip_OnTooltipSetItem(tooltip)
	local _, link = tooltip:GetItem()
	if not link then return; end
	
	local itemString = match(link, "item[%-?%d:]+")
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

	local itemText = ItemIdTable[itemId]
	if type(itemText) == "number" then
		itemText = ItemIdTable[itemText]
	end

	if itemText then
		tooltip:AddLine(itemText , litR,litG,litB, 1)
	end
end

SLASH_LIT_SCP1 = "/lit"
SLASH_LIT_SCP2 = "/loreitemtooltips"
SLASH_LIT_SCP3 = "/loreitemtooltip"
SlashCmdList["LIT_SCP"] = function(msg)
	ShowColorPicker(litR,litG,litB,nil, myColorCallback);
end

local resetText = "|cffffd100Lore Item Tooltips|r: colours have been reset! Previous values were:"

local function round(number, decimals)
	return (("%%.%df"):format(decimals)):format(number)
end

SLASH_LIT_RESET1 = "/litreset"
SLASH_LIT_RESET2 = "/loreitemtooltipsreset"
SLASH_LIT_RESET3 = "/loreitemtooltipreset"
SlashCmdList["LIT_RESET"] = function(msg)
	print(resetText .. "\nRGB(0-1) - |cffff7f7f" .. round(litR,2) .. "|r, |cff7fff7f" .. round(litG,2) .. "|r, |cff7f7fff" .. round(litB,2) .. "|r\nRBG(0-255) - |cffff7f7f" .. round(litR*255) .. "|r, |cff7fff7f" .. round(litG*255) .. "|r, |cff7f7fff" .. round(litB*255) .. "|r")
	litR,litG,litB = defR,defG,defB
	 r, g, b, a = defR,defG,defB,nil
end

GameTooltip:HookScript("OnTooltipSetItem", GameTooltip_OnTooltipSetItem)
ItemRefTooltip:HookScript("OnTooltipSetItem", GameTooltip_OnTooltipSetItem)