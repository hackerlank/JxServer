--幸运礼包
--by 小浪多多
--2007.04.13

TB_LIBAO = 
{
	1000000,--总概率
	{0.00125,	{"C鰑 V� B筩h H� trang",					0,2,9,10,2,}}, --九尾白狐裘[水属性]
	{0.00125,	{"C鰑 V� B筩h H� trang",					0,2,9,10,3,}}, --九尾白狐裘[火属性]
	{0.00125,	{"Tuy襫 Long b祇",							0,2,6,10,2,}}, --Tuy襫 Long b祇[水属性]
	{0.00125,	{"Tuy襫 Long b祇",							0,2,6,10,3,}}, --Tuy襫 Long b祇[火属性]
	{0.00125,	{"Thi猲 T祄 Y猽 Цi",						0,6,0,10,2,}}, --Thi猲 T祄 Y猽 Цi[水属性]
	{0.00125,	{"Thi猲 T祄 Y猽 Цi",						0,6,0,10,3,}}, --Thi猲 T祄 Y猽 Цi[火属性]
	{0.00125,	{"B筩h Kim Y猽 Цi",						0,6,1,10,2,}}, --B筩h Kim Y猽 Цi[水属性]
	{0.00125,	{"B筩h Kim Y猽 Цi",						0,6,1,10,3,}}, --B筩h Kim Y猽 Цi[火属性]
	{0.15,		{"Ti猲 Th秓 L� ",							6,1,71,1,}},	 --Ti猲 Th秓 L� 
	{0.1796,	{"Qu� Hoa T鰑",							6,1,125,1,}},	 --Qu� Hoa T鰑
	{0.0001,	{"An Bang B╪g Tinh Th筩h H筺g Li猲",		0,164,}},			 --安邦 – 冰晶石项链
	{0.0001,	{"An Bang C骳 Hoa Th筩h Gi韎 Ch�",		0,165,}}, 		 --安邦 – 菊花石戒指
	{0.0001,	{"An Bang K� Huy誸 Th筩h Gi韎 Ch� ",		0,167,}},			 --安邦 – 鸡血石戒指
	{0.0001,	{"An Bang 襫 Ho祅g Th筩h Ng鋍 B閕",		0,166,}}, 		 --安邦 – 田黄石玉佩
	{0.0004,	{"мnh Qu鑓 � Sa Ph竧 Qu竛",			0,160,}}, 		 --定国 – 钨砂发冠
	{0.0004,	{"мnh Qu鑓 T� Щng H� uy觧",			0,159,}}, 		 --定国 – 青纱长衫
	{0.0004,	{"мnh Qu鑓 T� Щng H� uy觧",			0,162,}},			 --定国 – 紫藤护腕
	{0.0004,	{"мnh Qu鑓 Ng﹏ T祄 Y猽 i",			0,163,}},			 --定国 – 银蚕腰带
	{0.0004,	{"мnh Qu鑓 X輈h Quy猲 Nhuy詎 Ngoa",			0,161,}},			 --定国 – 赤绢软靴
	{0.0002,	{"Chi誹 D� Ng鋍 S� T� ",					0,10,5,10,}},	 --Chi誹 D� Ng鋍 S� T� 80级马
	{0.0002,	{"X輈h Th� ",								0,10,5,2,}},	 --X輈h Th� 80级马
	{0.0002,	{"V� L﹎ M藅 T辌h",						6,1,26,1,}},	 --V� L﹎ M藅 T辌h
	{0.0002,	{"T葃 T駓 Kinh",							6,1,22,1,}},	 --T葃 T駓 Kinh
	{0.65,		{"B玭g hoa chi課 c玭g",							6,1,1414,1,}}	 --B玭g hoa chi課 c玭g
}

function main(sel)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate > 070513) then
		return 0
	end;
	if (GetLevel() < 50) then
		Msg2Player("Ngi ch琲 c蕄 50 tr� l猲  n筽 th� m韎 c� th� s� d鬾g.");
		return 1;
	end;
	if ( CalcFreeItemCellCount() < 12 ) then
		Say("Xin s緋 x誴 l筰 h祅h trang  m b秓 c� 12 � tr鑞g.",0);
	return 1;
	end
	local SumPe =  TB_LIBAO[1];
	local Rand = random(1,SumPe);
	local Sum = 0;
	for i=2,getn(TB_LIBAO) do
		local pnum = TB_LIBAO[i][1];
		local item = TB_LIBAO[i][2];
		Sum = Sum + pnum * SumPe;
		if Rand < Sum then
			award_item(item);
			break;
		end
	end
end

function award_item(item)
	local nidx ;
	if getn(item) == 3 then
		nidx = AddGoldItem(item[2], item[3]);
	elseif getn(item) == 5 then
		nidx = AddItem(item[2], item[3], item[4], item[5],0,0);
	elseif getn(item) == 6 then
		nidx = AddQualityItem(2,item[2], item[3], item[4], item[5],item[6],255,-1,-1,-1,-1,-1,-1)
	end
	Msg2Player("B筺 nh薾 頲 m閠"..item[1]);
	WriteLog(format("[xingyunlibao]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s \t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),item[1]));

end