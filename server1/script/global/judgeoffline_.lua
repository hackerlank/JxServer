--用户选择离线托管时的脚本
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua");
Include("\\script\\global\\judgeoffline_limit.lua");		-- 2006年10月30日加入限制在所有城市车夫旁和 Thi猲 vng 帮托管的脚本  by peres
Include("\\script\\item\\ib\\zimudai.lua");
Include("\\script\\lib\\player.lua")
Include("\\script\\trip\\define.lua")

arraymap = 
	{
		["1"] = " phng tng ",
		["11"] = " th祅h  ",
		["37"] = " bi謓 kinh ",
		["80"] = " Dng Ch﹗ ",
		["78"] = " tng dng ",
		["162"] = " Чi L� ",
		["176"] = " trc khi an ",
		["20"] = " giang t﹏ th玭 ",
		["53"] = " ba l╪g huy襫 ",
		["54"] = " nam nh筩 tr蕁 ",
		["99"] = " v躰h nh筩 tr蕁 ",
		["100"] = " Chu ti猲 tr蕁 ",
		["101"] = " o hng th玭 ",
		["121"] = " long m玭 tr蕁 ",
		["153"] = " th筩h c� tr蕁 ",
		["174"] = " long tuy襫 th玭 ",
		["13"] = " Nga Mi ",
		["25"] = " Л阯g m玭 ",
		["49"] = " ng祔 nh蒼 ",
		["59"] = " Thi猲 vng ",
		["81"] = " V� Л琻g ",
		["103"] = " Thi誹 L﹎ ",
		["115"] = " C竔 Bang ",
		["131"] = " C玭 L玭 ",
		["154"] = " th髖 kh鉯 ",
		["183"] = " n╩ c ",
--		["208"]	= " i lao ",
		-- LLG_ALLINONE_TODO_20070802
		["235"] = " hoa o o  m閠 ",
		["236"] = " hoa o o  hai ",
		["237"] = " hoa o o  ba ",
		["238"] = " hoa o o  b鑞 ",
		["239"] = " hoa o o  n╩ ",
		["240"] = " hoa o o  s竨 ",
		["241"] = " hoa o o  b秠 ",
		["835"] = " V� danh c鑓 ( m閠 )",
		["836"] = " V� danh c鑓 ( hai )",
		["837"] = " V� danh c鑓 ( ba )",
		["838"] = " V� danh c鑓 ( b鑞 )",
		["839"] = " V� danh c鑓 ( n╩ )",
		["840"] = " V� danh c鑓 ( s竨 )",
		["586"] = " c玭g c閚g bang h閕 b秐  m閠 ",
		["587"] = " s琻 th祅h bang h閕 b秐  ",
		["588"] = " Mi猽 Cng bang h閕 b秐  ",
		["589"] = " sa m筩 bang h閕 b秐  ",
		["590"] = " kinh s� bang h閕 b秐  ",
		["591"] = " b猲 t綾 bang h閕 b秐  ",
		["593"] = " Giang Nam bang h閕 b秐  ",
		["594"] = " tuy誸 l躰h bang h閕 b秐  ",
		["595"] = " c玭g c閚g bang h閕 b秐  hai ",
		["596"] = " c玭g c閚g bang h閕 b秐  ba ",
		["597"] = " c玭g c閚g bang h閕 b秐  b鑞 ",
	};

function judgeoffline(player_count, offline_count)
		
	-- szHour = date("%H");
	-- nHour = tonumber(szHour);
	
	-- sparetime = GetTask(AEXP_TASKID);	
	-- if (nHour >= AEXP_INVALIDTIMEBEGIN and nHour < AEXP_INVALIDTIMEEND) then 
	-- 		Say("<> ngi � y <color=red>"..AEXP_INVALIDTIMEBEGIN..":00<color>-<color=red>"..AEXP_INVALIDTIMEEND..":00<color> th阨 gian 畂筺 b猲 trong l鵤 ch鋘 c竎h tuy課 b祔 qu秐 , c� th� ti誴 t鬰 b祔 s筽 giao d辌h , nh璶g l� s� kh玭g t 頲 kinh nghi謒 tr� gi� , s� kh玭g t� ng nh薾 l蕐 ph骳 duy猲 . kho秐g th阨 gian n祔 h� th鑞g s� kh玭g kh蕌 tr� ngi c竎h tuy課 b祔 qu秐 th阨 gian , m� ngi nh璶g ti課 h祅h tr� ch琲 th阨 gian l� s� ti誴 t鬰 t輓h to竛 . ", 2, "Ngi nh蕋 nh ph秈 ti課 v祇 c竎h tuy課 b祔 qu秐 sao ?/judgecontion", "T筸 th阨 kh玭g c莕 . /donothing");
	-- 		return 5
	-- else
	--     judgecontion();
	-- end 	
	judgecontion();
	
	return 0
