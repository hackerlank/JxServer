-- 用铜钱出售易容物品的NPC
-- Fanghao Wu
-- 2004.11.1

function main()

	Say("Thu藅 d辌h dung s�  v� kh竎h quan kia , ngh� mu鑞 c竔 g� th� t鑤 tr鵦 ti誴 甶 <color=yellow> k� tr﹏ c竎 <color> trong ch鋘 l� 頲 , l穙 phu r鑤 c鬰 c� th� thanh nh祅 thanh nh祅 y  c竔 g� ? kh玭g hi觰 th� n祇 甶 <color=yellow> k� tr﹏ c竎 <color> ? tr鵦 ti誴 甶觤 k輈h <color=green> di g鉩 ph秈 ch c竔  h譶h tr遪 ch  ti猽 <color> l� 頲 . ", 0);
	return
	
	-- Say ( "Thu藅 d辌h dung s�  mu鑞 h鋍 thu藅 d辌h dung ? th藅 ra th� r蕋 n gi秐 , � ta y mua m閠 c ch� d辌h dung m苩 n� ta li襫 c� th� d箉 ngi . b蕋 ng m苩 n� c� th� d辌h dung 頲 kh玭g c飊g ch d竛g v� , i hi謕 c� mu鑞 hay kh玭g nh譶 m閠 ch髏 ? ", 3, "Mua /OnBuy", "T筸 th阨 kh玭g mua /OnCancel", " li猲 quan t韎 d辌h dung m苩 n� /OnAbout" );
end

function OnBuy()
	Sale( 95, 3 );
end

function OnCancel()
end

function OnAbout()
	Say( "m t飝 � m苩 n� trang b� n trang b� lan trung <color=yellow> m苩 n� <color> m閠 c竎h , nh� ch琲 nh﹏ v藅 d竛g ngo礽 s鯽 i v� n猲 m苩 n� i 鴑g NPC h譶h tng , nh﹏ v藅 t猲 c飊g t蕋 c� thu閏 t輓h u <color=yellow> kh玭g thay i <color> , c騨g <color=yellow> kh玭g 秐h hng <color> nh﹏ v藅 b譶h thng s� d鬾g c竎 lo筰 trang b� o c� c飊g ch鴆 n╪g . 甧m m苩 n� t� trang b� lan g� xu鑞g , nh﹏ v藅 d竛g ngo礽 thay i tr� v� b� d竛g l骳 trc , m苩 n� ch s� d鬾g s� l莕 <color=yellow> gi秏 b韙 m閠 l莕 <color> . ", 0 );
end