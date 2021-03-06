-- 南蛮老人.lua (圣诞活动)
Include([[\script\missions\chrismas\ch_head.lua]]);
Include([[\script\missions\chrismas\xmas_day.lua]]);

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
500000
};

tabRate = {
	{0, 0.69, 0.27, 0.04},
	{0, 0.83, 0.14, 0.03},
	{0, 0.86, 0.13, 0.01},
	{0, 0.85, 0.15, 0},
	{0, 0.9, 0.1, 0},
	{0, 0.95, 0.05, 0},
	{0.27, 0.68, 0.05, 0},
	{0.37, 0.59, 0.04, 0},
	{0.61, 0.36, 0.03, 0},
	{0.72, 0.26, 0.02, 0}
};

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20061222) then
		Describe(DescLink_LiGuan.." l� gi竛g sinh vui v� !", 1, "K誸 th骳 i tho筰 /oncancel");
	else
		Describe(DescLink_LiGuan.." ha ha  l� gi竛g sinh vui v�  mu鑞 bi誸 n╩ nay l� gi竛g sinh c� c竔 g� ho箃 ng sao ?", 5, 
			" nghe n鉯 玭g gi� n� en r韙 h祅h l� /want_xmasevent",
			" ta mu鑞 t筼 ngi tuy誸 ./want_snowman",
			" ta mu鑞 d飊g ngi tuy誸 i l� ph萴 ./want_gift",
			" ta mu鑞 hi觰 r� ho箃 ng n閕 dung /xmas_about",
			" ta b﹜ gi� b� b閚 nhi襲 vi謈 , ch� m閠 ch髏 tr� l筰 ./oncancel");
	end;
end;

function want_xmasevent()
	if (isXmasTime() ~= 1) then
		Describe(DescLink_LiGuan.." c竚 琻 ngi , ta  t譵 頲 t骾 h祅h l� li評 .",1, "K誸 th骳 i tho筰 /oncancel");
		return 0;
	end;
	Describe(DescLink_LiGuan.." ta m韎 v鮝 r韙 m閠 t骾 h祅h l� , b猲 trong c� r蕋 nhi襲 qu� gi竛g sinh , ngi c� th� gi髉 ta t譵 tr� v� sao ?", 4,
	" d� nhi猲 c� th� n鱝/r錳 ./onok",
	" ta  t譵 頲 b鋘 h� ./award",
	" k誸 th骳 gi竛g sinh ho箃 ng ./detail",
	" b﹜ gi� ta b� b閚 nhi襲 vi謈 , c� r穘h r鏸 tr� chuy謓 ti誴 nga ./oncancel")
end;


function onok()
	if (50 > GetLevel()) then
		strTalk = DescLink_LiGuan.." ngi l辌h l穖 kh玭g c� t t韎 50 c蕄 , v蒼 kh玭g th� tham gia gi竛g sinh ho箃 ng . ";
		Describe(strTalk, 1, "K誸 th骳 i tho筰 /oncancel");
		return
	end;
	Describe(DescLink_LiGuan.." nga , v藋 th� th藅 l� c竚 琻 nhi襲 , ngi t韎 trc b猲 kia chu萵 b� m閠 ch髏 , ta m閠 h錳 li襫 d蒼 ngi n b鋘 h� 甶 v鴗 a phng . ", 2, "T鑤 . /wantjoin", "Ta t nhi猲 c� ch髏 vi謈 g蕄 , trc h誸 ch� m閠 ch髏 甶 . /oncancel");
end;

