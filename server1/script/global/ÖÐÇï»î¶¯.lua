-- Const List
aryAwardTime = { 1900, 2400, 928 }    	--领奖时间段 ( { 起始时间， 结束时间 } 时间格式为HHMM )
aryAwardItem = {{ " hoa qu� ru ",   {6,1,125,1,0,0,0} },	--奖品数组
  { " t竚 tr﹏ ph骳 th竛g 畂祅 vi猲 b輓h ", {6,1,126,1,0,0,0} }}
 
MingZi=50     	--单字合成几率
QiuZi=30
GeZi=30
YingZi=80
JuZi=10
WangZi=80
YuanZi=10

-- Talking String
STR_Do_Nothing  = " ta ch糿g qua l� t韎 甶 d筼 m閠 ch髏 /do_nothing"
STR_Next_Page  = " trang k� ti誴 "
STR_OK 	 	 = " ta bi誸 , c竚 琻 . "
STR_Main 	 = { " l� quan  ta l� ph� tr竎h g雐 l� v藅 ch l� quan , m閠 n╩ trung ch tr鋘g i ng祔 l� ta c騨g s� c� l� v藅 g雐 . ngo礽 ra ta c遪 ph� tr竎h ph竔 ph竧 t苙g v藅 ph萴 . ng礽 b﹜ gi� m蕌 ch鑤 l蕐 l� v藅 sao ? ",
    " h醝 th╩ trung thu ti誸 ch lai l辌h ",
     " h醝 th╩ m閠 ch髏 trung thu ho箃 ng n閕 dung ",
     " trung thu ho箃 ng m閠  tham gia 畂竛 ch� m� ho箃 ng ",
     " trung thu ho箃 ng hai  tham gia h頿 th祅h m閠 ch� c nh蕋 ", --5
     " trung thu ho箃 ng ba  tham gia t藀 th� t� d蒼 ph莕 thng ",
     " trung thu ho箃 ng b鑞  nh薾 l蕐 ng祔 l� t苙g ph萴 ",
     " ta ch糿g qua l� t韎 甶 d筼 m閠 ch髏 ",
     " nh薾 l蕐 t苙g v藅 ph萴 ",
     " mua chu ni猲 kh竛h i l� t骾 ph秈 may m緉 chi誧 nh蒼 c飊g mi to祅 i b� ho祅 " } --10
STR_About_MA  = { " truy襫 thuy誸 , H藆 Ngh� ch th� t� thng nga , b雐 v� kh玭g ch辵 頲 nh﹏ gian t辌h m辌h , � th竛g t竚 mi l╩ ng祔 n祔 , ╪ tr閙 Vng m蓇 nng nng ch linh dc m� phi th╪g th祅h ti猲 . t� nay c飊g ng鋍 th� l祄 b筺 , h祅g m ch� i th竛g cung . H藆 Ngh� h祅g m i v韎 v� 輈h t� th竛g , l蕐 t� ni謒 th� t� k� ph竛 畂祅 vi猲 , sau  li襫 t� t� c� th竛g t竚 mi l╩ ng緈 tr╪g t� th竛g ch phong t鬰 . ",
    " c騨g c� n鉯 , n玭g l辌h th竛g t竚 mi l╩ ng祔 n祔 v鮝 v苙 l� o t� th祅h th鬰 th阨 kh綾 , c竎 nh� c騨g l箉 th� a th莕 , trung thu l� thu b竜 ch di t鬰 . m鏸 n ng祔 n祔 , gia gia h� h� c騨g s� 畂祅 t� chung m閠 ch� , thng tr╪g s竛g  ╪ b竛h Trung thu  畂竛 ch� m� . tr╪g s竛g cao treo , hoa qu� phi猽 hng , trong  c騨g k� th竎 r蕋 nhi襲 kh竎h c� tha hng ch du t� th﹎ thi誸 ch t� ni謒 t譶h . ",
    " m鏸 n ng祔 n祔 , gia gia h� h� c騨g s� 畂祅 t� chung m閠 ch� , thng tr╪g s竛g , ╪ b竛h Trung thu , 畂竛 ch� m� . tr╪g s竛g cao treo , hoa qu� phi猽 hng , trong  c騨g k� th竎 r蕋 nhi襲 kh竎h c� tha hng ch du t� th﹎ thi誸 ch t� ni謒 t譶h . ",
    " ta  bi誸 " }
