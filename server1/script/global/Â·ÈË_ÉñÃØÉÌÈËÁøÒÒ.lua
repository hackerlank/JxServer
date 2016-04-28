--以福缘出售物品的NPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include([[\script\event\mid_autumn06\head.lua]]);
Include("\\script\\vng_feature\\thuongnhanthanbi\\moruongfour\\openchestfour.lua")

function main()
	local tab_Content = {
		"Giao d辌h/OnBuy", 
		" Trng b筩h s琻 /GotoHuanZhuan", 
		"Li猲 quan t韎 ph骳 duy猲.../OnAbout",
		"K誸 th骳 i tho筰/OnCancel"
	};
	if (au06_is_inperiod() == 1) then
		tinsert(tab_Content, "Trung thu ho箃 ng/au06_lpaw_entrance");
	end;
	--tinsert(tab_Content, "开箱 4/#tbChectfour:main()");
	Say ( "Kh竎h quan mu鑞 mua g�? B鎛 trang h祅g g� c騨g c�!", getn(tab_Content), tab_Content);
end

function OnBuy()
	Sale( 93, 2 );
end

function OnAbout()
	Talk( 3, "", "Ph骳 duy猲 甶觤 m: Th玭g qua t輈h l騳 th阨 gian ch琲, c� th� i 甶觤 ph骳 duy猲. C� th� t韎 Tng Dng th莕 b� thng nh﹏ Li評 ?t i c竎 lo筰 v藅 ph萴 c th�. ", " Ph骳 duy猲 i:t輈h l騳 hai gi� online tr� l猲 , 甶 c竎 i th祅h th� t譵 v� l﹎ minh ch� truy襫 nh﹏ l� 頲 i . m閠 ng祔 頲 i 2 l莕, t輈h l騳 � tuy課 th阨 gian 4 gi� tr� l猲, m鏸 gi� i 1 甶觤 ph骳 duy猲.", "H筺 ch� 甶襲 ki謓 :Ng錳 t� kh玭g 頲 t輈h l騳 甶觤 ph骳 duy猲." );
end

function au06_lpaw_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("ch� c� sung tr� gi� nh� ch琲 m韎 c� th� tham gia trung thu ho箃 ng", 0);
		return
	end;
	Say("n誹 nh� ngi c� <color=yellow> 10 thng c� l謓h b礽 <color> ta s� cho ngi i m閠 <color=yellow> ph鬾g ng� qu� dong <color> a k� n╪g tr� gi� ho芻 l� 1 <color=yellow> c鑞g ng� ph� dung <color> a ti襪 n╪g tr� gi�", 3, "1 c� thng c� l謓h b礽 i l蕐 tng thng/#shangjialingpai(1)", "10 c� thng c� l謓h b礽 i l蕐 tng thng/#shangjialingpai(2)", "Kh玭g/oncancel");
end;

function shangjialingpai(nIndex)
	if (CalcEquiproomItemCount(6, 1, 1252, -1) < 10) then
		Say("c莕 10 c� thng c� l謓h b礽 m韎 c� th� i l蕐 tng thng", 0);
		return
	end;
	
	--扣除物品
	if (ConsumeEquiproomItem(10, 6, 1, 1252, -1) ~= 1) then
		return
	end
	
	--给予奖励
	local str = "<color=yellow>Ph鬾g ng� qu� dong<color>";
	if (nIndex == 1) then -- 增加一个技能点
		AddItem(6, 1, 127, 1, 0, 0, 0);
	else -- 增加5个潜能点
		AddItem(6, 1, 128, 1, 0, 0, 0);
		str = "<color=yellow>C鑞g ng� ph� dung<color>";
	end;
	
	--给予提示
	Say("Xin m阨 nh薾 m閠 ch髏 l� v藅", 0);
	Msg2Player("Чt 頲"..str);
end;

function OnCancel()
end
function GotoHuanZhuan()
	NewWorld(934, 49632 / 32, 105696 /32)
end
