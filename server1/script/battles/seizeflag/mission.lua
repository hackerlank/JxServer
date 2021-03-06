IncludeLib("BATTLE");
IncludeLib("TITLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
--夺旗模式中PL_PARAM1 和PL_PARAM2用于当玩家属于旗手时，目标点的坐标


function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
	level = BT_GetGameData(GAME_LEVEL);
	
	if (level <= 0) then
		print("Error!!!can not start battle because battlelevel <= 0")
		return
	end

	flagmode = sj_selectmode()
	SetMissionV(MS_FLAGMODE , flagmode)

	SetMissionV(MS_FLAGCOUNT, 40)
	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--显示与统计总积分
	BT_SetView(PL_KILLPLAYER);--杀玩家数目
	BT_SetView(PL_KILLNPC);--杀Npc数目
	BT_SetView(PL_BEKILLED);--本玩家被杀次数
	BT_SetView(PL_SNAPFLAG);--夺旗数目
	BT_SetView(PL_GETITEM);
	BT_SetView(PL_MAXSERIESKILL);--连斩次数
	
	BT_SetGameData(GAME_CAMP1, 0) --设置当前宋方人数
	BT_SetGameData(GAME_CAMP2, 0) --设置当前金方人数

	subworldid = SubWorldIdx2ID(SubWorld)	
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
	
	--设置煌之章活动奖励倍数
	SetMissionV(MS_HUANGZHIZHANG, greatnight_huang_event(1))
	
	--获得地图相对应的设定文件名
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	

	--得到该地图有几个区域
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("battle"..BT_GetGameData(GAME_RULEID).." error! areacount <= 1");
		return
	end
	
	--随机从所有区域中抽取两个，作为双方的主区域
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)
	
	BT_SetGameData(GAME_CAMP1AREA, s_area);
	BT_SetGameData(GAME_CAMP2AREA, j_area);

	area_section1 = "Area_"..s_area;
	area_section2 = "Area_"..j_area;
-------------------------------------------------------------------------
--读取两个区域的大营内点坐标
	--从大营到后营时的坐标点
    file = GetIniFileData(mapfile, area_section1 , "centertohomepos")
    x,y =bt_getadata(file)
	SetMissionV(MS_HOMEIN_X1, floor(x/32))
	SetMissionV(MS_HOMEIN_Y1, floor(y/32))

	file = GetIniFileData(mapfile, area_section2 , "centertohomepos")
    x,y = bt_getadata(file)
	SetMissionV(MS_HOMEIN_X2, floor(x/32))
	SetMissionV(MS_HOMEIN_Y2, floor(y/32))
	
	--从后营到大营的坐标点
	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos")
	SetMissionS(1, file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X1, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y1, floor(y/32))

 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos")
	SetMissionS(2,file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X2, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y2, floor(y/32))
	
-------------------------------------------------------------------------
	
	--摆放Trap点
	--摆放双方后营的Trap点

	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap")
	bt_addtrap(hometrapfile, FILE_HOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap");
	bt_addtrap(hometrapfile, FILE_HOMETRAP2)


	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertohometrap")
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertohometrap");
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP2)
	
	
	--摆放双方军营的trap点

	centertrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	centertrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	

	--摆放对话类型Npc
	--军医的摆放
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "宋军军需官");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x * 32, y * 32, "金军军需官");
	
	
	--帅旗的摆放
	symbolnpcfile = GetIniFileData(mapfile, "Area_"..s_area, "symbolnpc");
	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL1, " ");
	symbolnpcfile = GetIniFileData(mapfile, "Area_"..j_area, "symbolnpc");
	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL2, " ");
	
	
	--贮物箱的摆放
	depositxy = GetIniFileData(mapfile, "Area_"..s_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT, x * 32,y * 32);
	

	
	depositxy = GetIniFileData(mapfile, "Area_"..j_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT, x * 32, y * 32);
	
	
	StartMissionTimer(MISSIONID, 22, TIMER_2);
	--随机模式需要打开每X分钟触发一次的触发器，以产生新旗
	StartMissionTimer(MISSIONID,21, TIMER_1);
	
	SetMissionV(MS_STATE,1);--允许报名了
	if (level == 1) then
		lvlstr = "初级战场的"
	elseif (level == 2) then
		lvlstr = "中级战场的"
	else
		lvlstr = "高级战场的"
	end
	
	RestMin, RestSec = GetMinAndSec(1800);
	local str1 = lvlstr.."宋金战役之夺旗模式一触即发，目前正进入报名阶段，欲参战者请尽快从襄阳或朱仙镇进入，或使用宋金诏书进入宋金战场报名点报名,报名剩余时间:"..RestMin.."分"..RestSec.."秒。参战条件:等级不小于40级，报名费"..BATTLES_JOINFEE.."两。";
	AddGlobalNews(str1);
	CreateChannel("宋方"..szGAME_GAMELEVEL[level].."夺旗", 9)
	CreateChannel("金方"..szGAME_GAMELEVEL[level].."夺旗", 10)
	if (GetMissionV(MS_FLAGMODE) == 1) then
		BT_SetMissionName("固定夺旗模式")
		BT_SetMissionDesc("背景：公元1160年，金主完颜亮为实现灭宋大计，积极集结大军，酝酿南下。金军频频南侵，首当其冲的便是南宋重镇襄阳，一场艰苦卓绝的襄阳防卫战即将展开。<enter><enter><color=yellow>固定夺旗：将敌方大营内的帅旗夺到己方大营的指定目的地，夺旗数量多的一方获胜。<enter>夺旗：点击敌方举旗NPC<enter>插旗：使用在军需官处购买的旗标")
		WriteLog(lvlstr.."宋金大战固定夺旗模式开始报名。地图ID为："..subworldid.."。时间："..date("%H:%M"))
	else
		BT_SetMissionName("随机夺旗模式")
		BT_SetMissionDesc("背景：公元1160年，金主完颜亮为实现灭宋大计，积极集结大军，酝酿南下。金军频频南侵，首当其冲的便是南宋重镇襄阳，一场艰苦卓绝的襄阳防卫战即将展开。<enter><enter><color=yellow>随机夺旗：将大营和野外的帅旗运送到随机的指定目的地，夺旗数量多的一方获胜。<enter>夺旗：点击举旗NPC<enter>插旗：使用在军需官处购买的旗标")
		WriteLog(lvlstr.."宋金大战随机夺旗模式开始报名。地图ID为："..subworldid.."。时间："..date("%H:%M"))
	end