STR_About_Rules  = { " � n琲 n祔 vui m鮪g ch trong cu閏 s鑞g ,  v鈔g ki誱  c騨g v� nh� ch琲 c鯽 chu萵 b� r蕋 c� d﹏ t鬰 phong t譶h ch ng祔 l� ho箃 ng 棗�<color=red> 畂竛 ch� m� <color><color=red> t藀 th� t� <color><color=red> ph萴 b竛h Trung thu <color><color=red> thng tr╪g s竛g <color>� . ",
    " 畂竛 ch� m� ", 
    " t藀 th� t� ",
    " ph萴 b竛h Trung thu ", 
    " thng tr╪g s竛g ",   --5
    " ta  hi觰 ",
    "    剑网和玩家一起庆祝中 thu 国庆，与各城市的礼官对话选择猜谜游戏，并每次缴纳<color=red>一千两<color>，就可以开始猜谜游戏 . 要求<color=red>连续答对五道题目<color>就可以随机获得一个<color=red>特殊单字<color>，其作用是与普通单字合成出<color=red>高一级的普通单字<color>，以及在参加 t藀 th� t� 活动中换取奖品 . ",
    "    剑网和玩家一起庆祝中 thu 国庆，在活动期间，大家可以在礼官处用一些单字填诗词以领取不同的奖品，有三种途径来获得单字：<color=red>打怪<color>（<color=red>获得普通单字<color>）、<color=red> 畂竛 ch� m� <color>（<color=red>获得特殊单字<color>）、<color=red>合成单字<color>（<color=red>升级普通单字<color>），领取每种奖品都需要匹配一个普通字与一个特殊字 . ",
    "    剑网和玩家一起庆祝中 thu 国庆，在<color=red>九月二十八日中 thu <color>当天的 <color=red>19:00~24:00<color> 时段里，符合条件的玩家都可以到礼官处免费领取一次节日赠品（<color=red> t竚 tr﹏ ph骳 th竛g 畂祅 vi猲 b輓h <color>和<color=red> hoa qu� ru <color>），邀约朋友 ph萴 b竛h Trung thu  thng tr╪g s竛g  . ",
    " v鈔g ki誱 c飊g nh� ch琲 c飊g nhau ╪ m鮪g trung thu qu鑓 kh竛h , 產ng ho箃 ng trong l骳 , <color=red> Hoa S琻 <color><color=red> n骾 Thanh Th祅h <color><color=red> V� di s琻 <color> ba phong c秐h khu nh� ch琲 c騨g c� th� th蕐 th竛g c秐h , cung m鋓 ngi ng緈 tr╪g n鉯 chuy謓 phi誱  ch魀 h譶h l璾 ni謒 . ",
    " h醝 th╩ nh鱪g kh竎 ho箃 ng n鉯 r� " }	--11
STR_Gift 	 = { " th藅 xin l鏸 , ng礽 c遪 kh玭g c� sung t筽 . xin/m阨 trc sung t筽 . ",
    " th藅 xin l鏸 , xin/m阨 � th竛g ch輓 hai mi t竚 ng祔 trung thu ti誸 bu鎖 t鑙 19:00~24:00 畂筺 th阨 gian n祔 t韎 nh薾 l蕐 t苙g ph萴 . ",
    " th藅 xin l鏸 , ng礽 ch c蕄 b薱 ch璦  n╩ mi c蕄 . ",
    " th藅 xin l鏸 , ng礽  nh薾 l蕐 qu� t苙g thng th鴆 . ",
    " ng礽 thu 頲 m閠 " }
