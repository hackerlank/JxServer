--武林联赛官员

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )
Include("\\script\\lib\\log.lua")


--主对话框
function main()
	local n_level = wlls_getcityinfo()
	if (not wlls_CheckIsOpen(n_level)) then
		return
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (not FALSE(n_lid)) then
		--检查并提示找错官员的情况
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_mylevel = WLLS_TAB[n_mytype].match_type[n_mtype].level
		if (n_mylevel ~= n_level) then
			wlls_descript("<enter> c竎 h�  gia nh藀 <color=red>"..WLLS_LEVEL_DESC[n_mylevel].."<color> 甶觤 vinh d� ta l� <color=red>"..WLLS_LEVEL_DESC[n_level].."<color> 甶觤 vinh d�, c� ph秈 hay kh玭g t譵 l閚 ngi ?", wlls_add_option({}, "Kh玭g c� chuy謓 g� "))
			return
		end
		
		--判断是否越级
		local str = wlls_levelcheck(GetName())
		if (str) then
			Say(wlls_npcname()..str, 3,
				"Ta mu鑞 r阨 kh醝 i!/wlls_want2leaveleague",
				"Ta mu鑞 l穘h thng/wlls_wantaward",
				"Ta ch� ti謓 gh� qua/OnCancel")
			return
		end
	end

	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local str = "<enter>  "..WLLS_TAB[n_next].text_main[n_level]
	local str_des = WLLS_LEVEL_DESC[n_level]
	local tb_option = {}
	tb_option[getn(tb_option) + 1] = "Ta mu鑞 n "..str_des.." h閕 trng/wlls_want2signmap"
	tb_option[getn(tb_option) + 1] = " "..str_des.." nh鉳/wlls_mylg"
	tb_option[getn(tb_option) + 1] = "Ta mu鑞 l穘h ph莕 thng li猲 u/wlls_wantaward"
	tb_option[getn(tb_option) + 1] = "Ki觤 tra 甶觤 vinh d�/wlls_ShowRespect"
	tb_option[getn(tb_option) + 1] = "T総 m� nh薾 kinh nghi謒/wlls_show_expswitch"
	wlls_descript(str, wlls_add_option(tb_option, "Ta ch� ti謓 gh� qua"))
end

--领取奖励（对话）
function wlls_wantaward()
	local n_matchphase = GetGlbValue( GLB_WLLS_PHASE )
	local str_des = wlls_get_desc(1)
	local n_awardmin = wlls_get_award_min()
	local str = "<enter> Gi秈 thng li猲 u bao g錷 甶觤 <color=red>x誴 h筺g<color> 甶觤 vinh d� v� 甶觤 <color=red>vinh d�<color> 甶觤 vinh d�. Sau khi k誸 th骳 giai 畂筺 li猲 u <color=red> d鵤 v祇 s� tr薾 chi課 th緉g<color> 甶觤 vinh d�  x誴 th� h筺g. <color=red>"..n_awardmin.." i x誴 h筺g cao nh蕋<color> 甶觤 vinh d� s� nh薾 頲 <color=red>ph莕 thng c bi謙<color> 甶觤 vinh d�.C� th� d飊g 甶觤 vinh d�  mua v藅 ph萴!"
	local tb_option = {}
	if (n_matchphase == 1) then
		tb_option[getn(tb_option)+1] = "Ta mu鑞 nh薾 ph莕 thng x誴 h筺g!/wlls_wantaward_rank"
		tb_option[getn(tb_option)+1] = "Ta mu鑞 nh薾 ph莕 thng danh hi謚!/wlls_wantaward_title"
	end
	tb_option[getn(tb_option)+1] = "Ta mu鑞 i 甶觤 vinh d�/wlls_buy_honour"
	tb_option[getn(tb_option)+1] = "Ta mu鑞 i 甶觤 uy t輓/wlls_buy_Respect"
	
	tb_option[getn(tb_option)+1] = "Ta ch� ti謓 gh� qua/OnCancel"
	wlls_descript(str, tb_option)
end

