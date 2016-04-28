-- 长江源头 路人_界无邪.lua　丐帮90级技能任务
-- By：XiaoYang(2004-04-29)
-- Update：dan_deng(2004-05-20)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(2) == 1 then
		allbrother_0801_FindNpcTaskDialog(2)
		return 0;
	end
	
	Uworld128 = GetTask(128)
	Uworld30 = GetByte(GetTask(30),2)
	if (Uworld128 < 10) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~="gaibang") and (Uworld30 ==127) then
		Talk(8,"Uworld128_get","Trng Giang nguy猲 u. B筺 nh譶 th蕐 m閠 thanh ni猲 tu蕁 t�, 產ng th鎖 s竜. Ti課g s竜 r蕋 n穙 nu閠","Ti課g s竜 c馻 c竎 h� sao nghe th� lng,dng nh� 產ng c� t﹎ s�?","Qu鑓 gia chi n筺, th蕋 phu h鱱 tr竎h. Huynh  gia vi猲 產ng b� qu﹏ kim ch� p t祅 s竧, t筰 h� l祄 sao c� th� vui 頲?","Quan s琻 v筺 l�, kh玭g bi誸 bao nhi猽 h薾 th�. Ch� ti誧 th� nh﹏ ngu mu閕 sai l莔 l蕐 kh鉯 hoa  i l蕐 s� ph錸 vinh","T筰 h� l� Gi韎 V� T� � C竔 Bang, h玬 nay g苝 頲 anh h飊g, mang ru ra u鑞g m鮪g!","Trong thi猲 h� anh h飊g c� m蕐 ngi� ","C筺 ly ","C筺 ly ")
   elseif (Uworld128 == 10) and (HaveItem(76) == 1) then
   	Talk(11,"Uworld128_envelop","Huynh i qu� l� ngi c� ch� t輓","Tri k� tng ph飊g thi猲 b玦 thi觰. H玬 nay nh蕋 nh ph秈 u鑞g cho say� ","Trong thi猲 h� anh h飊g c� m蕐 ngi� ","C竎 h� kh玭g bi誸  th玦, nhi襲 khi ch輓h th阨 th� t筼 anh h飊g!","T筰 sao n鉯 v藋?","T筰 h� tuy nh藀 m玭 kh玭g l﹗ nh璶g  tr秈 qua kh玭g 輙 tr薾 quy誸 chi課, nhi襲 ngi kh玭g n猲 ch誸 c騨g  ch誸 r錳, t筰 h� v蒼 c遪 s鑞g y, b鋘 h� ai c騨g c� cha m�, v� v� con th� kh玭g l� n祇 l筰 mu鑞 ch誸,? Ch� t筰 th阨 th� d錸 v祇 阯g c飊g kh玭g th� kh玭g l祄 v藋","Цng ti誧, nh鱪g ngi nh� th� r蕋 hi誱!","C� l� v藋! дn lt ta r錳! Kh玭g n鉯 nh鱪g chuy謓 kh玭g vui n鱝! N祇 u鑞g ru 甶!","Gi韎 i ca h譶h nh� c� chuy謓 g� kh� n鉯? N誹 i ca c� g� c莕 d苙 d� c� n鉯 v韎 !","Ta v� ngi b蘯 nc g苝 nhau nh璶g v鮝 g苝 nh�  quen t� l﹗! Л頲! Gi韎 m� � y c� m閠 b鴆 th� nh� ngi mang gi髉 b鴆 th� n祔 n C竔 bang giao cho trng l穙 La Khu玭g Sinh!")
   elseif (Uworld128 == 40) then
   	Talk(7,"Uworld128_kill","G i韎 i ca! Huynh kh玭g c� vi謈 g� ch�!","Y猲 t﹎! Ta kkh玭g sao!","Huynh l祄 sao bi誸 c� ngi s緋 gi誸 h筰 huynh!","Chuy謓 n祔 li猲 quan n n閕 b� C竔 bang, n誹 ta kh玭g c� tin t譶h b竜 ch輓h x竎 th� c騨g kh玭g d竚 b轪 t ra u","V藋 huynh ph秈 n猲 c萵 th薾,  ph秈 甶 b竜 v韎 La trng l穙!","B籲g h鱱! Gi韎 m� kh玭g c� g� b竜 p! Sau n祔 n誹 c� c莕 vi謈 g� th� Gi韎 m� d� l祄 tr﹗ ng鵤 c騨g quy誸 l祄!","Чi ca kh玭g n猲 n鉯 nh� v藋, n誹 kh玭g t筰 h� th蕐 r蕋 蕐 n竬")
   elseif (Uworld128 == 10) then
   	Talk(1,"","Л阯g t� y t韎 Dng Ch﹗ r蕋 nguy hi觤, tr猲 阯g 甶 nh� c萵 th薾!")
   elseif (Uworld128 == 30) then
   	Talk(2,"","Gi韎 i ca c騨g c萵 th薾 k蝟 b� 竚 h筰","дn th藅 ng l骳! H穣 c飊g nhau gi誸 s筩h l� gi芻 n祔!")
   elseif (Uworld128 == 20) and (HaveItem(390) == 0) then
   	AddEventItem(390)
   	Msg2Player("L筰 nh薾 頲 b鴆 th� c馻 Gi韎 V� T� ")
   	Talk(1,"","S� vi謈 r蕋 tr鋘g i, nh� ngi c蕄 t鑓 mang b鴆 th� n祔 n b鎛 bang giao cho La trng l穙")
   else
   	Talk(1,"","U鑞g ru ca h竧!Nh﹏ sinh tri k� h鱱 k� nh﹏?")
   end
end

function Uworld128_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","H玬 nay ta v� c竎 h� ph秈 u鑞g ru m o t韎 t鑙! S竛g mai xin k輕 l猲 阯g!")
	else
		Say("Цng ti誧 l� h玬 nay t筰 h� kh玭g bi誸 s� g苝 頲 tri ﹎ n猲 ch璦 k辮 chu萵 b� ru ngon",2,"T筰 h� bi誸 � Dng Ch﹗ c� m閠 t鰑 l莡 b竛 ru Tu� Tuy襫 r蕋 ngon,  t筰 h� l藀 t鴆 甶 mua. /Uworld128_wait","Huynh  ta b蘯 nc g苝 nhau, t筰 h� kh玭g bi誸 con 阯g ph輆 trc r錳 s� v� u /Uworld128_no")
	end
end

function Uworld128_wait()
	SetTask(128,10)
--	Uworld135 = GetGameTime()
   Msg2Player("B筺 v� Gi韎 V� T� c� giao c n Dng Ch﹗ thng th鴆 ru ngon ")
   AddNote("B筺 v� Gi韎 V� T� c� giao c n Dng Ch﹗ thng th鴆 ru ngon ")
end

function Uworld128_no()
end

function Uworld128_envelop()
	DelItem(76)
	AddEventItem(390)
	Msg2Player("Nh薾 頲 b鴆 th� c馻 Gi韎 V� T� n C竔 bang t譵 La trng l穙 ")
	AddNote("Nh薾 頲 b鴆 th� c馻 Gi韎 V� T� n C竔 bang t譵 La trng l穙 ")
	SetTask(128,20)
end

function Uworld128_kill()
	SetTask(128,50)
	Msg2Player("C鴘 tho竧 Gi韎 V� T�, tr� v� h錳 b竜 La trng l穙 ")
	AddNote("C鴘 tho竧 Gi韎 V� T�, tr� v� h錳 b竜 La trng l穙 ")
end
