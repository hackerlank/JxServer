--description: 唐门翡翠湖敌人 20级任务
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 20*256+40) and (HaveItem(41) == 0) then			-- 概率由50%改为100%
		AddEventItem(41) 
		Msg2Player("C� 頲 d﹜ chuy襫 v祅g ")
		AddNote("T筰 h� Ph� Th髖 k� b猲 Л阯g Gia B秓, nh b筰 X輈h Di謒 Ng筩, l蕐 頲 d﹜ chuy襫 v祅g ")
	end
end;
