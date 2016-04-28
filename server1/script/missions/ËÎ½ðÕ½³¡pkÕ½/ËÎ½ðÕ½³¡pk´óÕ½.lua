Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");

function InitMission()
    --Msg2Player("战事紧急，大战一触即发.");
    StartMissionTimer(1,4,TIMER_1);
    SetMissionV(1,1);--允许报名了
    SetMissionV(MS_KEY, random(100000))
    RevivalAllNpc();
HideNpc("南宋将军",1000000);
HideNpc("金国大将",1000000);

    RestMin, RestSec = GetMinAndSec(1800);
local str1 = "<#>Chi課 trng T鑞g Kim 產ng bc v祇 giai 畂筺 b竜 danh, c竎 nh﹏ s� h穣 n Tng Dng ho芻 Chu Ti課 Tr蕁  ng k� tham gia tr薾 chi課, th阨 gian c遪 l筰:"..RestMin.."<#>琱髏"..RestSec.."<#>gi﹜".."<#>襲 ki謓 tham gia: c蕄  l韓 h琻 40, l� ph� ng k� 3000 lng!";
    AddGlobalCountNews(str1, 1);
end;

function RunMission()
    SetMissionV(1,2);
    SetMissionV(MS_J_NPCDEATH, 0);
    SetMissionV(MS_S_NPCDEATH, 0);
    SetMissionV(MS_S_SHOWKING, 0);
    SetMissionV(MS_J_SHOWKING, 0);
    RevivalAllNpc();
HideNpc("南宋将军",1000000);
HideNpc("金国大将",1000000);
HideNpc("宋军军医",1000000);
HideNpc("金国军医",1000000);
    idx = 0;
    
    for i = 1 , 500 do
    	idx, pidx = GetNextPlayer(1,idx, 0);
    	
    	if (idx == 0) then
    		break
    	end;
    	
    	if (pidx > 0) then
    		PlayerIndex = pidx;
    		SetFightState(1);
    	end;

    	--此时为GM发布命令，正式打响战斗
PutMessage("K� th�  ho箃 ng ph輆 trc, h穣 d騨g c秏 ti猽 di謙 b鋘 ch髇g!");
    end;
    
    StartMissionTimer(1,5, TIMER_2);
end;

function EndMission()

    for i = 1, 20 do 
    SetMissionV(i , 0);
    end;

    StopMissionTimer(1,4);
    StopMissionTimer(1,5);
    GameOver();
end;

function OnLeave(RoleIndex)
    PlayerIndex = RoleIndex;
str2 = GetName().." r阨 kh醝 chi課 trng ";
    -- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
    SetPKFlag(0)
    ForbidChangePK(0);
    Msg2MSAll(1, str2);
end;
