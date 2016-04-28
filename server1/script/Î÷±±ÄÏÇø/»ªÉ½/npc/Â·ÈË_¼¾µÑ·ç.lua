-- \script\西北南区\华山\npc\路人_uworld122_季笛风.lua
-- by xiaoyang(2004\4\15) 少林90级任务

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld122 = GetTask(122)
	Uworld38 = GetByte(GetTask(38),2)
	if(Uworld122 < 10) and (GetLevel() >= 90) and (Uworld38 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="shaolin" ) then
		Talk(8,"U122_get","L� huynh! Lu薾 v� v╪ th�  kh玭g b籲g huynh, nh璶g t藀 v� kh玭g nh� c s竎h, c遪 c莕 ph秈 c� c玭g phu","Thng huynh! S竎h � T祅g kinh c竎 c� ng祅 v筺, n誹 nh� ai c騨g nh� huynh kh玭g ch辵 c s竎h th� Ph藅 ph竝 Thi誹 L﹎  s韒 kh玭g t錸 t筰 tr猲 th� gian.","Ph藅 o l� ph秈 t� nhi猲, tu h祅h kh玭g nh蕋 thi誸 ph秈 theo s竎h v�. Hu鑞g chi Thng m� tuy ch璦 t鮪g c s竎h nh璶g u ph秈 kh玭g bi誸 ch�. V� c玭g c馻 huynh kh玭g nh� ta, l筰 mu鑞 h鋍 v� c玭g thng th鮝","Nh� th� l� kh玭g h頿 l�. Ch颽 c馻 ta tru韈 khi h鋍 v� ph秈 nghi猲 c鴘 Ph藅 甶觧 v� gi秈 b� t閕 l鏸 甶, n誹 kh玭g s� ch誸 s韒, ta ch� mu鑞 t鑤 cho huynh th玦.","N鉯 nh� v藋, nh ph秈 so t礽 m閠 tr薾. Thi誹 L﹎ nghi猰 c蕀 ng m玭 tng t祅, ch髇g ta l猲 l玦 i Hoa S琻 c玭g b籲g so t礽, sinh t� do tr阨 nh.","u th� u! е khuy猲 huynh ch� kh玭g ph秈 l�  s� huynh!","Ha! Ha! Hai v�! T筰 h� ng b猲 ngo礽 nghe h誸 c�. Thi誹 L﹎ l� v� l﹎ b綾 u. Hai v� kh玭g n猲 s竧 thng t輓h m謓h nhau","V� n祔...t筰 h� c騨g l� b蕋 c d� th玦!")
	elseif(Uworld122 > 10) and (Uworld122 < 50) then
		Talk(2,"","L� huynh kh玭g nhng cho th� t筰 h� c騨g kh玭g kh竎h kh� u.","T筰 h� c� 璾 th� r� r祅g, Thng huynh ch� l祄 kh�!")
	elseif (Uworld122 == 60) then
		Talk(4,"Uworld122_ashamed","Thng huynh! L� huynh! Hai v� ng th� n鱝!","C秏 t� ﹏ c鴘 m筺g c馻 c竎 h�!","уng m玭 tng tranh, h藆 qu� kh� lng,h鑙 h薾 c騨g kh玭g k辮!","Thi誹 L﹎ l� rng c閠 c馻 v� l﹎, t筰 h� c� th� gi髉  頲 hai v�, th藅 vinh h筺h! M鋓 vi謈  x� l� xong! Ta ph秈 quay v� Thi誹 L﹎ ph鬰 m謓h.")
   elseif (Uworld122 == 50) and (HaveItem(392) == 1) then
   	Talk(4,"U122_step","Thi誹 L﹎ T╪g Ch髇g l謓h � y! е t� Thi誹 L﹎ l藀 t鴆 nghe l謓h!","Ch輓h th鵦 l� Thi誹 L﹎ T╪g Ch髇g l謓h! Ta xin tu﹏ theo hi謚 l謓h!","C竎 h� c� sai khi課!","Hi謓 t筰 qu﹏ Kim 產ng 萵 n蕄 trong n骾 Hoa S琻,  bao v﹜ ch髇g ta. Ch髇g ta th鮝 l骳 ch髇g 產ng b� tr�, chia ra nh gi秈 v﹜, sau  t藀 h頿 l筰.")
   elseif (Uworld122 == 50) then			-- 状态正确，但没有令牌
   	Talk(1,"","Ngi l� ai? D鵤 v祇 c竔 g� m� can thi謕 v祇 chuy謓 c馻 ch髇g ta?")
   elseif (Uworld122 == 55) then			-- 任务中的缺省对话
   	Talk(2,"","Nhi謒 v� c馻 ta  ho祅 th祅h, b猲 huynh th� n祇?","Ta th藅 kh玭g y猲 t﹎, c竎 huynh quay l筰 xem th�, i ta m閠 l竧!.")
   elseif (Uworld122 == 65) and (HaveItem(392) == 0) then		-- 重新取回令牌
   	Talk(1,""," t� ﹏ c鴘 m筺g c馻 c竎 h�, y l� l謓h b礽 xin g鰅 l筰!")
   	AddEventItem(389)
   	Msg2Player("L蕐 l謓h b礽 Thi誹 L﹎ v� ")
   elseif (Uworld122 >= 240) then		-- 任务已完成
   	Talk(1,"","L莕 trc nh蕋 th阨 h� , n誹 kh玭g c� c竎 h� tng tr� th� qu� th藅 h藆 qu� kh� lng!")
   else
   	Talk(1,"","Thng huynh! L莕 n祔 ta t� v� c� nh﹏, n誹 s� ph� bi誸 nh蕋 nh s� tr竎h m緉g ng kh玭g?")
   end
