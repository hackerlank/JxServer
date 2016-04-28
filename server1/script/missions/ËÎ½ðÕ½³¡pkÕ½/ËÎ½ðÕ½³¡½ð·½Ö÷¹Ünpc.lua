--接任务的Npc
--·参与的玩家等级必须大于40级；
--·宋方的玩家必须要到衡山独孤剑处报名；
--·金方的玩家必须要到汴京衙门口金国武将处报名；
--·报名时需要交纳一定的金钱；
-- Update by Dan_Deng(2003-10-23) 通过对话切换到战场外的，需要更改战斗状态为1

Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");


function main()


local State = GetMissionV(1) 

--未开始
if (State == 0 ) then 
	Say("Xin h穣 ngh� ng琲 v� ch� th玭g b竜!",0);
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

--异常情况直接退出
if (State > 2) then
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

local GroupV = GetTask(SJTASKVLAUE);
result = 0;
--如果该玩家是已经报名过的，断线重连进来的，则扔进去
result = CheckLastBattle(2, State)
if (result == 1) then
	return
end

if (result == 2) then
	--此句话是敌方玩家与对方的报名Npc的对话
	--比如 你们这些宋国的草民!我们大金国将士们各各善战智勇,铁骑纵横......等，有得是眼色看
	Say("Kim qu鑓 ch髇g t玦, ai c騨g d騨g c秏 v� quy誸 li謙, l祄 th� n祇 ngi c� th� x鴑g ng l祄 i th�?!",0)
end

--报名时期
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
 		if ( nGroup == 2 ) then 
 		--此句话是本方已报名的玩家与报名Npc的对话
    		Say("C� ch誸 c騨g trung th祅h v韎 Kim qu鑓!",0)
  		else
    		Say("Kim qu鑓 ch髇g t玦, ai c騨g d騨g c秏 v� quy誸 li謙, l祄 th� n祇 ngi c� th� x鴑g ng l祄 i th�?!",0);
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,2) >= MAX_J_COUNT) then
		Say("Hi謓 t筰 qu﹏ l鵦    ti猽 di謙 qu﹏ T鑞g, binh s� h穣 vui l遪g ch� t ti誴 theo!", 0)
	return
	end;
	
	--比如,目前宋国国力不振，宋国百姓生灵涂炭，我们大金国。。。。
	Say("T鑞g qu﹏ s� thua cu閏, ch� l� v蕁  th阨 gian, ngi c� mu鑞 c飊g ta hng vinh quang?!",2, "T玦  tham d�. /Yes", "H穣  t玦 ngh�!/No");
end;

--交战时期
if (State == 2) then 
	--此为在战斗正式打响之后，其它未报名玩家与报名Npc的对话
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
  V = GetMissionV(6);
  SetMissionV(6, V + 1);
  SJ_JoinJ();
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

