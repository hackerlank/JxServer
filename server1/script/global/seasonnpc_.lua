-- 野叟任务链脚本
-- Edited by peres
-- 2004/12/24 圣诞节前夜

IncludeLib("FILESYS");
IncludeLib("RELAYLADDER");	--排行榜
Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua"); -- 任务链的头文件
Include("\\script\\task\\newtask\\tasklink\\tasklink_award.lua"); -- 任务链的奖励头文件
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

--Storm 真正的接新任务
function storm_goon_start(gameid, b_nonext)
	
	local nNum     = GetTask(ID_TASKLINK_LIMITNUM);
	
		-- 每天的限制次数 +1
		nNum = nNum + 1;
		SetTask(ID_TASKLINK_LIMITNUM, nNum);
		
	if b_nonext then return end
	tl_dealtask()
	Task_MainDialog()
end

-- 检测任务是否已经过了每天的限制
function checkTask_Limit()
	
-- 每天限制次数的处理
local nNowDate = tonumber(GetLocalDate("%y%m%d"));
local nOldDate = GetTask(ID_TASKLINK_LIMITDATE);
local nNum     = GetTask(ID_TASKLINK_LIMITNUM);
	
	if nNowDate~=nOldDate then
		
		SetTask(ID_TASKLINK_LIMITDATE, tonumber(GetLocalDate("%y%m%d")) );
		SetTask(ID_TASKLINK_LIMITNUM, 0);
		SetTask(ID_TASKLINK_LIMITCancelCount, 0);
		return 1;
		
	else
		-- 40 次的限制
		if nNum>=40 then
			Say("Ha ha , m鏸 ng祔 nhi謒 v� t鎛g s� kh玭g th� vt qua 40 l莕 . ", 0);
			return 0;
		end;
		
		return 1;

	end;
	
end;
	
	
--Task_BuyGoods = {}
--Task_FindGoods = {}
--Task_ShowGoods = {}
--Task_FindMaps = {}
--Task_UpGround = {}
--Task_WorldMaps = {}
--Task_Level = {}
--Task_MainLevelRate = {}


-- 构造任务内存变量
Task_BuyGoods = AssignValue(Task_BuyGoods,TL_BUYGOODS)
Task_FindGoods = AssignValue(Task_FindGoods,TL_FINDGOODS)
Task_ShowGoods = AssignValue(Task_ShowGoods,TL_SHOWGOODS)
Task_FindMaps = AssignValue(Task_FindMaps,TL_FINDMAPS)
Task_UpGround = AssignValue(Task_UpGround,TL_UPGROUND)
Task_WorldMaps = AssignValue(Task_WorldMaps,TL_WORLDMAPS)

Task_MainTaskLink = AssignValue_TaskLink(Task_MainTaskLink,TL_LEVELLINK)
Task_MainLevelRate = AssignValue_TaskRate(Task_MainLevelRate,TL_MAINTASKLEVEL)

-- 构造奖励内存变量
Task_AwardBasic = AssignValue_Award(Task_AwardBasic,TL_AWARDBASIC)

-- 构造完成次数的奖励
Task_AwardLink = AssignValue_LinkAward(TL_AWARDLINK)

Task_AwardLoop = AssignValue_Award(Task_AwardLoop,TL_AWARDLOOP)

-- 构造对话内容内存变量
Task_TalkGoods = AssignValue_TaskTalk(Task_TalkGoods,TL_TASKGOODSTALK)
Task_TalkBuy = AssignValue_TaskTalk(Task_TalkBuy,TL_TASKBUYTALK)
Task_TalkShow = AssignValue_TaskTalk(Task_TalkShow,TL_TASKSHOWTALK)
Task_TalkFind = AssignValue_TaskTalk(Task_TalkFind,TL_TASKFINDMAPS)
Task_TalkUp = AssignValue_TaskTalk(Task_TalkUp,TL_TASKUPGROUNDTALK)
Task_TalkWorld = AssignValue_TaskTalk(Task_TalkWorld,TL_TASKWORLDTALK)


function Task_NewVersionAward()
	
	local nNum = GetTask(ID_TASKLINK_LIMITNUM);
	local nCancelNum = GetTask(ID_TASKLINK_LIMITCancelCount);
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "yesourenwu")
	G_ACTIVITY:OnMessage("FinishYesou", nNum, nCancelNum);
	
	-- 每天完成第30个额外奖励
	if (nNum - nCancelNum) == 30 then
		Msg2Player("Ch骳 m鮪g ngi , ho祅 th祅h 30 c� d� t萿 nhi謒 v� , t 頲 ng筩h ngo筰 tng thng ");
		tbAwardTemplet:GiveAwardByList({nExp_tl = 30000000}, "Чt 頲 ng筩h ngo筰 tng thng ")
	end
	
	-- 每天完成第40个额外奖励
	if (nNum == 40 and nCancelNum) == 0 then
		Msg2Player("恭喜你，完成40个野叟任务，Чt 頲 ng筩h ngo筰 tng thng ");
		tbAwardTemplet:GiveAwardByList({nExp_tl = 100000000}, "Чt 頲 ng筩h ngo筰 tng thng ")
	end	
	
end


function main()

	--有盂兰节活动期间对话。
--	local nDate = tonumber(GetLocalDate("%y%m%d"));
--	if (nDate >= 60808 and nDate <= 60815) then
--		local tab_Content = {
--			"Xem c nhi v?g? l kh t莕 g/tasklink_entence",
--		}
--		tinsert(tab_Content, "Ta mu l筽 l m vg Li y誸 Hoa/menglanjie");
--		tinsert(tab_Content, "R 竎h kh ta /Task_Wait");
--		Say("M n nay chi kh鉧 tranh tri th輈h mi y誸 , d th th l筽 g kh? Phng trng Thi ph� L t?mu l筽 t?ch ch薽 th?trai m v� g L?Vu Lan  m ngi hng ch l﹗ gi ph l﹗ y y誸 bh", getn(tab_Content), tab_Content);
--		return
--	end;
	
	tasklink_entence();
end;

function menglanjie()
	if (GetExtPoint(0) <= 0 or GetLevel() < 30) then
		Say("Xin l! Ch?c?ngi ch b閕 t?c <color=red>30,  n th?color> m c?th?tham gia ho ng n ph� ", 0)
		return 
	end;
	local tab_Content = {
		"Ta mu l筽 k vg Kim Li y誸 Hoa [c 9 Kim Li y誸 Hoa]/process(1)",
		"Ta mu l筽 h th y猽 h vg M nhu薾 Li y誸 Hoa [c 9 M nhu薾 Li y誸 Hoa]/process(2)",
		"Ta mu l筽 h th y猽 h vg Th Li y誸 Hoa [c 9 Th Li y誸 Hoa]/process(3)",
		"Ta mu l筽 h th y猽 h vg H Li y誸 Hoa [c 9 H Li y誸 Hoa]/process(4)",
		"Ta mu l筽 h th y猽 h vg Th?Li y誸 Hoa [c 9 Th?Li y誸 Hoa]/process(5)",
		"Ch?n th t莕 g ch l﹗ th quy誸 !/Task_Wait"
	}
	Say("Ch?c ngi  thu th  s?Li y誸 Hoa v?<color=yellow>"..MAKING_COST.."<color> lng ta s?gi ngi k vg hoa tuy khi猰 p. Nhg l ? m ng ph� ch?c?th?k  2 vg Li y誸 Hoa cg thu nhu薾 t v穘 h m?th quy誸 .", getn(tab_Content), tab_Content);
