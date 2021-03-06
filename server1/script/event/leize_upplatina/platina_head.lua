IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\lib\\log.lua")

TB_PLATINAEQ_GOLDEQ ={
--[白金ID] = {黄金ID,装备升级价值量系数,装备名, 是否需要H鏽 n nh};
--[1] = {1, 1, 4, "梦龙之正黄僧帽",bhunduding},
}

function LoadPlatinaEquipSettingTmp()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def_tmp.txt", "PlatinaDataTmp")
	if b1~=1 then
		print("T秈 t藀 tin th╪g c蕄 trang b� B筩h Kim th蕋 b筰!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaDataTmp", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "PLATINAID"));
		
		local goldid = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "GOLDID"));
		local taskrate = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "TASKRATE"));
		local name = TabFile_GetCell("PlatinaDataTmp", y, "EQUIPNAME");
		local bhundunding = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "HUNDUNDING"));
		
		if (bhundunding ~= nil and bhundunding == 1) then
			TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name, bhundunding};
		else
			TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name};
		end
	end	
end;

LoadPlatinaEquipSettingTmp()

--白金装备各等级升级的价值量
PLATINAEQ_UPGRADERATE_BASIC = 10000;
TB_PLATINAEQ_UPGRADERATE = {
	[0] = 2000*PLATINAEQ_UPGRADERATE_BASIC,
	[1] = 4000*PLATINAEQ_UPGRADERATE_BASIC,
	[2] = 6000*PLATINAEQ_UPGRADERATE_BASIC,
	[3] = 8000*PLATINAEQ_UPGRADERATE_BASIC,
	[4] = 10000*PLATINAEQ_UPGRADERATE_BASIC,
	[5] = 15000*PLATINAEQ_UPGRADERATE_BASIC,
	[6] = 30000*PLATINAEQ_UPGRADERATE_BASIC,
	[7] = 50000*PLATINAEQ_UPGRADERATE_BASIC,
	[8] = 80000*PLATINAEQ_UPGRADERATE_BASIC,
	[9] = 120000*PLATINAEQ_UPGRADERATE_BASIC,
};

--补天石碎片的价值量
TB_UPGRADEITEM_VALUE ={
	["6,1,1308"] = {20000000, "B� Thi猲 Th筩h (ti觰)", -1},
	["6,1,1309"] = {100000000, "B� Thi猲 Th筩h (trung)", -1},
	["6,1,1310"] = {1000000000, "B� Thi猲 Th筩h (i)", -1},
	["6,1,1380"] = {3333333333, "B� Thi猲 Th筩h (i)", -1},
	["6,1,2127"] = {1, "B綾 u luy謓 kim thu藅 (Quy觧 1)", -1, 6},
	["6,1,2160"] = {1, "B綾 u luy謓 kim thu藅 (Quy觧 2)", -1, 7},
	["6,1,2161"] = {1, "B綾 u luy謓 kim thu藅 (Quy觧 3)", -1, 8},
	["6,1,2162"] = {1, "B綾 u luy謓 kim thu藅 (Quy觧 4)", -1, 9},
}

TB_GOLD2PLANITA_ITEM = {
	["6,1,1473"] = {1, "L玦 Tr筩h Ch飝", -1},
}
TB_GOLD2PLANITA_ITEM_SP1	= {
	["6,1,1473"] = {1, "L玦 Tr筩h Ch飝", -1},
	["6,1,1740"] = {1, "H鏽 n nh", -1},
}

tbUpGradeProcess = {
[1] = {
				tbUpItemList = TB_GOLD2PLANITA_ITEM,
				szErrorMsg = "<dec><npc>除<color=yellow>黄金装备之外<color>, 只有<color=yellow>L玦 Tr筩h Ch飝<color>是我们需要的物品，请把别的物品带走!",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
[3] = {
				tbUpItemList = TB_UPGRADEITEM_VALUE,
				szErrorMsg = "<dec><npc>Ngo礽 <color=yellow>trang b� B筩h Kim<color>, ta c遪 c莕  <color=yellow>m秐h B� Thi猲 Th筩h<color> n鱝, xin h穣 gi� l筰 nh鱪g th� kh竎.",
				nItemQuality = 4,
				szGetEquipIDFunc = "GetPlatinaEquipIndex",
				szContinueFunc = "want_upplatinaeq",
				szDoProcessFunc = "UpgradePlatinaItem"},
[4] = {
				tbUpItemList = TB_GOLD2PLANITA_ITEM_SP1,
				szErrorMsg = "<dec><npc>除<color=yellow>黄金装备之外<color>, 只有<color=yellow>L玦 Tr筩h Ch飝<color>是我们需要的物品，请把别的物品带走!",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
}

function writeRecoinLog(szTitle, szLog)
	WriteLog(format("  %s\t%s\tNAME:%s\tACCOUNT:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"), szTitle,GetName(),GetAccount()));
	WriteLog(format("  %s\t%s", GetLocalDate("%Y-%m-%d %H:%M:%S"), szLog));
end;
