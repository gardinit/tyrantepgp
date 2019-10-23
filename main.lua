local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_RAID")
frame:RegisterEvent("CHAT_MSG_GUILD")
frame:RegisterEvent("CHAT_MSG_RAID_LEADER")

local gpValues = {
    ["Ring of Binding"] = "  -- Need: 24 - Greed: 6"
    ,["Crimson Shocker"] = " -- Need: 36 - Greed: 9"
    ,["Flamewalker Legplates"] = " -- Need: 36 - Greed: 9"
    ,["Shadowstrike"] = " -- Need: 36 - Greed: 9"
    ,["Core Forged Greaves"] = " -- Need: 36 - Greed: 9"
    ,["Fireguard Shoulders"] = " -- Need: 36 - Greed: 9"
    ,["Fireproof Cloak"] = " -- Need: 36 - Greed: 9"
    ,["Choker of Enlightenment"] = " -- Need: 72 - Greed: 18"
    ,["Helm of the Lifegiver"] = " -- Need: 72 - Greed: 18"
    ,["Manastorm Leggings"] = " -- Need: 72 - Greed: 18"
    ,["Ring of Spell Power"] = " -- Need: 72 - Greed: 18 -- Priority: Mages then Warlocks"
    ,["Wristguards of Stability"] = " -- Need: 72 - Greed: 18"
    ,["Seal of the Archmagus"] = " -- Need: 72 - Greed: 18"
    ,["Cenarion Bracers"] = " -- Need: 72 - Greed: 18"
    ,["Cenarion Belt"] = " -- Need: 72 - Greed: 18"
    ,["Giantstalker Bracers"] = " -- Need: 72 - Greed: 18"
    ,["Giantstalker Belt"] = " -- Need: 72 - Greed: 18"
    ,["Arcanist Bindings"] = " -- Need: 72 - Greed: 18"
    ,["Arcanist Belt"] = " -- Need: 72 - Greed: 18"
    ,["Vambraces of Prophecy"] = " -- Need: 72 - Greed: 18"
    ,["Girdle of Prophecy"] = " -- Need: 72 - Greed: 18"
    ,["Nightslayer Bracelets"] = " -- Need: 72 - Greed: 18"
    ,["Nightslayer Belt"] = " -- Need: 72 - Greed: 18"
    ,["Felheart Bracers"] = " -- Need: 72 - Greed: 18"
    ,["Felheart Raiment"] = " -- Need: 72 - Greed: 18"
    ,["Bracers of Might"] = " -- Need: 72 - Greed: 18"
    ,["Belt of Might"] = " -- Need: 72 - Greed: 18"
    ,["Lawbringer Bracers"] = " -- Need: 72 - Greed: 18"
    ,["Lawbringer Belt"] = " -- Need: 72 - Greed: 18"
    ,["Ancient Cornerstone Grimoire"] = " -- Need: 72 - Greed: 18"
    ,["Magma Tempered Boots"] = " -- Need: 72 - Greed: 18"
    ,["Aged Core Leather Gloves"] = " -- Need: 108 - Greed: 27 -- Priority: Rogues then Druids"
    ,["Earthshaker"] = " -- Need: 108 - Greed: 27"
    ,["Fire Runed Grimoire"] = " -- Need: 108 - Greed: 27"
    ,["Obsidian Edged Blade"] = " -- Need: 108 - Greed: 27"
    ,["Sabatons of the Flamewalker"] = " -- Need: 108 - Greed: 27"
    ,["Gutgore Ripper"] = " -- Need: 108 - Greed: 27"
    ,["Finkle's Lava Dredger"] = " -- Need: 108 - Greed: 27"
    ,["Essence of the Pure Flame"] = " -- Need: 108 - Greed: 27"
    ,["Shard of the Flame"] = " -- Need: 108 - Greed: 27"
    ,["Cenarion Helmet"] = " -- Need: 108 - Greed: 27"
    ,["Cenarion Shoulders"] = " -- Need: 108 - Greed: 27"
    ,["Cenarion Gloves"] = " -- Need: 108 - Greed: 27"
    ,["Cenarion Leggings"] = " -- Need: 108 - Greed: 27"
    ,["Cenarion Boots"] = " -- Need: 108 - Greed: 27"
    ,["Giantstalker Helmet"] = " -- Need: 108 - Greed: 27"
    ,["Giantstalker Shoulders"] = " -- Need: 108 - Greed: 27"
    ,["Giantstalker Gloves"] = " -- Need: 108 - Greed: 27"
    ,["Giantstalker Leggings"] = " -- Need: 108 - Greed: 27"
    ,["Giantstalker Boots"] = " -- Need: 108 - Greed: 27"
    ,["Arcanist Crown"] = " -- Need: 108 - Greed: 27"
    ,["Arcanist Mantle"] = " -- Need: 108 - Greed: 27"
    ,["Arcanist Gloves"] = " -- Need: 108 - Greed: 27"
    ,["Arcanist Leggings"] = " -- Need: 108 - Greed: 27"
    ,["Arcanist Boots"] = " -- Need: 108 - Greed: 27"
    ,["Circlet of Prophecy"] = " -- Need: 108 - Greed: 27"
    ,["Mantle of Prophecy"] = " -- Need: 108 - Greed: 27"
    ,["Gloves of Prophecy"] = " -- Need: 108 - Greed: 27"
    ,["Pants of Prophecy"] = " -- Need: 108 - Greed: 27"
    ,["Boots of Prophecy"] = " -- Need: 108 - Greed: 27"
    ,["Nightslayer Cover"] = " -- Need: 108 - Greed: 27"
    ,["Nightslayer Shoulderpads"] = " -- Need: 108 - Greed: 27"
    ,["Nightslayer Gloves"] = " -- Need: 108 - Greed: 27"
    ,["Nightslayer Pants"] = " -- Need: 108 - Greed: 27"
    ,["Nightslayer Boots"] = " -- Need: 108 - Greed: 27"
    ,["Felheart Horns"] = " -- Need: 108 - Greed: 27"
    ,["Felheart Shoulderpads"] = " -- Need: 108 - Greed: 27"
    ,["Felheart Gloves"] = " -- Need: 108 - Greed: 27"
    ,["Felheart Pants"] = " -- Need: 108 - Greed: 27"
    ,["Felheart Slippers"] = " -- Need: 108 - Greed: 27"
    ,["Helm of Might"] = " -- Need: 108 - Greed: 27"
    ,["Pauldrons of Might"] = " -- Need: 108 - Greed: 27"
    ,["Gauntlets of Might"] = " -- Need: 108 - Greed: 27"
    ,["Legplates of Might"] = " -- Need: 108 - Greed: 27"
    ,["Sabatons of Might"] = " -- Need: 108 - Greed: 27"
    ,["Lawbringer Helmet"] = " -- Need: 108 - Greed: 27"
    ,["Lawbringer Spaulders"] = " -- Need: 108 - Greed: 27"
    ,["Lawbringer Gloves"] = " -- Need: 108 - Greed: 27"
    ,["Lawbringer Legplates"] = " -- Need: 108 - Greed: 27"
    ,["Lawbringer Boots"] = " -- Need: 108 - Greed: 27"
    ,["Flameguard Gauntlets"] = " -- Need: 126 - Greed: 31.5"
    ,["Sorcerous Dagger"] = " -- Need: 144 - Greed: 36"
    ,["Eskhandar's Right Claw"] = " -- Need: 144 - Greed: 36"
    ,["Gloves of the Hypnotic Flame"] = " -- Need: 144 - Greed: 36"
    ,["Sash of Whispered Secrets"] = " -- Need: 144 - Greed: 36"
    ,["Dragon's Blood Cape"] = " -- Need: 144 - Greed: 36"
    ,["Malistar's Defender"] = " -- Need: 144 - Greed: 36"
    ,["Cenarion Vestments"] = " -- Need: 144 - Greed: 36"
    ,["Giantstalker's Breastplate"] = " -- Need: 144 - Greed: 36"
    ,["Arcanist Robe"] = " -- Need: 144 - Greed: 36"
    ,["Robes of Prophecy"] = " -- Need: 144 - Greed: 36"
    ,["Nightslayer Chestpiece"] = " -- Need: 144 - Greed: 36"
    ,["Felheart Robes"] = " -- Need: 144 - Greed: 36"
    ,["Breastplate of Might"] = " -- Need: 144 - Greed: 36"
    ,["Lawbringer Chestguard"] = " -- Need: 144 - Greed: 36"
    ,["Bindings of the Windseeker"] = " -- Need: 180"
    ,["Deep Earth Spaulders"] = " -- Need: 180 - Greed: 45"
    ,["Cloak of the Shrouded Mists"] = " -- Need: 180 - Greed: 45 -- Prioirty: Hunters/Tanks"
    ,["Spinal Reaper"] = " -- Need: 180 - Greed: 45"
    ,["Sapphiron Drape"] = " -- Need: 180 - Greed: 45"
    ,["Aurastone Hammer"] = " -- Need: 198 - Greed: 49.5 -- Priority: Druids"
    ,["Blastershot Launcher"] = " -- Need: 198 - Greed: 49.5"
    ,["Bonereaver's Edge"] = " -- Need: 198 - Greed: 49.5"  
    ,["Brutality Blade"] = " -- Need: 216 - Greed: 54 -- Prioirty: Warriors/Rogues"  
    ,["Drillborer Disk"] = " -- Need: 216 - Greed: 54"  
    ,["Staff of Dominance"] = " -- Need: 216 - Greed: 54"  
    ,["Band of Sulfuras"] = " -- Need: 216 - Greed: 54"  
    ,["Vis'kag the Bloodletter"] = " -- Need: 216 - Greed: 54 -- Prioirty: Warriors/Rogues"
    ,["Stormrage Cover"] = " -- Need: 240 - Greed: 60"
    ,["Dragonstalker's Helm"] = " -- Need: 240 - Greed: 60"
    ,["Netherwind Crown"] = " -- Need: 240 - Greed: 60"
    ,["Halo of Transcendence"] = " -- Need: 240 - Greed: 60"
    ,["Bloodfang Hood"] = " -- Need: 240 - Greed: 60"
    ,["Nemesis Skullcap"] = " -- Need: 240 - Greed: 60"
    ,["Helm of Wrath"] = " -- Need: 240 - Greed: 60"
    ,["Judgement Crown"] = " -- Need: 240 - Greed: 60"
    ,["Mana Igniting Cord"] = " -- Need: 252 - Greed: 63"
    ,["Azuresong Mageblade"] = " -- Need: 252 - Greed: 63 -- Prioirty: Mages/Warlocks/Paladins"
    ,["Cauterizing Band"] = " -- Need: 252 - Greed: 63  -- Priority: Priest/Druid"
    ,["Wristguards of True Flight"] = " -- Need: 252 - Greed: 63 -- Priority: Tanks"
    ,["Heavy Dark Iron Ring"] = " -- Need: 270 - Greed: 67.5"
    ,["Core Hound Tooth"] = " -- Need: 288 - Greed: 72 -- Priority: Rogues then Hunters"
    ,["Deathbringer"] = " -- Need: 288 - Greed: 72"
    ,["Head of Onyxia"] = " -- Need: 288 - Greed: 72 -- Priority: Warriors then Rogues/Hunters"
    ,["Stormrage Legguards"] = " -- Need: 288 - Greed: 72"
    ,["Dragonstalker Legguards"] = " -- Need: 288 - Greed: 72"
    ,["Netherwind Pants"] = " -- Need: 288 - Greed: 72"
    ,["Leggings of Transcendence"] = " -- Need: 288 - Greed: 72"
    ,["Bloodfang Pants"] = " -- Need: 288 - Greed: 72"
    ,["Nemesis Leggings"] = " -- Need: 288 - Greed: 72"
    ,["Legplates of Wrath"] = " -- Need: 288 - Greed: 72"
    ,["Judgement Legplates"] = " -- Need: 288 - Greed: 72"
    ,["Shard of the Scale"] = " -- Need: 312 - Greed: 78 -- Priority: Priest/Paladin/Druid"
    ,["Ancient Petrified Leaf"] = " -- Need: 324 -- Note: Mature Black Dragon Sinew included in GP"
    ,["The Eye of Divinity"] = " -- Need: 324"
    ,["Mature Black Dragon Sinew"] = " -- Need: 324 -- Note: Ancient Petrified Leaf included in GP"
    ,["Medallion of Steadfast Might"] = " -- Need: 324 - Greed: 81"
    ,["Quick Strike Ring"] = " -- Need: 324 - Greed: 81"
    ,["Talisman of Ephemeral Power"] = " -- Need: 324 - Greed: 81 -- Priority: Warlocks then Mages"
    ,["Wild Growth Spaulders"] = " -- Need: 324 - Greed: 81 -- Priority: Druids then Paladins"
    ,["Eye of Sulfuras"] = " -- Need: 360 - Greed: 90"
    ,["Striker's Mark"] = " -- Need: 360 - Greed: 90 -- Priority: Warriors and Rogues"
    ,["Crown of Destruction"] = " -- Need: 360 - Greed: 90"
    ,["Perdition's Blade"] = " -- Need: 360 - Greed: 90 -- Priority: Rogues and Prot Warriors"
    ,["Robe of Volatile Power"] = " -- Need: 378 - Greed: 94.5"
    ,["Salamander Scale Pants"] = " -- Need: 378 - Greed: 94.5 -- Priority: Paladins and Druids"
    ,["Choker of the Firelord"] = " -- Need: 378 - Greed: 94.5 -- Priority: Mages and Warlocks"
    ,["Band of Accuria"] = " -- Need: 432 - Greed: 108 -- Priority: Rogues and Tanks"
    ,["Onslaught Girdle"] = " -- Need: 432 - Greed: 108"
}

function OnEvent(frame, event, ...)  

	local msg = ...;

    if(not(msg:lower():sub(1,3) == "!gp"))
    then
        return
    end
    
	return ChatEvent(event, msg, select(2, ...))
end

function ChatEvent(event, text, player, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, presenceID)
	local channel
    
	if (event == "CHAT_MSG_RAID") or (event == "CHAT_MSG_RAID_LEADER") then
        channel = "RAID"
    end

    if (event == "CHAT_MSG_GUILD") then
        channel = "GUILD"
    end

    local items = GetItems(text)
    for i = 1, #items, 2 do
        local count = items[i]
        local link = items[i+1]
        ChatThrottleLib:SendChatMessage("NORMAL", "TyrantEPGP", link, channel, nil, "TyrantEPGP")
    end
end

function GetItems(str)
    local itemList = {}
	for i = #itemList, 1, -1 do
		itemList[i] = nil
	end

    for number, link, color, item, name in str:gmatch("(%d*)%s*(|?c?(%x*)|Hitem:([^|]+)|h%[(.-)%]|h|?r?)") do
        
		table.insert(itemList, tonumber(number) or 1)
        table.insert(itemList, link .. gpValues[name])

	end
	return itemList
end



frame:SetScript("OnEvent", OnEvent)