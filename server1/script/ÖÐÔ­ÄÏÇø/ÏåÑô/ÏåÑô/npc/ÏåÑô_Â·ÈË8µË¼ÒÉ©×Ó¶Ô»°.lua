--description: 中原南区 襄阳府 路人8邓家嫂子对话 武当派50级任务
--author: yuanlan	
--date: 2003/5/16
-- Update: Dan_Deng(2003-08-17)

function main(sel)
	UTask_wd = GetTask(5);
	if (UTask_wd == 50*256+50) then 
		Talk(3, "select", "Nh� ta kh玭g c遪 g�  ╪, nh譶 con nh� lu玭 mi猲g k猽 i, l祄 m� ta th藅 r蕋 產u l遪g!", "Чi t萿, ta y c� 1 v筺 lng. T萿 mau nh薾 甶! Ch� c莕 c�  t� V� ng ta y, c竎 ngi s� kh玭g ph秈 ch辵 i l筺h n鱝!", "竔 da,ta qu� l� g苝 頲 b� t竧 s鑞g r錳! Ta 產ng t豱h hay m� B﹜ gi� c遪 c� ngi t鑤 v藋 sao?")
	elseif (UTask_wd > 50*256+50) then
		Talk(1,"","C竎 i hi謕 tr猲 V� ng s琻 th藅 l� b� t竧 s鑞g c鴘 m筺g b鋘 ngi c飊g kh?ta! N誹 h?kh玭g thng gi髉 , m?con ta ch綾  ch誸 i m蕋 r錳!")
	else
		Talk(1,"","Nh� ta kh玭g c遪 g�  ╪, nh譶 con nh� lu玭 mi猲g k猽 i, l祄 m� ta th藅 r蕋 產u l遪g!")
	end
end;

function select()
	if (GetCash() >= 10000) then
		Pay(10000)
	Msg2Player("m to祅 b?m閠 v筺 l筺g b筩 cp 頲 trao cho con d﹗ ng gia ")
		SetTask(5, 50*256+80)
		AddNote("m to祅 b?m閠 v筺 l筺g b筩 cp 頲 trao cho con d﹗ ng gia ")
	else
		Talk(1,"","Th藅 t? 1 v筺 lng  ta  d飊g m蕋 r錳, th?n祔 th?l祄 sao m韎 ph秈 y?Ta ph秈 甶 ki誱 ch髏 ng﹏ lng!")
		AddNote("Ng﹏ lng kh玭g , 甶 ki誱 ti襫 trc. ")
	end
end;
