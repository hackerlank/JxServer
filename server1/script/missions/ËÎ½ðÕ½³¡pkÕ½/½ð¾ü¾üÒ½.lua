--中原北区 宋金战场 金军军医
--苏宇

function main(sel)
	if (GetCurCamp() == 2) then
		Say("Tham gia tr薾 chi課 h穣 t� ch╩ s鉩 b秐 th﹏, mua thu鑓 kh玭g?", 2, "Mua thu鑓/yes", "Kh玭g mua/no")
	else
		Talk(1,"","Gi竛 甶謕 y �? V� binh u r錳!")
	end
end;

function yes()
Sale(53)
end;

function no()
end;