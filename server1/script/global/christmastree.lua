--  GetGlbValue(9)  记录时间hour
--  GetGlbValue(8)  记录领取次数
--  GetTask(615)    记录一小时内是否有领过奖
--  圣诞树送礼活动，每小时每台服务器送13个礼物，每人每小时只能领取一个
--  此活动从12月22日持续到1月11日


function main()

	iRand = random(1,300)
	if ( iRand < 100 ) then
		Say("Ngi � y c﹜ gi竛g sinh cho ph衟 m閠 nguy謓 , t nhi猲 ph竧 hi謓 tr猲 c﹜ nhi襲 m閠 chi誹 l蕄 l竛h ch  ",2,"Th藅 bi誸 甶襲 , ta n xem nh譶 nh譶 /present","Ta c遪 l� chuy猲 t﹎ h鴄 nguy謓 甶 /no")
	else
		Say("Nh� ch琲  th藅 l� p ch c﹜ gi竛g sinh nha , � ch� n祔 cho ph衟 ch nguy謓 nh蕋 nh c� th� th鵦 hi謓 ",0)
	end

end

function present()

	local nLastTime = GetGlbValue(9)
	local nQuantity = GetGlbValue(8)
	local Utask615 = GetTask(615)
	local nHour = tonumber( date( "%m%d%H" ) )
	local nMinute = tonumber( date( "%M") )
	
	if ( nLastTime == 0 and mod( nHour , 100 ) ~= 0 and nMinute < 30 ) then
		SetGlbValue(9,nHour - 1)
		SetGlbValue(8,0)
		AddLocalNews("* * * 玭g gi� n� en l筰 產ng c﹜ gi竛g sinh thng th� th藅 l� nhi襲 l� v藅 , m鋓 ngi mau 甶 xem m閠 ch髏 nha * * *")
	elseif ( nLastTime ~= nHour and nMinute >= 30 ) then
		SetGlbValue(9,nHour)
		SetGlbValue(8,0)
--		Msg2Player("New hour : ["..nHour.."o'clock] Reset")
		AddLocalNews("* * * 玭g gi� n� en l筰 產ng c﹜ gi竛g sinh thng th� th藅 l� nhi襲 l� v藅 , m鋓 ngi mau 甶 xem m閠 ch髏 nha * * *")
	end
	nLastTime = GetGlbValue(9)
	nQuantity = GetGlbValue(8)
	if ( Utask615 ~= nLastTime and nQuantity <= 14 ) then
		onTake()
		SetGlbValue(8,nQuantity + 1)
		SetTask(615,nLastTime)
--		Msg2Player("AddItem 1,total = "..nQuantity + 1)
	elseif ( Utask615 == nLastTime ) then
		Say("Kh玭g mu鑞 l遪g tham nga , 甧m c� h閕 nhng cho nh鱪g b籲g h鱱 kh竎 甶 ",0)
	else
		Say("Th� t鑤 nh竬 m総 li襫 b� cp xong r錳 , xin/m阨 m閠 canh gi� sau tr� l筰 th� m閠 ch髏 v薾 kh� 甶 ",0)
--		SetTask(615,nHour)
	end		

end

function onTake()

	i = random(1,100000)
	if ( i < 40000 ) then
		AddItem(6,0,20,1,0,0,0)
		Msg2Player("Oa  l� m閠 a hoa h錸g nga , ta mu鑞 甧m n� a cho ta th輈h nh蕋 ngi c馻 . ")
	elseif ( i < 85000 ) then
		AddItem(6,0,11,1,0,0,0)
		Msg2Player("Di  l� m閠 ph竜 b玭g c騨g , ta t韎  cho m鋓 ngi xem 甶 . ")
	elseif ( i < 90000 ) then
		AddItem(6,1,72,1,0,0,0)
		Msg2Player("Nga ? l� m閠 Thi猲 S琻 ng鋍 l� y , ch� mong n� c� th� cho ta mang n may m緉 . ")
	elseif ( i < 95000 ) then
		AddItem(6,1,73,1,0,0,0)
		Msg2Player("H綾  m閠 tr╩ qu� l� , ta 產ng c莕 n� y . ")
	else
		AddItem(6,1,125,1,0,0,0)
		Msg2Player("A ? m閠 hoa qu� ru oh , ta mu鑞 甶 t譵 b籲g h鱱 c飊g nhau chia x� c竔 n祔 m� v� ch ru ")
	end

end

function no()
end
