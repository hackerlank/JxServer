Include("\\script\\event\\storm\\head.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\lib\\say.lua")
Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数

IncludeLib("FILESYS")
IncludeLib("TITLE")
IncludeLib("ITEM")

--danh 次的文字描述
TB_STORM_LADDERNAME = {"Qu竛 qu﹏", "� qu﹏", "H筺g 3", " H筺g 4", " H筺g 5",
	"H筺g 6", " H筺g 7", " H筺g 8", " H筺g 9", " H筺g 10", "kh玭g c� trong b秐g x誴 h筺g", "Kh玭g c� x誴 h筺g"}

--武林盟传人	
STORM_WLMCR = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>V� l﹎ truy襫 nh﹏<link>"

--检查指定的awardtype
--awardid == nil	返回：积ph髏+/-排行	可以l穘h取的所有奖励
--awardid > 0		返回：nil不可以l穘h取	否则返回积ph髏+/-排行
function storm_checkaward(awardtype, awardid)
	storm_anotherday()
	
	if (awardtype == nil or TB_STORM_AWARD[awardtype] == nil) then
		return nil
	end
	
	if (GetTask(TB_STORM_AWARD[awardtype][3]) > 0) then
		Say("Xin l鏸! "..TB_STORM_AWARD[awardtype][1].."ph莕 thng c馻 ngi  nh薾 qua r錳!", 0)
		return nil
	end
	
	local awardvalue = 0
	if (TB_STORM_AWARD[awardtype][2] == 1) then
		awardvalue = -storm_getrank(awardtype)	--用负数作比较更方便
	else
		awardvalue = GetTask(TB_STORM_AWARD[awardtype][4])
	end
	
	if (awardid == nil) then
		local tb_award = {}
		local awardlevel = awardvalue
		for i = 1, getn(TB_STORM_AWARD[awardtype][5]) do
			if (awardvalue >= TB_STORM_AWARD[awardtype][5][i][1]) then
				if (awardlevel == TB_STORM_AWARD[awardtype][5][i][1] or getn(tb_award) == 0) then	--不能l穘h低级奖励
					awardlevel = TB_STORM_AWARD[awardtype][5][i][1]
					tb_award[getn(tb_award)+1] = i
				end
			end
		end
		return awardvalue, tb_award
	else
		if (awardvalue < TB_STORM_AWARD[awardtype][5][awardid][1]) then
			Say("V� l﹎ truy襫 nh﹏: H譶h nh� ngi kh玭g th� nh薾 ph莕 thng n祔!", 0)
			return nil
		else
			return awardvalue
		end
	end
end

--主对话
function storm_main()
	if (GetTask(STORM_TASKID_LETTER) ~= 2) then
		Describe(STORM_WLMCR.."<#> Ki誴 giang h� l蕐 s玭g n骾 l� nh�! Ng萵g m苩 nh譶 tr╪g, cu鑙 u mh譶 nc! Ch顃 ngh� n c﹗ th�: V� th� 阯g i b籲g ph糿g m穒, anh h飊g h祇 ki謙 c� h琻 ai!", 1, "B総 u ho箃 ng Phong ba th竛g 9/storm_main")
		Msg2Player("B筺 nh薾 頲 b秐 th秓 th莕 b� c馻 Th萴 Thi謚 Vi詎")
		AddItem(6, 1, 898, 1, 0 ,0)
		SetTask(STORM_TASKID_LETTER, 2)
	else
		local tb_option = {}
		tb_option[getn(tb_option)+1] = "Ta mu鑞 l穘h ph莕 thng h玬 nay/#storm_award(1)"
		if (GetTask(STORM_TASKID_DAY_LASTAWARD) == 0) then
			tb_option[getn(tb_option)+1] = "Ta mu鑞 l穘h ph莕 thng h玬 qua/#storm_award(4)"
		end
		tb_option[getn(tb_option)+1] = "Ta mu鑞 l穘h ph莕 thng tu莕 trc/#storm_award(2)"
		tb_option[getn(tb_option)+1] = "Ta mu鑞 l穘h ph莕 thng th竛g trc/#storm_award(3)"
		tb_option[getn(tb_option)+1] = "T譵 hi觰 甶觤 t輈h l騳 c馻 ta/#storm_query(0)"
		tb_option[getn(tb_option)+1] = "T譵 hi觰 ho箃 ng Phong Ba/storm_help"
		tb_option[getn(tb_option)+1] = "Kh玭g c莕!/OnCancel"
		Describe(STORM_WLMCR.."<#> Xin xem th玭g tin chi ti誸 ho箃 ng tr猲 trang ch� ", getn(tb_option), tb_option)
	end
	storm_anotherday()
