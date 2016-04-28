--description: 两湖区 巴陵县 药店老板对话（天王帮40级任务、新手任务小渔爹爹的病）
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-10)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	UTask_tw = GetTask(3)
	UTask_world18 = GetTask(46)
	if (UTask_tw == 40*256+20) then						-- 天王40级任务
		Talk(5, "L40_tw_talk2", "T筰 h� l� Thi猲 vng gi髉 ch  t� , ta c� m閠 ng m玭 trung li評 x輈h luy謓 x� ch c , xin/m阨 th莕 y cho ta gi秈 dc !", "X輈h luy謓 x� ? th藅 s� l� qu� nguy hi觤 .. ta c� th� c鴘 , mu鑞 t譵 t礽 li謚 t韎 ch� thu鑓 !", "Kh玭g bi誸 mu鑞 c竔 g� t礽 li謚 y ? ", "Зy l� gia truy襫 b� quy誸 , nh璶g ngi l� Thi猲 vng  t� ta li襫 n鉯 cho ngi nghe ! ph秈 c� <color=Red> l鯽 con th籲 l籲 ch v秠 <color> c飊g <color=Red> l玭g xanh con r颽 v� r颽 thng ch mao <color>. t譵 頲 hai th�  n祔 , ngi ng m玭 th� c� c鴘 ", "Kh玭g bi誸 c� th� t譵 頲 hai th�  n祔 sao ? ")
	elseif(UTask_world18 == 1) then				-- 新手村小渔任务
		Talk(1,"","Ng� th莕 y: oh ? ti觰 c� ch ph� th﹏ ng� b謓h ? ngi t韎 th藅 l� kh玭g kh衞 , m韎 v鮝 v祇 ch m閠 nh鉳 t� ba ho祅 b竛 h誸 cho Thi猲 vng gi髉 . n誹 kh玭g , ngi 甶 h醝 m閠 ch髏 trong th玭 Thi猲 vng gi髉 ch  t� ? ")
		Msg2Player("Ti謒 thu鑓 l穙 b秐 n鉯 cho ngi bi誸 t� ba ho祅  b竛 xong , c莕 甶 t譵 Thi猲 vng gi髉  t� ")
		AddNote("Ti謒 thu鑓 l穙 b秐 n鉯 cho ngi bi誸 t� ba ho祅  b竛 xong , c莕 甶 t譵 Thi猲 vng gi髉  t� ")
	elseif (UTask_tw == 40*256+50) then
		Say("Nghe n鉯 � <color=Red> ph鬰 l璾 ng <color> c� <olor=Red> l鯽 con th籲 l籲 <color> c飊g <color=Red> l玭g xanh con r颽 <color>, c� ngi � <color=Red> Thi猲 vng o <color> g苝 頲 . ch� c莕 t譵 頲 ngi ng m玭 th� c� c鴘 ", 2, "Ta 甶 trc mua m閠 ch髏 thu鑓 /yes", "Ta mu鑞 l藀 t鴆 甶 mua thu鑓 d蒼 /no")
	else							-- 非任务状态
		Say("B鎛 ti謒 l� th莕 dc! C� b謓h s� kh醝 b謓h, kh玭g b謓h s� kh醗, gi� c� ph秈 ch╪g. Mua m閠 輙 ch�? ", 3, "Giao d辌h /yes", "Ta n nh薾 nhi謒 v� s� nh藀 /yboss","Kh玭g giao d辌h /no");
	end
end;

function L40_tw_talk2()
	Talk(2,"","Nghe n鉯 � <color=Red> ph鬰 l璾 ng <color> c� <color=Red> l鯽 con th籲 l籲 <color> c飊g <color=Red> l玭g xanh con r颽 <color>, c� ngi � <color=Red> Thi猲 vng o <color> g苝 頲 ", " t� th莕 y !")
	SetTask(3, 40*256+50)								-- 天王40级任务
	AddNote("Nghe ba l╪g huy襫 ch th莕 y n鉯 : mu鑞 m� r緉 c ph秈 c� l鯽 con th籲 l籲 da c飊g l玭g xanh con r颽 ")
	Msg2Player("Mu鑞 m� r緉 c ph秈 c� l鯽 con th籲 l籲 da c飊g l玭g xanh con r颽 .")
end;

function yes()
	Sale(39);  			--弹出交易框
end;

function no()
end;