--领取排名奖励（对话）
function wlls_wantaward_rank()
	--检查排名奖励	
	local nAward, nLevel, szLGName, nRank = wlls_checkaward_rank()
	if nAward then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[nLevel][nAward]
		local str = "<enter>  Chi課 i: <color=yellow>"..szLGName.."<color> 甶觤 vinh d� trong "..str_des.." x誴 h筺g <color=yellow>"..nRank.."<color> 甶觤 vinh d�. Nh薾 頲 "..tb_award[2].." 甶觤 danh v鋘g."
		if (tb_award[3]) then	--有队长额外奖励
			if (LG_GetMemberTask(WLLS_LGTYPE, szLGName, GetName(), WLLS_LGMTASK_JOB) == 1) then
				str = str.." i trng nh薾 頲 "..tb_award[3].." 甶觤 danh v鋘g."
			end
		end
		str = str.." c� mu鑞 l躰h kh玭g ?"
		wlls_descript(str,
			"L躰h thng!/wlls_getaward_rank",
			"Tr� v�!/OnCancel")
		return
	end
end

--检查是否可以领取排名奖励，返回可以领的类型，nil为不可领
function wlls_checkaward_rank(b_silent)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then	--刚好在跨赛季的时候要领奖
		if (not b_silent) then
			Msg2Player("Trc m総 li猲 cu閏 so t礽  ti課 h祅h m韎 li猲 cu閏 so t礽 , kh玭g th� d蒼 l莕 trc li猲 cu閏 so t礽 ng h祅g tng thng .")
		end
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local str_des = wlls_get_desc(1)
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_awardmin = wlls_get_award_min()
	local n_rank = 0
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > n_awardmin) then
		if (not b_silent) then
			wlls_descript("<enter> l莕 n祔 "..str_des.." <color=red>"..n_awardmin.."<color> 甶觤 vinh d� trc m総  ng h祅g , gi鑞g nh� c竎 h� ch chi課 i kh玭g c� � b猲 trong !"..n_awardmin.."  cho ta gi髉 ngi ki觤 tra m閠 c竔 ")
		end
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter> ng tng r籲g gia nh藀 nh鱪g kh竎 ti觰 t� l� c� th� t韎 gi� m筼 d蒼 tng . h� k� ngi tr� l筰 甶 !")
		end
		return nil
	end
	if (GetByte(GetTask(WLLS_TASKID_GOTAWARD), 1) >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter> c竎 h�  d蒼 tng li評 , mu鑞 g箃 ta sao ?")
		end
		return nil
	end
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb_award = WLLS_TAB[n_type].award_rank[n_level]
	local n_award
	for i = getn(tb_award), 1, -1 do
		if (tb_award[i][1] >= n_rank) then
			n_award = i
		else
			break
		end
	end
	return n_award, n_level, str_lgname, n_rank
end

--领取称号奖励
function wlls_wantaward_title()
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then
		Msg2Player("Х ti課 h祅h li猲 u, kh玭g th� nh薾 thng!")
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_rank
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > 4) then
		Say(wlls_npcname().." gi秈 thng ch� gi祅h cho "..wlls_get_desc(1).." xu蕋 s綾 nh蕋(4 i h筺g u) . Ngi kh玭g thu閏 trong nh鉳 , ng ph� r鑙!", 0)
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		wlls_descript("<enter> ng tng r籲g gia nh藀 t� i l� c� th� gi� m筼 t韎 nh薾 thng. Ngi tr� l筰 甶 !")
		return nil
	end
	local n_title = WLLS_AWARD_TITLE[n_level] + n_rank - 1
	
	
	if (n_level == 2) then
		if WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)] then
			n_title = WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)][n_rank]
		end
	end
	
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	
	local nTime	= nMon * 1000000 + nDay * 10000	-- 持续到下届联赛结束
	_M("Title_AddTitle", n_title, nTime)
	
	--Remove武林盟主豪光，在add新的豪光之前- Modified by DinhHQ - 20110524
	if Title_GetActiveTitle() == 3000 then
		Title_RemoveTitle(3000)		
	end
	if GetSkillState(1500) ~= -1 then
		RemoveSkillState(1500)
	end
		
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	
	
	SetTask(1122, n_title)	--当前玩家领取的是哪个头衔ID
	local tb = {"V� мch ", " � qu﹏ ", "H筺g Ba", "H筺g T�"}
	Msg2Player("C竎 h� ngi t 頲 danh hi謚 <color=yellow>"..wlls_get_desc(1)..tb[n_rank].."<color> 甶觤 vinh d�! n猲 danh hi謚 c� th� duy tr� <color=yellow>20<color> 甶觤 vinh d� ng祔 .")