end;

--{name, product}
MAKING_COST = 10000;
MAKING_COUNT = 9;
tab_Flower = {
	{1126, "Kim ", 1131, 1760, 1761}, {1127, "M閏 ", 1132, 1762, 1763}, {1128, "Nc ", 1133, 1764, 1765}, {1129, " l鯽 ", 1134, 1766, 1767}, {1130, "t ", 1135, 1768, 1769}
}

function process(nIdx)
	if (nIdx < 1 or nIdx > getn(tab_Flower)) then
		return
	end;
	
	local nIndex;
	if (nIdx == 1) then
		nIndex = 1;
	elseif (nIdx == 2) then
		nIndex = 2;
	elseif (nIdx == 3) then
		nIndex = 3;
	elseif (nIdx == 4) then
		nIndex = 4;
	elseif (nIdx == 5) then
		nIndex = 5;
	end;
	
	Say("Mu l筽 l 1 vg <color=yellow>"..tab_Flower[nIdx][2].." Li y誸 Hoa<color> c c?9 <color=yellow>"..tab_Flower[nIdx][2].."Li y誸 Hoa<color>. Ngi x nh l ch?", 2, "ng! Xin l b tr?t nh璶g !/make_round("..nIndex..")", "Ta s?quay l t筩 sau!/Task_Wait");
end;

function make_round(nIdx)
	if (GetCash() < MAKING_COST) then
		Say("Xin t  10000 lng r m筺h h quay l t筩 ! Ta ?y ch?", 1, " th quy誸 ! Ta  l th 竝 ti th輈h !/Task_Wait");
		return
	end;
	
	local nCount = CalcEquiproomItemCount(6,1,tab_Flower[nIdx][1],-1);
	if (nCount < 9) then
		Say("Ngi hh nh?ch  <color=yellow>"..tab_Flower[nIdx][2].." Li y誸 Hoa<color=yellow>. Ch  9 <color=yellow>"..tab_Flower[nIdx][2].." Li y誸 Hoa<color> th?ta kh t莕 g th?gi ngi k vg "..tab_Flower[nIdx][2].." Li y誸 Hoa ho y猽 ", 1, " ta  chu oa b?!/Task_Wait");
		return
	end;
	
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate ~= GetTask(tab_Flower[nIdx][4])) then
		SetTask(tab_Flower[nIdx][4], nDate);
		SetTask(tab_Flower[nIdx][5], 0);
	end;
	
	local nTimes = GetTask(tab_Flower[nIdx][5]);
	if (nTimes >= 2) then
		Say(tab_Flower[nIdx][2].."H nay  k th y猽 h c t莕 g 2 vg r m筺h ! Mai h n nh?", 0)
		return
	end;
	
	Pay(MAKING_COST);
	ConsumeEquiproomItem(9, 6, 1, tab_Flower[nIdx][1], -1);
	SetTask(tab_Flower[nIdx][5], nTimes + 1);
	AddItem(6, 1, tab_Flower[nIdx][3], 1, 0, 0, 0);
	Say("Vg "..tab_Flower[nIdx][2].." Li y誸 Hoa c ngi  k xong. H mang n?n ch?L?Quan !", 1, "Nh nh� vg hoa/Task_Wait");
	Msg2Player("B nh nh�  m"..tab_Flower[nIdx][2].." Li y誸 Hoa ho y猽 ");
end;
    
-- 任务链的入口
function tasklink_entence()

_TaskLinkDebug() -- 对于任务链无法进行下去的 BUG 修复

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数

local myCountLinks
local myCountTimes

local myCanceled = nt_getTask(1036)
local myTaskTime = GetGameTime() -- 获取游戏时间，用以判断玩家是否被封
local n = myTaskTime - nt_getTask(1029)
local myTaskInfo = ""


-- 如果玩家当前的状态为还未发奖的话，则重新发奖
if (tl_gettaskcourse() == 2) then
	Task_GiveAward()
	return
end

	if ( myCanceled == 10) then
		if (n < 605) then
			Task_Punish()
			return
		else
			myCanceled = 0
			nt_setTask(1036,0)
			Task_Confirm()
		end
	end

	if (tl_gettaskcourse() == 0) then
		-- 如果还没有开始野叟的任务链的话
--		Say("V?n ph� "..GetPlayerSex().."xem ra  b t莕 ba giang h? m th 竎h gian d nh璶g r m筺h nh? c?mu l筽 tham gia kh nghi nhi v?li y誸 t c ta kh t莕 g?",3," th quy誸 ! Ta kh t莕 g tin c?nhi v?n k� l kh?d? ta/Task_Confirm","Ta mu l筽 bi kh nghi c ngi n c?n dung ra sao/Task_Info","Ta b nh� r m筺h , kh t莕 g rh ng m筺h t g c鑤 v t莕 g/Task_Exit");
		Say("D� t萿  v� n祔 "..GetPlayerSex().." xem ra x玭g x竜 giang h� c騨g c� m閠 畂筺 th阨 gian , c� th� hay kh玭g c� h鴑g th� t韎 tham gia ta <color=yellow>� ho祅 ho祅 li猲 li猲 tng x鴑g i , t莕g t莕g 甶謙 甶謙 l蕐 h藆 l� �<color> ch nhi謒 v� kh秓 nghi謒 y ? ",3,"H秓 nha , ta c騨g kh玭g tin c� c竔 g� nhi謒 v� c� th� kh� 頲 c騨g ta /Task_Confirm","Ta mu鑞 bi誸 ngi n鉯 kh秓 nghi謒 l� m閠 h譶h d竛g g� /Task_Info","Ta c遪 c� chuy謓 , kh玭g r穘h c飊g ngi � y r鏸 r穘h k衞 /Task_Exit");
	end
	
	if (tl_gettaskcourse() == 3) then

		-- 检测是否超过每天的限制
		if checkTask_Limit()~=1 then return end;
	
		myCountLinks = tl_counttasklinknum(2)
		myCountTimes = tl_counttasklinknum(1)
		
