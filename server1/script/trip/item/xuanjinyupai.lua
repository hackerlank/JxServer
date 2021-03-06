--玄金玉牌应该是 跨服道具
--不应该和跨服宋金有关，因此放在这里
--该文件定义的有关跨服宋金函数应转移至，\mission\battle



Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\missions\\battle\\manager.lua")
Include("\\script\\global\\judgeoffline.lua")
Include("\\script\\trip\\define.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\missions\\battle\\npc\\point2exp.lua")
function main()
	dialog_menu()
	return 1
end

function dialog_menu()
	local nTripMode = GetTripMode()
	if nTripMode ~= TRIP_MODE_CLIENT then
		return 1
	end
	local tbOpt =
	{
		{"Li猲 server", across_server},
		{"检查Li猲 server银两", show_across_server_money},
		{"Li猲 server贡献度", tbTripBattlePoint2Exp.DialogMain, {tbTripBattlePoint2Exp}},
		{"K誸 th骳 i tho筰"},
	}
	CreateNewSayEx("Huy襫 Kim Ng鋍 B礽", tbOpt)
end

function across_server()
	local tbOpt = {}
	local nCount = TripC_GetServerCount()
	for i=1, nCount do
		local szServerName = TripC_GetServerName(i)
		tinsert(tbOpt, {szServerName, sign_up, {i}})
	end
	tinsert(tbOpt, {"Tr� v�", dialog_menu})
	tinsert(tbOpt, {"K誸 th骳 i tho筰"})
	CreateNewSayEx("Ngi mu鑞 甶 t韎 n琲 n祇?", tbOpt)
end

function show_across_server_money()
	local tbOpt =
	{
		{"Tr� v�", dialog_menu},
		{"K誸 th骳 i tho筰"},
	}
	local szTitle = format("<color=yellow>%s<color>你有 <color=yellow>%d<color> Li猲 server银两, <color=yellow> 该银两数是你可以从源头服务器带到公共服务器，完成的不是公共服务器的银两数。公共服务器，你可以亲自到公共服务器检查。 <color>", GetName(), GetTask(TSK_TRIP_MONEY))
	CreateNewSayEx(szTitle, tbOpt)
end

function sign_up(nServerId)
	local _, nValue = GetRoleEquipValue()
	local szTitle = format("你目前的兵甲数值为%d, 你想去宋金Li猲 server的哪个级别? <enter>", nValue)
	local tbOpt = {}
	for i=1, getn(BattleManagerDef) do
		local nMapId = BattleManagerDef[i][2]
		local pManager = BattleManagerList[nMapId]
		if pManager then
			if pManager.nMinEqValue and pManager.nMaxEqValue then
				szTitle = szTitle..format("%s y猽 c莡 gi� tr� binh gi竝(%d~%d)<enter>", pManager.szName, pManager.nMinEqValue, pManager.nMaxEqValue)
			elseif pManager.nMinEqValue and not pManager.nMaxEqValue then
				szTitle = szTitle..format("%s y猽 c莡 gi� tr� binh gi竝 %d tr� l猲<enter>", pManager.szName, pManager.nMinEqValue)
			elseif pManager.nMaxEqValue and not pManager.nMinEqValue then
				szTitle = szTitle..format("%s y猽 c莡 gi� tr� binh gi竝%d tr� xu鑞g<enter>", pManager.szName, pManager.nMaxEqValue)
			else
				szTitle = szTitle..format("%s kh玭g y猽 c莡 gi� tr� binh gi竝", pManager.szName)
			end
			tinsert(tbOpt, {pManager.szName, select_mamager, {nMapId, nServerId}})
		end
	end
	tinsert(tbOpt, {"K誸 th骳 i tho筰"})
	CreateNewSayEx(szTitle, tbOpt)
end

function select_mamager(nMapId, nServerId)
	local pManager = BattleManagerList[nMapId]
	if not pManager then
		return
	end
	local _, nValue = GetRoleEquipValue()
	if (not pManager.nMinEqValue or nValue >= pManager.nMinEqValue) and
		(not pManager.nMaxEqValue or nValue <= pManager.nMaxEqValue) then
		local szServerName = TripC_GetServerName(nServerId)
		local nIfCanOffLine = check_if_can_offline()
		if szServerName and nIfCanOffLine == nil then
			TripC_Apply(szServerName, 0, pManager.nMapId, 1541, 3178)
		end
	else
		return  Talk(1, "", format("Gi� tr� binh gi竝 c馻 ngi(%d)kh玭g ph� h頿 y猽 c莡", nValue))
	end
end

function get_item()
	tbAwardTemplet:Give({szName="Huy襫 Kim Ng鋍 B礽",tbProp={6,1,3035,1,0,0},}, 1, {"TRIP", "get item"})
end

--EventSys:GetType("AddNpcOption"):Reg("V� binh th祅h m玭","我想领取Huy襫 Kim Ng鋍 B礽", get_item)
