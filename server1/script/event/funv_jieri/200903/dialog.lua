Include("\\script\\event\\funv_jieri\\200903\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\compose_jinnang.lua")

local tbScoreClass = tbBaseClass:new()

function tbScoreClass:_init(nCount)
	self.nCount = nCount
	self.szName = "觤 t輈h l騳"
	
end

function tbScoreClass:pGetCount()
	
	return tbFunv0903.tbTask:GetScore()
end


function tbScoreClass:pConsume(nCount)
	if self:pGetCount() < nCount then
		return 0
	else
		tbFunv0903.tbTask:AddScore(-nCount)
		return 1
	end
end

local _ReceiveNpcGife = function (nPoint, szLogTitle)
	
	if nPoint <= 0 then
		Talk(1, "", "大侠的物品无法фi觤 t輈h l騳")
		return
	end
	tbFunv0903.tbTask:AddScore(nPoint)
	local szMsg = format("获得 %d 觤 t輈h l騳", nPoint)
	Msg2Player(szMsg)
	WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t%s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), format("get score %d", nPoint) ))
end

local tbMaterial = 
{
	{szName="Th醝 Son", tbProp={6, 1, 1960}, nScore = 8},
	{szName="K裵 T鉩", tbProp={6, 1, 1961}, nScore = 1},
	{szName="Gng", tbProp={6, 1, 1962}, nScore = 4},
	{szName="Lc", tbProp={6, 1, 1963}, nScore = 2},
}