end

--最终领取排行奖励
function wlls_getaward_rank()
	local n_award, n_level, str_lgname, nRank = wlls_checkaward_rank();
	if (n_award) then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[n_level][n_award]
		local n_got = GetGlbValue(GLB_WLLS_SID)
		n_got = SetByte(n_got, 4, n_type)
		n_got = SetByte(n_got, 3, n_level)
		n_got = SetByte(n_got, 2, n_award)
		SetTask(WLLS_TASKID_GOTAWARD, n_got)
		local nPoint	= tb_award[2]
		Msg2Player("Ch骳 m鮪g, b筺 t 頲 "..str_des.." danh hi謚: Gi� tr� vinh d� "..tb_award[2].." 甶觤")
		wlls_award_log(format("获得排名奖 %s: 名望值%d  甶觤",
											str_des, tb_award[2]))
		if (tb_award[3]) then	--有队长额外奖励
			--该判断只对队长不能转移的情况（师徒赛）安全
			if (LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB) == 1) then
				nPoint	= nPoint + tb_award[3]
				Msg2Player("Ch骳 m鮪g, b筺 t 頲 "..str_des.."danh hi謚, gi秈 thng(i trng): Gi� tr� vinh d� "..tb_award[3].." 甶觤")
				wlls_award_log(format("获得排名奖 %s (队长): 名望值 %d  甶觤",
											str_des, tb_award[3]))
			end
		end
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		wlls_award_log(format("T鎛g c閚g c� %d danh v鋘g  ", GetTask(WLLS_TASKID_HONOUR)))
		
		if (nRank == 1) then -- 获得第一名 荣誉排行榜 联赛值加1
		    local nCurPoint = GetTask(2601);
		    nCurPoint = nCurPoint + 1;
		    SetTask(2601, nCurPoint);
		end

		SyncTaskValue(WLLS_TASKID_HONOUR)
	end
end

--检查是否可以建立战队
function wlls_cancreate(n_level)
	local n_mylevel = wlls_player_level()
	--等级限制
	if (n_mylevel ~= n_level) then
		if (n_level == 1) then
			if (n_mylevel < n_level) then
				wlls_descript("<enter>  <color=red>V� l﹎ li猲 u<color> 甶觤 vinh d� h閕 t� t蕋 c� c竎 anh h飊g, nh璶g c蕄  c馻 b筺 kh玭g ! Ph秈 t level "..WLLS_LEVEL_JUNIOR.." tr� l猲 th� m韎 c� th� tham gia!")
			else
				wlls_descript("<enter> c竎 h�  l� nh nh n鎖 danh giang h� i hi謕 , <color=red> v� l﹎ t﹏ t� li猲 cu閏 so t礽 <color> 甶觤 vinh d� l� mu鑞 ch鋘 l鵤 tu鎖 tr� t礽 cao ngi c馻 m韎 , ngi c莕 � ph輆 sau trc m苩 a b靚 uy phong sao ? n誹 kh玭g ngi tham gia <color=red> v� l﹎ li猲 cu閏 so t礽 <color> 甶觤 vinh d� 甶 !")
			end
		else
			wlls_descript("<enter> <color=red> v� l﹎ li猲 cu閏 so t礽 <color> 甶觤 vinh d� v蒼 l� anh h飊g thi猲 h� luy謓 ki誱 ch� , c蕄 b薱 c馻 ngi kh玭g  !"..WLLS_LEVEL_SENIOR.." c蕄 , anh h飊g thi猲 h� t� t藀 , m r錸g hang h� , ch� s� ngi ch糿g qua l� h藆 b鑙 , t鑤 nh蕋 l� luy謓 nhi襲 t藀 !")
		end
		return nil
	end
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()))) then
		wlls_descript("<enter> c竎 h� v祇 i r錳 , kh玭g th� th祅h l藀 i kh竎!")
		return nil
	end
	return wlls_player_type()
