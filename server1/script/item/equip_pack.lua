
-- ====================== 文件信息 ======================

-- 剑侠情缘online IB 服务器五行装备礼包脚本文件
-- Edited by peres
-- 2006/10/26 PM 11:51

-- 就如同她的笑从来都不是代表快乐，
-- 她的哭泣也没有任何意味。
-- 她说，好了。
-- 我们说会儿话吧。
-- 拿了裙子和内衣，非常沉静地一件一件穿上。
-- 态度有明显的生疏，仿佛想退回到她的世界里去。

-- ======================================================

aryFiveEquip = {
	
	[1267]={"Th衟 ki誱 ",        0,0,0,10},
	[1268]={"Gi� l韓 產o ",        0,0,1,10},
	[1269]={"Kim c� ca t鬾g ",        0,0,2,10},
	[1270]={"X� tr阨 k輈h ",        0,0,3,10},
	[1271]={"X� tr阨 ch飝 ",        0,0,4,10},
	[1272]={"B� vng phi猽 ",        0,1,0,10},
	[1273]={"B� th竛g 產o ",        0,1,1,10},
	[1274]={"Kh鎛g tc linh ",        0,1,2,10},	
	[1275]={" long phng huy誸 ng鋍 tr筩 ",    0,8,0,10},
	[1276]={"Thi猲 t祄 h� c� tay ",      0,8,1,10},
	[1277]={"Th玭g thi猲 ph竧 quan ",      0,7,3,10},
	[1278]={"Gi蕌 ng祔 kh玦 ",        0,7,4,10},
	[1279]={"Huy襫 t� m苩 n� ",      0,7,9,10},
	[1280]={"Thanh tinh sai ",        0,7,12,10},
	[1281]={"Thi猲 t祄 產i l璶g ",      0,6,0,10},
	[1282]={"B筩h kim 產i l璶g ",      0,6,1,10},
	[1283]={"Thi猲 t祄 ngoa ",        0,5,1,10},
	[1284]={"Bay phng ngoa ",        0,5,3,10},
		
	}; 


function main(nIndex)
	local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
	local i=0;
	if aryFiveEquip[nParticular] then
		for i=0,4 do
			AddItem(aryFiveEquip[nParticular][2],
					aryFiveEquip[nParticular][3],
					aryFiveEquip[nParticular][4],
					aryFiveEquip[nParticular][5],
					i,
					0,0);
		end;
		Msg2Player("Ng礽 l蕐 頲 m閠 b� ng� h祅h ch <color=yellow>"..aryFiveEquip[nParticular][1].."<color>");
		WriteLog("[ ng� h祅h trang b� nhi謒 v� l� t骾 ]"..date("[%y n╩ %m th竛g %d ng祔 %H l骳 %M ph﹏ ]").."[ trng m鬰 "..GetAccount().."][ vai tr� "..GetName().."] m� ra m閠 "..aryFiveEquip[nParticular][1].." l� t骾 . ");
	else
		Say("Ngi mua l� m閠 kh玭g c� hi謚 qu� ch ng� h祅h l� t骾 ", 0);
		return 1;
	end;
	return 0;
end;