--		Say(":<enter>V?"..GetPlayerSex().." ho y猽 th y猽 h <color=yellow>"..myCountTimes.."<color>, nhi v?n ph� ng ph� h nay c?th?th hi l t筩 <color=yellow>"..(40 - GetTask(ID_TASKLINK_LIMITNUM)).."<color>, ngi c?mu l筽 l n kh t莕 g?",2,"g nhi y誸 , mau cho ta bi nhi v?ti theo l?g?/Task_TaskProcess"," ta ngh?ng b閕 m l ! Ta b nh� r m筺h /Task_Wait");
		Say("D� t萿 <enter> v� n祔 "..GetPlayerSex().."  ho祅 th祅h <color=yellow>"..myCountTimes.."<color> l莕 ta a cho nhi謒 v� c馻 ngi , kh玭g bi誸 ngi c� c遪 hay kh玭g h鴑g th� ti誴 t鬰 ti誴 theo l祄 ti誴 y ? ",2,"D� nhi猲 , mau  cho ta bi誸 ngi/c竔 k� ti誴 nhi謒 v� l� c竔 g� /Task_TaskProcess","H穣  cho ta ngh� m閠 l竧 m� 甶 , ta c遪 kh竎 bi謙 chuy謓 c馻 t譶h /Task_Wait");
	elseif (tl_gettaskcourse() == 1) then
		Task_MainDialog()
	end

end

-- 答应了野叟的考验，正式开始任务链
function Task_Confirm()

local myTaskID

-- 设置任务变量的数值，1020 号变量为任务链状态专用变量，其中的四个字节分别定义为：| ①次数 | ②链数 | ③环数 | ④取消剩余次数 |

tl_settaskstate(1,0) -- 正在进行第一次任务
tl_settaskstate(2,tl_getfirstlink()) -- 正在进行第一链任务
tl_settaskstate(3,tl_getfirstloop()) -- 正在进行第一环任务

tl_settaskstate(4,0) -- 剩余 0 次取消任务的机会
nt_setTask(DEBUG_TASKVALUE, 0);

tl_settaskstate(6,0)

storm_ask2start(4)	--Storm 开始挑战
tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuDaTau")
--tbLog:PlayerActionLog("Ch� y誹 c 甶觤 ","NhanNhiemVuDaTau")
end


-- 进行下一次任务
function Task_TaskProcess()

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数


-- 检测是否超过每天的限制
if checkTask_Limit()~=1 then return end;

tl_taskprocess() -- 首先执行下一轮函数

storm_goon_start()	--Storm恢复

end


-- 任务链的主要控制面版
function Task_MainDialog()

local myTaskInfo = tl_gettaskinfo() -- 任务的详细信息
local myTaskTotalNum = tl_counttasklinknum(1) + 1; -- 总任务次数统计
local myTitleText = "";

if (myTaskInfo == nil) then
	myTaskInfo = ""
end

-- 设置任务状态为已经接了任务但未完成
tl_settaskcourse(1)


if myTaskTotalNum==0 or myTaskTotalNum==nil then
	myTitleText = " d� t萿 <enter><enter>"..myTaskInfo;
else
	myTitleText = " d� t萿 <enter><enter>这是第 <color=green>"..myTaskTotalNum.."<color> c� nhi謒 v� , "..myTaskInfo;
end;

Say(myTitleText,
	4,
--	"Bi r m筺h ,  ta ho y猽 th y猽 h nhi v?xong m l t筩 t ngi/Task_Wait",
--	"ta  ho y猽 th y猽 h nhi v?l n ph� , xin h ki tra l t筩 !/Task_Accept",
--	"Nhi v?l n ph� kh?qu? Ta mu l筽 h b?kh t莕 g l n/Task_CancelConfirm",
--	"Ta mu l筽 bi kh nghi c ngi n c?n dung ra sao/Task_Info"
	" bi誸 , ch� ta ho祅 th祅h nhi謒 v� sau l筰 t韎 t譵 ngi /Task_Wait",
	" ta  ho祅 th祅h nhi謒 v� l莕 n祔 , m阨/xin ngi nghi謒 thu 甶 /Task_Accept",
	" nhi謒 v� l莕 n祔 c騨g qu� kh� kh╪ , ta mu鑞 h駓 b� r琲 kh玭g l祄 /Task_CancelConfirm",
	"Ta mu鑞 bi誸 ngi n鉯 kh秓 nghi謒 l� m閠 h譶h d竛g g� /Task_Info"
	);

-- 设置取消任务的标记为可以取消
nt_setTask(1045, 1);

end


-- 取消任务时给予玩家一次确认的机会
function Task_CancelConfirm()

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数

local myCountTimes = tl_counttasklinknum(1);  -- 玩家进行的任务总数

if (myTaskCancel==0) then
	Say("D� t萿  ng礽 b﹜ gi� m閠 l莕 h駓 b� ch c� h閕 c騨g kh玭g c� , c� nh� v藋 ngi li襫 ph秈 b総 u l筰 t� u 竎  h琻 n鱝 trc ngi ch tng thng t輈h l騳 s� l莕 n鱝 b総 u m h誸 . ",3,"ng v藋 , ta ch輓h l� kh玭g mu鑞 l祄 c竔 n祔 qu� nhi謒 v� /Task_NormalCancel","Ta mu鑞 d飊g 100 t� n骾 s玭g x� t綾  m秐h v鬾 t韎 l蕐 ti猽 nhi謒 v� l莕 n祔 /Task_Cancel(2)"," �/d� 厖 v藋 h穣  cho ta suy ngh� l筰 m閠 ch髏 甶 /Task_Wait");
else
	Say("D� t萿  ng礽 b﹜ gi� c遪 c� "..myTaskCancel.." l莕 h駓 b� nhi謒 v� c� h閕 , ngi nh蕋 nh ph秈 h駓 b� nhi謒 v� l莕 n祔 sao ? ",2,"ng v藋 , ta ch輓h l� kh玭g mu鑞 l祄 c竔 n祔 qu� nhi謒 v� /Task_Cancel(1)"," �/d� 厖 v藋 h穣  cho ta suy ngh� l筰 m閠 ch髏 甶 /Task_Wait");
end


--if (myTaskCancel==0) then
--	
--	Say("Hi t t筩 b kh t莕 g c?c?h n k�  h b?nhi v? b ch?c?th?l l t筩 t?u th quy誸 ! ng th 竎h ph thng t chu h l c b l b� trc s? t v穘 h l t筩 t?u.",
--		3,
--		"ng, ta kh t莕 g mu l筽 l nhi v?qu?qu n ph� u/Task_NormalCancel",
--		"Ta mu l筽 s?dg 100 mh s H?X?T l╪g  h b?nhi v?l n ph� /Task_Cancel(2)",
--		"Uhm!  ta suy ngh?l t筩 /Task_Wait");
--	
--else
--	
--	Say("Hi t t筩 b c"..myTaskCancel.." s?l c?h h b?nhi v? b x nh h b?nhi v?l n ph� ng kh t莕 g?",
--		2,
--		"ng, ta kh t莕 g mu l筽 l nhi v?qu?qu n ph� u/Task_Cancel(1)",
--		"Uhm!  ta suy ngh?l t筩 /Task_Wait");
--	
--end

end


-- 正常的取消方式再确认一次
function Task_NormalCancel()

Say("D� t萿  ngi ngh� t鑤 l緈 th藅 mu鑞 l蕐 ti猽 nhi謒 v� l莕 n祔 sao ? ",2,"Kh玭g mu鑞 la toa li評 , ta ch輓h l� kh玭g mu鑞 l祄 c竔 n祔 qu� nhi謒 v� /Task_Cancel(1)","V藋 hay l�  cho ta suy ngh� l筰 m閠 ch髏 甶 /Task_Wait");

