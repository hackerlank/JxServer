Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============混合单人赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部混合单人赛相关数据
WLLS_DATA = {
	
	name = " n u t� do ",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10235,
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
			ladder = 10236,
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
			{2, 1000},	--第2名
			{3, 800},	--第3名
			{4, 500},	--第4名
			{8, 400},	--第5-8名
			{16, 300},	--第9-16名
			{32, 200},	--第17-32名
			{64, 100},	--第33-64名
			{128, 50},	--第65-128名
			{256, 20},	--第129-256名
			{512, 10},	--第257-512名
		}, {	--联赛
			{1, 2000},	--第1名
			{2, 1000},	--第2名
			{3, 800},	--第3名
			{4, 500},	--第4名
			{8, 400},	--第5-8名
			{16, 300},	--第9-16名
			{32, 200},	--第17-32名
			{64, 100},	--第33-64名
			{128, 50},--第65-128名
			{256, 20},--第129-256名
			{512, 10},	--第257-512名
		}
	},
	
	max_member = 1,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"此次是 n u t� do ，各位侠客努力练习，等富贵的一天",
		"此次是 n u t� do ，各位侠客努力练习，等富贵的一天",
	},
	
	--====Functions====
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> l莕 n祔 "..str_des.."为<color=red> n u t� do <color>, 不需要建立战队，系统将记录你的第一次比赛")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> L莕 n祔  <color=yellow>"..str_lgname.."<color><enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow>H駓 li猲 u h筺 ch� v� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n誹 nh� mu鑞 h駓 li猲 u , xin m阨 th祅h l藀 m韎 chi課 i .<color><enter>"
		end
		local tb_option = {}
		str = str.."<enter><color=red> t筸 th阨 產ng trong th阨 gian ngh� ng琲 <color> ho芻 l� <color=red> kh玭g tham gia cu閏 tranh t礽 <color>, ngi c� th� r阨 kh醝 chi課 i, chi課 i t� ng gi秈 t竛 <color>."
		tb_option[getn(tb_option)+1] = "Ta mu鑞 r阨 i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t譶h h譶h thi u hi謓 t筰/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� 甶 ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--检查当前角色是否可以加入指定的战队
	check_addmem = function(n_capidx, n_lid, n_mtype)
		return " kh玭g th� tham gia li猲 u !"
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(5,WLLS_DATA)