function award()
	local nCount = GetTask(TK_COUNT_ONETIME);
	local nRank = GetTask(TK_RANK);
	SetTask(TK_COUNT_ONETIME, 0);
	SetTask(TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Describe(DescLink_LiGuan.." ngi th藅 gi鑞g nh� kh玭g c� t譵 頲 b蕋 k� ch gi竛g sinh tinh linh 甶 . ", 1, "K誸 th骳 i tho筰 /oncancel");
		return
	end;
	local strSay = format("Ngi th藅 t譵 頲 b鋘 h� , b﹜ gi� th藅 t鑤 qu�  ta xem m閠 ch髏 , ngi t鎛g c閚g t譵 頲 %d c� <color=yellow> gi竛g sinh tinh linh <color> , l� t譵 n tinh linh th� %d nhi襲 ngi , t韎 t韎 , y l� l� v藅 cho ngi , nh薾 l蕐 甶 , a a a ~", nCount, nRank);
	Describe(DescLink_LiGuan..strSay, 1, "Nh薾 l蕐 l� v藅 . /oncancel");
	giveaward(nRank);
end;

function detail()
	Describe(DescLink_LiGuan.." t譵 tinh linh ho箃 ng m閠 cu閏 v� <color=yellow>15<color> ph髏 , trong  c� <color=yellow>5<color> ph髏 chu萵 b� th阨 gian , � ghi danh tham gia sau ngi s� b� mang t韎 chu萵 b� b秐  , ho箃 ng b総 u sau ngi s� b� mang t韎 gi竛g sinh tinh linh 甶 v鴗 a phng , n誹 nh� ngi � y n琲  th蕐 <color=yellow> gi竛g sinh tinh linh <color> l阨 c馻 ch� c莕 d飊g con chu閠 <color=yellow> b猲 tr竔 ki謓 甶觤 k輈h <color> h緉 l� 頲 r錳 , d� nhi猲 ngi c� l� s� b� nh鱪g kh竎 nh� ch琲 ch ng╪ tr� , l骳 n祔 ngi c� th� d飊g ho箃 ng o c� t韎 i ph� nh鱪g t譶h hu鑞g n祔 , ch� c莕 ngi t譵 頲 nhi襲  ch <color=yellow> gi竛g sinh tinh linh <color> nh� v藋 玭g gi� n� en s� cho ngi t鑤 l� v藅 nga . ", 1, "Th藅 th莕 k� nh� v藋 ? ta xem m閠 ch髏 . /oncancel");
end;

function giveaward(nRank)
	expaward(nRank);
	goodsaward(nRank);
end;

function expaward(nRank)
	AddOwnExp(tabExp[nRank]);
end;

function goodsaward(nRank)
	local nGoodsType = getgoodtype(nRank);
	if (nGoodsType == 1) then
		AddItem(6, 1, 1008, 1, 0, 0, 0);
		local strsay = " ngi thu 頲 m閠 ho祅g kim m莔 m鉵g "
		Msg2Player(strsay);
	elseif (nGoodsType == 2) then
		AddItem(6, 1, 1007, 1, 0, 0, 0);
		local strsay = " ngi thu 頲 m閠 th駓 tinh m莔 m鉵g "
		Msg2Player(strsay);
	elseif (nGoodsType == 3) then
		AddItem(6, 1, 1006, 1, 0, 0, 0);
		local strsay = " ngi thu 頲 m閠 hoa h錸g m莔 m鉵g "
		Msg2Player(strsay);
	elseif (nGoodsType == 4) then
		AddItem(6, 1, 1005, 1, 0, 0, 0);
		local strsay = " ngi thu 頲 m閠 may m緉 m莔 m鉵g "
		Msg2Player(strsay);
	end;
end;

function getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 4 do
		nRate[i] = tabRate[nRank][i] * 100;
	end;
	local nBase = 0;
	for i = 1, 4 do
		nBase = nBase + nRate[i];
		if (nBase >= nSeed) then
			return (5 - i);
		end;
	end;
end;

function onsale()

end;

function wantjoin()
	local w, x, y;
	w, x, y = GetWorldPos();
	SetTask(TK_LEAVERMAPID, w);	--存储玩家离开的坐标
	SetTask(TK_LEAVERPOSX, x);
	SetTask(TK_LEAVERPOSY, y);
	joingame() --加入到游戏中
end;

function xmas_about()
	Describe(DescLink_LiGuan.." 產ng ho箃 ng th阨 gian b猲 trong , nh� ch琲 c莕 nh tr竎h t韎 thu t藀 h閜 qu� , b猲 trong s� c� <color=yellow> b玭g tuy誸 , gia t� , t飊g chi , c竔 m� , t飊g c﹜ , vi c﹏ <color>, l� d飊g t韎 luy謓 ch� <color=yellow> c bi謙 ngi tuy誸 ch nguy猲 li謚 <color>. nh﹏ c玭g luy謓 ch� th蕋 b筰 , 甧m l祄 ra <color=yellow> m閠 lo筰 ngi tuy誸 <color>. sau  , c� th� d飊g ngi tuy誸  i l蕐 l� ph萴 .", 1, "Ta bi誸 /main");
end;

function oncancel()	--取消

end;
