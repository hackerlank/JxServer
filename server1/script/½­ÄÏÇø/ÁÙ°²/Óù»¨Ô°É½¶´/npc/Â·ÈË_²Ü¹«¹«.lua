-- 临安皇宫秘道 路人NPC 曹公公（丐帮50级任务）
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+20) and (HaveItem(199) == 1) then		-- 50级任务，第一次进宫
		Talk(3,"L50_after1","V� c玭g c玭g n祔! Ta mu鑞 v祇 g苝 Ho祅g thng. C� m閠 v藅 quan tr鋘g mu鑞 giao cho Ho祅g thng. "," Ho祅g thng hi謓 產ng ngh� ng琲. C� giao v藅  cho ta. Ta s� chuy觧 n cho Ho祅g thng","祬chuy謓 n祔� ","Sao h�? Kh玭g tin tng ta �? C騨g kh玭g ch辵 h醝 trc xem T祇 c玭g c玭g ta l� ngi nh� th� n祇. Ho祅g thng t� nh� n l韓 u do ta s╪ s鉩. L� n祇 ta l筰 甶 g箃 ngi sao? ","V藋 c騨g 頲!")
	elseif (UTask_gb == 50*256+50) then		--50级任务，第二次进宫打败了卫士之后
		Talk(7,"L50_after2","Xin h穣 tha m筺g!","N鉯! B鴆 a  Trung Nguy猲 hi謓 產ng � u?","� ch� ta! � ch� ta!","Ta v鑞 mu鑞 n  gi誸 ngi y!","Xin h穣 tha m筺g!","Nh璶g m� ta l筰 kh玭g mu鑞 khi課 cho Ho祅g thng kinh s頽猲 m韎 tha cho c竔 m筺g c馻 ngi. Ngi h穣 t� gi� l蕐 c竔 m筺g c馻 m譶h. N誹 nh� c遪 c﹗ k誸 v韎 b鋘 ngi Kimm穒 qu鑓 c莡 vinh th� thi猲 h� c騨g s� kh玭g tha cho ngi. ")
	elseif (UTask_gb == 50*256+40) then			-- 50级任务，第二次进未打卫士
		Talk(1,"","Kh玭g 頲 qua y! V� s�! Mau n c鴘 mang!")
	else
		Talk(1,"","C� th輈h kh竎h! V� s�!")
		SetFightState(0)
		NewWorld(176, 1627, 3206)
	end
end;

function L50_after1()
	AddNote("Giao b鴆 a  cho T祇 c玭g c玭g. ")
	Msg2Player("Giao b鴆 a  cho T祇 c玭g c玭g. ")
	DelItem(199)
	SetTask(8,50*256+30)
	SetFightState(0)
	NewWorld(176, 1627, 3206)
end

function L50_after2()
	AddEventItem(199)
	AddNote("箃 l筰 b鴆 a  Trung Nguy猲. ")
	Msg2Player("箃 l筰 b鴆 a  Trung Nguy猲. ")
	SetFightState(0)
	NewWorld(176, 1627, 3206)
end
