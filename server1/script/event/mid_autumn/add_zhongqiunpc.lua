-- 加载中秋活动NPC脚本
-- lixin 2005-9-6

--{npc模板,等级,XPOS,YPOS,是否重生,NPC姓名,是否boss,对话脚本}
tab_zhongqiunpc = {
{212,1,1566,3150,0,"糕点师",0,"\\script\\event\\mid_autumn\\zuofanggongren.lua"},
{212,1,1566,3257,0,"糕点师",0,"\\script\\event\\mid_autumn\\zuofanggongren.lua"},
{212,1,1641,3153,0,"糕点师",0,"\\script\\event\\mid_autumn\\zuofanggongren.lua"},
{212,1,1632,3262,0,"糕点师",0,"\\script\\event\\mid_autumn\\zuofanggongren.lua"},
{209,1,1556,3150,0,"西夏商人",0,"\\script\\event\\mid_autumn\\xixiashangren.lua"},
{209,1,1554,3265,0,"西夏商人",0,"\\script\\event\\mid_autumn\\xixiashangren.lua"},
{209,1,1633,3148,0,"西夏商人",0,"\\script\\event\\mid_autumn\\xixiashangren.lua"},
{209,1,1645,3273,0,"西夏商人",0,"\\script\\event\\mid_autumn\\xixiashangren.lua"},
{455,1,1600,3203,0,"明月老人",0,"\\script\\event\\mid_autumn\\mingyuelaoren.lua"},
{625,1,1576,3146,0,"储物箱",0,"\\script\\event\\mid_autumn\\chuwuxiang.lua"},
{625,1,1573,3264,0,"储物箱",0,"\\script\\event\\mid_autumn\\chuwuxiang.lua"},
{625,1,1623,3262,0,"储物箱",0,"\\script\\event\\mid_autumn\\chuwuxiang.lua"},
{625,1,1647,3165,0,"储物箱",0,"\\script\\event\\mid_autumn\\chuwuxiang.lua"},
}

--{npc模板,等级,地图ID,XPOS,YPOS,是否重生,NPC姓名,是否boss,对话脚本}
tab_citynpc_old = {
{258,1,1,1538,3155,0,"行脚商人",0,"\\script\\event\\mid_autumn\\xingjiaoshang.lua"},
{258,1,11,3149,4972,0,"行脚商人",0,"\\script\\event\\mid_autumn\\xingjiaoshang.lua"},
{258,1,37,1790,2957,0,"行脚商人",0,"\\script\\event\\mid_autumn\\xingjiaoshang.lua"},
{258,1,78,1533,3314,0,"行脚商人",0,"\\script\\event\\mid_autumn\\xingjiaoshang.lua"},
{258,1,80,1613,3045,0,"行脚商人",0,"\\script\\event\\mid_autumn\\xingjiaoshang.lua"},
{258,1,162,1613,3255,0,"行脚商人",0,"\\script\\event\\mid_autumn\\xingjiaoshang.lua"},
{258,1,176,1433,3007,0,"行脚商人",0,"\\script\\event\\mid_autumn\\xingjiaoshang.lua"},
}

tab_citynpc = {
{258,1,1,1538,3155,0,"行脚商人",0,"\\script\\event\\xinnianlibao\\xingjiaoshang.lua"},
{258,1,11,3149,4972,0,"行脚商人",0,"\\script\\event\\xinnianlibao\\xingjiaoshang.lua"},
{258,1,37,1790,2957,0,"行脚商人",0,"\\script\\event\\xinnianlibao\\xingjiaoshang.lua"},
{258,1,78,1533,3314,0,"行脚商人",0,"\\script\\event\\xinnianlibao\\xingjiaoshang.lua"},
{258,1,80,1613,3045,0,"行脚商人",0,"\\script\\event\\xinnianlibao\\xingjiaoshang.lua"},
{258,1,162,1613,3255,0,"行脚商人",0,"\\script\\event\\xinnianlibao\\xingjiaoshang.lua"},
{258,1,176,1517,3406,0,"行脚商人",0,"\\script\\event\\xinnianlibao\\xingjiaoshang.lua"},
{258,1,176,1433,3007,0,"行脚商人",0,"\\script\\event\\xinnianlibao\\xingjiaoshang.lua"},
}

function add_zhongqiunpc()
	add_mingyuenpc();
	add_citynpc();
end

function add_mingyuenpc()
	for i= 520	, 526 do
		Mid =	SubWorldID2Idx(i);
		if (Mid >= 0) then
			for j = 1 , getn(tab_zhongqiunpc) do
				xpos = tab_zhongqiunpc[j][3] * 32
				ypos = tab_zhongqiunpc[j][4] * 32
				zhongqiu_index = AddNpc(tab_zhongqiunpc[j][1],tab_zhongqiunpc[j][2],Mid,xpos,ypos,tab_zhongqiunpc[j][5],tab_zhongqiunpc[j][6]);
				SetNpcScript(zhongqiu_index, tab_zhongqiunpc[j][8]);
			end
		end
	end
end

function add_citynpc()
	for i = 1 , getn(tab_citynpc) do
		Mid = SubWorldID2Idx(tab_citynpc[i][3]);
		if (Mid >= 0 ) then
			xpos = tab_citynpc[i][4] * 32
			ypos = tab_citynpc[i][5] * 32
			newtasknpcindex = AddNpc(tab_citynpc[i][1],tab_citynpc[i][2],Mid,xpos,ypos,tab_citynpc[i][6],tab_citynpc[i][7]);
			SetNpcScript(newtasknpcindex, tab_citynpc[i][9]);
		end;
	end;
end;