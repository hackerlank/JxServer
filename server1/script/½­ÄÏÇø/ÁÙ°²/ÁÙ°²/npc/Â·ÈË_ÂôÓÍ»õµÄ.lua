-- �ٰ���·�ˡ����ͻ���
-- by��Dan_Deng(2003-09-16)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>�а�������ը�������������ը����"
	G_TASK:OnMessage("���ͻ���", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end;
