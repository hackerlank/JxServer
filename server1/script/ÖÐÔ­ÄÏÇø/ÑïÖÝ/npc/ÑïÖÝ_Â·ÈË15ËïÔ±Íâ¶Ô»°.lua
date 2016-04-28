-- 扬州 路人NPC 孙员外（入门任务）
-- by：Dan_Deng(2003-07-28)

function main()
	Uworld30 = GetByte(GetTask(30),2)
	if ((Uworld30 == 10) and (HaveItem(75) == 0)) then		--入门任务中并且没有该物品
		Say("Ph秈 khen th� n祇 y?",4,"B筺 b� /prise_1","T礽 ph骳 /prise_2","Con ch竨. /prise_3","R阨 kh醝/prise_exit")
	else					--在普通对话中给一点点任务提示。
		if (random(0,1) == 0) then
			Talk(1,"","B鋘 c飊g kh�  su鑤 ng祔 c� n qu蕐 r鑙! H鮩! M閠 ch髏 ta c騨g kh玭g cho!")
		else
			Talk(1,"","Ta n╩ nay  g莕 50 tu鎖 r錳, m閠 a con trai c騨g kh玭g c�. Sau n祔 bao nhi猽 s秐 nghi謕 n祔 ta kh玭g bi誸 ph秈 nhng l筰 cho ai y!")
		end
	end
end;

function prise_1()
	Talk(2,"","V� l穙 gia n祔, v鮝 nh譶  bi誸 ngay l� ngi h祇 hi謕 thng ngi. B籲g h鱱 n琲 n祇 c騨g c�. Th藅 ng l� M筺h Thng Qu﹏ th� hai v藋"," M筺h Thng Qu﹏ l� c竔 th� g�? H緉 c� 頲 bao nhi猽 ti襫? C竔 m b莕 c飊g n祔 su鑤 ng祔 c� n y  v遡 xin! Ch綾 ngi c騨g v藋 th玦! ! ! !")
end;

function prise_2()
	Talk(2,"","V� l穙 gia n祔 gi祏 c� nh蕋 v飊g, danh ti課g kh緋 n琲. дn Ho祅g Thng c騨g kh� m� b� 頲 v韎 s� ph� qu� c馻 ng礽! Ta ch骳 玭g ti襫 v� ng祔 c祅g nhi襲,phi襫 ph鴆 ng祔 c祅g 輙!"," H鮩!C竔 t猲 ti觰 qu� n祔 mi謓g li c馻 h緉 m韎 ng鋞 l祄 sao! Л頲! Xem nh� h玬 nay ta m� l遪g m閠 l莕 v藋. Mi課g 'b秐 ch�' n祔 ta t苙g cho ngi!")
	AddEventItem(75)
	Msg2Player("T玭 Vi猲 Ngo筰 t苙g b筺 B秐 ch� ")
	AddNote("T玭 Vi猲 Ngo筰 t苙g b筺 B秐 ch�   ")
end;

function prise_3()
	Talk(2,"","V� l穙 gia n祔 th藅 c� ph骳 tng. Trong nh� nh蕋 nh l� c� nhi襲 'ki襲 th� m� thi誴 ' v� qu� t� y nh� ph秈 kh玭g?","H鮩! Kh玭g n鉯 th� th玦! N鉯 ra l筰 c遪 bu錸! Ta n╩ nay  g莕 50 tu鎖, m閠 a con trai c騨g kh玭g c�, bao nhi猽 s秐 nghi謕 ng祔 sau kh玭gbi誸  l筰 cho ai?")
end;

function prise_exit()
end;
