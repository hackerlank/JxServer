-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 道具:杀手秘宝
-- 文件名　：shashou_mibao.lua
-- 创建者　：子非魚
-- 创建时间：2010-05-24 11:40:18

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua");		-- 奖励模板
local n_XuanTian_Chui = 6;

tbItem_Mibao = {
	{szName = " ti猲 th秓 l� ",tbProp = {6,1,71,1,1,0}, nRate = 15.873},--ok
	{szName = " t� m穘g l祄 ", tbProp = {6,1,2350,1,1,0}, nRate = 0.2},--ok
	{szName = " huy襫 vi猲 l祄 ", tbProp = {6,1,2351,1,1,0}, nRate = 0.5},--ok
	{szName = " t� m穘g l祄 ", tbProp = {6,1,2350,1,1,0}, nRate = 0.1},--ok
	{szName = " huy襫 vi猲 l祄 ", tbProp = {6,1,2351,1,1,0}, nRate = 0.1},--ok
	{szName = " i l鵦 ho祅 ", tbProp = {6,0,3,1,1,0}, nRate = 25},--ok
	{szName = " nhanh ch鉵g ho祅 ", tbProp = {6,0,6,1,1,0}, nRate = 25},--ok
	{szName = " khi猽 chi課 l� t骾 ", tbProp = {6,1,2006,1,1,0}, nRate = 20},--ok
	{szName = " huy ho祅g qu� ( cao ) ", tbProp = {6,1,906,1,1,0}, nRate = 10, nExpiredTime = 10080},--ok
	{szName = " ho祅g kim chi qu� ", tbProp = {6,1,907,1,1,0}, nRate = 0.5, nExpiredTime = 10080},--ok
	{szName = " h錳 thi猲 t竔 t筼 c萴 nang ", tbProp = {6,1,1781,1,1,0}, nRate = 3, tbParam = {60}},	-- 锦囊包含60个--ok
}

function main(nItemIdx)
	local n_curcnt = CalcItemCount(3, 6,1,2348,-1);
	if (n_curcnt < %n_XuanTian_Chui) then
		Msg2Player(format("C莕 %d %s, c竎 h� s� mang s� lng kh玭g  !", %n_XuanTian_Chui, "Huy襫 thi猲 ch飝 "));
		return 1
	end
	if (CalcFreeItemCellCount() >= 3 and ConsumeItem(3, %n_XuanTian_Chui, 6,1,2348,-1)) then
		tbAwardTemplet:GiveAwardByList(tbItem_Mibao, format("USE %s", "D� t萿 ch b� b秓 "))
		AddStatData("baoxiangxiaohao_kaishashoumibao", 1)		-- 数据埋点第一期
	else
		Msg2Player("T骾 b猲 trong ch� tr鑞g ch璦  ! ");
		return 1
	end
end