STR_Guess 	 = { " th藅 xin l鏸 ngi tu鎖 tr� , ng﹏ lng c� ph秈 hay kh玭g qu猲 � trong nh� n鱝/r錳 ? ",
    " th藅 xin l鏸 , ng﹏ lng ch璦   c莕 ",
    " lng b筩 . ",
    " hai ng祔 trc nh祅 r鏸 kh玭g chuy謓 g� , vi誸 m蕐 c﹗ n m� , ngi tu鎖 tr� c� mu鑞 t韎 hay kh玭g 畂竛 m閠 c竔 ? ch� c莕 <color=red> m閠 ng祅 lng b筩 <color> , c騨g <color=red> li猲 t鬰 p i v韎 n╩  <color> , ta li襫 cho ng礽 m閠 <color=red> c th� m閠 ch� c nh蕋 <color> . ",
    " ta 產ng mu鑞 th� m閠 ch髏 ",   --5
    " ta mu鑞 tham gia nh鱪g kh竎 ho箃 ng ",
    " o  m鬰 . ",
    " c騨g ch� k衜 nh� v藋 m閠 ch髏 n鱝/r錳 , ng n秐 ch� , n th猰 n鱝 l� 甶 ",
    " ng礽 l蕐 頲 m閠 ch� ",
    " 畂竛 ch� m� ",   	--10
    " qu� nhi猲 b穙 h鋍 th� s竎h , l穙 phu k輓h n� , n琲 n祔 l� h鴄 h裯 ch ph莕 thng  a ng礽 m閠 <color=red> c th� m閠 ch� c nh蕋 <color> . ngi tu鎖 tr� c遪 ph秈 kh玭g n猲  cho l穙 phu thi l筰 thi ng礽 ? ",
    "     c騨g ch� k衜 nh� v藋 m閠 ch髏 n鱝/r錳 , ng n秐 ch� , n th猰 n鱝 l� 甶 还要不要再让老夫考考您？" }
STR_Reward_Note  = { " ta ch� n祔 c� m閠 輙 t祅 ph� th� , n誹 nh� ng礽 tr猲 ngi v鮝 l骳 c� trong l骳 <color=red> thi誹 s鉻 ch m閠 ch� c nh蕋 <color> , ta s� a cho ng礽 m閠 m鉵 l� ph萴 . ",
    " qu� nhi猲 l� anh h飊g xu蕋 thi誹 ni猲 a ",
    " ch骳 m鮪g a  ng礽 l蕐 頲 ",
    " mu鑞 d蒼 ph莕 thng <color=red>",
    "<color> c莕 m� ra �",
    "� c﹗ n祔 th� , ng礽 kh玭g c� c莕 thi誸 ch ch� y ",
    " ta ch糿g qua l� t韎 甶 d筼 m閠 ch髏 ",
    " n鉯 cho m鋓 ngi m閠 tin t鴆 t鑤 , trong truy襫 thuy誸 ch c鑞g th竛g ph� dung  b� nh� ch琲 nh薾 l蕐 , m鋓 ngi ti誴 t鬰 c� g緉g a ",
    " n鉯 cho m鋓 ngi m閠 tin t鴆 t鑤 , trong truy襫 thuy誸 ch ph鬾g th竛g qu� dong  b� nh� ch琲 nh薾 l蕐 , m鋓 ngi ti誴 t鬰 c� g緉g a ",
    " n鉯 cho m鋓 ngi m閠 tin t鴆 t鑤 , trong truy襫 thuy誸 ch nh qu鑓 an bang ho祅g kim trang b�  b� nh� ch琲 nh薾 l蕐 , m鋓 ngi ti誴 t鬰 c� g緉g a ",
    " c遪 ph秈 i l蕐 nh鱪g kh竎 ph莕 thng ",
    " ta mu鑞 tham gia nh鱪g kh竎 ho箃 ng " }
STR_Reward_Poem  = { " minh __ bao l﹗ c� , 甧m __ h醝 thanh thi猲 ",
    " tr猲 bi觧 th╪g __ th竛g , thi猲 nhai c閚g n祔 __ ",
    "__ kh玭g minh th竛g treo , quang __ l� d輓h t ",
    " ta __ th竛g b錳 h錳 , ta __ 秐h th蕋 th莕 ",
    " kh雐 v� bi誸 r� __ , h� t鵤 nh� __ nh﹏ gian ",
    "__ ch衝 y猽 tr╪g s竛g , i v韎 秐h th祅h ba __ ",
    " ng萵g u __ tr╪g s竛g , c骾 u __ c� hng ",
    " nh璶g __ ngi l﹗ d礽 , ng祅 d苖 c閚g thi襫 __ " }
