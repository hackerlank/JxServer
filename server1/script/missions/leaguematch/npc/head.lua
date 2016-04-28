IL("RELAYLADDER");

--��ѯ�����Ի���
function wlls_query()
	local str = "<enter> ���ng kim lo�n th� , anh h�ng h�o ki�t b�i xu�t , b�i v� mu�n ph�n kh�ng tr�n giang h� ��ch tranh �o�t , cho n�n , ��c c� minh ch� c� h�nh v� l�m li�n cu�c so t�i : ��u ti�n l� ch�n l�a trong ch�n v� l�m �u t� ng��i c�a m�i , th� nh� l� c�ng nhau hi�n k� . tham gia li�n cu�c so t�i n�u nh� bi�u hi�n h�o , c� th� ��t ���c t��ng th��ng . <enter>"..
		"B�n c� th� ki�m tra t�nh h�nh li�n quan ��n v� l�m li�n ��u ki�t xu�t(d��i 119) v� v� l�m li�n ��u � ch� ta."
	local tb_option = {}
	if (LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()) ~= 0) then
		tb_option[getn(tb_option)+1] = "Ki�m tra t�nh h�nh chi�n ��i[��i c�a ta]/wlls_query_mylg"
	end
	tb_option[getn(tb_option)+1] = "Ki�m tra t�nh h�nh chi�n ��i [10 h�ng ��u]/wlls_query_level"
	tb_option[getn(tb_option)+1] = "Ki�m tra t�nh h�nh chi�n ��i [t�n chi�n ��i] /wlls_query_lgnamein"
	tb_option[getn(tb_option)+1] = "Ki�m tra t�nh h�nh chi�n ��i [t�n nh�n v�t]/wlls_query_plnamein"
	tb_option[getn(tb_option)+1] = "Kh�ng c�n!/OnCancel"
	wlls_descript(str, tb_option)
end

--��ѯ�Լ�ս�ӣ���ѯ��
function wlls_query_mylg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (FALSE(n_lid)) then
		Say(wlls_npcname()..": ch�a v�o ��i, kh�ng th� xem!", 0)
	else
		wlls_query_do(n_lid)
	end
end

--��ѯ����ǰ10��ս�ӣ������б������㡢�߼���
function wlls_query_level()
	wlls_descript(" b�n mu�n ki�m tra ��i n�o?",
		WLLS_LEVEL_DESC[1].." 10 h�ng ��u/#wlls_query_type(1)",
		WLLS_LEVEL_DESC[2].." 10 h�ng ��u/#wlls_query_type(2)",
		"Tr� l�i/wlls_query",
		"Ta bi�t r�i/OnCancel")
end

--��ѯ����ǰ10��ս�ӣ������б���
function wlls_query_type(n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb_option = {}
	local n
	for n_mtype, tb_mtaype in WLLS_TAB[n_type].match_type do
		if (tb_mtaype.level == n_level) then
			n = n_mtype
			tb_option[getn(tb_option)+1] = WLLS_LEVEL_DESC[tb_mtaype.level].."-"..tb_mtaype.name.." 10 h�ng ��u/#wlls_query_top10("..n_mtype..")"
		end
	end
	if (getn(tb_option) == 1) then	--ֻ��һ����ֱ����ʾ
		wlls_query_top10(n)
		return
	end
	tb_option[getn(tb_option)+1] = "Tr� l�i/wlls_query_level"
	tb_option[getn(tb_option)+1] = "Ta bi�t r�i/OnCancel"
	wlls_descript("�i�u n�y "..WLLS_LEVEL_DESC[n_level].." bao g�m "..(getn(tb_option) - 1).." b�n mu�n ki�m tra ��i n�o?", tb_option)
end

--��ѯ����ǰ10��ս�ӣ�ǰʮ���б���
function wlls_query_top10(n_mtype)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_ladder = WLLS_TAB[n_type].match_type[n_mtype].ladder
	local n_level = WLLS_TAB[n_type].match_type[n_mtype].level
	local tb_option = {}
	for i = 1, 10 do
		local str_lgname, n_order = Ladder_GetLadderInfo(n_ladder, i)
		if (not FALSE(n_order)) then
			tb_option[getn(tb_option)+1] = strfill_left("h�ng "..(-n_order).." danh ", 7)..str_lgname.."/#wlls_query_top("..n_ladder..","..i..")"
		end
	end
	if (getn(tb_option) <= 0) then
		Say(wlls_npcname().." : ch�a x�p h�ng, kh�ng th� ki�m tra!", 0)
	else
		tb_option[getn(tb_option)+1] = "Tr� v�/#wlls_query_type("..n_level..")"
		tb_option[getn(tb_option)+1] = "Ta bi�t r�i/OnCancel"
		Say(wlls_npcname().." mu�n ki�m tra nh�m n�o ?", getn(tb_option), tb_option)
	end
end

--��ѯǰ10��ս�ӣ���ѯ��
function wlls_query_top(n_ladder, n_idx)
	local str_lgname = Ladder_GetLadderInfo(n_ladder, n_idx)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (n_lid ~= 0 and LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK) > 0) then
		wlls_query_do(n_lid)
	else
		Say(wlls_npcname()..": ��i �� gi�i t�n, kh�ng th� ki�m tra!!", 0)
	end
end

--��ѯָ��ս��(����)
function wlls_query_lgnamein()
	AskClientForString("wlls_query_lgname", "", 1, 16, "Nh�p t�n chi�n ��i!")
end

--��ѯָ��ս��(��ѯ)
function wlls_query_lgname(str_lgname)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		Say(wlls_npcname()..": chi�n ��i kh�ng t�n t�i ho�c �� gi�i t�n", 0)
	else
		wlls_query_do(n_lid)
	end
