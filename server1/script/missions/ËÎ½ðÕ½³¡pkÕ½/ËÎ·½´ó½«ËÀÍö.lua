Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");

function OnDeath()

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

if ( GetMissionV(5) + GetMissionV(6) >= (MAX_S_COUNT + MAX_J_COUNT) * 7 / 10) then
	if (random(100) > 60) then
	return
	end;
	AddEventItem(195);
	Msg2Player("B筺 nh薾 頲 Nh筩 Vng Ki誱!");
end;

--这句是给所有参加大战的玩家发的信息
str1 = "<#>K誸 qu� phe T鑞g: binh s� "..GetName().."<#> ti猽 di謙 tng phe T鑞g, phe Kim gi祅h chi課 th緉g!";

--下面这句是给获胜方发的信息，欢庆鼓舞的话语!
str = "<#>Ch骳 m鮪g ["..GetName().."<#>]  ti猽 di謙 phe T鑞g, gi髉 ch髇g ta th緉g tr筺 n祔!";

Msg2MSAll(1, str1);
Msg2MSGroup(1, str, 2);
resultstr = WinBonus(2, 1);
str1 = str1..resultstr;
SetMissionV(2,1);
SetMissionV(MS_STATE,3);
AddGlobalCountNews(str1, 3);
CloseMission(1);
end;