end

--我的战队
function wlls_mylg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local n_type

	if (FALSE(n_lid)) then
		n_type = GetGlbValue(GLB_WLLS_NEXT)
	else
		n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)		
	end
	
	WLLS_TAB[n_type].npc_mylg()
end

function wlls_want2create()
	local n_level = wlls_getcityinfo()
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	if (not wlls_cancreate(n_level)) then return end
	wlls_descript("<enter>"..WLLS_TAB[n_next].text_creat,
		"Ta mu鑞 l藀 i!/wlls_inputstr_lgname",
		"Suy ngh� l筰/OnCancel")
end

--输入战队名
function wlls_inputstr_lgname()
	local n_level = wlls_getcityinfo()
	if (not wlls_cancreate(n_level)) then return end
	AskClientForString("wlls_createleague", "", 1, 16, "Nh藀 v祇 t猲 nh鉳")
end

--建立战队（最终）
function wlls_createleague(str_lgname)
	if (not str_lgname) then
		str_lgname = GetName()
	end
	local n_level = wlls_getcityinfo()
	local n_mtype = wlls_cancreate(n_level)
	if (not n_mtype) then return end
	str_lgname = strsub(str_lgname,1,16)
	local forbidstr={" ","\"","/","#","|","\t","\n"}
	local str
	for i = 1, getn(forbidstr) do
		if (not FALSE(strfind(str_lgname,forbidstr[i]))) then
			str = "Xin l鏸! T猲 kh玭g 頲 c� k� t�: "
			for i = 1, getn(forbidstr) do
				if (forbidstr[i]==" ") then
					str = str .. " [Space]"
				elseif (forbidstr[i]=="|") then
					str = str .. " [ ch魀 h譶h ]"
				elseif (forbidstr[i]=="\t") then
					str = str .. "[TAB]"
				elseif (forbidstr[i]=="\n") then
					str = str .. " [Enter]"
				else
					str = str .. forbidstr[i]
				end
			end
			break
		end
	end
	if (not str) then
		if (not FALSE(LG_GetLeagueObj(WLLS_LGTYPE, str_lgname))) then
			str = "Xin l鏸! T猲 nh鉳  頲 s� d鬾g"
		elseif (FALSE(ST_CheckTextFilter(str_lgname))) then
			str = "Xin l鏸! T猲 nh鉳 c� k� t� kh玭g ng"
		end
	end
	if (str) then
		Say(wlls_npcname()..str, 2, "Nh藀 l筰!/wlls_inputstr_lgname", "Kh玭g c莕!/OnCancel")
		return
	end
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local szParam = GetName().." "..n_next.." "..n_mtype.." "..str_lgname
	LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, GetName(), "\\script\\leaguematch\\league.lua", "wlls_create", szParam , "", "")
	
	
	SetRespect(0)
end


--添加成员（对话）
function wlls_want2addmember()
	local teammember, _, str_lgname = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local str = wlls_npcname().." ngi ngh� ngi ph輆 di "..getn(teammember).." gia nh藀 t� i ["..str_lgname.."] ph秈 kh玭g ?<enter>";
	for i = 1, getn(teammember) do
		str = str.." <color=yellow>"..teammember[i];
	end

	Say(str, 2, "Cho gia nh藀 /wlls_sure2addmember","Kh玭g c莕!/OnCancel")
end

--添加成员（最终）
function wlls_sure2addmember()
	local teammember = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local str_lgname = LG_GetLeagueInfo(n_lid)
	for i = 1, getn(teammember) do
		local nPlayerIndex = SearchPlayer(teammember[i])
		if nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, SetRespect, 0)
			local szParam = teammember[i].." "..str_lgname.." "..GetName()
			LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, teammember[i], "\\script\\leaguematch\\league.lua", "wlls_add", szParam , "", "")
		end	
	end