--Say("B suy ngh?k?h b?nhi v?l n ph� ng kh t莕 g?",2,"ng l quy誸 th quy誸 n! ta kh t莕 g mu l筽 l nhi v?qu?qu n ph� u/Task_Cancel(1)","Th quy誸  ta suy ngh?l t筩 !/Task_Wait");

end;


-- 1000 次以上的任务取消时需要放水晶
function Task_TotalCancel()
	GiveItemUI("D� t萿 nhi謒 v� 1000 l莕 tr� l猲 h駓 b� , c莕 cung c蕄 nc bi誧 tinh m閠 vi猲 , xin/m阨 甧m th駓 tinh t � ph輆 di v藅 ph萴 khu玭g trung ", "Task_TotalCancel_Main", "Task_Wait");
end;


function Task_TotalCancel_Main(nCount)
	
	local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = 0,0,0,0,0,0;
	local nIndex = 0;
	
	if nCount~=1 then
		Say("D� t萿  ngi cho ta kh玭g ph秈 l� m祏 xanh l� c﹜ <color=yellow>1 c� <color> th駓 tinh !", 0);
		return
	end;
	
	nIndex = GetGiveItemUnit(1);
	nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
	
	if nGenre==4 and nDetail==240 and nParticular==1 then
		Task_Cancel(1);  -- 全部取消
	else
		Say("D� t萿 : ngi cho ta kh玭g ph秈 l� m祏 xanh l� c﹜ <color=yellow>1 c� <color> th駓 tinh !", 0);
		return		
	end;
	
end;


-- 显示玩家当前的任务所进行的程度（调试用）
function Task_ProcessInfo()

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数

local myTaskType = tl_getplayertasktype()

local myTimes = tl_gettaskstate(1)
local myLinks = tl_gettaskstate(2)

local myCountTimes = tl_counttasklinknum(1)

-- local myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
-- local myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
	

-- local myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1))

-- local myMainValueText1 = " ngi trc m総 ch nhi謒 v� v藅 ph萴 gi� tr� v� : "..myTaskValue1.." nhi謒 v� gi� tr� v� : "..myTaskValue2.."<enter>".." nhi謒 v� c馻 ngi b﹜ gi� t鎛g gi� tr� lng v� : "..myMainValue

--	Say("D� t萿  ngi b﹜ gi� ti課 h祅h 頲 li評 th� "..myTaskLoops.." ho祅 trung ch th� "..myTaskLinks.." li猲 trung ch th� "..myTaskTimes.." l莕 . <enter> ngi li猲 t鬰 ti課 h祅h ch s� l莕 v� "..tl_counttasklinknum(1).." l莕 <enter> ngi li猲 t鬰 ti課 h祅h ch li猲 m v� "..tl_counttasklinknum(2).." li猲 <enter>"..myMainValueText1,0);

--	Say(" Hi謓 t筰 ngi  ho y猽 th y猽 h <color=yellow>"..myCountTimes.."<color> s?l nhi v?ta giao cho, c c?g lng g h nh?", 0);
	Say("野叟：你现在  ho祅 th祅h <color=yellow>"..myCountTimes.."<color> l莕 ta a cho nhi謒 v� c馻 ngi , k輓h xin ti誴 t鬰 c� g緉g nga ", 0);

end


-- 玩家已经完成任务前来给野叟验收
function Task_Accept()
	--2007-09-19 增加物品奖励时的背包空间判断
	if (CalcFreeItemCellCount() < 5) then
		Say("D� t萿  xin/m阨 d鋘 d裵 t骾 x竎h c馻 ngi ph鬰 kh玭g thua k衜 5 c� c竎h t� , sau  t韎 nh薾 l蕐 ph莕 thng ",0);
		return
	end;
local myTaskType = tl_getplayertasktype()

	if (myTaskType == 1) then
		GiveItemUI("T譵 ki誱 v藅 ph萴 nhi謒 v� ","D� t萿  nga ? ta cho ngi 甶 mua  ngi mua cho ta  t韎 ch璦 ? ","Task_Accept_01","Task_Wait");
	elseif (myTaskType == 2) then
		GiveItemUI("Mua v藅 ph萴 nhi謒 v� ","D� t萿  nga ? ta cho ngi 甶 t譵  ngi cho ta t譵 頲 sao ? ","Task_Accept_02","Task_Wait");
	elseif (myTaskType == 3) then
		GiveItemUI("V藅 ph萴 bi觰 di詎 nhi謒 v� ","D� t萿  nga ? ta cho ngi 甶 t譵  ngi cho ta t譵 頲 sao ? ","Task_Accept_03","Task_Wait");
	elseif (myTaskType == 4) then
		Task_Accept_04()
	elseif (myTaskType == 5) then
		Task_Accept_05()
	elseif (myTaskType == 6) then
		Task_Accept_06()
	else -- 异常处理
		Say("D� t萿  ngi b﹜ gi� l祄  c遪 kh玭g c� t t韎 y猽 c莡 c馻 ta nga , c遪 l� m阨/xin ngi c� g緉g n鱝 甶 ",0);
	end

end


-- 任务一的判断处理
function Task_Accept_01(nCount)
local myTaskGoods
local ItemGenre,DetailType,ParticularType,Level,nSeries,Luck

if ( nCount > 1 ) then
	Say("D� t萿  v� n祔 "..GetPlayerSex().." , ngi m閠 l莕  nhi襲 nh� v藋  甶 v祇 ta l� th蕐 con m総 b蕋 h� ti誴 nha , c遪 l� t� t� 甶 甶 厖",0);
	return 0
elseif ( nCount == 0) then
	Say("D� t萿  v� n祔 "..GetPlayerSex().." , ngi 厖 th藅  c�  c� � b猲 trong kh玭g ? c� ph秈 hay kh玭g ta l穙 Hoa li評 m総 nha ? ",0);
	return 0
end

	ItemGenre,DetailType,ParticularType,Level,nSeries,Luck = GetItemProp(GetGiveItemUnit(1))
--	magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)
	myTaskGoods = {ItemGenre,DetailType,ParticularType,nSeries,Level}
	
--	tl_print ("D� t萿 ki觤 nghi謒 li評 v藅 ph萴 "..ItemGenre..DetailType..ParticularType..nSeries..Level)
	
	if (tl_checktask(myTaskGoods) == 1) then
		RemoveItemByIndex(GetGiveItemUnit(1)) -- 删除玩家身上的物品
		Task_AwardRecord()
		Task_GiveAward()
		-- 发奖处理
	else
		Say("D� t萿  ngi b﹜ gi� a cho ch  c遪 kh玭g c� t t韎 y猽 c莡 c馻 ta nga , c遪 l� m阨/xin ngi c� g緉g n鱝 甶 ",0);
	end
end


-- 任务二的判断处理
function Task_Accept_02(nCount)