end

function judgecontion()
--	do
--		Talk(1, "", "C竎h tuy課 b祔 qu秐 ch鴆 n╪g t総 ")
--		return
--	end

	--如果到达这一步那么成功开始离线托管
	local tbSpareTime = {};
										--特效大白驹丸	普通大白驹丸	白驹丸
	local tbAexpTask = {AEXP_TIANXING_TIME_TASKID,AEXP_SPECIAL_TIME_TASKID,AEXP_TASKID, AEXP_SMALL_TIME_TASKID,
											--特效技能大白驹丸	技能大白驹丸	技能白驹丸
												AEXP_SPECIAL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SMALL_SKILL_TASKID};
	local btime = 0;
	for i = 1, getn(tbAexpTask) do
		tbSpareTime[i] = {};
		tbSpareTime[i][1] = GetTask(tbAexpTask[i]);
		tbSpareTime[i][2], tbSpareTime[i][3] = getFrame2MinAndSec(tbSpareTime[i][1]);	--给用户提示显示到分钟
		if (tbSpareTime[i][1] >= FRAME2TIME * 60 and btime ~= 1) then
			btime = 1;
		end;
	end;
	
	
	if (btime == 1 and IsCharged() == 1) then
		local nSkillExpID = GetTask(AEXP_SKILL_ID_TASKID);
		local szSkillExpName = "";
		if (nSkillExpID ~= 0) then
			szSkillExpName = "<color=yellow>"..GetSkillName(nSkillExpID).."<color>";
		else
			szSkillExpName = "<color=blue>Ch ch k?ng<color>";
		end
		
		local szmsg = format("Ngi c竎h tuy課 b祔 qu秐 c遪 th鮝 l筰 th阨 gian l� : c hi謚 r� r祅g c﹗ ho祅 <color=red>%d<color> gi� <color=red>%d<color> ph﹏ "..
	"<enter> r� r祅g c﹗ ho祅 <color=red>%d<color> gi� <color=red>%d<color> ph﹏ "..
	"<enter> b筩h c﹗ ho祅 <color=red>%d<color> gi� <color=red>%d<color> ph﹏ "..
	"<enter> c hi謚 ti猲 th秓 l� <color=red>%d<color> gi� <color=red>%d<color> ph﹏ "..
	"<enter> k� n╪g  thu莕 th鬰 (%s): c hi謚 k� n╪g r� r祅g c﹗ ho祅 <color=red>%d<color> gi� <color=red>%d<color> ph﹏ "..
	"<enter> k� n╪g r� r祅g c﹗ ho祅 <color=red>%d<color> gi� <color=red>%d<color> ph﹏ "..
	"<enter> k� n╪g b筩h c﹗ ho祅 <color=red>%d<color> gi� <color=red>%d<color> ph﹏ "..
	"<enter> b祔 qu秐 l骳 n誹 nh� c� c hi謚 r� r祅g c﹗ ho祅 hi謚 qu� , 璾 ti猲 theo nh� n祔 hi謚 qu� cho c飊g kinh nghi謒 c騨g kh蕌 tr� k� i 鴑g hi謚 qu� th阨 gian . ", 
					tbSpareTime[1][2],tbSpareTime[1][3],
					tbSpareTime[2][2],tbSpareTime[2][3],
					tbSpareTime[3][2],tbSpareTime[3][3],
					tbSpareTime[4][2],tbSpareTime[4][3],
					szSkillExpName, tbSpareTime[5][2],tbSpareTime[5][3],
					tbSpareTime[6][2],tbSpareTime[6][3],
					tbSpareTime[7][2],tbSpareTime[7][3]);
		local szSay =
		{	" b総 u c竎h tuy課 b祔 qu秐 /beginoffline",
			" l鵤 ch鋘 c竎h tuy課 b祔 qu秐 k� n╪g /selectofflineskill('judgecontion')",
			" b総 u � tuy課 b祔 qu秐 /begin_onlinecommission",
			" k誸 th骳 � tuy課 b祔 qu秐 /end_onlinecommission",
			" nh薾 l蕐 c竎h tuy課 tng thng /offlineaward",
			" ta suy ngh� m閠 ch髏 n鱝 /donothing"
		};
		Describe(szmsg, getn(szSay), szSay[1], szSay[2], szSay[3], szSay[4], szSay[5], szSay[6]);
	else
		if (IsCharged() ~= 1) then
			Talk(1, "", "<> thi誹 ph� sung tr� gi� nh綾 nh� ? ");
			return
		end;
		--beginoffline();
		--用户剩余的时间
		Say("<>Th 竎h gian c l t筩  th kinh nghi B ng h C Ho y猽 c b l?color=red>0<color> ph﹏ . Ngi c?th?s?dg i B ng h C Ho y猽 c Bi khi猰 ho s� l?i B ng h C Ho y猽  tg th 竎h gian  th c mh. <enter>ho s� l?ch<color=yellow>  th r 竎h mg mi c� ph?color>, c n ph� ch?c?th?nh nh�  m ch l﹗ tri誴 kinh nghi.",
			3,
			" b総 u c竎h tuy課 b祔 qu秐 /beginoffline",
			" nh薾 l蕐 c竎h tuy課 tng thng /offlineaward",
			" ta suy ngh� m閠 ch髏 n鱝 /donothing");
	end
