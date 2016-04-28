-- 扬州 路人NPC 如意（入门任务）
-- by：Dan_Deng(2003-07-28)

function main()
	Uworld30 = GetByte(GetTask(30),2)
	if (Uworld30 == 10) and (HaveItem(74) == 0) then		--入门任务中并且没有该物品
		Say("Ph秈 khen th� n祇 y?",4,"Tng m筼 /prise_1","H鋍 th鴆 /prise_2","B筺 b� /prise_3","R阨 kh醝/prise_exit")
	else					--在普通对话中给一点点任务提示。
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","Уn 玭g t� 8 tu鎖 tr� l猲, 80 tu鎖 tr� xu鑞g u qu� m鋚 trc s綾 p c馻 b鎛 c� nng!")
		elseif (i == 1) then
			Talk(1,"","Ti觰 n� tuy v� i nh璶g l筰 c� c")
		else
			Talk(1,"","V� sao h� lu玭 ghen gh衪 s綾 p c馻 ta? L� n祇 p c騨g l� c竔 t閕 hay sao?")
		end
	end
end;

function prise_1()
--	if (GetSex() == 1) then		--若玩家角色是女性，对话应该修改。先留出接口，具体的言词以后再改。
--		Talk(4,"","玩家：这位姑娘眉如翠羽，肌如白雪，腰如束素，齿如含贝。增之一分则太长，减之一分则太短。著粉则太白，施朱则太赤。当真有西施之貌，贵妃之容啊！","Ngi th藅 bi誸 nh譶, b鎛 c� nng hi謚 x璶g l� Dng Ch﹗  nh蕋 m� nh﹏. Уn 玭g t� 8 tu鎖 tr� l猲,80 tu鎖 tr� xu鑞g u qu� m鋚 di ch﹏ b鎛 c� nng!","Ta qu� th藅 vinh h筺h, cu鑙 c飊g c騨g c� th� chi猰 ngng v� p c馻  nh蕋 m� nh﹏ Dng Ch﹗. Ch糿g hay c� nng c� th� t苙g ta 1 chi誧 kh╪ tay? Ta mu鑞 nh譶 kh╪ nh� nh譶 th蕐 ngi, m穒 m穒 ghi nh� n衪 xinh p m� mi襲 c馻 c� nng!","女子：这有何难？")
--	else
		Talk(4,"","V� c� nng n祔 m礽 nh� ph� th髖, da tr緉g nh� tuy誸, r╪g tr緉g nh� ng鋍 kh玭g thua k衜 g� T﹜ Thi, Qu� Phi!","Ngi th藅 bi誸 nh譶, b鎛 c� nng hi謚 x璶g l� Dng Ch﹗  nh蕋 m� nh﹏. Уn 玭g t� 8 tu鎖 tr� l猲,80 tu鎖 tr� xu鑞g u qu� m鋚 di ch﹏ b鎛 c� nng!","Ta qu� th藅 vinh h筺h, cu鑙 c飊g c騨g c� th� chi猰 ngng v� p c馻  nh蕋 m� nh﹏ Dng Ch﹗. Ch糿g hay c� nng c� th� t苙g ta 1 chi誧 kh╪ tay? Ta mu鑞 nh譶 kh╪ nh� nh譶 th蕐 ngi, m穒 m穒 ghi nh� n衪 xinh p m� mi襲 c馻 c� nng!","V藋 c� g� kh�?")
--	end
	AddEventItem(74)
	Msg2Player("Th� Sinh t苙g b筺 chi誧 qu箃 ")
	AddNote("Л頲 t苙g m閠 mi課g Th� Ph竎h. ")
end;

function prise_2()
	Talk(2,"","V� c� nng n祔 kh� ch蕋 thanh khi誸, ch綾 l� con nh� tr﹎ anh th� ki謙, h鋍 v蕁 uy猲 th﹎! Th藅 l� 1 n� trung Tr筺g nguy猲.","Ti觰 n� kh玭g c� t礽 th� c騨g c� c. Ch� ngh躠 th� l祄 頲 g�? Ch� gi祏 sang ph� qu� l� 頲 r錳!")
end;

function prise_3()
	Talk(2,"","V� c� nng n祔 th藅 d� m課! Ch綾 c� nng c� r蕋 nhi襲 b籲g h鱱?","H�! B鋘 h�  k� ta xinh p h琻 h� n猲 ta m韎 kh玭g k誸 b筺 v韎 h� th玦!")
end;

function prise_exit()
end;
