-- 临安　路人　华员外
-- by：Dan_Deng(2003-09-16)
-- edit by 小浪多多
Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,1)
		Describe("Hoa vi猲 ngo筰: Trung thu  n, ch� c莕 thu th藀  6 <color=red>m秐h tranh V﹏ Du<color>  h頿 th祅h 1 b鴆 tranh ho祅 ch豱h mang n cho ta, ta s� t苙g l筰 i hi謕 1 b竛h <color=red>C鑞g Nguy謙 Ph� Dung<color>.",2,"фi b竛h C鑞g Nguy謙 Ph� Dung/makeItemUI","Nh﹏ ti謓 gh� qua th玦/NoChoice")
	else
		if (random(0,1) == 0) then
			Talk(1,"","Hoa vi猲 ngo筰  ta tuy kh玭g ph秈 l� ngi trong quan trng , nh璶g l� trong tri襲 i vi猲 c騨g c飊g ta qu� m鴆 th鬰 , ch� c莕 c� b筩 , c遪 s� kh玭g l祄 頲 chuy謓 ? ")
		else
			Talk(1,"","Hoa vi猲 ngo筰  ngi ngi c騨g mu鑞 l祄 quan , ph秈 bi誸 s�  gian hi觤 , kia c飊g 頲 v韎 ta nh� v藋 ti猽 dao t� t筰 ")
		end
	end
end;