STR_Reward_Reward	 = { "（烟花+2粒PK药丸）",
    " h莡 n╩ c竧 tng t骾 ",
    " ti猲 th秓 l� ",
    "（ t竚 tr﹏ ph骳 th竛g 畂祅 vi猲 b輓h ）",
    "（ hoa qu� ru ）",
    " c鑞g th竛g ph� dung ",
    " ph鬾g th竛g qu� dong ",
    " nh qu鑓 an bang ho祅g kim trang b� m閠 m鉵 trong  " }
STR_Reward_Func  = { "/yes1",
    "/yes2",
    "/yes3",
    "/yes4",
    "/yes5",
    "/yes6",
    "/yes7",
    "/yes8" }
STR_Combin_Note  = { " n誹 nh� c� d� th鮝 c蕄 th蕄 ch� , c� th� b総 頲 ta ch� n祔 t韎 , n誹 nh� cho ta <color=red> m閠 t� m閠 ch� c nh蕋 <color> c飊g c蕄 ch <color=red> m閠 c th� ch� c飊g m閠 b譶h thng ch� <color> c飊g <color=red> m閠 ng祅 lng th� t鬰 ph� <color> , ta s� nhng ng礽 th� m閠 ch髏 t� n琲 n祔 trong rng l蕐 l韕 mi c蕄 ch m閠 ch� c nh蕋 , n誹 nh� th蕋 b筰 甧m kh玭g l飅 c遪 ng礽 b� ra ch ch�  d� nhi猲 , ng qu猲 m鏸 l莕 h頿 th祅h <color=red> m閠 ng祅 lng th� t鬰 ph� <color> . ",
    " h頿 th祅h ch� c莕 <color=red> m閠 ng祅 lng th� t鬰 ph� <color=red> , ti襫 c馻 ng礽 gi鑞g nh� kh玭g  , c遪 l� l莕 sau tr� l筰 甶 . ",
    " xin ch� ch鑓 l竧 . ",
    " ng礽 l蕐 頲 m閠 ch� c nh蕋 ",
    " th蕋 b筰 , <color=red>",
    "<color> ch� c騨g kh玭g ph秈 t鑤 nh� v藋 h頿 th祅h n ch , l莕 sau tr� l筰 th� m閠 ch髏 tay kh� 甶 . ",
    " mu鑞 h頿 th祅h �<color=red>",
    "<color>� ch� c莕 <color=red>",
    "<color> , ng礽 kh玭g c� c莕 thi誸 ch ch� y  c� ph秈 hay kh玭g qu猲 mang theo ? mau 甶 tr� v� t譵 m閠 ch髏 tr� l筰 甶 . ",
    " ta ch糿g qua l� t韎 甶 d筼 m閠 ch髏 /do_nothing", --10
    " c遪 ph秈 h頿 th祅h nh鱪g kh竎 m閠 ch� c nh蕋 ",
    " ta mu鑞 tham gia nh鱪g kh竎 ho箃 ng " }
STR_Combin_Word  = { " minh ",
    " thu ",
    " ca ",
    " 秐h ",
    " gi� ",
    " ng緈 ",
    " nguy謓 " }
STR_Combin_Request	 = { "（月+酒）",
    "（ minh +时）",
    "（ thu +彩）",
    "（ ca +舞）",
    "（ 秐h +在）",
    "（ gi� +人）",
    "（ ng緈 +思）" }
STR_Combin_Func  = { "/Combin1",
    "/Combin2",
    "/Combin3",
    "/Combin4",
    "/Combin5",
    "/Combin6",
    "/Combin7" }   
   
  
-- Start of Proc
--function main()
--	Say(STR_Main[1], 9, 
-- STR_Main[2].."/about_mid_autumn",
-- STR_Main[3].."/about_game_rules",
-- STR_Main[4].."/guess_at_riddle",
-- STR_Main[5].."/Combination",
-- STR_Main[6].."/GetReward",
-- STR_Main[7].."/take_gift",
-- STR_Main[9].."/onGift",
-- STR_Main[10].."/lg_onRingGift",
-- STR_Main[8].."/do_nothing" )
--end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 主菜单 ----------------------------------------------
-- ------------------------------------------------------------------------------------------------
function on_mid_autumn()
	Say( 
 STR_Main[1],
 5,
-- STR_Main[2].."/about_mid_autumn",
 STR_Main[3].."/about_game_rules",
 STR_Main[4].."/guess_at_riddle",
 STR_Main[5].."/Combination",
 STR_Main[6].."/GetReward",
-- STR_Main[7].."/take_gift",
 STR_Main[8].."/do_nothing"
 );
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 关于中 thu  --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function about_mid_autumn()
	Say(STR_About_MA[1], 1,
 STR_Next_Page.."/about_mid_autumn_b" )
