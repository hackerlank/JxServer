--description: 剑阁蜀道锁云洞敌人
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4);
	if (UTask_tr == 40*256+20) and (HaveItem(159) == 0) then					--取消对任务物品有无的判断，以便重做任务
		AddEventItem(159)
		Msg2Player("B総 d� d祅g t猲 h� Li猽, tr猲 ngi h緉 t譵 頲 m閠 b鴆 m藅 th� vi誸 g鰅 tri襲 nh nh� T鑞g. ")
--		SetTask(4, 45)
		AddNote("B総 頲 t猲 h� Li猽 t筰 Ki誱 C竎 чc o, To� V﹏ ng, l蕐 頲 m閠 b鴆 m藅 th� g鰅 cho T鑞g qu鑓. ")
	end
end;
