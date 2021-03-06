Include("\\script\\activitysys\\config\\1000\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")

local nYellowDaisyMaxCount = 1000

local tbGiveDaisyTaskInfo =
{
	nTaskID = 2712,
	nStartBit = 1,
	nBitCount = 12,
	nMaxValue = 1000
}
local tbGourdUseTaskInfo =
{
	nTaskID = 2712,
	nStartBit = 13,
	nBitCount = 12,
	nMaxValue = 1000
}
--local tbSteelHeartWineUseTaskInfo =
--{
--	nTaskID = 2712,
--	nStartBit = 25,
--	nBitCount = 6,
--	nMaxValue = 5
--}
local tbGiveDaisy_AdditionalAward = {
	[500] = {szName = "告脁 kinh nghi珵", nExp=5000000},
	[1000] = {szName = "告脁 kinh nghi珵", nExp=10000000},
}
local tbUseGourd_AdditionalAward = {
	[50] = {szName = "告告脁 kinh nghi珵", nExp=3000000},
	[100] = {szName = "告告脁 kinh nghi珵", nExp=6000000},
	[200] = {szName = "告告脁 kinh nghi珵", nExp=8000000},
	[300] = {szName = "告告脁 kinh nghi珵", nExp=10000000},
	[400] = {szName = "告告脁 kinh nghi珵", nExp=12000000},
	[500] = {szName = "告告脁 kinh nghi珵", nExp=14000000},
	[600] = {szName = "告告脁 kinh nghi珵", nExp=16000000},
	[700] = {szName = "告告脁 kinh nghi珵", nExp=18000000},
	[800] = {szName = "告告脁 kinh nghi珵", nExp=20000000},
	[900] = {szName = "告告脁 kinh nghi珵", nExp=25000000},
	[1000] = {szName = "告告脁 kinh nghi珵", nExp=30000000},
}
local tbUseWine_ExpAward = {
	[1] = {szName = "告告脁 kinh nghi珵", nExp=2000000},
	[2] = {szName = "告告脁 kinh nghi珵", nExp=3000000},
	[3] = {szName = "告告脁 kinh nghi珵", nExp=4000000},
	[4] = {szName = "告告脁 kinh nghi珵", nExp=5000000},
	[5] = {szName = "告告脁 kinh nghi珵", nExp=6000000},
	[6] = {szName = "告告脁 kinh nghi珵", nExp=6000000},
	[7] = {szName = "告告脁 kinh nghi珵", nExp=7000000},
	[8] = {szName = "告告脁 kinh nghi珵", nExp=8000000},
	[9] = {szName = "告脁 kinh nghi珵", nExp=9000000},
	[10] = {szName = "告告脁 kinh nghi珵", nExp=10000000},
}