local tbScoreShop = 
{
	[1] = 
	{
		szComposeTitle =  "фi",
		szFailMsg = "大侠的觤 t輈h l騳或银两不足，无法фi此物品.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="D﹜ chuy襫", tbProp={6, 1, 1964, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
	[2] = 
	{
		szComposeTitle =  "фi",
		szFailMsg = "大侠的觤 t輈h l騳或银两不足，无法фi此物品.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="Th� Tr筩", tbProp={6, 1, 1965, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
	[3] = 
	{
		szComposeTitle =  "фi",
		szFailMsg = "大侠的觤 t輈h l騳或银两不足，无法фi此物品.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="Hoa tai ", tbProp={6, 1, 1966, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
	[4] = 
	{
		szComposeTitle =  "фi",
		szFailMsg = "大侠的觤 t輈h l騳或银两不足，无法фi此物品.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="Nh蒼", tbProp={6, 1, 1967, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime},
	},
	[5] = 
	{
		szComposeTitle =  "фi",
		szFailMsg = "大侠的觤 t輈h l騳或银两不足，无法фi此物品.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(35),
			{nJxb = 6e4}
		},
		tbProduct = {szName="Kh╪ Qu祅g C�", tbProp={6, 1, 1968, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime},
	},
	[6] = 
	{
		szComposeTitle =  "фi",
		szFailMsg = "大侠的觤 t輈h l騳或银两不足，无法фi此物品.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(35),
			{nJxb = 6e4}
		},
		tbProduct = {szName="Nc Hoa", tbProp={6, 1, 1969, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
}



function tbFunv0903:DialogMain(nItemIndex, szDescLink)
	
	if self:IsActDate() ~= 1 then
		Talk(1, "", "Ho箃 ng  k誸 th骳.")
		return
	end
	
	
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = 
	{
		"<dec>"..szDescLink.."Ho箃 ng ch祇 m鮪g ng祔 Qu鑓 T� Ph� N� 8 th竛g 3 n╩ nay di詎 ra trong kho秐g th阨 gian t� 06-03-2009 n 24:00 ng祔 15-03-2009. Ngi c莕 ta gi髉 vi謈 g�?",
		format("Ta n nh薾 c萴 nang s� ki謓/#%s:GetJinnang(%d, [[%s]])", self.szClassName, nItemIndex, szDescLink),
		
		format("大侠有多少觤 t輈h l騳了?/#%s:CheckMyScore()", self.szClassName),
		format("大侠要фi一些/#%s:BuyItemByScore(%d, [[%s]])", self.szClassName, nItemIndex, szDescLink),
		"K誸 th骳 i tho筰/OnCancel"
	}
	if nItemIndex == nil or nItemIndex == -1 then
		tinsert(tbSay, 3, format("大侠想фi成品 [觤 t輈h l騳]/#%s:GiveNpcGift(%d)", self.szClassName, nItemIndex))
	end
	
	CreateTaskSay(tbSay)
end

function tbFunv0903:GetJinnang()
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ngi ch璦  甶襲 ki謓  nh薾 v藅 ph萴 n祔")
		return
	end
	
	if self.tbTask:GetIsGetJinNang() ~= 0 then
		Say("L� Thu Th駓: Ngi  nh薾 v藅 ph萴 n祔 r錳 m�?",1, "Th藅 ng筰 qu�! T筰 h� qu猲 m蕋./OnCancel")
		return 
	end
	local tbItem = {szName="C萴 nang s� ki謓", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.nComposeEndDate, tbParam = {self.nComposeEndDate, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by Funv0903")
	self.tbTask:SetIsGetJinNang(1)
end

function tbFunv0903:CheckMyScore()
	local nScore = self.tbTask:GetScore()
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "你的觤 t輈h l騳不够")
	else
		Talk(1, "", format("你的觤 t輈h l騳为: %d", nScore))	
	end
	
end


local _MakeItemTable = function (nItemIndex)
	local tbItem = {}
	tbItem.szName		= GetItemName(nItemIndex)
	tbItem.nQuality		= GetItemQuality(nItemIndex);
	tbItem.nBindState	= GetItemBindState(nItemIndex);
	
	tbItem.nCount		= GetItemStackCount(nItemIndex) or 1
	tbItem.tbProp = {}
	if tbItem.nQuality == 0 then -- 普通物品
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	elseif tbItem.nQuality == 1 or tbItem.nQuality == 4 then --黄金 or 白金
		local nGenre = GetItemProp(nItemIndex)
		if nGenre == 7 then
			tbItem.tbProp[1] = nGenre
		elseif tbItem.nQuality == 1 then
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetGlodEqIndex(nItemIndex)
		elseif tbItem.nQuality == 4 then
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetPlatinaEquipIndex(nItemIndex)
		end
	elseif tbItem.nQuality == 2 then -- 紫色装备
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	end
	return tbItem
end

local _MatchItem = function (tbSrcItem, tbDecItem)
	if tbSrcItem == nil or tbDecItem == nil then
		return 0;
	end
	if tbSrcItem.tbProp == nil or tbDecItem.tbProp == nil then
		return 0;
	end
	if tbSrcItem.nQuality ~= nil and tbSrcItem.nQuality ~= tbDecItem.nQuality then
		return 0;
	end
	if tbSrcItem.nBindState ~= nil and tbSrcItem.nBindState ~= tbDecItem.nBindState then
		return 0;
	end
	local i;
	for i=1,getn(tbSrcItem.tbProp) do
		if (tbSrcItem.tbProp ~= nil) then
			if (tbSrcItem.tbProp[i] ~= tbDecItem.tbProp[i]) then
				return 0;
			end
		end
	end
	return 1;
end

local _CalcItemCountInGiveUI = function (tbItem, nUICount)
	
	local nItemCount = 0
	for i=1, nUICount do
		local nItemIndex = (GetGiveItemUnit(i))
		local tbItem_UI = %_MakeItemTable(nItemIndex)
		if %_MatchItem(tbItem, tbItem_UI) == 1 then
			nItemCount = nItemCount + tbItem_UI.nCount
		end
	end
	return nItemCount
end

local _ConsumeItemInGiveUI = function (tbItem, nConsumeCount, nUICount)
	local nLeftCount = nConsumeCount or 1
	local nItemCount = 0
	for i=1, nUICount do
		local nItemIndex = (GetGiveItemUnit(i))
		local tbItem_UI = %_MakeItemTable(nItemIndex)
		if %_MatchItem(tbItem, tbItem_UI) == 1 then
			
			if tbItem_UI.nCount <= nLeftCount then
				if RemoveItemByIndex(nItemIndex) == 1 then
					nLeftCount = nLeftCount - tbItem_UI.nCount
				end
			else
				if SetItemStackCount(nItemIndex, tbItem_UI.nCount - nLeftCount) == 1 then
					nLeftCount = 0
				end
			end
			if nLeftCount == 0 then
				return 1
			end
		end
		
	end
	return nil
end



function tbFunv0903__ProcessGiveUI(nUICount)
	
	local self = tbFunv0903
	local tbMaterial = %tbMaterial
	local nScore = 0
	local szLogTitle = "give npc gift"
	local tbCount = {}
	
	
	
	for i=1, getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local nItemCount = %_CalcItemCountInGiveUI(tbItem, nUICount)
		
		
		
		if nItemCount > 0 and %_ConsumeItemInGiveUI(tbItem, nItemCount, nUICount) == 1 then
			
			nScore = nScore + tbItem.nScore * nItemCount
			local szItemName = nItemCount.." "..tbItem.szName
			WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t consume %s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), szItemName))
		end

	end
	%_ReceiveNpcGife(nScore, szLogTitle)
end

function tbFunv0903:GiveNpcGift(nItemIndex)
	
	if self:IsActDate() ~= 1 then
		Talk(1, "", "Ho箃 ng  k誸 th骳.")
		return
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg)
		return
	end
	
	local szTitle = "фi觤 t輈h l騳"
	local szMaterial = "H穣 b� nguy猲 li謚 v祇 � b猲 di"
	
	nItemIndex = nItemIndex or -1
	if tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return
		end
	end
	if tbItemJingnianshijian then
		 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
	end
	
	GiveItemUI(szTitle, szMaterial, "tbFunv0903__ProcessGiveUI", "OnCancel")
	
	
end



function tbFunv0903:BuyItemByScore(nItemIndex, szDescLink)
	if self:IsActDate() ~= 1 then
		Talk(1, "", "Ho箃 ng  k誸 th骳.")
		return
	end
	
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg)
		return
	end
	
	
	if not self.tbScoreShop then
		self.tbScoreShop = tbComposeListForJinNang:new("tbFunv0903_Shop", %tbScoreShop)
	end
	local szTitle = "Ta 產ng c� r蕋 nhi襲 v藅 ph萴 m� c竎 ch� em ph� n� thng hay s� d鬾g. Ngi mu鑞 ch鋘 v藅 ph萴 n祇?"
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = self.tbScoreShop:MakeOptByProductName("我要фi", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "K誸 th骳 i tho筰/OnCancel")
	CreateTaskSay(tbSay)
end

