Include("\\script\\activitysys\\config\\32\\head.lua")
Include("\\script\\activitysys\\config\\32\\variables.lua")
Include("\\script\\activitysys\\config\\32\\killdailytask.lua")
Include("\\script\\activitysys\\config\\32\\gatherdailytask.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")
Include("\\script\\lib\\log.lua")
--风云令牌-记录武林盟主任务完成次数- Modified by DinhHQ - 20110920
Include("\\script\\activitysys\\g_activity.lua")

function pActivity:IsOpen()
	return 1;
end

function pActivity:Init()
	%tbKillDailyTask:Init();
	%tbGatherDailyTask:Init();
	%tbTalkDailyTask:Init();
end

function pActivity:AcceptKillTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbKillDailyTask:AcceptTask();
end

function pActivity:AcceptTalkTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbTalkDailyTask:AcceptTask();
end

function pActivity:AcceptGatherTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbGatherDailyTask:AcceptTask();
end

function pActivity:CompletKillTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbKillDailyTask:CompleteTask() == 1) then
		--风云令牌-记录武林盟主任务完成次数- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "KillTask");
		--更改每日Nhi謒 v� S竧 qu竔 奖励- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("Ho祅 th祅h nhi謒 v� h祅g ng祔(%s) nh薾 頲 %d c竔 %s", "Nhi謒 v� S竧 qu竔 ", 15000000, "kinh nghi謒 "));
		Talk(1,"",format("%s, Ngi qu� l� m閠 v� i hi謕. Зy l� m鉵 qu� nh� ta t苙g cho ngi, mong h穣 nh薾 l蕐. Ng祔 mai g苝 l筰 nh�.", GetSex() == 1 and "Ch� " or "Ca Ca"));
		
	end
end

function pActivity:CompletTalkTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbTalkDailyTask:CompleteTask() == 1) then
		--风云令牌-记录武林盟主任务完成次数- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "TalkTask");
		--更改每日Nhi謒 v� цi tho筰 奖励- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("Ho祅 th祅h nhi謒 v� h祅g ng祔(%s) nh薾 頲 %d c竔 %s", "Nhi謒 v� цi tho筰 ", 15000000, "kinh nghi謒 "));
		Talk(1,"",format("%s, Ngi qu� l� m閠 v� i hi謕. Зy l� m鉵 qu� nh� ta t苙g cho ngi, mong h穣 nh薾 l蕐. Ng祔 mai g苝 l筰 nh�.", GetSex() == 1 and "Ch� " or "Ca Ca"));
		
	end
end

function pActivity:CompletGatherTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbGatherDailyTask:CompleteTask() == 1) then
		--风云令牌-记录武林盟主任务完成次数- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "GatherTask");
		--更改每日Nhi謒 v� thu th藀奖励- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 10000000}, format("Ho祅 th祅h nhi謒 v� h祅g ng祔(%s) nh薾 頲 %d c竔 %s", "Nhi謒 v� thu th藀", 10000000, "kinh nghi謒 "));
		Talk(1,"",format("%s, Ngi qu� l� m閠 v� i hi謕. Зy l� m鉵 qu� nh� ta t苙g cho ngi, mong h穣 nh薾 l蕐. Ng祔 mai g苝 l筰 nh�.", GetSex() == 1 and "Ch� " or "Ca Ca"));
		
	end
end

function pActivity:TalkToNpc()
	%tbTalkDailyTask:TalkToNpc();
end