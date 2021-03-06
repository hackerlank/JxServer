--接任务的Npc
--·参与的玩家等级必须大于40级；
--·宋方的玩家必须要到衡山独孤剑处报名；
--·金方的玩家必须要到汴京衙门口金国武将处报名；
--·报名时需要交纳一定的金钱；

Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");

function main()

local State = GetMissionV(1) 

--未开始
if (State == 0 ) then 
	Say("Xin h穣 ngh� ng琲 v� ch� th玭g b竜!",0);
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;

--异常情况直接退出
if (State > 2) then
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;


local GroupV = GetTask(SJTASKVLAUE);
--如果该玩家是已经报名过的，断线重连进来的，则扔进去
result = CheckLastBattle(1, State);
if (result == 1) then
	return
end

if (result == 2) then
	--此句话是敌方玩家与对方的报名Npc的对话
	Say("Ngi  x﹎ chi誱 nc ta, gi誸 ch誸 ng b祇 ta, ta th� s�  ngi ch誸 trong cay ng!",0)
end


--报名时期
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
	if ( nGroup == 1) then 
    		Say("T竧 c� ch髇g ta u ph秈 c� tr竎h nhi謒 cho d﹏ t閏, b﹜ gi� l� l骳 ta ph鬰 v� cho qu� hng!",0)
  		else
    		Say("Ngi  x﹎ chi誱 nc ta, gi誸 ch誸 ng b祇 ta, ta th� s�  ngi ch誸 trong cay ng!",0)
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,1) >= MAX_S_COUNT) then
		Say("Hi謓 t筰 qu﹏ l鵦    ti猽 di謙 qu﹏ Kim, binh s� h穣 vui l遪g ch� t ti誴 theo!", 0)
	return
	end;
	
	Say("Hi謓 t筰 qu﹏ l鵦    ti猽 di謙 qu﹏ Kim, binh s� h穣 vui l遪g ch� t ti誴 theo!",2, "T玦  tham d�. /Yes", "H穣  t玦 ngh�!/No");
end;

--交战时期
if (State == 2) then 
	Say("B筺 vui l遪g t譵 m閠 n琲  ch鑞 tho竧",0);
	return 
end;

end;

function Yes()
if (GetMissionV(1) ~= 1) then
	return
end
if (GetLevel() >= 40) then 
  if (Pay(MS_SIGN_MONEY) == 1) then
  Msg2Player("Ch祇 m鮪g b筺 tham gia chi課 trng!");
  V = GetMissionV(5);
  SetMissionV(5, V + 1);
  AddMSPlayer(1,1);
  SJ_JoinS();
  SetTask(SJKILLNPC,0);
  SetTask(SJKILLPK,0);
  --CheckGoFight()
  return 
  end;
end;

Say("B筺 ch璦 t c蕄 40 ho芻 kh玭g  ti襫",0);
end;

function No()
Say("H穣 suy ngh� l筰 甶! th阨 gian c� h筺!",0);
end;
