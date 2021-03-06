-- 文件名　：yandiduihuan.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-05-14 16:38:43
--炎帝装备重铸
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("ITEM")
yandiduihuan_tbItemList = 
{
	{szName="To筰 Nh﹏ X輈h Huy誸 Nguy猲 V� Gi竝", nQuality=1, tbProp={0, 442}},
	{szName="To筰 Nh﹏ B竎h Luy謓 Kh玦", nQuality=1, tbProp={0, 443}},
	{szName="To筰 Nh﹏ Tr鬰 Thi猲 Ngoa", nQuality=1, tbProp={0, 445}},
	{szName="To竔 Nh﹏ Kim L� Nhuy詎 Vi H� Uy觧", nQuality=1, tbProp={0, 446}},
	{szName="Ph鬰 Hi Hoan 秐h K辌h", nQuality=1, tbProp={0, 455}},
	{szName="Ph鬰 Hi V� Lng T辌h T� Th�", nQuality=1, tbProp={0, 456}},
	{szName="Ph鬰 Hi To竔 T﹎", nQuality=1, tbProp={0, 457}},
	{szName="N� Oa H錸g Nhan Ph竧 Цi", nQuality=1, tbProp={0, 463}},
	{szName="N� Oa L鬰 Ngh� Ngh� Thng Th骳 Цi", nQuality=1, tbProp={0, 464}},
	{szName="N� Oa H祅 Tng", nQuality=1, tbProp={0, 467}},
	{szName="Ch骳 Dung Li謙 Di謒 N� Phong Trang", nQuality=1, tbProp={0, 472}},
	{szName="Ch骳 Dung Kinh Ch輈h B蕋 Di謙 Tr秓", nQuality=1, tbProp={0, 476}},
	{szName="Ch骳 Dung Ph� Nh藅", nQuality=1, tbProp={0, 477}},
	{szName="Th莕 N玭g Ti猽 Dng мa Ho祅g Y", nQuality=1, tbProp={0, 482}},
	{szName="Th莕 N玭g N� L玦 u Ho祅", nQuality=1, tbProp={0, 483}},
	{szName="Th莕 N玭g Ng� Phong L�", nQuality=1, tbProp={0, 485}},
	{szName="Th莕 N玭g Tr秏 Nh筩", nQuality=1, tbProp={0, 487}},
}

yandiduihuan_Material = 
{
	{szName="Phng Minh Ch飝", tbProp={6, 1, 1746}},
	{szName="Huy襫 tinh kho竛g th筩h c蕄 8", tbProp={6, 1, 147, 8}},
	{szName="M秐h B� Thi猲 Th筩h (trung)", tbProp={6, 1, 1309}},
	{szName="Th莕 b� kho竛g th筩h", tbProp={6, 1, 398}},
}
yandiduihuan_CostMoney = 10000000 --1QW


function yandiduihuan_CalcItemCount(tbMaterial)
	if type(tbMaterial[1]) == "table" then
		local nNeedCount = 0
		local tbNeedCount = {}
		for i = 1, getn(tbMaterial) do
			local nCount = 0
			nCount, tbNeedCount[i] = yandiduihuan_CalcItemCount(tbMaterial[i])
			nNeedCount = nNeedCount + nCount
		end
		return nNeedCount, tbNeedCount
	else
		local nCount = tbMaterial.nCount or 1
		return nCount, nCount
	end
	
end

function yandiduihuan_checkGoldItem(nCount)
	for i=1, nCount do
		local tbItem = yandiduihuan_MakeItemTable(GetGiveItemUnit(i))
		if tbItem.nQuality == 1 then
			if yandiduihuan_tbItemList ~= nil then
				for j=1,getn(yandiduihuan_tbItemList) do
					if (yandiduihuan_checkOne(yandiduihuan_tbItemList[j], tbItem) == 1) then
						return tbItem,i
					end
				end
			end
		end
	end
end