end

--检查组队队员是否可以被添加到当前队伍中，Th祅h c玭g 返回组队队员名单、战队类型、战队名，否则返回nil
function wlls_checkteam()
	if (IsCaptain() ~= 1) then
		Say(wlls_npcname().." th藅 xin l鏸 ! ngi c莕 l� <color=red> i trng <color> 甶觤 vinh d� � <color=red> ti觰 t� <color> 甶觤 vinh d�, m韎 c� th� ghi danh gia nh藀 chi課 i i vi猲 .",0)
		return nil
	end

	local teamsize = GetTeamSize()
	if (teamsize < 2) then
		Say(wlls_npcname().." ngi ti觰 t� gi鑞g nh� kh玭g c� nh鱪g kh竎 t� th祅h vi猲 , ngi mu鑞 cho ngi n祇 ti課 v祇 m譶h t� sao ?",0)
		return nil
	end

	local n_lid, n_mtype, n_job, str_lgname, n_mcount = wlls_lg_info()
	if (FALSE(n_lid)) then
		Say(wlls_npcname().." th藅 xin l鏸 ! ngi kh玭g c� th祅h l藀 ti觰 t� , kh玭g th�  cho nh鱪g ngi kh竎 ti課 v祇 ti觰 t� !", 0)
		return nil
	end
	if (n_job ~= 1) then
		Say(wlls_npcname().." th藅 xin l鏸 ! ngi kh玭g ph秈 l� i trng , kh玭g th� cho nh鱪g ngi kh竎 ti課 v祇 ti觰 t� !", 0)
		return nil
	end
	local n_next	= GetGlbValue(GLB_WLLS_NEXT)
	local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	if (n_stype ~= n_next) then
		Say(wlls_npcname().." th藅 xin l鏸 ! l莕 sau li猲 cu閏 so t礽 lo筰 h譶h kh玭g thay i , ngi chi課 i trc m総  n k� , kh玭g th� ti誴 t鬰 s� d鬾g .", 0)
		return nil
	end
	local n_maxmem = WLLS_TAB[n_next].max_member
	n_mcount = n_maxmem - n_mcount
	if (n_mcount <= 0) then
		Say(wlls_npcname().." th藅 xin l鏸 ! ngi chi課 i ["..str_lgname.."]   ngi , kh玭g th� l筰 th猰 v祇 th祅h vi猲 !",0)
		return nil
	end
	if (GetTeamSize()-1 > n_mcount) then
		Say(wlls_npcname().." th藅 xin l鏸 ! ngi chi課 i ["..str_lgname.."] ch� c莕 l莕 n鱝 a v祇 "..n_mcount.." ngi , kh玭g th�  cho t蕋 c� c馻 ngi th祅h vi猲 gia nh藀 , xin cho c遪 s鉻 l筰 th祅h vi猲 t筸 th阨 r阨 甶 ti觰 t� !",0)
		return nil
	end

	local teammember = {}
	local str_capname = GetName()
	local n_capidx = PlayerIndex
	for i = 2 , teamsize do
		PlayerIndex = GetTeamMember(i)
		local membername = GetName()
		--避免重复加入队员
		if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, membername))) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname().." th藅 xin l鏸 ! � ti觰 t� i vi猲 :"..membername.."  l� nh鱪g chi課 i kh竎 th祅h vi猲 , cho n猲 , kh玭g th� v祇 ngi chi課 i !", 0)
		 	return nil
		end
		--加入队员特殊检查
		local str = wlls_check_addmem(n_capidx, n_lid, n_mtype)
		if (str) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname()..str, 0)
		 	return nil
		end
		teammember[i-1] = membername
	end
	PlayerIndex = n_capidx
	return teammember, n_mtype, str_lgname
end

