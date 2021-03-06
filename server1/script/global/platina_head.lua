IncludeLib("ITEM");
IncludeLib("FILESYS")

TB_PLATINAEQ_GOLDEQ ={
--[白金ID] = {白金ID, 黄金ID,装备升级价值量系数,装备名};
--[1] = {1, 1, 4, "M閚g long chi 產ng ho祅g t╪g m筼 "},
}

function LoadPlatinaEquipSetting()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def.txt", "PlatinaData")
	if b1~=1 then
		print("K� ti誴 th╪g c蕄 b筩h kim trang b� tin t鴆 th蕋 b筰 !")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaData", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaData", y, "PLATINAID"));
		
		local goldid = tonumber(TabFile_GetCell("PlatinaData", y, "GOLDID"));
		local taskrate = tonumber(TabFile_GetCell("PlatinaData", y, "TASKRATE"));
		local name = TabFile_GetCell("PlatinaData", y, "EQUIPNAME");
		
		TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name};
	end	
end;

LoadPlatinaEquipSetting()

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

-- 白金升级的必需的材料
tb_upgrade_material	=
{
	--[材料ID] = {材料名，价值量，材料Level，所需数量，升级几级白金}
	["6,1,1308"] 	= {szName = " b� ng祔  b� phi課  ti觰 ", nValue = 20000000},
	["6,1,1309"] 	= {szName = " b� ng祔  b� phi課  trung ", nValue = 100000000},
	["6,1,1310"]	= {szName = " b� ng祔  b� phi課  i ", nValue = 1000000000},
	["6,1,2127"]	= {szName = " b綾 u luy謓 kim thu藅 ( ph莕 u ti猲 )", nValue = 0, nCount = 1, nUpgradeLevel = 6},
	["6,1,2160"]	= {szName = " b綾 u luy謓 kim thu藅  cu鑞 hai ", nValue = 0, nCount = 1, nUpgradeLevel = 7},
	["6,1,2161"]	= {szName = " b綾 u luy謓 kim thu藅  cu鑞 ba ", nValue = 0, nCount = 1, nUpgradeLevel = 8},
	["6,1,2162"]	= {szName = " b綾 u luy謓 kim thu藅  cu鑞 b鑞 ", nValue = 0, nCount = 1, nUpgradeLevel = 9},
};

tb_gold2planita_material =
{
	["6,1,398"] 	= {szName = " th莕 b� qu竛g th筩h ", nCount = 1},
	["6,1,147"] 	= {szName = " c蕄 t竚 huy襫 tinh qu竛g th筩h ", nItemLevel = 8, nCount = 1},
	["6,1,1309"]	= {szName = " b� ng祔  b� phi課  trung ", nCount = 1},
};

tbUpGradeProcess = {
[1] = {
				tbUpItemList = tb_gold2planita_material,
				szErrorMsg = "<dec><npc>错误<color=yellow>白金装备<color>, 我还需<color=yellow> th莕 b� qu竛g th筩h <color>, color=yellow> c蕄 t竚 huy襫 tinh qu竛g th筩h <color> ，<color=yellow> b� ng祔  b� phi課  trung <color>, 请留下其他东西.",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
[3] = {
				tbUpItemList = tb_upgradematerial,
				szErrorMsg = "<dec><npc> sai l莔 <color=yellow> b筩h kim trang b� <color>, ta c遪 c莕 <color=yellow> b� ng祔  b� phi課 <color> xin/m阨 l璾 l筰 nh鱪g v藅 kh竎 .",
				nItemQuality = 4,
				szGetEquipIDFunc = "GetPlatinaEquipIndex",
				szContinueFunc = "want_upplatinaeq",
				szDoProcessFunc = "UpgradePlatinaItem"},
}