end

--l穘h取奖励（查看奖励）
function storm_award(awardtype)
	local awardvalue, tb_award = storm_checkaward(awardtype)
	if (awardvalue == nil) then
		return
	end
	
	local str = ""
	if (awardvalue >= 0) then
		str = "B筺 "..TB_STORM_AWARD[awardtype][1].."t輈h l騳 Phong Ba l�:"..storm_point2str(awardvalue)
	elseif (awardvalue == -12) then
		str = TB_STORM_AWARD[awardtype][1].."kh玭g c� trong b秐g x誴 h筺g"
	elseif (awardvalue == -11) then
		str = "B筺 "..TB_STORM_AWARD[awardtype][1].."kh玭g c� trong b秐g x誴 h筺g"
	elseif (awardvalue >= -3) then
		str = "B筺 "..TB_STORM_AWARD[awardtype][1].."trong ho箃 ng Phong ba th竛g 9"..storm_point2str(TB_STORM_LADDERNAME[-awardvalue])
	else
		str = "B筺 "..TB_STORM_AWARD[awardtype][1].."trong ho箃 ng Phong ba th竛g 9排danh "..storm_point2str(-awardvalue).."danh "
	end
	
	local awardcount = getn(tb_award)
	if (awardcount > 0) then
		local tb_option = {}
		if (awardcount == 1) then
			str = str..", B筺 可以l穘h取奖品: <enter>"
			str = str.."<color=green>"..TB_STORM_AWARD[awardtype][5][tb_award[1]][2].."<color><enter>"
			str = str.."<enter>, nh薾 b﹜ gi� ch�?"
			Say("V� l﹎ truy襫 nh﹏:"..str, 2, "Ta mu鑞 nh薾 ph莕 thng/#storm_getaward("..awardtype..","..tb_award[1]..",0)", "в ta suy ngh� l筰/OnCancel")
		else
			str = str..", B筺 可以T筰以下奖苝h髏腥窝∫桓�: <enter>"
			for i = 1, getn(tb_award) do
				if (i >= 2) then
					str = str.."ho芻   "
				end
				local awardname = TB_STORM_AWARD[awardtype][5][tb_award[tb_award[i]]][2]
				str = str.."<color=green>"..awardname.."<color><enter>"
				tb_option[getn(tb_option)+1] = "l穘h"..awardname.."/#storm_getaward("..awardtype..","..tb_award[i]..",0)"
			end
			str = str.."<enter> Quy誸 nh xong ch璦?"
			tb_option[getn(tb_option)+1] = "Kh玭g c莕!/OnCancel"
			Say("V� l﹎ truy襫 nh﹏:"..str, getn(tb_option), tb_option)
		end
	else
		Say("V� l﹎ truy襫 nh﹏:"..str..", B筺 无法l穘h奖", 0)
		return
	end
end

