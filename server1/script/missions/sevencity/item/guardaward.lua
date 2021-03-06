-- 卫柱礼包使用脚本
Include("\\script\\lib\\awardtemplet.lua")

--当使用各种宝箱时每天的经验值上限是5000万 - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
--	{szName = "у Ph� T� M穘g H礽", 		tbProp = {6, 1, 2716, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "у Ph� T� M穘g Y猽 Цi", 		tbProp = {6, 1, 2717, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "у Ph� T� M穘g H� Uy觧", 		tbProp = {6, 1, 2718, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "T� Tinh Kho竛g Th筩h", 			tbProp = {6, 1, 30040, 1, 0, 0}, 	nRate = 44},
--	{szName = "Tinh Luy謓 Th筩h", 			tbProp = {6, 1, 2280, 1, 0, 0}, 	nRate = 27.34},
--	{szName = "Th莕 Quy B� Huy誸 Кn (ti觰)", 	tbProp = {6, 1, 2583, 1, 0, 0}, 	nRate = 18.3,	nCount = 10},
--	{szName = "Th莕 Quy B� Huy誸 Кn (trung)",	tbProp = {6, 1, 2582, 1, 0, 0},		nRate = 10,		nCount = 10},

--当使用各种宝箱时每天的经验值上限是5000万 - Modified by DinhHQ - 20110428	
--	{szName="觤 kinh nghi謒", nExp=5000000, nRate=30},
--	{szName="觤 kinh nghi謒", nExp=10000000, nRate=20},
--	{szName="觤 kinh nghi謒", nExp=15000000, nRate=15},
--	{szName="觤 kinh nghi謒", nExp=20000000, nRate=10},
	{szName="觤 kinh nghi謒 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "V� Tr� L� Bao")
				end,
				nRate = 30,
	},
	{szName="觤 kinh nghi謒 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "V� Tr� L� Bao")
				end,
				nRate = 20,
	},
	{szName="觤 kinh nghi謒 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(15000000, "V� Tr� L� Bao")
				end,
				nRate = 15,
	},
	{szName="觤 kinh nghi謒 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "V� Tr� L� Bao")
				end,
				nRate = 10,
	},
	
	{szName="C萴 nang thay i tr阨 t", tbProp={6,1,1781,1,0,0}, tbParam={60}, nRate=8},
	{szName="Ti猲 Th秓 L� c bi謙", tbProp={6,1,1181,1,0,0}, nRate=7},
	{szName="B竎h Ni猲 Tr﹏ L�", tbProp={6,1,2266,1,0,0}, nRate=5},
	{szName="V筺 Ni猲 Tr﹏ L�", tbProp={6,1,2268,1,0,0}, nRate=2},
	{szName="Thi猲 Ni猲 Tr﹏ L�", tbProp={6,1,2267,1,0,0}, nRate=1},
	{szName="Th莕 H祅h Ph�", tbProp={6,1,1266,1,0,0}, nRate=2, nExpiredTime=20160},

}

function main()
	if (CalcFreeItemCellCount() < 1) then
		Say("H祅h trang 輙 nh蕋 ph秈 c� <color=red>1<color> � tr鑞g m韎 nh薾 頲 ph莕 thng.")
		return 1
	end
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseGuardAward"})
	return 0
end

function test()
	local rate = 0
	for i = 1, getn(tbAward) do
		rate = rate + tbAward[i].nRate
	end
	if (floor(rate) ~= 100) then
		error(format("invalid rate: %d", rate))
	end
end

