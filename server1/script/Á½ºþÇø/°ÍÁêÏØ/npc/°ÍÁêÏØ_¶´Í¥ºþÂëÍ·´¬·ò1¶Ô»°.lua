--两湖区 巴陵县 洞庭湖码头船夫1对话
-- Update: Dan_Deng(2003-08-21) 降低出村等级要求为5级

function main(sel)
	Say("C� i ta 甶襲 s鑞g v韎 s玭g nc!. чng d譶h h� kh玭g n琲 n祇 m� ta kh玭g bi誸! Kh竎h quan mu鑞 甶 u?", 2, " Thi猲 Vng Фo/yes", "Kh玭g ng錳/no")
end;

function yes()
	if (GetLevel() >= 5) then						--等级达到十级
		if (GetFaction() == "tianwang") then				--如果玩家是天王帮弟子，坐船不收钱
			Say("Th� ra l� m玭  c馻 Thi猲 Vng Bang! ta s� a ngi 甶 mi詎 ph�", 1, "Ng錳 Thuy襫/ok1")
		else	
			Say("N琲  nguy hi觤 l緈! N誹 kh竎h quan mu鑞 甶 xin cho th猰 輙 ti襫", 1, "Ng錳 Thuy襫/ok2")
		end
	else		
		Talk(1,"","N琲  nguy hi觤 l緈! Khi n祇 d箃 n ng c蕄 h琻 10 ta s� a kh竎h quan 甶")
	end
end;

function no()
end;

function ok1()
NewWorld(59, 1425, 3472)
SetFightState(0)					--转换为非战斗状态
end;

function ok2()
if (GetCash() >= 100) then							--参考值
	Pay(100)
	NewWorld(59, 1425, 3472)
	SetFightState(0)							--转换为非战斗状态	
else
	Say("Kh玭g ti襫 kh玭g th� ng錳 thuy襫!", 0)		
end
end;