end;

function RunMission()
	SetMissionV(MS_STATE,2);
	
	--从宋方产生一个目标点在金方的金旗
	if (GetMissionV(MS_FLAGMODE) == 1) then
		sf_createflag(1, BT_GetGameData(GAME_CAMP1AREA), BT_GetGameData(GAME_CAMP2AREA))
		sf_createflag(2, BT_GetGameData(GAME_CAMP2AREA), BT_GetGameData(GAME_CAMP1AREA))
	end
	
	local subworldid = SubWorldIdx2ID(SubWorld);
	local level = BT_GetGameData(GAME_LEVEL);
	if (level == 1) then
		lvlstr = "初级战场的"
	elseif (level == 2) then
		lvlstr = "中级战场的"
	else
		lvlstr = "高级战场的"
	end
	if (GetMissionV(MS_FLAGMODE) == 1) then
		WriteLog(lvlstr.."宋金大战固定夺旗模式开战。地图ID为："..subworldid.."。开战时间："..date("%H:%M").."此时宋金人数比为"..GetMSPlayerCount(MISSIONID, 1).."："..GetMSPlayerCount(MISSIONID, 2))
	else
		WriteLog(lvlstr.."宋金大战随机夺旗模式开战。地图ID为："..subworldid.."。开战时间："..date("%H:%M").."此时宋金人数比为"..GetMSPlayerCount(MISSIONID, 1).."："..GetMSPlayerCount(MISSIONID, 2))
	end

	local idx = 0;
	local pidx = 0;
	local oldPlayerIndex = PlayerIndex
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		--此时为GM发布命令，正式打响战斗
		if (pidx > 0) then
			PlayerIndex = pidx;
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() );
			PutMessage("敌军已经开始行动，将士们赶赴前线，奋勇杀敌呀！");
		end;
		if (idx <= 0) then 
			break
		end;
	end;
	PlayerIndex = oldPlayerIndex
end;

function EndMission()
	StopMissionTimer(MISSIONID, 21);
	StopMissionTimer(MISSIONID ,22);
	
	GameOver();
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("宋方"..szGAME_GAMELEVEL[level].."夺旗")
	DeleteChannel("金方"..szGAME_GAMELEVEL[level].."夺旗")

	SetGlbValue(GLB_BATTLESTATE, 0) --设置该全局变量为1，标志当前服务器正处于宋金战役阶段，此时襄阳或朱仙镇的出口点自动设在宋金战役的报名点，否则则设在原宋金战场地图
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
	ResetBonus()		--计算积分系数，重置积分
end;

function OnLeave(RoleIndex)
	level = BT_GetGameData(GAME_LEVEL);
	PlayerIndex = RoleIndex;
	branchTask_JoinSJend1()
	-- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0)
	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "宋方"..szGAME_GAMELEVEL[level].."夺旗")
	else
		LeaveChannel(PlayerIndex, "金方"..szGAME_GAMELEVEL[level].."夺旗")
	end
	sf_onplayerleave()
	SyncTaskValue(700 + PL_BATTLEPOINT);--同步玩家的总积分给客户端，用于积分购买功能
	AddSkillState(656,30,0,0) --降玩家的速度
	AddSkillState(661,5,0,0) --清除玩家的称号技能数据
	Title_ActiveTitle(0);
	local nRecord = GetTask(PL_TOTALPOINT + 750);	--By Liao Zhishan
	local nBeiShu = greatnight_huang_event(1);
	if (nBeiShu > 0) then
		nRecord = floor(nRecord / nBeiShu);
	end;
	local nOffered = GetTask(2435);
	SetTask(2435, nRecord);
	if (nRecord > nOffered) then
		tongaward_battle(nRecord - nOffered);--
	end;

	if (GetMissionV(MS_TIMER1_TIME) < (TIMER_2 / TIMER_1)) then
		BT_UpdateMemberCount();
	end	
	ResetBonus()		--计算积分系数，重置积分
end;

function sj_selectmode()
	mode_1 = tonumber(BT_GetBattleParam(13))
	mode_2 = tonumber(BT_GetBattleParam(14))
	
	if (mode_1 == nil) then
		mode_1 = 0;
	end;
	
	if (mode_2 == nil) then
		mode_2 = 0;
	end;
	
	local q = mode_1 + mode_2
	if (q == 0) then
		return random(1,2)
	end
	
	if (random(q) < mode_1) then
		return 1
	else
		return 2
	end
end