end

function U122_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- 白名未学野球拳的，不允许接任务
		Talk(1,"","Xem huynh c� v� kh玭g kho�, hay l� ng c竎h xa tr薾 chi課  tr竛h b� s竧 thng.")
	else
		Say("N鉯 nh� v藋, n誹 huynh ch辵 nhng danh hi謚, t筰 h� quy誸 kh玭g l祄 kh� kh╪!",2,"Xem ra th� khuy猲 hai ngi kh玭g xong, ta nh l猲 Thi誹 L﹎ m閠 chuy課, h醝 r� c╪ nguy猲. /Uworld122_yes","C竎 huynh nh th� c� nh, kh玭g li猲 can n ta, khuy猲 r錳 m� c竎 huynh kh玭g nghe, b� thi謙 th遡 l� c竎 huynh. /Uworld122_no")
	end
end

function Uworld122_yes()
	Msg2Player("е t� Thi誹 L﹎ Thng B竎h L� v� L� мch Phong v� tranh h鋍 v� c玭g thng th鮝 m� quy誸 u s鑞g ch誸. B筺 nh l猲 Thi誹 L﹎ t譵 s� ph� c馻 h�  khuy猲 ng╪. ")
	AddNote("е t� Thi誹 L﹎ Thng B竎h L� v� L� мch Phong v� tranh h鋍 v� c玭g thng th鮝 m� quy誸 u s鑞g ch誸. B筺 nh l猲 Thi誹 L﹎ t譵 s� ph� c馻 h�  khuy猲 ng╪. ")
	SetTask(122,10) --少林任务启动
end

function Uworld122_no()
end

function U122_step()
	DelItem(392)
	SetTask(122,55)			-- 插入变量中
	Msg2Player("е t� Thi誹 L﹎ Thng B竎h L� v� L� мch Phong v� tranh h鋍 v� c玭g thng th鮝 m� quy誸 u s鑞g ch誸. B筺 nh l猲 Thi誹 L﹎ t譵 s� ph� c馻 h�  khuy猲 ng╪. ")
end

function Uworld122_ashamed()
	SetTask(122,65)  --设置任务变量为60
  	AddEventItem(392)		-- 此处再取回令牌
	Msg2Player("C鴘 Thng B竎h L� v� L� мch Phong, mang l謓h b礽 Thi誹 L﹎ v� Thi誹 L﹎ b竜 tin. ")
	AddNote("C鴘 Thng B竎h L� v� L� мch Phong, mang l謓h b礽 Thi誹 L﹎ v� Thi誹 L﹎ b竜 tin. ")
end
