--Kh雐 g派帮助NPC
-- By: Dan_Deng(2003-11-25)

Include("\\script\\global\\map_helper.lua")
npc_name = "Kh雐 g"

function main(sel)
	UTask_gb = GetTask(8)
	player_faction = GetFaction()
	if (player_faction == "gaibang") then		-- 本门弟子
		RestoreLife()		-- 本门免费治疗
		RestoreMana()
		RestoreStamina()
		Say("Ta theo 我入Kh雐 g已经50年了，算起来也是何帮主的师叔了。有什么不懂的就问我.",6,"T譵 hi觰 vi謈 c馻 b鎛 bang/faction","T譵 hi觰 c竎 v� trong b鎛 bang/member","T譵 hi觰 nhi謒 v� /task_get","T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 70*256) then				-- 本门出师
		Say("Ngi xu蕋 s�  m蕐 n╩, ch糿g l� v蒼 c遪 nh� 頲 nh鱪g s� gian kh� l骳  �? Kh�! Kh�! Kh�!",6," l筰 b鎛 m玭 c� s� /faction","Th╩ l筰 huynh  ng m玭/member","Ta c遪 c� th� gi髉 g� kh玭g/task_get","T譵 hi觰 s� trng luy謓 c玭g/map_help","T譵 hi觰 v� ngh� b鎛 m玭/skill_help","Kh玭g h醝 n鱝!/nothing")
	elseif (player_faction ~= "") then			-- 非本门出师、其它门派（门派不为空即指非新手）
		Say("欢迎来到Kh雐 g! 不知有什么指教?",3,"T譵 hi觰 qu� bang/faction","T譵 hi觰 c竎 v� anh h飊g/member","Kh玭g h醝 n鱝!/nothing")
	else													-- 新手
		Say("Kh雐 g欢迎各位抗金的有志之士!",4,"T譵 hi觰 qu� bang/faction","T譵 hi觰 c竎 v� anh h飊g/member","T譵 hi觰 甶襲 ki謓 nh藀 m玭/task_get","Kh玭g h醝 n鱝!/nothing")
	end
end

----------------- 门派介绍部份 ----------------------------
function faction()
	Say("V藋 th� ngi mu鑞 nghe ta gi韎 thi謚 v� b� ph薾 n祇 c馻 b鎛 bang? ",5,"Kh雐 g的起源/F1","V� tr� a l� /F2","мa v� giang h� /F3","c s綾 m玭 ph竔/F4","Kh玭g h醝 n鱝!/nothing")
end

function F1()
	Say("L辌h s� c馻 b鎛 bang  c� t� l﹗. T� l骳 s� T鑞g  c� danh x璶g 'Thi猲 h�  nh蕋 bang' r錳. Danh ch蕁 giang h�, anh t礽 c馻 b鎛 bang nh� 'Ng鋋 h� t祅g long', th阨 n祇 c騨g c�!",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F2()
	Say("东南西北，哪里有乞丐，哪里就有Kh雐 g!",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F3()
	Say("Kh雐 g称为天下第一帮，遇到不少困难. ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function F4()
	Say("Kh雐 g的特点是，讨饭生活，是最宝贵的家财，加入Kh雐 g，需要放弃所有家产，乞讨生活。因为本帮分布广泛，所以，耳目众多，信息及时",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

----------------- 成员介绍部份 ----------------------------
function member()
	Say("Mu鑞 nghe ta gi韎 thi謚 v� n祇 trong b鎛 bang?",11,"Bang ch� H� Nh﹏ Ng� /Mhe","Ch蕄 ph竝 trng l穙 M筺h Thng Lng/Mmeng","Chng b鎛g trng l穙 La Khu玭g Sinh/Mluo","Truy襫 c玭g trng l穙 Ng魕 Li評 g/Mwei","Chng B竧 trng l穙 X� Tam Trng/Mshe","Tri謚  ch� /Mzhao","M筺h Vi詎 T礽/Myuan","Trng T竛/Mzhang","L� T� /Mli","Vng Ng� /Mwang","Kh玭g h醝 n鱝!/nothing")
end

function Mhe()
	Say("帮主何人我  位置：Kh雐 g广场   坐标: 191,231<enter>狂放豪爽，粗中有细，极重义气。爱喝酒，手中永远一手拿棍，一手拿着酒壶，虽然常常喝得酩酊大醉，但是处理帮中大事决不会糊涂",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mmeng()
	Say("执法长老孟苍浪   位置：Kh雐 g广场   坐标: 194,236<enter>为人公正严明，执法如山，有时理性得几乎不近人情。与其早逝的兄长感情深厚，对其遗子孟远才一直十分疼爱",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mluo()
	Say("掌棒长老罗匡生   位置：Kh雐 g广场   坐标: 190,226<enter>为人忠厚。沉默寡言，一旦发言，则一针见血，常能见到他人所不能见。.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mwei()
	Say("传功长老魏了翁   位置：Kh雐 g广场   坐标: 191,241<enter> 性情火爆耿直，疾恶如仇.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mshe()
	Say("掌砵长老佘三丈   位置：Kh雐 g广场   坐标: 189,236<enter> 十分随和可亲的一个老头，经常会和人开玩笑，是帮中弟子最喜爱的一个长老。",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mzhao()
	Say("Tri謚 У ch�   V� tr�: Dng Ch﹗ T� V鋘g nh B綾   T鋋 : 213,177<enter> Dng Ch﹗ l�  ch� ph﹏  th� 3 � Dng Ch﹗, t輓h t譶h c萵 th薾! Nghi猰 minh ch輓h tr鵦.",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Myuan()
	Say("孟远才   位置：Kh雐 g区域外 <enter> 是无袋弟子，是执法长老孟苍浪的侄子。喜好名声，被各位长老教训过。但是他很聪明，说话很有趣",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mzhang()
	Say("Trng T秐   V� tr�: Qu秐g trng   T鋋 : 48,84   Ph� tr竎h: Giao d辌h binh kh� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mli()
	Say("L� T�   V� tr�: Qu秐g trng   T鋋 : 51,85   Ph� tr竎h: Giao d辌h trang b� ",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function Mwang()
	Say("Vng Ng�   V� tr�: Qu秐g trng   T鋋 : 53,86   Ph� tr竎h: Giao d辌h Dc ph萴",2,"T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

----------------- 任务介绍部份 ----------------------------
function task_get()
	UTask_gb = GetTask(8)
	if (UTask_gb < 10*256) then	-- 未入门
		Say("ngi hi謓 t筰 ch璦 nh藀 m玭, n誹 mu鑞 nh藀 m玭, ch� c莕 t譵 頲  t� ti誴 d蒼 b鎛 m玭 � b蕋 k� th玭 m韎 n祇 l� 頲,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_enroll","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 10*256) and (UTask_gb < 20*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� mua ru,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L10","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 20*256) and (UTask_gb < 30*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� gi竜 hu蕁 M筺h Vi詎 T礽,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L20","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 30*256) and (UTask_gb < 40*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� N竜 Qu� Phong Ba,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L30","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 40*256) and (UTask_gb < 50*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� b秓 v� Trng Tu蕁,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L40","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 50*256) and (UTask_gb < 60*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� Trung Nguy猲 мa H譶h у,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L50","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 60*256) and (UTask_gb < 70*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� Xu蕋 s�,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_L60","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	elseif (UTask_gb >= 70*256) and (UTask_gb < 80*256) then
		Say("Nhi謒 v� hi謓 gi� c馻 ngi l� nhi謒 v� Tr飊g ph秐 s� m玭,  頲 ghi nh� "..UTask_gb..".",4,"Ti誴 t鬰 t譵 hi觰 nhi謒 v� hi謓 t筰/T_return","T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	else
		Say("B﹜ gi� ngi c� th� t� do h祅h t萿 giang h�, t筸 th阨 ch璦 c� nhi謒 v� m韎,  頲 ghi nh� "..UTask_gb..".",3,"T譵 hi觰 nh鱪g nhi謒 v� kh竎/T_all","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
	end
end

function T_all()
	Say("Mu鑞 t譵 hi觰 nhi謒 v� g�?",10,"Nhi謒 v� nh藀 m玭/T_enroll","Nhi謒 v� mua ru/T_L10","Nhi謒 v� gi竜 hu蕁 M筺h Vi詎 T礽/T_L20","Nhi謒 v� n竜 qu� phong ba/T_L30","Nhi謒 v� b秓 h� Trng Tu蕁/T_L40","Nhi謒 v� Trung nguy猲 a /T_L50","Nhi謒 v� xu蕋 s� /T_L60","Nhi謒 v� tr飊g ph秐 s� m玭/T_return","T譵 hi觰 nh鱪g v蕁  kh竎/main","Kh玭g h醝 n鱝!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Mu鑞 nh藀 m玭 h鋍 ngh�, ch� thu閏 h� H醓, ch璦 gia nh藀 ph竔 kh竎 ng th阨 ng c蕄 tr猲 10, n b蕋 k� T﹏ Th� Th玭 n祇 i tho筰 v韎 е t� b鎛 ph竔.Trc ti猲 ph秈 ho祅 th祅h nhi謒 v� nh藀 m玭. Sau  l莕 lt ho祅 th祅h 5 Nhi謒 v� c馻 m玭 ph竔. S� h鋍 頲 v� c玭g,頲 phong Danh hi謚.Sau khi ho祅 th祅h Nhi謒 v� xu蕋 s� s� th祅h ngh� xu蕋 s�!")
end

function T_L10()
	Talk(5,"t_all","入门级10级以上后，你可以接任务去交易酒，通过完成任务，你将升为执袋弟子，学到武功<color=blue> Kh雐 g棒法, Kh雐 g拳法<color>. ","Bc th� nh蕋: дn ch� c馻<color=blue> Bang ch� H� Nh﹏ Ng�<color> Ti誴 nh薾 nhi謒 v�.  mua 5 lo筰 ru n鎖 ti課g: Trung Tuy襫 < color=red>, Kim L╪g Xu﹏, B竎h hoa nng, Kinh Hoa L�, Song C﹗ Чi Kh骳. <color>. ","Bc th� hai: G苝<color=blue> Dng Ch﹗ t鰑 l莡 <color> mua 頲 4 lo筰 ru, <color> nh璶g <color=red>c遪 Trung Tuy襫 t鰑<color> th�  b� T髖 B竛 Ti猲< color>n mua trc r錳 ","Bc th� ba: T譵<color=blue> 頲 T髖 B竛 Ti猲 <color>b猲 c筺h t鰑 l莡 <color=blue>. Цp 鴑g 頲 nh鱪g y猽 c莡 c馻 h緉, <color=blue>nh薾 頲 Trung Tuy襫 T鰑 ","第四步： 返回 <color=blue> Kh雐 g <color>, 见<color=blue>何人我 color>交五种酒<color=red>给他 <color>完成任务")
end

function T_L20()
	Talk(4,"t_all","Sau khi ho祅 th祅h nhi謒 v� Giao d辌h ru v� ng c蕄 c馻 ngi  t╪g l猲 c蕄 20. ngi  c� th� ti誴 Ti誴 nh薾 nhi謒 v� gi竜 hu蕁 M筺h Vi詎 T礽.  n ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� Ch蕄 B竧  t� 頲 h鋍 v� c玭g<color=blue>H鉧 Ki誱 Vi Di<color>. ","第一步: 到 <color=blue> 守林村<color>找一位<color=blue>Kh雐 g弟子<color>, 接任务教训<color=blue>孟远才<color>. ","Bc 2: T譵 頲 M筺h Vi詎 T礽, nh b筰 h緉.","第三步: 返回color=blue>Kh雐 g<color>, 见<color=blue>孟苍浪<color>复命, 完成任务 ")
end

function T_L30()
	Talk(6,"t_all","Sau khi ho祅 th祅h nhi謒 v� gi竜 hu蕁 M筺h Vi詎 T礽 v� ng c蕄 c馻 ngi  t╪g l猲 30, ngi  c� th� ti誴 Ti誴 nh薾 nhi謒 v� N竜 Qu� Phong Ba.  n ho祅 th祅h nhi謒 v� n祔, ngi 頲 th╪g l� Ch蕄 B鎛g  t�. H鋍 頲 v� c玭g<color=blue>Gi竛g Long Chng; Ф C萿 Tr薾<color>. ","Bc th� nh蕋: дn g苝<color=blue>La Khu玭g Sinh<color>, ti誴 nh薾 nhi謒 v�, thay g ta n<color=blue> Dng Ch﹗ g苝 Tri謚 У ch� <color> l蕐 quy觧 s竎h m� <color=red> g ta 產ng vi誸 d�<color>. ","Bc th� hai: дn<color=blue>Dng Ch﹗ T� V鋘g ёnh<color>g苝 頲<color=blue>Tri謚 У ch�<color>, th� ra m蕐 ng祔 nay  t� c馻 Tri謚 ch� �<color=blue>Th鬰 cng s琻 <color> g﹜ n猲 nh鱪g chuy謓 n竜 lo筺, g﹜ ra l阨 m ti誹 ","第三步: 去<color=blue> 蜀岗山<color>, 打败金人的 <color=blue> 伏兵<color>, 救了Kh雐 g弟子<color=blue> <color>. ","Bc th� t�: Tr� v�<color=blue>g苝<color>Tri謚  ch�. g 蕐  vi誸 xong, <color=red>quy觧 s竎h <color>, nh� ngi 甧m v� giao cho <color=blue>La Khu玭g Sinh<color>. ","第五步: 返回color=blue>Kh雐 g<color>, 交<color=red>书<color> 给<color=blue>罗匡生<color>, 完成任务")
end

function T_L40()
	Talk(6,"t_all","Sau khi ho祅 th祅h nhi謒 v� N竜 Qu� phong ba v� ng c蕄 c馻 ngi t╪g l猲 c蕄 40, th� ngi  c� th� ti誴 nh薾 nhi謒 v� b秓 h� Trng Tu蕁. Th玭g qua vi謈 ho祅 th祅h nhi謒 v� n祔, ngi s� 頲 th╪g l� Long u  t� 頲 h鋍 v� c玭g<color=blue>ho箃 B蕋 L璾 Th�<color>. ","Bc th� nh蕋:  t譵 Truy襫 c玭g trng l穙 <color=blue>Ng魕 T� c玭g<color>, Ti誴 nh薾 nhi謒 v�: Ti猽 di謙<color=blue>b鋘 s竧 th�<color>ngi Kim 產ng <color=blue>mai ph鬰 � La Ti猽 s琻 <color>, b秓 v� <color=blue>Trng Tu蕁<color>an to祅 ","Bc th� hai: дn <color=blue> Long Quan ng � La Ti猽 s琻 <color> t譵 th蕐 v� ti猽 di謙 b鋘 s竧 th� Kim qu鑓<color=blue>產ng mai ph鬰 � <color>, ngi nh蕋 nh ph秈 l蕐 頲 m閠 b鴆 <color=red>m藅 h祄<color>. ","第三步: 返回Kh雐 g<color=blue>见<color>魏子翁, 交<color=red> 密函<color> 给<color=blue>魏子翁<color>, 原来密函中记录了朝廷中与金人勾结的官员名字，要求把<color=red> 密函<color>交给 <color=blue>张俊<color>. ","Bc th� t�: дn <color=blue> m閠 l� qu竛 b� m藅 � Dng Ch﹗<color>t譵 Trng Tu蕁<color=blue> <color>, giao b鴆 m藅 h祄 cho g 蕐. ","第五步 : 返回<color=blue> Kh雐 g<color>, 见<color=blue> 魏了翁<color> 报信, 完成任务")
end

function T_L50()
	Talk(10,"t_all","Sau khi ho祅 th祅h nhi謒 v� b秓 h� Trng Tu蕁 v� ng c蕄 c馻 ngi  t╪g l猲 c蕄 50, th� ngi c� th� ti誴 nh薾 nhi謒 v� B秐  Trung Nguy猲.  n ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l� Чi Long u. H鋍 頲 v� c玭g<color=blue> B鎛g Ф 竎 C萿; Kh竛g Long H鱱 b鑙 <color>. ","Bc th� nh蕋: дn g苝 bang ch�<color=blue>H� Nh﹏ Ng�<color> ti誴 nh薾 nhi謒 v�. giao<color=red>b鴆 b秐  Trung Nguy猲<color>mang n<color=blue>L﹎ An<color> giao cho tri襲 nh ","Bc th� hai: Trc<color=blue>c鯽 Ho祅g Cung<color>, b� v� binh ng╪ c秐, kh玭g c� l謓h b礽 th玭g h祅h th� kh玭g th� v祇 頲 Ho祅g cung ","Bc th� ba: T譵 頲 <color=blue> Trng Tu蕁 <color>, y猽 c莡 cho mn t蕀 l謓h b礽 th玭g h祅h <color=red> v祇 Ho祅g Cung<color>. ","Bc th� t�: Tr� l筰<color=blue>trc c鯽 Ho祅g Cung<color>, sau khi i tho筰 v韎 v� binh, 甶 v祇 Ho祅g Cung, g苝 l穙 th竔 gi竚<color=blue>T祇 c玭g c玭g<color>, giao <color=red>b鴆 b秐  Trung Nguy猲 <color> cho h緉 ","Bc th� n╩: Quay l筰 <color=blue> ch� <color> Trng Tu蕁, ph竧 hi謓 ra l穙 T祇 c玭g c玭g  s韒  c﹗ k誸 v韎 Kim qu鑓. B鴆 b秐    b� g箃 l蕐 m蕋 r錳 ","Bc th� s竨: L莕 th� ba quay l筰 <color=blue> c鎛g Ho祅g cung <color>, l莕 n祔 T祇 c玭g c玭g s韒  畂竛 trc, c� 頲 l謓h b礽 th玭g h祅h v蒼 kh玭g th� v祇 頲 Ho祅g Cung. ","Bc th� b秠: ngi ph秈 h鑙 l� <color=blue> t猲 ti觰 th竔 gi竚 � c鎛g b猲 <color>, 甶 v祇 Ho祅g cung l莕 n鱝 t筰 <color=blue> m閠 m藅 o � Ng� Hoa vi猲 <color> t譵 g苝 頲 <color=blue>T祇 c玭g c玭g<color>. Sau khi nh b筰 b鋘 v� s�, 畂箃 l筰< color=red>B秐  Trung Nguy猲<color>. ","Bc th� t竚: ngi quay l筰 <color=blue> g苝 <color>Trng Tu蕁, a<color=red>b鴆 B秐  Trung Nguy猲 <color>cho g ta. ","第九步: 返回color=blue>Kh雐 g<color>, 见<color=blue>何人我color>报信, 完成任务 ")
end

function T_L60()
	Talk(4,"t_all","Ho祅 th祅h nhi謒 v� Trung Nguy猲 a  v� ng c蕄 tr猲 50, ngi c� th� ti誴 nh薾 nhi謒 v� xu蕋 s�. Th玭g qua ho祅 th祅h nhi謒 v� n祔, ngi 頲 phong l祄 Ti猽 Dao Th莕 C竔, thu薾 l頸 xu蕋 s�.","Bc th� nh蕋: дn g苝 Chng B竧 trng l穙 <color=blue>X� tam Trng<color> ti誴 nh薾 nhi謒 v�, <color=blue>Tng V﹏ ng<color> t譵<color=red>9 c竔 t骾 v秈<color>. ","Bc th� hai: V祇<color=blue>Tng V﹏ ng<color>t譵 trong m閠 c竔 B秓 rng<color=blue>t譵 頲<color>, 9 c竔<color=red>t骾 v秈<color>. ","第三步: 返回<color=blue>Kh雐 g <color>, 交 <color=red> 9 个布袋<color>给掌钵长老<color=blue>佘三章, <color>, 完成任务")
end

function T_return()
	Talk(3,"t_all","Th玭g qua Tr飊g ph秐 s� m玭, ngi 頲 th╪g l� trng l穙 9 t骾. H鋍 頲 Tuy謙 H鋍 ch輓h ph竔<color=blue>: Ti猽 di猽 c玭g v� T髖 甶謕 cu錸g v�<color>. ","第一步: 在你等级超过60级后，去见帮主<color=blue>何人我<color>, 申请返回Kh雐 g ","第二步: 通过捐<color=red>50000 两<color>, 返回Kh雐 g ")
end

----------------- 结束 ---------------------------
function nothing()
end
