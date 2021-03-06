Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============三人赛相关数据===============

if (not tmp_process_data) then
	return
end

--全部三人赛相关数据
WLLS_DATA = {
	
	name = " t� do ba ngi cu閏 so t礽 ",
	
	--地图信息
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10223,
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
			ladder = 10224,
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
			{1, 1000},	--第1名
			{2, 800},	--第2名
			{3, 600},	--第3名
			{4, 500},	--第4名
			{8, 400},	--第5-8名
			{16, 200},	--第9-16名
			{32, 100},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}, {	--联赛
			{1, 1000},	--第1名
			{2, 800},	--第2名
			{3, 600},	--第3名
			{4, 500},	--第4名
			{8, 400},	--第5-8名
			{16, 200},	--第9-16名
			{32, 100},	--第17-32名
			{64, 50},	--第33-64名
			{128, 10},	--第65-128名
		}
	},
	
	max_member = 3,	--每个战队的最大人数
	
	text_main = {	--officer主对话（末尾差异部分）
		"此次武林新秀联赛为 <color=red> t� do ba ngi cu閏 so t礽 <color>",
		"此次武林新秀联赛为<color=red> t� do ba ngi cu閏 so t礽 <color>",
	},
	
	--====Functions====
	--我的战队
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> l莕 n祔 "..str_des.."在 <color=red> t� do ba ngi cu閏 so t礽 <color>, 你可以选择建立组队，也可以加入其他战队。在队长与玩家组队完后，"..str_des.." c飊g quan vi猲 i tho筰 , l鵤 ch鋘 li猲 cu閏 so t礽 i "..str_des.." gia nh藀 i h鱱 n v鑞 i l� 頲 , chi課 i th祅h vi猲 nhi襲 nh蕋 v� <color=red>3 ngi <color>.",
				" ta mu鑞 th祅h l藀 "..str_des.." h鋚 th祅h i /wlls_want2create",
				" ta ch� nh譶 m閠 ch髏 /OnCancel")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> trc m総 ngi chi課 i v� <color=yellow>"..str_lgname.."<color><enter>"
		.. " chi課 i i trng :"..join(wlls_get_mems(n_lid), "Chi課 i th祅h vi猲 :") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow> ch� �  h� k� li猲 cu閏 so t礽 h筺 ch� v� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n誹 nh� mu鑞 h� k� li猲 cu閏 so t礽 , xin/m阨 th祅h l藀 m韎 chi課 i .<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ngi c� th� l鵤 ch鋘 <color=red> gia nh藀 nh鱪g kh竎 i ng� <color> ho芻 l� <color=red> r阨 甶 li猲 cu閏 so t礽 <color>.<enter><enter>"..
			" th祅h l藀 chi課 i bc : � <color=red> th阨 gian ngh� ng琲 c飊g li猲 cu閏 so t礽 th阨 gian <color>, c騨g c� th� thay v� h緉 nh� ch琲 h鋚 th祅h i , <color=red> kh竎 ph竔 <color>, l鵤 ch鋘 c飊g  cho c飊g i gia nh藀 v鑞 i . <enter>"..
			" r阨 甶 li猲 cu閏 so t礽 : � <color=red> th阨 gian ngh� ng琲 <color>, ngi c� th� r阨 甶 li猲 cu閏 so t礽 i , � li猲 cu閏 so t礽 th阨 gian n誹 nh� ngi kh玭g ph秈 l� i <color=red> kh玭g gia nh藀 thng k� li猲 cu閏 so t礽 <color>, ngi c� th� r阨 甶 li猲 cu閏 so t礽 i , n誹 nh�  tham gia th� kh玭g th� r阨 甶 . i trng t� c竎h 甧m b� chuy觧 giao cho nh鱪g i vi猲 kh竎 <color=yellow> n誹 nh� kh玭g c� th祅h vi猲 , chi課 i 甧m b� gi秈 t竛 <color>."
			tb_option[getn(tb_option)+1] = "Th猰 th祅h vi猲 v祇 i/wlls_want2addmember"
		else
			str = str.."<enter> ngi c� th� l鵤 ch鋘 r阨 甶 i .<enter><enter>"..
			" c竎h i  � <color=red> th阨 gian ngh� ng琲 <color>, ngi c� th� r阨 甶 li猲 cu閏 so t礽 i , � li猲 cu閏 so t礽 th阨 gian n誹 nh� m譶h ch li猲 cu閏 so t礽 i <color=red> kh玭g gia nh藀 l莕 trc li猲 cu閏 so t礽 <color>, ngi c� th� r阨 甶 li猲 cu閏 so t礽 i , n誹 nh� gia nh藀 li猲 cu閏 so t礽 th� kh玭g th� r阨 甶 ."
		end
		tb_option[getn(tb_option)+1] = "Ta mu鑞 r阨 i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t譶h h譶h thi u hi謓 t筰/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� 甶 ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(4,WLLS_DATA)