function yandiduihuan_GiveStep(nCount)

	local tbMaterial = yandiduihuan_Material
	local nNeedCount, tbNeedCount = yandiduihuan_CalcItemCount(tbMaterial)
	
	
	if nCount ~=  nNeedCount + 1 then
		Msg2Player("B� v祇 s� lng kh玭g ng.")
		return Say("大侠放入的材料不对，不能进行重炼，用于重炼炎帝黄金装备的原料是：1个炎帝黄金装备，1个Phng Minh Ch飝，1个8级玄晶，1个补天石碎片（中）", 0)
	end
	
	local tbAwardItem, nCheckedId = yandiduihuan_checkGoldItem(nCount)
	
	if tbAwardItem == nil then
		Msg2Player("B� trang b� vi猰  v祇 kh玭g ph� h頿 v韎 y猽 c莡.")
		return Say("B� trang b� vi猰  v祇 kh玭g ph� h頿 v韎 y猽 c莡.", 0)
	end
	
	for i=1,nCount do
		if i ~= nCheckedId then
			local tbItem = yandiduihuan_MakeItemTable(GetGiveItemUnit(i))
			local nId,nItemCount = yandiduihuan_checkItem(tbMaterial, tbItem)
			if nId > 0 and tbNeedCount[nId] >= nItemCount then
				nNeedCount = nNeedCount - nItemCount
				tbNeedCount[nId] = tbNeedCount[nId] - nItemCount
			else
				Msg2Player("B� v祇 nguy猲 li謚 kh玭g ng");
				return Say(format("给我的原料不对，所以不能重炼。重炼原料：<color=yellow>%s<color>l?1 <color=yellow>%s<color>, 1个Phng Minh Ch飝，1个8级玄晶，1个补天石碎片（中), 1000万银两", tbAwardItem.szName, tbAwardItem.szName), 0)
			end
		end
			
	end	
	if (nNeedCount == 0) then
		if  Pay(yandiduihuan_CostMoney) == 1 then 
			local nItemIndex = GetGiveItemUnit(nCheckedId)
			yandiduihuan_LogEquip(nItemIndex, "Trc khi tr飊g luy謓 Vi猰 д")
			for i = 1, nCount do
				RemoveItemByIndex(GetGiveItemUnit(i))
			end
			tbAwardItem.CallBack = yandiduihuan_LogEquip
			tbAwardTemplet:GiveAwardByList(tbAwardItem, "Sau khi tr飊g luy謓 Vi猰 д")
			return Say(format("V藅 ph萴 <color=yellow>%s<color>  tr飊g luy謓 th祅h c玭g", tbAwardItem.szName), 0)
		else
			return Say("Kh玭g  ti襫  ti課 h祅h tr飊g luy謓 n祔.", 0)
		end
				
	else
		Msg2Player("B� v藅 ph萴 v祇 kh玭g ng y猽 c莡");
	end
end


function yandiduihuan_MakeItemTable(nItemIndex)
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
		else
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetGlodEqIndex(nItemIndex)	
		end
	elseif tbItem.nQuality == 2 then -- 紫色装备
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	end
	return tbItem
end



function yandiduihuan_checkItem(tbMaterial,tbItem)	
	for i = 1, getn(tbMaterial) do
		if yandiduihuan_checkOne(tbMaterial[i], tbItem) == 1 then
			return i, tbItem.nCount
		end
	end
	return 0;
end

function yandiduihuan_checkOne(tbSrcItem, tbDecItem)
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

function yandiduihuan_LogEquip(nItemIndex, szLogTitle)
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	
	local arynMagLvl	= GetItemAllParams(nItemIndex);
	local nQuality		= GetItemQuality(nItemIndex);
	local uRandSeed		= ITEM_GetItemRandSeed(nItemIndex)
	local szItemName	= GetItemName(nItemIndex)
	
	local szLogMsg = format("%s, {%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d,%d}", szItemName, 4,uRandSeed,nQuality,nGenre,nDetailType,nParticular,nLevel,nSeries,nLuck,unpack(arynMagLvl))
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t%s",szLogTitle or "Sau khi tr飊g luy謓 Vi猰 д",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szLogMsg))	
	
end


function yandiduihuan_main()
	GiveItemUI("Giao di謓 tr飊g luy謓 trang b� ho祅g kim Vi猰 д", "1个Phng Minh Ch飝，1个8级玄晶，1个补天石碎片（中), 1 个Th莕 b� kho竛g th筩h, 1000 万银两, 1个炎帝黄金装备", "yandiduihuan_GiveStep", "yandiduihuan_OnCancel", 1)
end


function yandiduihuan_shuoming()
	local tbSay = 
	{
		"<dec><npc>炎帝装备重炼, 需要1个Phng Minh Ch飝，1个8级玄晶，1个补天石碎片（中), 1 个Th莕 b� kho竛g th筩h, 1000 万银两, 1个炎帝黄金装备.<enter>炎帝装备用于重炼，重练后的装备是一种黄金装备，如果使用To筰 Nh﹏ X輈h Huy誸 Nguy猲 V� Gi竝重练，就一定会出To筰 Nh﹏ X輈h Huy誸 Nguy猲 V� Gi竝装备和随机属性。",
		"Ta  hi觰 r� r錳/yandiduihuan_OnCancel",
	}
	CreateTaskSay(tbSay)
end

function yandiduihuan_OnCancel()
	
end