local myTaskGoods
local ItemGenre, DetailType, ParticularType, Level, nSeries, Luck
local magictype,p1,p2,p3
local i,n,m = 0,0,0

if ( nCount > 1 ) then
	Say("D� t萿  v� n祔 "..GetPlayerSex().." , ngi m閠 l莕  nhi襲 nh� v藋  甶 v祇 ta l� th蕐 con m総 b蕋 h� ti誴 nha , c遪 l� t� t� 甶 甶 厖",0);
	return 0
elseif ( nCount == 0) then
	Say("D� t萿  v� n祔 "..GetPlayerSex().." , ngi 厖 th藅  c�  c� � b猲 trong kh玭g ? c� ph秈 hay kh玭g ta l穙 Hoa li評 m総 nha ? ",0);
	return 0
end

	for i=1,6 do
		ItemGenre,DetailType,ParticularType,Level,nSeries,Luck = GetItemProp(GetGiveItemUnit(1))
		magictype , p1, p2, p3 = GetItemMagicAttrib(GetGiveItemUnit(1), i)
		myTaskGoods = {ItemGenre,DetailType,ParticularType,Level,nSeries,magictype,p1,p2,p3}
--		tl_print("Ki觤 nghi謒 li評 ma ph竝 thu閏 t輓h "..i.." :".." ma ph竝 ID v� : "..magictype.." ma ph竝 tham s� 1 v� : "..p1.." ma ph竝 tham s� 2 v� : "..p2.." ma ph竝 tham s� 3 v� : "..p3);
		n = tl_checktask(myTaskGoods)
		if (n == 1) then
			m = 1
		end
	end
	
	if (m == 1) then
		RemoveItemByIndex(GetGiveItemUnit(1)) -- 删除玩家身上的物品
		Task_AwardRecord()
		Task_GiveAward()
	else
		Say("D� t萿  ngi b﹜ gi� a cho ch  c遪 kh玭g c� t t韎 y猽 c莡 c馻 ta nga , c遪 l� m阨/xin ngi c� g緉g n鱝 甶 ",0);
	end
	
end


-- 任务三的判断处理
function Task_Accept_03(nCount)

local myTaskGoods
local magictype,p1,p2,p3
local i,n,m = 0,0,0


if ( nCount > 1 ) then
	Say("D� t萿  v� n祔 "..GetPlayerSex().." , ngi m閠 l莕  nhi襲 nh� v藋  甶 v祇 ta l� th蕐 con m総 b蕋 h� ti誴 nha , c遪 l� t� t� 甶 甶 厖",0);
	return 0
elseif ( nCount == 0) then
	Say("D� t萿  v� n祔 "..GetPlayerSex().." , ngi 厖 th藅  c�  c� � b猲 trong kh玭g ? c� ph秈 hay kh玭g ta l穙 Hoa li評 m総 nha ? ",0);
	return 0
