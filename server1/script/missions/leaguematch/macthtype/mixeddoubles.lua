Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============混合双人赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部混合双人赛相关数据
WLLS_DATA = {
	
	name = "song u nam n�",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10248,
			map = {
				{396, 560, 397, "(1)"},
				{398, 561, 399, "(2)"},
				{400, 562, 401, "(3)"},
				{402, 563, 403, "(4)"},
				{404, 564, 405, "(5)"},
				{406, 565, 407, "(6)"},
				{408, 566, 409, "(7)"},
				{410, 567, 411, "(8)"},
			},
		},
		{
			name = "",
			level = 2,
			ladder = 10249,
			map = {
				{540, 570, 541, "(1)"},
				{542, 571, 543, "(2)"},
				{544, 572, 545, "(3)"},
				{546, 573, 547, "(4)"},
				{548, 574, 549, "(5)"},
				{550, 575, 551, "(6)"},
				{552, 576, 553, "(7)"},
				{554, 577, 555, "(8)"},
			},
		},
	},
	
	award_rank = {
		{	--排行奖励，新秀
			{1, 1500},	--第1名
			{2, 1200},	--第2名
			{3, 1000},	--第3名
			{4, 800},	--第4名
			{8, 500},	--第5-8名
			{16, 300},	--第9-16名
			{32, 200},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}, {	--联赛
			{1, 1500},	--第1名
			{2, 1200},	--第2名
			{3, 1000},	--第3名
			{4, 800},	--第4名
			{8, 500},	--第5-8名
			{16, 300},	--第9-16名
			{32, 200},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}
	},
	
	max_member = 2,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"本次新秀联赛将士song u nam n髂Ｊ剑蠹铱梢宰杂沙闪⒄蕉樱α废芭浜�",
		"本次新秀联赛将士song u nam n髂Ｊ剑蠹铱梢宰杂沙闪⒄蕉樱α废芭浜�",
	},
	
	addmem_ex	= ", y猽 c莡 <color=red> nam n� <color>",	--组建战队额外要求（可选）

	--====Functions====
	
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> l莕 n祔 "..str_des.." 参加 <color=red>song u nam n�<color>.你可以自己建立战队，也可以参加他人的战队。在队长与他人组队后，将"..str_des.." c飊g quan vi猲 i tho筰 , l鵤 ch鋘 tranh t礽 i ng� "..str_des.." l藀 t鴆 t筼 th祅h chi課 i . th祅h vi猲 s� lng nhi襲 nh蕋 v� <color=red>2 ngi <color=red>, c莕 kh竎 ph竔 .",
				"Ta mu鑞 t筼 "..str_des.." i/wlls_want2create",
				"Ta ch� 甶 ngang qua/OnCancel")
			return
		end
	
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> ngi chi課 i trc m総 v� <color=yellow>"..str_lgname.."<color><enter>"
		.. " chi課 i i trng :"..join(wlls_get_mems(n_lid), "Chi課 i th祅h vi猲 :") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow> ch� �  h� qu� tranh t礽 h筺 ch� v� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n誹 nh� mu鑞 tranh t礽 , xin/m阨 th祅h l藀 m韎 chi課 i .<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ngi c� th� ch鋘 <color=red> gia nh藀 nh鱪g kh竎 i <color> ho芻 l� <color=red> r阨 甶 tranh t礽 i <color>.<enter><enter>"..
			" th祅h l藀 chi課 i bc : � <color=red> th阨 gian ngh� ng琲 c飊g tranh t礽 th阨 gian <color>, c騨g c� th� thay v� h緉 nh� ch琲 h鋚 th祅h i , <color=red> kh竎 ph竔 <color>, l鵤 ch鋘 c飊g  cho c飊g i gia nh藀 v鑞 i . <enter>"..
			" r阨 甶 tranh t礽 : � <color=red> th阨 gian ngh� ng琲 <color>, ngi c� th� r阨 甶 tranh t礽 i , � tranh t礽 th阨 gian n誹 nh� ngi kh玭g ph秈 l� i <color=red> kh玭g gia nh藀 thng k� tranh t礽 <color>, ngi c� th� r阨 甶 tranh t礽 i , n誹 nh�  tham gia th� kh玭g th� r阨 甶 . i trng t� c竎h 甧m b� chuy觧 giao cho nh鱪g i vi猲 kh竎 <color=yellow> n誹 nh� kh玭g c� th祅h vi猲 , chi課 i 甧m b� gi秈 t竛 <color>."
			tb_option[getn(tb_option)+1] = "Th猰 th祅h vi猲 v祇 i/wlls_want2addmember"
		else
			str = str.."<enter> ngi c� th� l鵤 ch鋘 r阨 甶 i .<enter><enter>"..
			" c竎h i  � <color=red> th阨 gian ngh� ng琲 <color>, ngi c� th� r阨 甶 tranh t礽 i , � tranh t礽 th阨 gian n誹 nh� m譶h ch tranh t礽 i <color=red> kh玭g gia nh藀 l莕 trc tranh t礽 <color>, ngi c� th� r阨 甶 tranh t礽 i , n誹 nh� gia nh藀 tranh t礽 th� kh玭g th� r阨 甶 ."
		end
		tb_option[getn(tb_option)+1] = "Ta mu鑞 r阨 i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t譶h h譶h thi u hi謓 t筰/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� 甶 ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--检查当前角色是否可以加入指定的战队
	check_addmem = function(nCapIdx, nLGID, nMType)
		print(nMType, wlls_player_type())
		if (nMType ~= wlls_player_type()) then
		 	return " th藅 xin l鏸 , i v韎 b猲 trong i vi猲 :"..GetName().." c飊g <color=red> tham gia tranh t礽 lo筰 h譶h <color> ngi chi課 i kh玭g h頿 , cho n猲 , kh玭g th� v祇 ngi chi課 i !"
		end
		local nOldIdx = PlayerIndex
		PlayerIndex = nCapIdx
		local nSex	= GetSex()
		PlayerIndex = nOldIdx
		if (nSex == GetSex()) then
			return "本次比武按照男女song u nam n髂Ｊ剑阋乙桓鲆煨�!"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(7,WLLS_DATA)