end

--��ѯָ����ɫ(����)
function wlls_query_plnamein()
	AskClientForString("wlls_query_plname", "", 1, 16, "Nh�p t�n nh�n v�t!")
end

--��ѯָ����ɫ(��ѯ)
function wlls_query_plname(str_plname)
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		Say(wlls_npcname()..": Xin l�i! T�n kh�ng t�n t�i, ho�c ch�a gia nh�p ��i!", 0)
	else
		wlls_query_do(n_lid)
	end
end

--��ѯָ��ս�ӣ���ʾ��
function wlls_query_do(n_lid)
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	local str_mtype = wlls_get_desc(2, n_mtype, 1, n_type)
	local str_mem = join(wlls_get_mems(n_lid), "  ")
	local n_win = LG_GetLeagueTask(n_lid, WLLS_LGTASK_WIN)
	local n_tie = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIE)
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_point = LG_GetLeagueTask(n_lid, WLLS_LGTASK_POINT)
	local n_time = ceil(LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIME)/18)
	local n_lose = n_total - n_tie - n_win
	local f_rate = 0
	if (n_total > 0) then
		f_rate = n_win/n_total*100
	end
	local n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	local str_rank
	if (n_rank > 1000) then
		str_rank = "H�ng sau 1000"
	elseif (n_rank > 0) then
		str_rank = "H�ng th� "..n_rank.." danh "
	else
		str_rank = "Kh�ng ���c x�p h�ng"
	end
	local n_width = 17
	local str = "<enter>"
	str = str .. strfill_center(str_mtype.." nh�m [<color=yellow>"..str_lgname.."<color>]", 53+21, "-")
	str = str .. strfill_left("�Bao g�m <color=yellow>"..n_memcount.."<color> th�nh vi�n ", n_width+21).."<color=cyan>"..str_mem.."<color><enter>"
	str = str .. strfill_left("�� tham gia <color=yellow>"..n_total.."<color> tr�n:", n_width+21).." chi�n th�ng<color=yellow>"..n_win.."<color>tr�n/h�a<color=yellow>"..n_tie.."<color>tr�n/thua<color=yellow>"..n_lose.."<color>tr�n<enter>"
	str = str .. strfill_left("",n_width).."T� l� th�ng <color=yellow>"..strsub(f_rate,1,4).."<color> %<enter>"
	str = str .. strfill_left("�i�m th��ng nh�m: <color=yellow>"..n_point.."<color>", n_width+21).." th�i gian chi�n ��u t�ch l�y: <color=yellow>"..n_time.."<color> gi�y <enter>"
	str = str .. ""..strfill_center("<<  <color=yellow>"..str_rank.."<color>  >>", 53+21).."<color>"
	wlls_descript(str)
end

--����
function wlls_help(n_type, n_level, n_id)
	local tb_option = {}
	local tb = WLLS_TAB[n_type].help_msg
	for i = 1, getn(tb) do
		if (i == n_id) then
			tb_option[getn(tb_option)+1] = "< "..tb[i][n_level][1].." >/#wlls_help("..n_type..","..n_level..","..i..")"
		else
			tb_option[getn(tb_option)+1] = tb[i][n_level][1].."/#wlls_help("..n_type..","..n_level..","..i..")"
		end
	end
	tb_option[getn(tb_option)+1] = "Ta bi�t r�i!/OnCancel"
	wlls_descript("<enter>"..strfill_center(" ( "..tb[n_id][n_level][1]..") ", 52).."<enter>"..tb[n_id][n_level][2], tb_option)
end

--Describe�Ի�
function wlls_descript(str, ...)
	str = "<link=image[0,8]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>"..wlls_npcname().."<link>"..str
	if (type(arg[1]) == "table") then
		arg = arg[1]
	end
	if (getn(arg) <= 0) then
		Describe(str, 1, "Kh�ng c�n/OnCancel")
	else
		Describe(str, getn(arg), arg)
	end
end

--�õ����еĶ�Ա����
function wlls_get_mems(n_lid)
	local str_lgame, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local tb = {""}
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgame, str_plname, WLLS_LGMTASK_JOB)
		if n_job == 1 then
			tb[1] = str_plname
		else
			tb[getn(tb)+1] = str_plname
		end
	end
	return tb
end

--�õ��Ի�Npc����
function wlls_npcname()
	return GetNpcName(GetLastDiagNpc())..":"
end

--���Ӳ�ѯ������ѡ��
function wlls_add_option(tb, str)
	tb[getn(tb)+1] = "Ta mu�n ki�m tra t�nh h�nh thi ��u hi�n t�i/wlls_query"
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local n_mtype, _, n_map = wlls_get_mapinfo()
	local n_level
	if (n_mtype) then
		n_level = WLLS_TAB[n_type].match_type[n_mtype].level
	else
		n_level = wlls_getcityinfo()
	end
	if (n_type == n_next) then
		tb[getn(tb)+1] = WLLS_LEVEL_DESC[n_level] .. " h� tr� thi ��u/#wlls_help("..n_type..","..n_level..",1)"
	else
		tb[getn(tb)+1] = WLLS_LEVEL_DESC[n_level] .. WLLS_TAB[n_type].name .. " h� tr� thi ��u/#wlls_help("..n_type..","..n_level..",1)"
		tb[getn(tb)+1] = WLLS_LEVEL_DESC[n_level] .. WLLS_TAB[n_next].name .. " h� tr� thi ��u/#wlls_help("..n_next..","..n_level..",1)"
	end
	--if (n_map == 1) then
	--	tb[getn(tb)+1] = "��Ҫ�뿪�᳡/wlls_want2transback"
	--end
	tb[getn(tb)+1] = str.."/OnCancel"
	return tb
end
