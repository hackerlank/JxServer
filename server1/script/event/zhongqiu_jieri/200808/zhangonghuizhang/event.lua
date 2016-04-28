

Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function zhongqiu0808_zhangonghuizhang(nBattleLevel, i)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	local tbItem = 	{szName="Huy chng chi課 c玭g", tbProp={6, 1, 1818, 1, 0, 0}}
	if nDate >= zhongqiu0808_ZhanGongStartTime and nDate <= zhongqiu0808_ZhanGongEndTime then
		if zhongqiu0808_PlayerLimit() == 1 and nBattleLevel == 3  then
			if BT_GetData(PL_CURRANK) == 5 then
				Msg2Player("送大侠一过Huy chng chi課 c玭g，因为成绩出色!")
				tbAwardTemplet:GiveAwardByList(tbItem,tbItem.szName )
			else
				Msg2Player("Huy chng chi課 c玭g只能送给达到大将称号的玩家，下次更努力点哦!")
			end
		end
	end
	
	
	
end

function zhongqiu0808_gongxuanlingpai()
	local tbSay = 
	{
		"<dec><npc>D飊g 2000 甶觤 t輈h l騳 T鑞g Kim i 1 C玭g tr筺g l謓h b礽.",
		"X竎 nh薾/zhongqiu0808_gongxuanlingpai_ok",
		"H駓 b� /no"
	}
	CreateTaskSay(tbSay)
end

function zhongqiu0808_gongxuanlingpai_ok()
	if GetLevel() < 120 or IsCharged() ~= 1 then 
		return Say("Ch� c� nh﹏ v藅 c蕄 120 tr� l猲  n筽 th� m韎 c� th� i C玭g Tr筺g L謓h B礽.", 0)
	end
	
	local tbItem = 	{szName="C玭g tr筺g l謓h b礽", tbProp={6, 1, 1819, 1, 0, 0}}
	local nPoint = 2000
	if nt_getTask(747) < nPoint then
		Say(format("您的积分不够 %d, 不能换取C玭g tr筺g l謓h b礽.", nPoint),0);
		return 0;
	end
	nt_setTask(747, floor(nt_getTask(747) - nPoint));
	tbAwardTemplet:GiveAwardByList(tbItem,tbItem.szName )
end