--新年年糕
--p=1342	莲蓉什锦年糕	100w经验
--p=1343	桂花百果年糕	200w经验
--p=1344	鲤鱼香米年糕	500w经验
--截至日期2007-3-6

Include("\\script\\item\\springfestival07\\xinnian_head.lua")

function main(nItemIdx)
	if (isTakeXinNianItem(nItemIdx) ~= 1) then
		return 1;
	end;
	
	local _, _, np = GetItemProp(nItemIdx);
	local nCurExp = GetTask(TSK_XINNIANNIANGAO_MAXEXP);
	if (nCurExp >= XINNIAN_MAXEXP) then
		Say("Ngi ch辵 kh玭g 輙 n╩ cao , l筰 nh譶 th蕐 n╩ cao m閠 ch髏 c騨g kh玭g mu鑞 ╪ r錳 . ", 0);
		return 1;
	end;
	
	if (np == 1342) then
		nAddExp = 1000000;
	elseif (np == 1343) then
		nAddExp = 2000000;
	elseif (np == 1344) then
		nAddExp = 5000000;
	else
		return 1;
	end;
	
	local szmsg = format("Ngi thu 頲 %d kinh nghi謒 tr� gi� ",nAddExp);
	if (nCurExp + nAddExp > XINNIAN_MAXEXP) then
		nAddExp = XINNIAN_MAXEXP - nCurExp;
		szmsg = format("Ngi thu 頲 %d kinh nghi謒 tr� gi� ，再也不想吃年糕了",nAddExp);
	end;
	
	AddOwnExp(nAddExp);
	SetTask(TSK_XINNIANNIANGAO_MAXEXP, nCurExp+nAddExp);
	Msg2Player(szmsg);
	WriteLog(format("[ n╩ m韎 n╩ cao ]\t%s\tName:%s\tAccount:%s\t s� d鬾g m閠 %s t 頲 %d kinh nghi謒 ",GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount(), GetItemName(nItemIdx),nAddExp));
end;