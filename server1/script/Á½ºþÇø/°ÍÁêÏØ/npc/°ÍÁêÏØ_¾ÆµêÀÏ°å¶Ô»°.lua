--description: 两湖区 巴陵县 酒店老板对话 天王入门任务
--author: yuanlan	
--date: 2003/4/24
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\timerhead.lua")

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld38 == 20) then 							--天王帮入门任务
Talk(4, "", "Ch� qu竛! 氘﹜ lo筰 ru n祇 l� ngon nh蕋?", "Ru ngon nh蕋 � y l� <color=Red>B錸g Lai Xu﹏<color>, n蕌 lo筰 ru n祔 t鑞 r蕋 nhi襲 c玭g s鴆, h琻 n鱝 nguy猲 li謚 r蕋 kh� t譵, v� th� gi� c� s� kh玭g r�. ", "Ch� c莕 ru ngon l� 頲, ta mu鑞 mua m閠 h�, h誸 bao nhi猽 ti襫?", "C� bao nhi猽 ti襫 c騨g kh玭g , b雐 v� qu竛 ch髇g ta t� l﹗ r錳 kh玭g c遪 b竛 lo筰 ru n祔 n鱝, v� thi誹 c竎 lo筰 nguy猲 li謚 <color=Red>Linh Chi<color>, <color=Red>Huy襫 S﹎<color> v� <color=Red>H� Th� �<color>. N誹 kh竎h quan c� th� gi髉 ta t譵 ba m鉵 nguy猲 li謚 n祔, ta s� l祄 gi髉 m閠 h� ")
		SetTask(38,SetByte(GetTask(38),1,40))
		AddNote("цi tho筰 v韎 ch� qu竛 ru Ba L╪g huy謓, bi誸 頲 c莕 t譵 ba lo筰 nguy猲 li謚  n蕌 ru: Linh Chi, Huy襫 S﹎, H� Th� �. ")
		Msg2Player("Bi誸 頲 c莕 t譵 ba lo筰 nguy猲 li謚  n蕌 ru: Linh Chi, Huy襫 S﹎, H� Th� �. ")
	elseif (Uworld38 == 40) then
		if (HaveItem(116) == 1) and (HaveItem(135) == 1) and (HaveItem(144) == 1) then
			if (GetTimerId() > 0) then		-- 另有计时器在运行中
				Talk(1,"","Ngi 產ng mang nhi謒 v� c蕄 b竎h nh� th�, m� c遪 ch箉 lung tung �?")
				return
			end
			Talk(2,"","Ch� qu竛! Ta  t譵  ba lo筰 nguy猲 li謚 r錳, 玭g gi髉 ta n蕌 ru B錸g Lai Xu﹏ 甶!","Л頲! Nh璶g ph秈 ch� m閠 gi� ng h� m韎 xong. ")
			DelItem(116)
			DelItem(135)
			DelItem(144)
			SetTask(38,SetByte(GetTask(38),1,60))
			SetTimer(1 * CTime * FramePerSec, 1)									--开启计时器
			AddNote("Quay l筰 qu竛 ru Ba L╪g huy謓, a nguy猲 li謚, bi誸 頲 c莕 ph秈 i m閠 gi�. ")
			Msg2Player("Лa nguy猲 li謚, bi誸 頲 c莕 ph秈 i m閠 gi�. ")
		else
			Talk(1,"","Nghe n鉯 ba lo筰 c﹜ thu鑓 n祔 sinh trng t筰 <color=Red>ph輆 Йng B綾 V� L╪g s琻<color>, nh璶g �  c� r蕋 nhi襲 qu竔 th� ╪ th辴 ngi, v� th� kh玭g ai c� can m n . ")
		end
	elseif (Uworld38 == 60) then			-- 为计时器容错加入手动超时处理
		i = GetRestSec(1)
		if (i > 0) then
			Talk(1,"","Ch璦 n l骳 u, ru n蕌 ch璦 xong, ngi c遪 ph秈 i: "..i.."Gi﹜, ")
		else
			StopTimer()						--结束计时
			SetTask(38,SetByte(GetTask(38),1,80))
			TWenroll_getitem()
		end
	elseif (Uworld38 == 80) and (HaveItem(90) == 0) then
		TWenroll_getitem()
	elseif (Uworld38 >= 80) then		-- 完成此任务后
		Talk(1,"","Th� n祇?B錸g Lai Xu﹏ c馻 b鎛 ti謒 kh玭g ph秈 l� h� danh ch�?")
	else
		Talk(1,"","N琲 y ch髇g ta c�  th鴆 ╪, h秈 s秐 phong ph�. Kh竎h quan mu鑞 ╪ g�? Mu鑞 u鑞g ru g�?")
	end
end;

function TWenroll_getitem()
	AddEventItem(90)
	Msg2Player("L蕐 頲 m閠 h� ru B錸g Lai Xu﹏. ")
--	SetTask(3, 8)
	AddNote("M閠 gi� sau, quay l筰 qu竛 ru l蕐 頲 B錸g Lai Xu﹏. ")
end