--l穘h取指定奖品
function storm_getaward(awardtype, awardid, sure)
	local awardvalue = storm_checkaward(awardtype, awardid)
	if (not storm_checkaward(awardtype, awardid)) then
		return
	end

	if (sure == 1) then
		Say("l穘h奖前整理背包!", 2, "Ta  s絥 s祅g!/#storm_getaward("..awardtype..","..awardid..",2)", "Ta c遪 ph秈 s緋 x誴 l筰 h祅h trang/OnCancel")
	elseif (sure == 2) then
		if (CalcFreeItemCellCount() < storm_countallaward(TB_STORM_AWARD[awardtype][5][awardid][3])) then
			Say("B筺 的背包没有空间，整理一下!", 0)
		else
			if (awardtype == 1 or awardtype == 4) then
				local mapid = tostring(SubWorldIdx2ID(SubWorld))
				local plcount = GetGlbValue(46) + 1
				SetGlbValue(46, plcount)
				Ladder_NewLadder(10195, mapid, plcount, 1)
			end
			local str = "Nh薾 頲"..TB_STORM_AWARD[awardtype][1].."Ph莕 thng t輈h l騳 Phong Ba "..TB_STORM_AWARD[awardtype][5][awardid][2]
			WriteLog("[STORM_AWARD]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\t"..awardvalue.."\t"..str)
			Msg2Player(str)
			SetTask(TB_STORM_AWARD[awardtype][3], 1)
			storm_giveallaward(TB_STORM_AWARD[awardtype][5][awardid][3])
			if (awardvalue >= 0) then
				str = awardvalue.."甶觤 t輈h l騳 Phong Ba"
			else
				str = "X誴 h筺g th� "..(-awardvalue).."danh "
			end
			if (awardtype == 2 or awardtype == 3 or awardid <= 2) then	--大奖发布公告
				AddGlobalNews(GetName().."T筰"..TB_STORM_AWARD[awardtype][1].."风暴活动中Nh薾 頲"..TB_STORM_AWARD[awardtype][5][awardid][2].." ")
			end
		end
	else
		Say("B筺 确定l穘h取<color=red>"..TB_STORM_AWARD[awardtype][5][awardid][2].."<color> 是吗? l穘h完之后不能l穘h了"..TB_STORM_AWARD[awardtype][1].."ph莕 thng kh竎 n鱝!", 2, "知道了! 我只l穘h这个算了！/#storm_getaward("..awardtype..","..awardid..",1)", "Kh玭g c莕!/OnCancel")
	end
end