end

	for i=1,6 do -- 循环历遍所有的魔法属性看看是否有合适的
		magictype,p1,p2,p3 = GetItemMagicAttrib(GetGiveItemUnit(1),i)
		myTaskGoods = {magictype,p1,p2,p3}
		n = tl_checktask(myTaskGoods)
		if (n == 1) then
			m = 1
		end
	end	

	if (m == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- 发奖处理
	else
		Say("D� t萿  ngi b﹜ gi� a cho ch  c遪 kh玭g c� t t韎 y猽 c莡 c馻 ta nga , c遪 l� m阨/xin ngi c� g緉g n鱝 甶 ",0);
	end
	
end


-- 任务四的判断处理
function Task_Accept_04()

	if (tl_checktask() == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- 发奖处理
	else
		Say("D� t萿  ngi b﹜ gi� chuy謓 l祄 c遪 kh玭g c� t t韎 y猽 c莡 c馻 ta nga , c遪 l� m阨/xin ngi c� g緉g n鱝 甶 ",0);
	end
	
end


-- 任务五的判断处理
function Task_Accept_05()

	if (tl_checktask() == 1) then
		Task_AwardRecord()
		Task_GiveAward()
		-- 发奖处理
	else
		Say("D� t萿  ngi b﹜ gi� chuy謓 l祄 c遪 kh玭g c� t t韎 y猽 c莡 c馻 ta nga , c遪 l� m阨/xin ngi c� g緉g n鱝 甶 ",0);
	end
	
end



-- 任务六的判断处理
function Task_Accept_06()
	
	if (tl_checktask()==1) then
		Task_AwardRecord()
		Task_GiveAward()
		return 1
	else
		Say("D� t萿  ha ha ha 厖 v� n祔 "..GetPlayerSex().."，某虽不才，但也明白江湖上讲的是一个信字，你都还没有收集完我所要求的山河社稷图残片怎么就想来领骚蕋 四兀�",0);
		return 0
	end

end



-- 玩家选择取消任务的处理
-- 传入参数 nType：取消任务的方法，1为用取消机会来取消，2为用 100 张山河社稷图碎片来取消
function Task_Cancel(nType)

local myTaskTimes = tl_gettaskstate(1) -- 玩家进行到的次数
local myTaskLinks = tl_gettaskstate(2) -- 玩家进行到的链数
local myTaskLoops = tl_gettaskstate(3) -- 玩家进行到的环数
local myTaskCancel = tl_gettaskstate(4) -- 玩家可以取消的次数
local myCanceled = nt_getTask(1036) -- 玩家已经恶意取消了多少次
local myMapNum = nt_getTask(1027) -- 看看玩家身上有多少个山河社稷图残片

local myNewCancel = GetTask(DEBUG_TASKVALUE);  -- 备份的取消机会

local nTotalTaskNum = tl_counttasklinknum(1); -- 获取当前玩家一共做了多少次任务

-- 如果不是从主面版进入的状态，则不能进行以下的取消过程
if nt_getTask(1045)~=1 then
	return
end;

-- 判断是否存在刷取消机会的行为
if _CancelTaskDebug()~=1 then
	Say("D� t萿  �/d� 厖 ngi tu鎖 tr� , gi鑞g nh� ngi  kh玭g c� h駓 b� c� h閕 nga ", 0);
	return
end;

-- 检测是否超过每天的限制
if checkTask_Limit()~=1 then return end;

	if (nType==2) then
		if (myMapNum>=100) then
			myMapNum = myMapNum - 100;
			nt_setTask(1027, myMapNum);
			myTaskCancel = myTaskCancel + 1;
			Msg2Player("Ng礽 s� d鬾g 100 t� n骾 s玭g x� t綾  m秐h v鬾 t韎 l蕐 ti猽 m閠 l莕 nhi謒 v� ");
			Msg2Player("Ng礽 b﹜ gi� n骾 s玭g x� t綾  m秐h v鬾 c遪 l筰 "..myMapNum.." t� ");
		else
			Say("D� t萿  ngi 厖 ngi 厖 ngi th藅 mang c� <color=yellow>100<color> t� n骾 s玭g x� t綾  m秐h v鬾 t韎 sao ? ta kh玭g c� nh譶 hoa m総 甶 ? ",0);
			return
		end;
	end;

	if (myTaskTimes == 0) and (myTaskLinks == tl_getfirstlink()) then
	
		if (myTaskCancel == 0) then
		
			myCanceled = myCanceled + 1
			nt_setTask(1036,myCanceled)
	
			if ( myCanceled > 2) then -- 如果玩家连续在初期取消了三次任务，则作处罚
				myCanceled = 10	
				nt_setTask(1036,myCanceled)
				nt_setTask(1029,GetGameTime())
				Task_Punish()
				
				return
				
			end
			
		end
		
		-- 重新随机派发新的任务
		SetTask(ID_TASKLINK_LIMITCancelCount, GetTask(ID_TASKLINK_LIMITCancelCount) + 1); -- 增加当天的取消次数
		storm_ask2start(4)	--Storm 开始挑战
		
		return
		
	end

	if (myTaskCancel >= 1) then -- 如果玩家还有机会取消的话则继续随机当前等级的任务
	
		-- 写入取消任务时的 LOG
		_WriteCancelLog(nType, nTotalTaskNum, myTaskCancel);
		
		myTaskCancel = myTaskCancel - 1
		
		tl_settaskstate(4,myTaskCancel)
		
		nt_setTask(DEBUG_TASKVALUE, myTaskCancel);
			
	else
		-- 写入取消任务时的 LOG
		_WriteCancelLog(nType, nTotalTaskNum, myTaskCancel);
	
		tl_settaskstate(1,0) -- 正在进行第一次任务
		tl_settaskstate(2,tl_getfirstlink()) -- 正在进行第一链任务
		tl_settaskstate(3,0) -- 从第 0 环开始
		
		tl_settaskstate(4,0) -- 剩余 0 次取消任务的机会
		nt_setTask(DEBUG_TASKVALUE, 0);
		
		tl_settaskstate(6,0) -- 当前的链进行了 0 次
		nt_setTask(1036,0) -- 惩罚次数累积变为 0 
		-- 在这里记录一下任务的总数
		nt_setTask(1044, tl_counttasklinknum(1));
		
--		Msg2Player("<color=yellow>Chu nhi v?D?T  x b?ho y猽 to y猽 , b gi?s?ph ti猲 l l t筩 t?nhi v?u ti y誸 <color>!");
	end
	
	-- 设置取消任务的标记为不可以取消
	nt_setTask(1045, 2);
	
	-- 重新随机派发新的任务
	SetTask(ID_TASKLINK_LIMITCancelCount, GetTask(ID_TASKLINK_LIMITCancelCount) + 1); -- 增加当天的取消次数
	storm_ask2start(4)	--Storm 开始挑战
end;


-- 听野叟解释整个任务链的过程与方法
function Task_Info()
	Talk(4,
		"tasklink_entence",
		"野叟：我这次安排的考验分为各种不同类型的小任务来检验各位武林人士的武术与魔蕋 Α�",
		" d� t萿  m鏸 ho祅 th祅h m閠 l莕 nhi謒 v� u c� <color=red> tng 鴑g tng thng <color> ch� c竎 v� , v� ph莕 c� th� li猲 t鬰 t th祅h <color=red> t竚 ng祅 l莕 <color> nhi謒 v� ngi l� s� c� <color=red> ng gi� vui m鮪g th� lao <color> ch� ngi ",
		" d� t萿  m� n誹 nh� ngi � y trong  b� qua m閠 c竔 nhi謒 v� l阨 c馻 , l� 甧m t� nhi謒 v� th� nh蕋 b総 u coi l� kh雐 . b蕋 qu� , ta c� l骳 h莡 c遪 l� s� cho d� ngi h駓 b� nhi謒 v� c� h閕 , kia ph秈 xem ngi m譶h t筰 sao n緈 ch芻 . ",
		" d� t萿  nh� th� n祇 ? ngi tu鎖 tr� , c� h鴑g th� hay kh玭g t韎 n b� ta c竔 n祔 kh秓 nghi謒 nha ? "
		);
end


-- 拒绝了野叟的考验提议
function Task_Exit()

	if (GetSex() == 0) then
		Say("D� t萿  ha ha ha 厖 ch� c玭g t� bi誸 th玭g qua kh秓 nghi謒 c馻 ta c� nhi襲 phong ph� tng thng sau li襫 t� nhi猲 s� tr� v� n鱝 t譵 ta li評 . ",0);
	else
		Say("D� t萿  ha ha ha 厖 ch� v� n祔 n� hi謕 bi誸 th玭g qua kh秓 nghi謒 c馻 ta c� nhi襲 phong ph� tng thng sau li襫 t� nhi猲 s� tr� v� n鱝 t譵 ta li評 . ",0);
	end
end


-- 在做任务的过程中退出野叟的对话，不作任何处理
function Task_Wait()

end


function Task_Punish()
	Say("D� t萿  v� n祔 "..GetPlayerSex().." c� ph秈 hay kh玭g c騨g qu� g蕄 g竝 li評 ch髏 , ta an b礽 kh秓 nghi謒 th藅 kh� kh╪ nh� th� sao ? ngi c遪 l� tr� ch髏 tr� l筰 甶 ",0);
	return 0
end




--  //////////////////////////////////////////////////////////////
-- //                     发予奖励的处理                       //
--//////////////////////////////////////////////////////////////

function Task_GiveAward()

	local i
	
	local myAward
	local myLinkAward,myLoopAward
	
	local myGoodsText = ""
	local ShowText = {"","",""}

	local nTotalTaskNum = tl_counttasklinknum(1); -- 获取当前玩家一共做了多少次任务
--	if (nTotalTaskNum ~= 0 and mod(nTotalTaskNum, 10) == 0 and GetTask(TKS_TASKLINK_SPITEM) ~= nTotalTaskNum) then
--		SetTask(TKS_TASKLINK_SPITEM, nTotalTaskNum);
--		local tbItem = {tbProp = {6, 1, 2374, 1, 0, 0}}
--		tbAwardTemplet:GiveAwardByList(tbItem, "seasonnpc_10task")
--		Msg2Player(format("Ch b� m v� g i hi  ho y猽 th y猽 h li y誸 ti %d nhi v?D?T, nh nh�  ph thng %s!", 10, "B rng th b?c D?T"));
--	end

	--tl_print ("Cho li猲 tng thng c飊g ho祅 tng thng ph竧 tng xong ");
	local nTongValue;
	myAward, nTongValue = tl_giveplayeraward(1);
	if (not nTongValue) then
		nTongValue = 0;
	end	
	local nBeishu = greatnight_huang_event(4);
	if (nBeishu > 0) then
		nTongValue = floor(nTongValue / nBeishu);
	end;
	
	for i=1,3 do
	--	tl_print (" l蕐 頲 Kim 钱奖励！");
		if (myAward[i][1] == 1) then
			ShowText[i] = " l蕐 頲 "..myAward[i][9].."/3".."/"..myAward[i][2].."/SelectAward_Money"
		elseif (myAward[i][1] == 2) then
			ShowText[i] = " l蕐 頲 "..myAward[i][9].."/4".."/"..myAward[i][2].."/SelectAward_Exp"
		elseif (myAward[i][1] == 3) then
			myGoodsText = myAward[i][3]..","..myAward[i][4]..","..myAward[i][5]..","..myAward[i][6]..","..myAward[i][7]..","..myAward[i][8]
			ShowText[i] = " l蕐 頲 "..myAward[i][9].."/5".."/"..myGoodsText.."/mySG"
		elseif (myAward[i][1] == 4) then
			if (myAward[i][10]==1) then
				myGoodsText = myAward[i][3]..","..myAward[i][4]..","..myAward[i][5]..","..myAward[i][6]..","..myAward[i][7]..","..myAward[i][8]
				ShowText[i] = myAward[i][9].."/6".."/"..myGoodsText.."/mySG"
			elseif (myAward[i][10]==2) then
				ShowText[i] = myAward[i][9].."/6".."/"..myAward[i][2].."/SelectAward_Exp"
			elseif (myAward[i][10]==3) then
				ShowText[i] = myAward[i][9].."/6".."/"..myAward[i][2].."/SelectAward_Money"
			end
			
		elseif (myAward[i][1] == 5) then
			ShowText[i] = " l蕐 頲 "..myAward[i][9].."/7".."/"..myAward[i][1].."/SelectAward_Cancel"
		end
		
	end
	
	tl_print(ShowText[1])
	tl_print(ShowText[2])
	tl_print(ShowText[3])
	
Prise( "D� t萿  c鵦 kh� , xin/m阨 v� n祔 "..GetPlayerSex().." xem m閠 ch髏 b猲 n祇  l� ngi r蕋 mu鑞 ch y ? ",ShowText[1],ShowText[2],ShowText[3] );
	
	--tl_print ("Ph竧 tng xong ");

end



-- 在已经确认了任务完成但是还未发奖时的变量处理，以防玩家刷奖
function Task_AwardRecord()
	--Storm 加积分
	local filename = tl_gettasktextID(tl_getplayertasktype())
	local tabcol = tl_gettasktablecol()
	local myTaskValue1 = tonumber(TabFile_GetCell(filename,tabcol,"TaskValue1"))
	local myTaskValue2 = tonumber(TabFile_GetCell(filename,tabcol,"TaskValue2"))
	local myMainValue = myTaskValue1 + myTaskValue2
	storm_addpoint(4, myMainValue)
	
	tl_settaskcourse(2) -- 任务的进展程度为2，即是还没有发奖
	nt_setTask(1037, GetGameTime() + tonumber(GetLocalDate("%H%M%S")));
end



-- 选择了物品的奖励
-- PS：因为考虑到任务面版的传入字符不能超过 32 个，所以这个过程简写成 mySG
function mySG(myQuality,myGenre,myDetail,myParticular,myLevel,myFive)

-- 防止多个面版弹出来刷奖励的处理
if (tl_gettaskcourse() == 3) then
	Say("D� t萿  ngi  d蒼 qu� ph莕 thng nga , th� n祇 c遪 mu鑞 n鱝 d蒼 y ? ",0);
	return
end
	--2007-09-19 增加物品奖励时的背包空间判断
	if (CalcFreeItemCellCount() < 5) then
		Say("D� t萿  xin/m阨 d鋘 d裵 b鋍 qu莕 竜 c竎h t� kh玭g thua k衜 5 c� , sau  s� t韎 nh薾 l蕐 tng thng ",0);
		return
	end;
	
--	tl_print(" l蕐 頲 了奖励物品编号："..myQuality..myGenre..myDetail..myParticular..myLevel..myGoodsFive);
	if (myQuality == 0) then
		AddItem(myGenre,myDetail,myParticular,myLevel,myFive,0,0)
		
		if (myDetail==238) or (myDetail==239) or (myDetail==240) or (myDetail==252) then
			WriteLog("[ nhi謒 v� li猲 tng thng ghi ch衟 ]"..date("[%y n╩ %m th竛g %d ng祔 %H l骳 %M ph﹏ ]").." trng m鬰 "..GetAccount().." , vai tr� "..GetName().."在任务链奖励中 l蕐 頲 了宝石一个，宝石的类型编号为："..myDetail)
		end

	else
		AddGoldItem(0,myGenre)
		AddGlobalNews("Th玭g b竜  nh� ch琲 "..GetName().." 因为完成了任务在野叟处 l蕐 頲 了黄Kim 装备一件！！！");
		WriteLog("[ nhi謒 v� li猲 tng thng ghi ch衟 ]"..date("[%y n╩ %m th竛g %d ng祔 %H l骳 %M ph﹏ ]").." trng m鬰 "..GetAccount().." , vai tr� "..GetName().."在任务链奖励中 l蕐 頲 了黄Kim 装备一件，黄Kim 装备编号为："..myGenre)
	end
	Msg2Player("您 l蕐 頲 了一个任务物品奖励！");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();
	
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--加上门派奖励
	Task_NewVersionAward()
end

-- 选择了Kim 钱的奖励
function SelectAward_Money(nAward)

-- 防止多个面版弹出来刷奖励的处理
if (tl_gettaskcourse() == 3) then
	Say("D� t萿  ngi  d蒼 qu� ph莕 thng nga , th� n祇 c遪 mu鑞 n鱝 d蒼 y ? ",0);
	return
end

	Earn(nAward)
	Msg2Player("您 l蕐 頲 了 <color=green>"..nAward.."<color> lng b筩 ");
	
	tl_settaskcourse(3)	
	PayPlayerLinkAward();
	
	-- 如果奖励的Kim 钱数量大于 30W，则记LOG
	if nAward>=300000 then
		WriteLog("[任务链Kim 钱记录]"..
				 date("[%y n╩ %m th竛g %d ng祔 %H l骳 %M ph﹏ ]")..
				 "[ trng m鬰 ]"..GetAccount()..
				 "[ vai tr� ]"..GetName()..
				 " � nhi謒 v� li猲 trung thu 頲 <money>"..nAward.."</money> lng b筩 ch tng thng ");
	end;
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--加上门派奖励
	Task_NewVersionAward()
end

-- 选择了经验值的奖励
function SelectAward_Exp(nAward)

-- 防止多个面版弹出来刷奖励的处理
if (tl_gettaskcourse() == 3) then
	Say("D� t萿  ngi  d蒼 qu� ph莕 thng nga , th� n祇 c遪 mu鑞 n鱝 d蒼 y ? ",0);
	return
end

	tl_addPlayerExp(nAward)
	Msg2Player("您 l蕐 頲 了 <color=green>"..nAward.."<color> ch髏 kinh nghi謒 tr� gi� ");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--加上门派奖励
	Task_NewVersionAward()
end

-- 选择再随机一次的奖励
function SelectAward_Change(nAward)

-- 防止多个面版弹出来刷奖励的处理
if (tl_gettaskcourse() == 3) then
	Say("D� t萿  ngi  d蒼 qu� ph莕 thng nga , th� n祇 c遪 mu鑞 n鱝 d蒼 y ? ",0);
	return
end

	Msg2Player("您 l蕐 頲 了随机再选择一次奖励的机会！");
	
	tl_settaskcourse(3)
	PayPlayerLinkAward();

end

-- 选择了取消的机会
function SelectAward_Cancel(nAward)

local myCancel = 0;
local myNewCancel = GetTask(DEBUG_TASKVALUE);

	-- 防止多个面版弹出来刷奖励的处理
	if (tl_gettaskcourse() == 3) then
		Say("D� t萿  ngi  d蒼 qu� ph莕 thng nga , th� n祇 c遪 mu鑞 n鱝 d蒼 y ? ",0);
		return
	end


	
	myCancel = tl_gettaskstate(4)
	myCancel = myCancel + 1
	
	if myNewCancel==0 then
		myNewCancel = myCancel;
	else
		myNewCancel = myNewCancel + 1;		
	end;
	
	if myNewCancel<=254 then
		-- 再存一次另外的变量
		nt_setTask(DEBUG_TASKVALUE, myNewCancel);
	end;
	
	tl_settaskstate(4, myCancel);
	
	if myCancel<=254 then
		Msg2Player("您 l蕐 頲 了 <color=green>一次取消任务的机会<color>!");
	end;

	WriteLog("[ nhi謒 v� li猲 tng thng ghi ch衟 ]"..
			 date("[%y n╩ %m th竛g %d ng祔 %H l骳 %M ph﹏ %S gi﹜ ]")..
			 "[ trng m鬰 ]"..GetAccount()..
			 "[ vai tr� ]"..GetName()..
			 " � nhi謒 v� li猲 trung thu 頲 h駓 b� c� h閕 tng thng , trc m苩 ch h駓 b� c� h閕 v� <"..myCancel.."> l莕 . ");
	
	tl_settaskcourse(3)	
	PayPlayerLinkAward();
	
	local nBeishu = greatnight_huang_event(4);
	local nTongValueGift = GetTaskTemp(TASKID_TONG_TASKLINKTEMP);
	if (nBeishu > 0) then
		nTongValueGift = floor(nTongValueGift / nBeishu);
	end;
	tongaward_tasklink(nTongValueGift);	--加上门派奖励
	Task_NewVersionAward()
end


-- 发给玩家链奖励、环奖励或者黄Kim 装备
function PayPlayerLinkAward()

local myGolden = {2,6,11,16,21,22,26,31,39,40,42,46,51,54,56,60,61,67,71,76,81,87,92,94,96,101,106,107,115,119,121,122,126,132,136,144,145,146} -- 20 环奖励黄Kim 装备的编号
local nGoldenID = 0

local myTaskTimes = tl_gettaskstate(1)
local myTaskLinks = tl_gettaskstate(2)
local myTaskLoops = tl_gettaskstate(3)

local nTotalTask = tl_counttasklinknum(1);

-- 设置任务完成次数排名
Ladder_NewLadder(10118, GetName(), nTotalTask, 1);

-- 在这里发予固定任务次数的奖励
tl_getlinkaward(Task_AwardLink, nTotalTask);

-- 越南版完成 8000 次任务不做任何处理
if (nTotalTask == 8000) then

--	nGoldenID = myGolden[random(getn(myGolden))]
	
	-- 满 8000 次任务奖励 1E Kim 钱
	Earn(100000000);
	
--	AddGoldItem( 0, nGoldenID )
	
	WriteLog("[ nhi謒 v� li猲 tng thng ghi ch衟 ]"..date("[%y n╩ %m th竛g %d ng祔 %H l骳 %M ph﹏ ]").." trng m鬰 "..GetAccount().." , vai tr� "..GetName().."在任务链奖励中因为完成 8000 次任务 l蕐 頲 了黄Kim 装备一件，黄Kim 装备编号为："..nGoldenID)
	
	AddGlobalCountNews("Th玭g b竜  nh� ch琲 "..GetName().." 因为完成了 8000 次任务在野叟处 l蕐 頲 了门派大黄Kim 装备一件和剑侠币一亿两！！！", 3);
	
	for i=1,3 do
		Msg2Player("恭喜你！！因为你连续完成了 8000 次任务所以 l蕐 頲 了一个极品奖励和一亿两剑侠币！！！");
	end

	return
	
end

storm_ask2start(4, 1)	--Storm 开始挑战

end


--/////任务链的无法进行下去的 BUG 的修补/////

function _TaskLinkDebug()

	if (nt_getTask(1030)==0) and (tl_gettaskcourse()==1) then
		nt_setTask(1030,2);
		tl_savetalkvalue(1,2);
		tl_savetalkvalue(2,2);
		tl_savetalkvalue(3,2);
		tl_savetalkvalue(4,2);
		tl_savetalkvalue(5,2);
		tl_savetalkvalue(6,2);
	end

end


--  ////////////////////////////////////////////////
-- ///// 判断玩家是否刷取消机会的过程 /////////////
--////////////////////////////////////////////////

function _CancelTaskDebug()

local nOrgTask = GetTask(DEBUG_TASKVALUE);
local nDecTask = tl_gettaskstate(4);
local nDiff    = 0;

	if nOrgTask==nDecTask or nOrgTask==0 then
		return 1;
	else
		WriteLog("[ nhi謒 v� li猲 b� l鏸 ghi ch衟 ]"..
				 date("[%y n╩ %m th竛g %d ng祔 %H l骳 %M ph﹏ %S gi﹜ ]")..
				 "[ trng m鬰 ]"..GetAccount()..
				 "[ vai tr� ]"..GetName()..
				 " nhi謒 v� h駓 b� c� h閕 kh玭g u ch� , trc m苩 h駓 b� c� h閕 v� <"..nDecTask.."> , b� ph﹏ ch h駓 b� c� h閕 v� <"..nOrgTask.."> . ");
		return 0;
	end;

end;

--  /////输出任务取消时的 LOG //////////////////////
-- ///// 传入的参数为任务次数和取消任务的机会 /////
--////////////////////////////////////////////////

function _WriteCancelLog(nType, nTime, nCancel)

	if nType==1 then
		WriteLog("[ nhi謒 v� li猲 h駓 b� ghi ch衟 ]"..date("[%y n╩ %m th竛g %d ng祔 %H l骳 %M ph﹏ ]").." trng m鬰 "..GetAccount().." , vai tr� "..GetName().." � nhi謒 v� s� l莕 v� "..nTime.." h駓 b� c� h閕 c遪 th鮝 l筰 "..nCancel.." l骳 h駓 b� m閠 l莕 nhi謒 v� . ");
	else
		WriteLog("[ nhi謒 v� li猲 h駓 b� ghi ch衟 ]"..date("[%y n╩ %m th竛g %d ng祔 %H l骳 %M ph﹏ ]").." trng m鬰 "..GetAccount().." , vai tr� "..GetName().." � nhi謒 v� s� l莕 v� "..nTime.." l骳 d飊g 100 t� x� t綾  h駓 b� m閠 l莕 nhi謒 v� . ");
	end;

end;