end
function about_mid_autumn_b()
	Say(STR_About_MA[2], 1,
 STR_About_MA[4].."/main" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 游戏说 minh  --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function about_game_rules()
	Say(STR_About_Rules[1], 5,
 STR_About_Rules[2].."/rule_a",
 STR_About_Rules[3].."/rule_b",
 STR_About_Rules[4].."/rule_c",
 STR_About_Rules[5].."/rule_d",
 STR_About_Rules[6].."/main" )
end

function rule_a()
	Say(STR_About_Rules[7], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

function rule_b()
	Say(STR_About_Rules[8], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

function rule_c()
	Say(STR_About_Rules[9], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

function rule_d()
	Say(STR_About_Rules[10], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 领取赠品 --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function take_gift()  	--中 thu 送礼( -1:未充卡  -2:当前不是领奖时间  -3：等级不足50  -4:已领过奖 )
	local nCurrTime = tonumber(date("%H%M"))
	local nCurrData = tonumber(date("%m%d"))

	if( IsCharged() ~= 1 ) then   --是否充过卡
 Say(STR_Gift[1], 1,
 	STR_OK.."/main" )
 return -1
	end
	if not ((nCurrTime >= aryAwardTime[1]) and (nCurrTime <= aryAwardTime[2]) and (nCurrData == aryAwardTime[3])) then  	--是否是领奖时间
 Say(STR_Gift[2], 1,
 	STR_OK.."/main" )
 return -2
	end	
	if (GetLevel() < 50) then   --等级是否大于50
 Say(STR_Gift[3], 1,
 	STR_OK.."/main" )
 return -3
	end
	
	if (GetTask(702) == 5) then   --是否已领过奖
 Say(STR_Gift[4], 1,
 	STR_OK.."/main" )
 return -4
	else
        AddItem( aryAwardItem[1][2][1], aryAwardItem[1][2][2], aryAwardItem[1][2][3], aryAwardItem[1][2][4], aryAwardItem[1][2][5], aryAwardItem[1][2][6] , aryAwardItem[1][2][7])
        Msg2Player( STR_Gift[5]..aryAwardItem[1][1] )
        AddItem( aryAwardItem[2][2][1], aryAwardItem[2][2][2], aryAwardItem[2][2][3], aryAwardItem[2][2][4], aryAwardItem[2][2][5], aryAwardItem[2][2][6] , aryAwardItem[2][2][7])
        Msg2Player( STR_Gift[5]..aryAwardItem[2][1] )
 SetTask(702, 5)
	end	
	
end

function IsCharged()  	--判断玩家是否充过卡
	if( GetExtPoint( 0 ) >= 1 ) then
 return 1
	else
 return 0
	end
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 猜謎部分 --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function guess_at_riddle()
	local mpay  = 1000 --需要支付的金錢數量

	Say(STR_Guess[4], 2,
 STR_Guess[5].."/get_question",
 STR_Guess[6].."/main" )	
end
function get_question()
	local mpay  = 1000 --需要支付的金錢數量
	
	if ( GetCash() >= mpay ) then
 SetTaskTemp(250, 0) --设置当前题目为第 0 题
 SetTaskTemp(251, 0) --设置当前答案为第 0
 Pay(mpay)
 gquestion()
	else
 Say(STR_Guess[1], 1,
 	STR_OK.."/main" )
 Msg2Player(STR_Guess[2]..mpay..STR_Guess[3])
	end
end


-- 下面是五个题目
function gquestion()
	local qid_min  = 2001   --题库起始ID
	local qid_max  = 2220   --题库结束ID
	local qid 	 = random(qid_min, qid_max)	--确定一个题目ID	
	local question  = GetQuestion(qid) 	--取问题
	local qchoose  = {GetChoose(qid , 1), --取可选答案 A
   	GetChoose(qid , 2), --取可选答案 B
   	GetChoose(qid , 3), --取可选答案 C
   	GetChoose(qid , 4)} --取可选答案 D
	local qrextemp  = 0   --交换用临时变量下标
	local qchoosetemp	 = "_"   --交换用临时变量
	local qanswer  = GetQAnswer(qid) 	--取答案(答案编号)
    local gttc 	 = GetTaskTemp(250) + 1
    local inttemp  = {1,2,3,4}
	SetTaskTemp(250, gttc)   	--正在进行的题目轮次
	SetTaskTemp(251, 0)

	qrextemp = random(1, 3)
	qchoosetemp = qchoose[4]
	qchoose[4] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
 qanswer = 4
	elseif (qanswer == 4) then
 qanswer = qrextemp
	end
	
	qrextemp = random(1, 2)
	qchoosetemp = qchoose[3]
	qchoose[3] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
 qanswer = 3
	elseif (qanswer == 3) then
 qanswer = qrextemp
	end
	
	qrextemp = 1
	qchoosetemp = qchoose[2]
	qchoose[2] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
 qanswer = 2
	elseif (qanswer == 2) then
 qanswer = qrextemp
	end

	SetTaskTemp(251, qanswer)   --記錄當前問題答案
	Say(question, 4, 
 qchoose[1].."/answerproc_a",
 qchoose[2].."/answerproc_b",
 qchoose[3].."/answerproc_c",
 qchoose[4].."/answerproc_d" )
end
	
function answerproc_a()  	--选择答案 A
	if (GetTaskTemp(251) == 1) then --是否是正确答案
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	
function answerproc_b()  	--选择答案 B
	if (GetTaskTemp(251) == 2) then --是否是正确答案
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	
function answerproc_c()  	--选择答案 C
	if (GetTaskTemp(251) == 3) then --是否是正确答案
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	
function answerproc_d()  	--选择答案 D
	if (GetTaskTemp(251) == 4) then --是否是正确答案
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	

function qfail()  --回答出错
end
-- 题目结束

function add_random_special_word()
	local qitem  	 = {426,427,428,429,430,431,432,433}  --記錄有可能的獎勵道具(幾率匹配)
	local qitem_rate	 = {763,863,913,963,983,993,998,1000}  --記錄有可能的獎勵道具出現機率
   --  763 100  50  50  20  10   5    2
	local accuracy  = 1000   --隨機數精度
	local drop_rate  = random(1, accuracy) --確定獎品類型的一個隨機數
 
	if ( drop_rate <= qitem_rate[1] ) then
 AddItem(4,qitem[1],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[2] ) then
 AddItem(4,qitem[2],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[3] ) then
 AddItem(4,qitem[3],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[4] ) then
 AddItem(4,qitem[4],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[5] ) then
 AddItem(4,qitem[5],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[6] ) then
 AddItem(4,qitem[6],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[7] ) then
 AddItem(4,qitem[7],1,1,0,0,0)
	elseif ( drop_rate <= accuracy ) then
 AddItem(4,qitem[8],1,1,0,0,0)
	end
	Msg2Player(STR_Guess[9])
--	guess_at_riddle()
	Say(STR_Guess[11], 2,
 STR_Guess[5].."/get_question",
 STR_Guess[6].."/main" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 填诗领奖品部分 --------------------------------------
-- ------------------------------------------------------------------------------------------------
function GetReward()
	Say(STR_Reward_Note[1],9,
 STR_Reward_Poem[1]..STR_Reward_Reward[1]..STR_Reward_Func[1],
 STR_Reward_Poem[2]..STR_Reward_Reward[2]..STR_Reward_Func[2],
 STR_Reward_Poem[3]..STR_Reward_Reward[3]..STR_Reward_Func[3],
 STR_Reward_Poem[4]..STR_Reward_Reward[4]..STR_Reward_Func[4],
 STR_Reward_Poem[5]..STR_Reward_Reward[5]..STR_Reward_Func[5],
 STR_Reward_Poem[6]..STR_Reward_Reward[6]..STR_Reward_Func[6],
 STR_Reward_Poem[7]..STR_Reward_Reward[7]..STR_Reward_Func[7],
 STR_Reward_Poem[8]..STR_Reward_Reward[8]..STR_Reward_Func[8],
 STR_Reward_Note[7].."/main")
end

function yes1()                                                                 -- 烟花与2粒Pk药丸
	if ((GetItemCountEx(418)>=1) and (GetItemCountEx(426))>=1) then
	  	DelItemEx(418)
	  	DelItemEx(426)
	  	for i=1,2 do 
	    	local x=random(1,10)
	    	AddItem(6,0,x,1,0,0,0)
	  	end
	  	AddItem(6,0,11,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[1].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[1]..STR_Reward_Note[5]..STR_Reward_Poem[1]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes2()                                                                 -- 猴年吉祥包
	if ((GetItemCountEx(419)>=1) and GetItemCountEx(427)>=1) then
	  	DelItemEx(419)
	  	DelItemEx(427)
	  	AddItem(6,1,19,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[2].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[2]..STR_Reward_Note[5]..STR_Reward_Poem[2]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes3()                                                                 -- 仙草露
	if ((GetItemCountEx(420)>=1) and GetItemCountEx(428)>=1) then
	  	DelItemEx(420)
	  	DelItemEx(428)
	  	AddItem(6,1,71,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[3].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[3]..STR_Reward_Note[5]..STR_Reward_Poem[3]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes4()                                                                 --  t竚 tr﹏ ph骳 th竛g 畂祅 vi猲 b輓h 
	if ((GetItemCountEx(421)>=1) and GetItemCountEx(429)>=1) then
	  	DelItemEx(421)
	  	DelItemEx(429)
	  	AddItem(6,1,126,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[4].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[4]..STR_Reward_Note[5]..STR_Reward_Poem[4]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes5()                                                                 --  hoa qu� ru 
	if ((GetItemCountEx(422)>=1) and GetItemCountEx(430)>=1) then
	  	DelItemEx(422)
	  	DelItemEx(430)
	  	AddItem(6,1,125,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[5].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[5]..STR_Reward_Note[5]..STR_Reward_Poem[5]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes6()                                                                 -- 贡月芙蓉
	if ((GetItemCountEx(423)>=1) and GetItemCountEx(431)>=1) then
	  	DelItemEx(423)
	  	DelItemEx(431)
	  	AddItem(6,1,128,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[6].." . ")
	  	local n=GetGlbValue(12)+1
	  	SetGlbValue(12,n)
 	WriteLog(date("%H%M%S").." ACC- "..GetAccount().. ", CHAR- "..GetName().." "..STR_Reward_Reward[6]);
	  	AddGlobalNews(STR_Reward_Note[8])
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[6]..STR_Reward_Note[5]..STR_Reward_Poem[6]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes7()                                                                 -- 奉月果蓉
	if ((GetItemCountEx(424)>=1) and GetItemCountEx(432)>=1) then
	  	DelItemEx(424)
	  	DelItemEx(432)
	  	AddItem(6,1,127,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[7].." . ")
	  	local n=GetGlbValue(11)+1
	  	SetGlbValue(11,n)
 	WriteLog(date("%H%M%S").." ACC- "..GetAccount().. ", CHAR- "..GetName().." "..STR_Reward_Reward[7]);
	  	AddGlobalNews(STR_Reward_Note[9])
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[7]..STR_Reward_Note[5]..STR_Reward_Poem[7]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes8()                                                                 -- 定国安邦黄金装备
	if ((GetItemCountEx(425)>=1) and GetItemCountEx(433)>=1) then
	  	DelItemEx(425)
	  	DelItemEx(433)
	  	local x=random(159,167)
	  	AddGoldItem(0,x)
	  	local n=GetGlbValue(10)+1
	  	SetGlbValue(10,n)
 	WriteLog(date("%H%M%S").." ACC- "..GetAccount().. ", CHAR- "..GetName().." "..STR_Reward_Reward[8]);
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[8].." . ")
	  	AddGlobalNews(STR_Reward_Note[10])
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[8]..STR_Reward_Note[5]..STR_Reward_Poem[8]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ 合成部分 --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function Combination()
	local mpay  = 1000 --需要支付的金錢數量
	
	if ( GetCash() < mpay ) then
 Say(STR_Combin_Note[2], 1,
 	STR_OK.."/main" )
 Msg2Player(STR_Guess[2]..mpay..STR_Guess[3])
	else
 Say(STR_Combin_Note[1], 2,
 	STR_Guess[5].."/Combination_List",
 	STR_Guess[6].."/main" )
	end
end
function Combination_List()
	local i=GetCash()
	if (i>=1000) then
 Say(STR_Combin_Note[1],8,
 	STR_Combin_Word[1]..STR_Combin_Request[1]..STR_Combin_Func[1],
 	STR_Combin_Word[2]..STR_Combin_Request[2]..STR_Combin_Func[2],
 	STR_Combin_Word[3]..STR_Combin_Request[3]..STR_Combin_Func[3],
 	STR_Combin_Word[4]..STR_Combin_Request[4]..STR_Combin_Func[4],
 	STR_Combin_Word[5]..STR_Combin_Request[5]..STR_Combin_Func[5],
 	STR_Combin_Word[6]..STR_Combin_Request[6]..STR_Combin_Func[6],
 	STR_Combin_Word[7]..STR_Combin_Request[7]..STR_Combin_Func[7],
 	STR_Combin_Note[10] )
	end
end

function Combin1()                                                                 --  minh 
	if ((GetItemCountEx(418)>=1) and GetItemCountEx(426)>=1) then
	  	if (Pay(1000) > 0 ) then 
	   DelItemEx(418)
	   DelItemEx(426)
	   local x=random(1,100) 
	   if (x<=MingZi) then
            	AddItem(4,419,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[1])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[1]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[1]..STR_Combin_Note[8]..STR_Combin_Request[1]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin2()                                                                 --  thu 
	if ((GetItemCountEx(419)>=1) and GetItemCountEx(427)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(419)
	   DelItemEx(427)
	   local x=random(1,100) 
	   if (x<=QiuZi) then
            	AddItem(4,420,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[2])
	  else
  Say(STR_Combin_Note[5]..STR_Combin_Word[2]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[2]..STR_Combin_Note[8]..STR_Combin_Request[2]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin3()                                                                 --  ca 
	if ((GetItemCountEx(420)>=1) and GetItemCountEx(428)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(420)
	   DelItemEx(428)
	   local x=random(1,100) 
	   if (x<=GeZi) then
            	AddItem(4,421,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[3])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[3]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[3]..STR_Combin_Note[8]..STR_Combin_Request[3]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin4()                                                                 --  秐h 
	if ((GetItemCountEx(421)>=1) and GetItemCountEx(429)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(421)
	   DelItemEx(429)
	   local x=random(1,100) 
	   if (x<=YingZi) then
            	AddItem(4,422,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[4])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[4]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[4]..STR_Combin_Note[8]..STR_Combin_Request[4]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin5()                                                                 --  gi� 
	if ((GetItemCountEx(422)>=1) and GetItemCountEx(430)>=1) then
	  	if (Pay(1000) > 0 ) then 
	   DelItemEx(422)
	   DelItemEx(430)
	   local x=random(1,100) 
	   if (x<=JuZi) then
            	AddItem(4,423,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[5])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[5]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[5]..STR_Combin_Note[8]..STR_Combin_Request[5]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin6()                                                                 --  ng緈 
	if ((GetItemCountEx(423)>=1) and GetItemCountEx(431)>=1) then
	  	if (Pay(1000) > 0 ) then 
	    	DelItemEx(423)
	    	DelItemEx(431)
	   local x=random(1,100) 
	   if (x<=WangZi) then
            	AddItem(4,424,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[6])
 	else
  Say(STR_Combin_Note[5]..STR_Combin_Word[6]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
 	end
 end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[6]..STR_Combin_Note[8]..STR_Combin_Request[6]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin7()                                                                 --  nguy謓 
	if ((GetItemCountEx(424)>=1) and GetItemCountEx(432)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(424)
	   DelItemEx(432)
	   local x=random(1,100) 
	   if (x<=YuanZi) then
            	AddItem(4,425,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[7])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[7]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
 end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[7]..STR_Combin_Note[8]..STR_Combin_Request[7]..STR_Combin_Note[9], 1,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function do_nothing()
end