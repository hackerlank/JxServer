Include("\\script\\event\\zhaojingling\\event.lua")

function TaskShedule()	
	TaskName("ѵ��ľ�� ")

	local nStartHour = tonumber(date("%H")) + 1
	if nStartHour < 12 then
		nStartHour = 12
	end
	if nStartHour == 24 then
		nStartHour = 0
	end
	--15����һ��
	TaskInterval(15) --����
	-- ���ô���ʱ��
	TaskTime(nStartHour, 0)
	
	OutputMsg("===��ľ�� ===")
	-- ִ�����޴�
	TaskCountLimit(0)
	------------������
	--tbJingLing:Save(tbJingLing.nSortKey, 0, 0)
	----------------
	tbJingLing:GetNextSortTime()
	tbJingLing:SortPaiMing()
end

function TaskContent()
	local nCurHour = tonumber(date("%H"))
	tbJingLing:SortPaiMing()
	if nCurHour >= 0 and nCurHour < 12 then
		return
	end
	OutputMsg("=======����Ѱ��ľ�˻=========")
	RemoteExecute("\\script\\missions\\zhaojingling\\prepare\\preparetimer.lua", "PrepareGame:InitTimer", 0)
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end