--查询个人甶觤 t輈h l騳 Phong Ba情况
function storm_query(querytype)
	storm_anotherday()
	
	local str = ""
	local tb_sheet = {}
	local var_width, var_align
	if (querytype == 1) then
		if (GetTask(STORM_TASKID_DAY) <= STORM_END_DAY) then
			str = "B筺 今nh藅 的甶觤 t輈h l騳 Phong Ba如下: <enter>%今nh藅 总积ph髏是:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT))
			var_width = {12,8,8,10}
			var_align = 2
			tb_sheet[getn(tb_sheet)+1] = {"活动danh ", "S� l莕", "Tr筺g th竔 ", "觤 t輈h l騳 cao nh蕋"}
			for i = 1, STORM_GAMEID_MAX do
				if (TB_STORM_TASKID[i] ~= nil) then
					local trycount = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
					local state = ""
					if storm_valid_game(i) then
						state = "<color=red>正T筰进行<color>"
					elseif (trycount <= 0) then
						state = "<color=blue>Ch璦 ti課 h祅h<color>"
					elseif (trycount < TB_STORM_TRYTIMES[i]) then
						state = "<color=green>Х ti課 h祅h<color>"
					else
						state = "<color=8947848>Х k誸 th骳<color>"
					end
					tb_sheet[getn(tb_sheet)+1] = {
						storm_gamename(i),
						storm_point2str(trycount).."/"..TB_STORM_TRYTIMES[i],
						state,
						storm_point2str(GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX]))
					}
				end
			end
		else
			str = "ho箃 ng <color=red>Phong ba th竛g 9<color>  k誸 th骳!"
		end
	elseif (querytype == 2) then
		str = "  B筺 最近的t輈h l騳 Phong Ba l�:<enter>%s"
		var_width = {8,10,6,8,10}
		var_align = 2
		tb_sheet[getn(tb_sheet)+1] = {
			"觤 t輈h l騳 h玬 nay", storm_point2str(GetTask(STORM_TASKID_DAY_POINT)), "",
			"觤 t輈h l騳 h玬 qua", storm_point2str(GetTask(STORM_TASKID_DAY_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"觤 t輈h l騳 tu莕 n祔", storm_point2str(GetTask(STORM_TASKID_WEEK_POINT)), "",
			"觤 t輈h l騳 tu莕 trc", storm_point2str(GetTask(STORM_TASKID_WEEK_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"觤 t輈h l騳 th竛g n祔", storm_point2str(GetTask(STORM_TASKID_MONTH_POINT)), "",
			"觤 t輈h l騳 th竛g trc", storm_point2str(GetTask(STORM_TASKID_MONTH_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"上Tu莕排danh ", "<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(2)].."<color>", "",
			"上nguy謙 排danh ", "<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(3)].."<color>"
		}
	else
		Say("B筺 想了解什么问题?", 3, "我今天的甶觤 t輈h l騳 Phong Ba/#storm_query(1)", "我最近的甶觤 t輈h l騳 Phong Ba/#storm_query(2)", "Kh玭g c� chuy謓 g� u!/OnCancel")
		return
	end
	str = format(str, maketable(tb_sheet, var_width, var_align))
	Say(str, 2, "Ti誴 t鬰 t譵 hi觰/#storm_query(0)", "Kh玭g c� g�, c竚 琻!/OnCancel")
end

--活动说明——总
function storm_help()
	local tb_option = {}
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i] ~= nil) then
			tb_option[getn(tb_option)+1] = "Li猲 quan ho箃 ng Phong Ba-"..TB_STORM_DESCRIBE[i].."gi髉 /#storm_help_game("..i..")"
		end
	end
	tb_option[getn(tb_option)+1] = "Li猲 quan ph莕 thng ho箃 ng Phong Ba/#storm_help_award(0)"
	tb_option[getn(tb_option)+1] = "Ta bi誸 r錳!/OnCancel"
	Say("  风暴活动从8/9/n2/10, 包括宋金战场, 野叟任务链, 杀手试炼任务. 每天将会根据系统中的成绩给出<color=yellow>甶觤 t輈h l騳 Phong Ba<color> (参加条件: 50级以上玩家) .每nh藅 m蕐ph髏将T筰<color=red>24:00之后清零<color>, 请T筰24:00前l穘h奖.<enter>. 每天 <color=red>23:30<color> 宋金战场开始, 成绩不记录进甶觤 t輈h l騳 Phong Ba.", getn(tb_option), tb_option)
end

--活动说明——挑战
function storm_help_game(gameid)
	local str = TB_STORM_HELP[gameid]
	if (gameid == 1) then	--宋金需要补充说明ph髏数上限
		str = format(str, "高级宋金战场, 每人每天最多只能l穘h取的甶觤 t輈h l騳 Phong Ba是<color=yellow>100<color> 点. 初中级宋金战场最多ph髏别Nh薾 頲<color=yellow>80<color>, <color=yellow>90<color> 点.")
	end
	Say(str, 2, "Mu鑞 t譵 hi觰 nh鱪g th� kh竎/storm_help", "Ta bi誸 r錳!/OnCancel")
end

--活动说明——奖励
function storm_help_award(awardtype,start)
	if (awardtype == 0) then
		Say("  每天玩家可以n武林传人处, 根据<color=red>甶觤 t輈h l騳 Phong Ba<color> 可以l穘h取相应的奖励, 同时，每Tu莕，每nguy謙 都有相应的甶觤 t輈h l騳 Phong Ba排行<color=red>排danh 前十<color>可以T筰当nguy謙 的第二个星期n武林传人处l穘h奖", 4,
			"Xem ph莕 thng ng祔/#storm_help_award(1)",
			"Xem ph莕 thng tu莕/#storm_help_award(2)",
			"Xem ph莕 thng th竛g/#storm_help_award(3)",
			"Ta bi誸 r錳!/OnCancel")
		return
	end
	
	local tb_awardstr = {"nh藅 ", "Tu莕", "nguy謙 "}
	local str = "甶觤 t輈h l騳 Phong Ba"..tb_awardstr[awardtype].."Ph莕 thng nh� sau:"
	if (not start) then
		start = 1
	end
	local lastvalue = nil
	local count = 0
	local PERPAGE = 4
	for i = start, getn(TB_STORM_AWARD[awardtype][5]) do
		if (count > PERPAGE) then	--PERPAGE项一页
			break
		end
		count = count + 1
		
		local awardvalue = TB_STORM_AWARD[awardtype][5][i][1]
		if (lastvalue ~= awardvalue) then
			if (awardvalue >= 0) then
				str = str.."<enter>".."T輈h l騳"..storm_point2str(awardvalue,3).."ph髏"
			else
				if (lastvalue) then
					str = str.."<enter>"..tb_awardstr[awardtype].."排T筰第"..storm_point2str(1-lastvalue).."n"..storm_point2str(-awardvalue).."m蕐"
				else
					str = str.."<enter>"..tb_awardstr[awardtype].."排T筰第"..storm_point2str(-awardvalue).."m蕐"
				end
			end
			lastvalue = awardvalue
		else
			str = str.."ho芻   "
		end
		str = str.."<color=yellow>"..TB_STORM_AWARD[awardtype][5][i][2].."<color>"
	end
	local tb_option = {}
	if (start > 1) then
		tb_option[getn(tb_option)+1] = "Trang trc/#storm_help_award("..awardtype..","..(start-PERPAGE)..")"
	end
	if (start + count < getn(TB_STORM_AWARD[awardtype][5])) then
		tb_option[getn(tb_option)+1] = "Trang k� /#storm_help_award("..awardtype..","..(start+PERPAGE)..")"
	end
	tb_option[getn(tb_option)+1] = "想Mu鑞 t譵 hi觰 nh鱪g th� kh竎/storm_help"
	tb_option[getn(tb_option)+1] = "我Ta bi誸 r錳!/OnCancel"
	Say(str, getn(tb_option), tb_option)
end

--Nh薾 頲该玩家T筰指定排行中的danh 次
function storm_getrank(laddertype)
	local ladderid = nil
	if (laddertype == 1) then	--nh藅 排行，暂无
		return 12
	elseif (laddertype == 2) then	--Tu莕排行
		local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
		if(weekid >= 1 and weekid <= 4) then 	--只有2、3、4、5Tu莕有上Tu莕
			ladderid = STORM_LADDERID_WEEK1 + weekid - 1
		end
	elseif (laddertype == 3) then	--nguy謙 排行
		if (GetTask(STORM_TASKID_MONTH) == 10) then	--只有10nguy謙 有上Tu莕
			ladderid = STORM_LADDERID_MONTH
		end
	else
		return 12
	end
	
	if (ladderid == nil) then
		return 12
	end
	
	local playername = GetName()
	for i = 1, 10 do
		if (playername == Ladder_GetLadderInfo(ladderid, i)) then
			return i
		end
	end
	return 11
end

--可升级的加经验
function storm_addownexp( awardexp )
	tl_addPlayerExp(awardexp)
end

--给与全部奖励
function storm_giveallaward(tb_awards)
	for i = 1, getn(tb_awards) do
		storm_giveoneaward(tb_awards[i])
	end
end

--给与一个奖励
function storm_giveoneaward(tb_award)
	local awardtype = tb_award[1]
	local awardcount = tb_award[3]
	if (awardtype == 1) then	--普通物品
		while (awardcount > 0) do
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddItem("..join(tb_award[2])..")")
			AddItem(storm_splittb(tb_award[2]))
			awardcount = awardcount - 1
		end
	elseif (awardtype == 2) then	--黄金物品
		while (awardcount > 0) do
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddGoldItem("..join(tb_award[2])..")")
			AddGoldItem(storm_splittb(tb_award[2]))
			awardcount = awardcount - 1
		end
	elseif (awardtype == 3) then	--非物品
		if (tb_award[2] == 1) then	--经验
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddOwnExp("..awardcount..")")
			storm_addownexp(awardcount)
		else	--留作扩展
			WriteLog("storm_giveoneaward : error tb_award[2]")
		end
	elseif (awardtype == 4) then	--随机物品
		while (awardcount > 0) do
			local giveindex = random(getn(tb_award[2]))
			storm_giveoneaward(tb_award[2][giveindex])
			awardcount = awardcount - 1
		end
	else
		WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tstorm_giveoneaward : error awardtype")
	end
end

--估算全部奖励物品数量
function storm_countallaward(tb_awards)
	local count = 0
	for i = 1, getn(tb_awards) do
		if (tb_awards[i][1] == 1) then	--普通物品
			count = count + tb_awards[i][3]
		elseif (tb_awards[i][1] == 2) then	--黄金物品
			count = count + tb_awards[i][3]*2
		elseif (tb_awards[i][1] == 4) then	--随机物品
			count = count + tb_awards[i][3]*2
		end
	end
	return count
end

--将数组拆开
function storm_splittb(tb, n)
	if (n == nil) then
		n = 1
	end
	if (n == getn(tb)) then
		return tb[n]
	end
	return tb[n], storm_splittb(tb,n+1)
end