end

-- 开始在线托管
function begin_onlinecommission()
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	
	--判断用户剩余的时间
	local sparetime = getsparetime();
	if (sparetime <= 0) then
		Say("<> ngi c遪 th鮝 l筰 c竎h tuy課 b祔 qu秐 th阨 gian l� 0 ph髏 . m阨/xin ngi s� d鬾g c竎h tuy課 b祔 qu秐 v藅 ph萴 , s� d鬾g n鱝 n猲 ch鴆 n╪g . ", 0);
		return 3
	end

	if (GetOnlineCommissionStatus() ~= 0) then
		Msg2Player("<> ngi trc m苩 kh玭g x� vu � tuy課 b祔 qu秐 tr筺g th竔 ")
	else
		Msg2Player("B総 u � tuy課 b祔 qu秐 ")
		SetOnlineCommissionStatus(1)
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tbegin_onlinecommission, last online time:%s",
						GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
		--EnableClientInput(0)
	end
end

-- 结束在线托管
function end_onlinecommission()
	if (GetOnlineCommissionStatus() == 0) then
		Msg2Player("<> � tuy課 b祔 qu秐 b総 u ")
	else
		SetOnlineCommissionStatus(0)
		--EnableClientInput(1)
		Msg2Player("<> � tuy課 b祔 qu秐 k誸 th骳 ")
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tend_onlinecommission, last online time:%s",
							GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
	end
end