--离开战队（对话）
function wlls_want2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if (FALSE(n_lid)) then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB)
	local str = wlls_npcname().." ngi ngh� r阨 甶 chi課 i ["..str_lgname.."] ph秈 kh玭g?"
	if(n_memcount <= 1) then
		str = str .. " ngi b﹜ gi� l� <color=red> duy nh蕋 th祅h vi猲 <color> 甶觤 vinh d� � ngi chi課 i . n誹 nh� ngi r阨 甶 chi課 i , chi課 i 甧m b� gi秈 t竛 ."
	elseif (not FALSE(n_job)) then
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_type == 3) then	--师徒赛
			str = str .. " trc m総 ngi l� <color=red> i trng ( s� ph� )<color> 甶觤 vinh d� n誹 nh� ngi r阨 甶 chi課 i ,   c馻 ngi 甧m <color=red> kh玭g th� tham gia li猲 cu閏 so t礽 <color> 甶觤 vinh d�."
		else	--其他联赛
			str = str .. " trc m総 ngi l� <color=red> i trng <color> 甶觤 vinh d�, n誹 nh� ngi r阨 甶 ti觰 t� , i trng ch鴆 v� 甧m chuy觧 giao cho th祅h vi猲 kh竎 ."
		end
	end
	Say(str, 2, "цi v韎 !/wlls_sure2leaveleague","Kh玭g c莕!/OnCancel")
end

--离开战队（确认对话）
function wlls_sure2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	Say(wlls_npcname().." khi ngi r阨 甶 ti觰 t� sau , 甧m <color=yellow> kh玭g th� nh薾 l蕐 chi課 i tng thng <color> 甶觤 vinh d�, ngi x竎 nh mu鑞 r阨 甶 sao ?", 2, "цi v韎 !/wlls_leaveleague_final","Kh玭g c莕!/OnCancel")
end

--离开战队（最终）
function wlls_leaveleague_final()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	LG_ApplyDoScript(WLLS_LGTYPE, "", GetName(), "\\script\\leaguematch\\league.lua", "wlls_leave", GetName() , "", "")
end

