Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");

function OnDeath()

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

--if ( GetMissionV(5) + GetMissionV(6) >= (MAX_S_COUNT + MAX_J_COUNT) * 7 / 10) then

if (GetMissionV(5) >= (MAX_S_COUNT / 2) and GetMissionV(6) >= (MAX_J_COUNT / 2)) then

	if (random(100) > 70) then
	return
	end;

	AddEventItem(195);
	Msg2Player("B筺 nh薾 頲 Nh筩 Vng Ki誱!");
end;


str1 = "<#>K誸 qu� phe Kim: binh s� "..GetName().."<#> ti猽 di謙 tng phe Kim, phe T鑞g gi祅h chi課 th緉g!";
str = "<#>Ch骳 m鮪g ["..GetName().."<#>]  ti猽 di謙 phe Kim, gi髉 ch髇g ta th緉g tr筺 n祔!";
Msg2MSAll(1, str1);
Msg2MSGroup(1, str, 1);
resultstr = WinBonus(1,2);
str1 = str1..resultstr;
SetMissionV(2,2);
SetMissionV(1,3);
AddGlobalCountNews(str1 , 3);
CloseMission(1);
end;