function check_if_can_offline()
	
	local nTripMode = GetTripMode()
	if nTripMode == TRIP_MODE_SERVER then
		Talk(1, "", "Xin i hi lng th?kh t莕 g th?s?dg th ng  th t t筩 server c t莕 g cg")
		return 1
	end
	--首先判断用户所在的区域
	mapid = SubWorldIdx2MapCopy(SubWorld);
	strmapid = ""..mapid.."";
	--没有在当前地图上
	if (arraymap[strmapid] == nil) then
		Say("<> ngi kh玭g th� � n琲 n祔 khu v鵦 s� d鬾g c竎h tuy課 b祔 qu秐 ch鴆 n╪g , m阨/xin ngi n tng 鴑g c nh khu v鵦  bao g錷 t蕋 c� th祅h tr蕁  th玭 trang c飊g v韎 th藀 i b猲 trong m玭 ph竔  s� d鬾g c竎h tuy課 b祔 qu秐 . ", 0);
		return 1
	end
	
	-- 判断是否在某些限制区域，比如说车夫、 Thi猲 vng 帮等
	if offlineCheckPermitRegion()~=1 then
		Say("<> ngi kh玭g th� � n琲 n祔 khu v鵦 s� d鬾g c竎h tuy課 b祔 qu秐 ch鴆 n╪g , m阨/xin ngi n tng 鴑g c nh khu v鵦  bao g錷 t蕋 c� th祅h tr蕁  th玭 trang c飊g v韎 th藀 i b猲 trong m玭 ph竔  s� d鬾g c竎h tuy課 b祔 qu秐 . ", 0);
		return 1;
	end;
	
	--判断用户的战斗状态
	if (GetFightState() ~= 0) then 
		Say("<> ngi trc m総 x� vu tr筺g th竔 chi課 u trung , kh玭g c竎h n祇 ti課 v祇 c竎h tuy課 b祔 qu秐 tr筺g th竔 , m阨/xin ngi ti課 v祇 kh玭g ph秈 l� tr筺g th竔 chi課 u sau s� d鬾g n鱝 c竎h tuy課 b祔 qu秐 . ", 0);
		return 2
	end
	
	--判断用户剩余的时间
	local sparetime = getsparetime();
	if (sparetime <= 0) then
		Say("<> ngi c遪 th鮝 l筰 c竎h tuy課 b祔 qu秐 kinh nghi謒 th阨 gian l� 0 ph髏 , ho芻 l� c騨g kh玭g l鵤 ch鋘 c竎h tuy課 b祔 qu秐 k� n╪g , xin/m阨 l莕 n鱝 x竎 nh薾 sau s� d鬾g n鱝 n猲 ch鴆 n╪g . ", 0);
		return 3
	end
	
	-- 当一台服务器的人数超过800人，则不允许玩家在这台服务器内进行离线托管
	player_count = GetPlayerCount();
	local nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_LIMIT;
	if (mapid >= 835 and mapid <= 840) then
		nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_SPECIAL;--750
	end;
	if (player_count > nmax_count_limit) then
		Say("<> b﹜ gi� c竔 ch� n祔 th藅 s� l� ngi ta t蕄 n藀 , ngi c遪 l� n nh鱪g th� kh竎 th祅h tr蕁  th玭 trang ho芻 l� m玭 ph竔 n鱝 ti課 h祅h c竎h tuy課 b祔 qu秐 甶 . ",0);
		return 4
	end
	
	
end

function beginoffline()	
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	-- 判断是否在在线托管
	if (GetOnlineCommissionStatus() ~= 0) then
		Say("<> ngi trc m苩 x� vu � tuy課 b祔 qu秐 tr筺g th竔 ", 0)
		return 1
	end
	-- 开始离线挂机
	OfflineLive(PlayerIndex);
end

--什么都不做的函数，可能多个地方调用到，修改得时候请注意
function donothing()
	
end

TASKID_OFFLINELIVE_EXP = {
	AEXP_SMALL_TIME_TASKID,
	AEXP_TASKID,
	AEXP_SPECIAL_TIME_TASKID,
	AEXP_TIANXING_TIME_TASKID
}

TASKID_OFFLINELIVE_SKILL = {
	AEXP_SMALL_SKILL_TASKID,
	AEXP_SKILL_TIME_TASKID,
	AEXP_SPECIAL_SKILL_TASKID
}

function getsparetime()
	--判断用户剩余的时间
	local nLeftTime = 0
	for i = 1, getn(TASKID_OFFLINELIVE_EXP) do
		nLeftTime = nLeftTime + GetTask(TASKID_OFFLINELIVE_EXP[i])
	end
	if (GetTask(AEXP_SKILL_ID_TASKID) ~= 0) then
		local nTime = 0
		for i = 1, getn(TASKID_OFFLINELIVE_SKILL) do
			nTime = nTime + GetTask(TASKID_OFFLINELIVE_SKILL[i])
		end
		if (nLeftTime < nTime) then
			nLeftTime = nTime
		end
	end
	return nLeftTime
end

-- 选择离线托管技能
function selectofflineskill()
	local aryExpSkill = getexpskill();
	local nExpSkillCount = getn(aryExpSkill);
	local aryszExpSkill = {};
	local szSayCmd = " xin/m阨 l鵤 ch鋘 ng礽 c莕 c竎h tuy課 b祔 qu秐 k� n╪g ";
	for i = 1, nExpSkillCount do
		aryszExpSkill[i] = format("%s/onSetUpgradeSkill(%d)",aryExpSkill[i][2],aryExpSkill[i][1]);
	end
	tinsert(aryszExpSkill, "Tr?l t筩 /judgecontion")
	Say(szSayCmd, getn(aryszExpSkill), aryszExpSkill);
end

-- 设置离线托管技能
function onSetUpgradeSkill(nUpgradeSkillID)
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
	judgecontion();
end

function offlineaward()
	local player = Player:New(PlayerIndex)
	DynamicExecute(
		"\\script\\global\\offlineaward.lua",
		"dlg_offlineaward",
		player)
end
