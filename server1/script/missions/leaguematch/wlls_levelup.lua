Include( "\\script\\missions\\leaguematch\\head.lua" )

--置越级状态
function wlls_set_over(str_lgname, str_plname)
	local n_over = GetGlbValue(GLB_WLLS_SID)
	if (GetGlbValue(GLB_WLLS_PHASE) == 1) then	--间歇期算下一个赛季
		n_over = n_over + 1
	end
	LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_OVER, n_over, "", "")
end

--升级检查
function wlls_leveupcheck()
	local str_plname = GetName();
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then	--无战队
		return
	end
	
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_over = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_OVER)
	if (n_over > 0) then	--早已越级
		return
	end

	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	local n_level = WLLS_TAB[n_mytype].match_type[n_mtype].level
	if (n_level == 1) then	--新秀战队成员，判断是否越级
		if (GetLevel() >= WLLS_LEVEL_SENIOR) then	--已经越级
			wlls_set_over(str_lgname, str_plname)
			Msg2Player("Ъng c蕄 c馻 b筺  cao h琻 119, kh玭g th� tham gia <color=yellow>v� l﹎ li猲 u ki謙 xu蕋<color> nh璶g b筺 c� th� tham gia <color=yellow>v� l﹎ li猲 u<color> .")
			return
		end
	end

	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_JOB)
	if (n_mytype == 3 and n_job == 0) then	--师徒联赛，判断徒弟是否越级
		if (GetLevel() >= 90) then	--已经越级
			wlls_set_over(str_lgname, str_plname)
			Msg2Player("Ъng c蕄 qu� cao so v韎 quy nh <color=yellow>song u s� <color> c� th� tham gia h譶h th鴆 kh竎 <color=yellow>tam u<color>. Trc ti猲 ph秈 l藀 i")
			return
		end
	end
end
