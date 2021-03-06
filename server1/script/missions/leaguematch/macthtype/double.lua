--==============双人赛相关数据===============
Include("\\script\\missions\\leaguematch\\tb_head.lua")

if (not tmp_process_data) then
	return
end

--全部双人赛相关数据
WLLS_DATA = {

	name = "song u t� do",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10196,
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
			ladder = 10197,
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
			{1, 2000},	--第1名
			{2, 1500},	--第2名
			{3, 1200},	--第3名
			{4, 1000},	--第4名
			{8, 800},	--第5-8名
			{16, 500},	--第9-16名
			{32, 300},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}, {	--联赛
			{1, 2000},	--第1名
			{2, 1500},	--第2名
			{3, 1200},	--第3名
			{4, 1000},	--第4名
			{8, 800},	--第5-8名
			{16, 500},	--第9-16名
			{32, 300},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}
	},
	
	max_member = 2,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"本次武林新秀联赛为 <color=red>song u t� do<color>",
		"本次武林新秀联赛为<color=red>song u t� do<color>",
	},
	
	--====Functions====
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> "..str_des.."是<color=red>song u t� do<color>. 你可以自选比赛队伍或者加入其他比赛队伍。队长与其他玩家组队后去"..str_des.." i tho筰 v韎 quan vi猲 li猲 u  ng k� "..str_des.." nh鉳. 1 i t鑙 產 <color=red>2 ngi<color>",
				"Ta mu鑞 l藀 "..str_des.." i/wlls_want2create",
				"Kh玭g c莕/OnCancel")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>Chi課 i <color=yellow>"..str_lgname.."<color><enter>"
		.. "чi trng:"..join(wlls_get_mems(n_lid), "th祅h vi猲:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>Li猲 u gi韎 h筺 b雐 <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, h穣 t筼 ra m閠 chi課 i.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ngi c� th� l鵤 ch鋘 <color=red> gia nh藀 nh鱪g kh竎 i <color> ho芻 l� <color=red> r阨 甶 tranh t礽 i <color>.<enter><enter>"..
			" Th祅h l藀 h鋚 th祅h i qu� tr譶h , � <color=red> th阨 gian ngh� ng琲 c飊g tranh t礽 th阨 gian <color>, ngi c� th� c飊g nh鱪g kh竎 nh� ch琲 h鋚 th祅h i , l鵤 ch鋘 i h鱱 gia nh藀 tranh t礽 i .<enter>"..
			" R阨 甶 tranh t礽 i ng�  � <color=red> th阨 gian ngh� ng琲 <color>, ngi c� th� r阨 甶 tranh t礽 i ng� , � tranh t礽 th阨 gian , n誹 nh� ngi tranh t礽 i ng� <color=red> kh玭g gia nh藀 thng k� tranh t礽 <color>, ngi c� th� r阨 甶 tranh t礽 i ng� . n誹 nh�  tham gia th� kh玭g th� r阨 甶 . i trng t� c竎h s� chuy觧 giao cho th祅h vi猲 kh竎 <color=yellow> n誹 nh� kh玭g c� th祅h vi猲 , chi課 i 甧m b� gi秈 t竛 <color>."
			tb_option[getn(tb_option)+1] = "Th猰 th祅h vi猲 v祇 i/wlls_want2addmember"
		else
			str = str.."<enter>       B筺 c� th� ch鋘  r阨 kh醝 i.<enter><enter>"..
			"Ra kh醝 i: Trong th阨 gian <color=red>ngh�<color>, b筺 c� th� r阨 kh醝 i. Trong th阨 gian thi u, n誹 b筺 kh玭g <color=red>li猲 u<color>, c� th� r阨 kh醝 i."
		end
		tb_option[getn(tb_option)+1] = "Ta mu鑞 r阨 i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t譶h h譶h thi u hi謓 t筰/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� 甶 ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(1, WLLS_DATA)