--进入会场（对话）
function wlls_want2signmap()
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	
	if (n_matchphase < 2) then
		Say(wlls_npcname()..": li猲 u 產ng trong giai 畂筺 ngh� ng琲, h閕 trng li猲 u t筸 th阨 ng!", 0)
		return 
	end
		
	local n_level, n_group = wlls_getcityinfo()
	local n_lid, n_mtype = wlls_check_player(GetName(), n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (FALSE(n_lid)) then
		local str_des = wlls_get_desc(1)
		if (WLLS_TAB[n_type].max_member == 1) then
			wlls_descript("B筺 ch璦 c� "..str_des.." nh鉳, n誹 tham gia v祇 li猲 u, ch髇g t玦 s� t筼 cho b筺 m閠 nh鉳", "Ta mu鑞 t筼 nh鉳!/#wlls_createleague()", "Kh玭g c莕!/OnCancel")
		else
			wlls_descript("<enter> l莕 n祔 "..str_des.." nh鉳, ph秈 c� chi課 i m韎 c� th� v祇 h閕 trng!")
		end
		return
	end

	if (not WLLS_TAB[n_type].match_type[n_mtype].map[n_group]) then
		n_group = 1
	end
	--记录入场地 甶觤
	local x,y,z = GetWorldPos();
	SetTask(WLLS_TASKID_FROMMAP, x);
	SetTask(WLLS_TASKID_FROM_X, y);
	SetTask(WLLS_TASKID_FROM_Y, z);

	--传送到报名 甶觤地图
	local n_signmap = wlls_get_mapid(1, n_mtype, n_group)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	Msg2Player("B筺 n <color=yellow>"..wlls_get_desc(3, n_mtype, n_group).."<color> 甶觤 vinh d� khu v鵦 li猲 u")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhThamGiaLienDau")
end

--检查是否可以离开战队。可以返回n_lid，否则返回nil,原因字符串
function wlls_check_leavelg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if(n_lid == 0) then
		return nil, "Ngi v蒼 kh玭g c� ti課 v祇 chi課 i !"
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_phase = GetGlbValue(GLB_WLLS_PHASE)
	if(n_phase ~= 1 and n_total ~= 0) then
		return nil, "B雐 v� ngi chi課 i 產ng li猲 cu閏 so t礽 , ngi kh玭g th� r阨 甶 chi課 i , xin i n li猲 cu閏 so t礽 ho祅 tr� l筰 !"
	end
	
	if(n_phase > 3) then
		return nil, "ng li猲 cu閏 so t礽 , kh玭g th� r阨 甶 chi課 i , xin ch� ch髏 m閠 cu閏 th阨 gian ngh� ng琲 m韎 c� th� r阨 甶 ."
	end
	
	return n_lid
end

--取得当前联赛排名奖励至少需要多少名
function wlls_get_award_min()
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_level = wlls_getcityinfo()
	local tb = WLLS_TAB[n_type].award_rank[n_level]
	return tb[getn(tb)][1]
end

--经验领取开关
function wlls_show_expswitch()
	local b_exps = GetBit(GetTask(WLLS_TASKID_SWITCH), 1)
	local str = "<enter> l莕 n祔 v� l﹎ li猲 cu閏 so t礽 tng thng r蕋 phong ph� , n誹 nh� c竎 ngi mu鑞 s� d鬾g kinh nghi謒 tr� gi� s� t韎 ta ch� n祔 , m� ra kinh nghi謒 tr� gi� , ngi c� th� kh鉧 l筰 m譶h kinh nghi謒 tr� gi� tng thng .<enter>"
	str = str.."<enter> trc m総 ngi t総 / m� ra tr筺g th竔 v� "..iif(b_exps == 0, "<color=red> m� ra color> ( c� th� nh薾 l蕐 kinh nghi謒 tr� gi� ) ", "<color=red> t総 <color> 甶觤 vinh d� ( kh玭g th� nh薾 l蕐 kinh nghi謒 tr� gi� ) ")..""
	wlls_descript(str, iif(b_exps == 0, "Ta mu鑞 t総 tng thng /wlls_set_expswitch(1)", "Ta mu鑞 m� ra tng thng /wlls_set_expswitch(0)"), "T鑤 , ta th祅h l藀 t鑤 l緈 !/OnCancel")
end

--设置经验领取开关
function wlls_set_expswitch(b_exps)
	local n_switch = GetTask(WLLS_TASKID_SWITCH)
	SetTask(WLLS_TASKID_SWITCH, SetBit(n_switch, 1, b_exps))
	Talk(1, "wlls_show_expswitch", "Th祅h c玭g "..iif(b_exps == 0, "M� ra ", "T総 ").." li猲 cu閏 so t礽 kinh nghi謒 tng thng !")
end

--用荣誉换取商品
function wlls_buy_honour()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end

	Msg2Player("B筺 c� <color=yellow>"..GetTask(WLLS_TASKID_HONOUR).."<color> 甶觤 vinh d� 甶觤 vinh d�")
	if (GetBoxLockState() == 0) then
		Sale(146,11) -- 商店的荣誉积分编号为11
	else
		Say(wlls_npcname().."请M� ra 箱子锁后再买! ", 0)
	end
end


function wlls_ShowRespect()
	Talk(1, "", "觤 vinh d� c馻 b筺 hi謓 t筰 l� <color=yellow>"..GetRespect().."<color> 甶觤 vinh d�")
end

--用荣誉换取商品
function wlls_buy_Respect()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end
	--在名望商店取消卖道具的限制- Modified by DinhHQ - 20110429
--	local nDate = tonumber(GetLocalDate("%d"))
--	if (nDate >= 8 and nDate <= 28) then
--		Talk(1, "", "目前不能Ⅱ名望道具")
--		return 
--	end
	
	
	Msg2Player("B筺 產ng c� <color=yellow>"..GetRespect().."<color> 甶觤 vinh d�")
	if (GetBoxLockState() == 0) then
		Sale(173,13) -- 商店的荣誉积分编号为11
	else
		Say(wlls_npcname().."请M� ra 箱子锁后再买! ", 0)
	end
end