--中原北区 朱仙镇 路人乞丐的对话
--朱仙镇新手任务: 找手环
--by Dan_Deng(2003-07-21)

--使用变量: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if (UTask_world40 == 2) then
		Talk(6,"","Nghe n鉯 ngi nh苩 頲 chi誧 nh蒼. с l� c馻 Song Song c� nng trong th玭 nh r琲, ngi c� th� tr� l筰 kh玭g?"," Ta ch糿g c� g� ╪ c�, ph秈 cho ta c竔 g� m韎 頲.","�.. (Ngi ch糿g ph秈 ╪ c琺 sao?) ......Ngi mu鑞 g�?","Ta mu鑞 ╪ m閠 ph莕 u h� Ng� Hng.","Ngi i h醝 nhi襲 qu� y.","Mu鑞 hay kh玭g mu鑞, ngi t� quy誸 nh 甶.")
		Msg2Player("Ngi ╪ m祔 mu鑞 i nh蒼 c馻 Song Song c� nng l蕐 u ph� Ng� Hng. ")
		AddNote("Ngi ╪ m祔 mu鑞 i nh蒼 c馻 Song Song c� nng l蕐 u ph� Ng� Hng. ")
		SetTask(68,3)
	elseif ((UTask_world40 == 3) and (HaveItem(187) == 1)) then
		Talk(3,"","u h� Ng� Hng c馻 ngi y.","A! ng l� u h� ch輓h t玭g Chu Ti猲 r錳, th琺 qu�!","Л頲! V藋 a nh蒼 cho ta.")
		DelItem(187)
		AddEventItem(191)
		Msg2Player("L蕐 頲 nh蒼 c馻 Song Song c� nng. ")
		AddNote("把豆腐给乞丐，L蕐 頲 nh蒼 c馻 Song Song c� nng. ")
--		SetTask(68,5)
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","H穣 b� th� cho k� ngh蘯 n祔 b竧 c琺 ngu閕!")
		else
			Talk(1,"","N籱 ph琲 n緉g, b総 con r薾. Nh鱪g l骳 th� n祔, th莕 ti猲 c騨g kh玭g i!")
		end
	end
end;