local tbUseWine_ItemAward = {
	{szName="批 Ph� T� M搖g H雉g Li泄",tbProp={6,1,2719,1,0,0},nCount=1,nRate=1},
	{szName="批 Ph� T� M搖g Th叟ng Gi璐 Ch�",tbProp={6,1,2721,1,0,0},nCount=1,nRate=1},
	{szName="批 Ph� T� M搖g H� Gi璐 Ch�",tbProp={6,1,2722,1,0,0},nCount=1,nRate=1},
	{szName="批 Ph� T� M搖g Kh� Gi璐",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.5},
	{szName="T� M搖g L琄h",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.5},
	{szName="Phi phong Kinh L勇 (D溡h chuy胻 t鷯 th甋)",tbProp={0,3470},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong Kinh L勇 (X筧 su厎 h粺 gi進 s聖 th閂ng)",tbProp={0,3471},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong Kinh L勇 ( Tr鄚g k徯h )",tbProp={0,3472},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="Ho登g Kim 刡 (C匪ng h粺)",tbProp={0,3210},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="Ho登g Kim 刡 (Nh叟c h粺)",tbProp={0,3220},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName = "S� d獼g Thi掐 T姓 t飀 kh南g may m駐",
		pFun = function (nItemCount, szLogTitle)
			Msg2Player("Lブ n稍 kh南g may m駐, ta ph進 th� th沸 lブ n躐")
		end,
		nRate = 93.5,
	}
}
local tbUseGourd_ItemAward = {
	{szName="批 Ph� T� M搖g Kh勇",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="批 Ph� T� M搖g Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="批 Ph� T� M搖g Y沿 孛i",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="批 Ph� T� M搖g H� Uy胻",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="批 Ph� T� M搖g B嶯",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.3},
	{szName="批 Ph� T� M搖g H痣",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.3},
	{szName="批 Ph� T� M搖g H雉g Li泄",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.1},
	{szName="批 Ph� T� M搖g Th叟ng Gi璐 Ch�",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.1},
	{szName="批 Ph� T� M搖g H� Gi璐 Ch�",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.1},
	{szName="批 Ph� T� M搖g Kh� Gi璐",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.1},
	{szName="Huy烋 Vi泄 L琄h",tbProp={6,1,2351,1,0,0},nCount=1,nRate=0.3},
	{szName="T� M搖g L琄h",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
	{szName="L琄h B痣 Th鞬 T鬣",tbProp={6,1,2745,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Qu� Ho登g Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=1, nExpiredTime = 10080},
	{szName="S聖 Th� Gi郾 l� h廧",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="M鉍 B鞋 Truy烋 T鋝g L琄h",tbProp={6,1,1448,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="H進 long ch季",tbProp={6,1,2115,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Huy烋 Thi泄 C�m Nang",tbProp={6,1,2355,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Long Huy掐 Ho登",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Ng踄 Qu罩",tbProp={6,1,2311,1,0,0},nCount=1,nRate=1},
	{szName="H蓽 Nguy泄 Linh L�",tbProp={6,1,2312,1,0,0},nCount=1,nRate=1},
	{szName="H幩g bao Sum vメ",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
	{szName="H幩g bao An khang",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
	{szName="Ng� H登h K� Th鉍h",tbProp={6,1,2125,1,0,0},nCount=1,nRate=41.6},
	{szName="Phi t鋃 ho登 l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=10,nExpiredTime=20160},
	{szName="完i l麡 ho登 l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=10,nExpiredTime=20160},
	{szName="Ng踄 Tr鮦g Luy琄",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.5},
	{szName="Phi phong L盯g V姊",tbProp={0,3465},nCount=1,nRate=0.4,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong Tuy珼 Th�",tbProp={0,3466},nCount=1,nRate=0.3,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong c劮 Ph� Qu姊 ( d溡h chuy胻 t鷯 th甋 )",tbProp={0,3467},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong Ngao tuy掐 (D溡h chuy胻 t鷯 th甋)",tbProp={0,3468},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong Ng雊 Tuy掐 (X筧 su厎 h粺 gi進 s聖 th閂ng)",tbProp={0,3469},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
	{szName = "告告脁 kinh nghi珵", nExp=7000000, nRate = 25},
}

function pActivity:VngCheckWeeklyTaskCount(nTaskID, nValue, strComparison, strFailMessage)
	local nResult = dostring("return "..%VngTaskWeekly:GetWeeklyCount(nTaskID)..strComparison..nValue)
	if not nResult then
		Talk(1, "", strFailMessage)
		return nil
	end
	return 1
end

function pActivity:VngAddWeeklyTaskCount(nTaskID, nValue)
	%VngTaskWeekly:AddWeeklyCount(nTaskID, nValue)
end

function pActivity:VngGiveDaisyLimit(nCount)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveDaisyTaskInfo) == 1 then
		Talk(1, "", "Ng閂i t躪g ta nhi烔 hoa r嶠, s� hoa n稍 xin h暄 nh甹 l隘.")
		return nil
	end
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveDaisyTaskInfo)
	if (nTaskVal + nCount) > %nYellowDaisyMaxCount then
		Msg2Player(format("S� l叟ng v叟t qu� gi璐 h雉, ng閂i ch� c� th� t躪g <color=yellow>%d <color>hoa c鏂 n躐.", %nYellowDaisyMaxCount - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:VngGiveDaisy(nCount)
	local tbAward = {szName = "告告脁 kinh nghi珵", nExp=1000000}
	for i = 1, nCount do
		%tbVNG_BitTask_Lib:addTask(%tbGiveDaisyTaskInfo, 1)
		tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "NopHoaCucVang"})
		
		--絞蝠逋500, 1000擅豪腔婬樓蔣療
		local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveDaisyTaskInfo)
		if %tbGiveDaisy_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbGiveDaisy_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"Event_MungPBM", format("Nop%dlanvatphamHoaCucVang", nTaskVal)})
		end
	end
end

function pActivity:VngGourdUseLimit()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGourdUseTaskInfo) == 1 then
		Talk(1, "", "S� d獼g v肕 ph�m 捕 捆t 校n gi璐 h雉, kh南g th� s� d獼g th沸")
		return nil
	end
	return 1
end

function pActivity:VngUseGourd()
	local tbAward = {szName = "告告脁 kinh nghi珵", nExp=7000000}
	%tbVNG_BitTask_Lib:addTask(%tbGourdUseTaskInfo, 1)	
	tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "SudungvatphamBinhHoLoPhongVanNhanPhanThuong"})
	--蔣療item
	tbAwardTemplet:Give(%tbUseGourd_ItemAward, 1, {"Event_MungPBM", "SudungvatphamBinhHoLoPhongVanNhanPhanThuong"})
	--妏蚚昜こ湛梓腔蔣療
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGourdUseTaskInfo)
		if %tbUseGourd_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbUseGourd_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"Event_MungPBM", format("SuDung%dlanVatPhamBinhHoLoPhongVanPhongVan", nTaskVal)})
		end
end

function pActivity:VngUseSteelHeartWine()
	local nDailyCount = PlayerFunLib:GetTaskDailyCount(2711)	
	local tbAward = %tbUseWine_ExpAward[nDailyCount]
	if tbAward then
		tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "SudungvatphamPhongVanThietTamTuuNhanPhanThuong"})
	end
	tbAwardTemplet:Give(%tbUseWine_ItemAward, 1, {"Event_MungPBM", "SudungvatphamPhongVanThietTamTuuNhanPhanThuong"})	
end

function pActivity:VngCheckWeeklyFeatureMatchCount(nTaskID1, nTaskID2, nTaskID3)
	local nTongKim = %VngTaskWeekly:GetWeeklyCount(nTaskID1)
	local nVuotAi = %VngTaskWeekly:GetWeeklyCount(nTaskID2)
	local nViemDe = %VngTaskWeekly:GetWeeklyCount(nTaskID3)
	local strTittle = format("Tuブ n稍 c筧 h� 捕 ho登 th登h:\n<color=yellow>\t\t\t%-6d<color> tr甹 T鋝g Kim\n<color=yellow>\t\t\t%-6d<color> lブ V叟t 進\n<color=yellow>\t\t\t%-6d<color> lブ v叟t 進 Vi沸 忱", nTongKim, nVuotAi, nViemDe)	
	Say(strTittle, 1, "扼ng/OnCancel")
end

function OnCancel()
end
