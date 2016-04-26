IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")

function main()
npcidx = GetLastDiagNpc();

--����ͬʱ����һ���������ˣ����ٲ���
if (GetNpcParam(npcidx, 4) == 0 ) then
	return
end;

if (GetMissionV(MS_STATE) ~= 2) then
	delnpcsafe(npcidx);
	print("flagobj Event error, because Mission no Start, yet");
	return 
end;

--�̶�ģʽʱ�������õз�����
if (GetMissionV(MS_FLAGMODE) == 1) then
	if (GetNpcParam(npcidx, 3) ~= GetCurCamp()) then
		Msg2Player("��������ͼ�����˧�죡")
		return
	end
end

	if (BT_GetData(PL_PARAM1) ~= 0 or BT_GetData(PL_PARAM2) ~= 0) then
		Msg2Player("���Ѿ��������ˣ������ٶ����������ӣ�");
		return
	end

	x = GetNpcParam(npcidx, 1);
	y = GetNpcParam(npcidx, 2);
	
	ChangeOwnFeature(0,0,643);
	
	BT_SetData(PL_PARAM1, x)
	BT_SetData(PL_PARAM2, y)


	Msg2Player("��ᵽ��˧�죬��Ҫʹ����꽫��嵽<color=yellow>"..floor(x/(32*8)).."��"..floor(y/(32*16)));
	W,X1,Y1 = GetWorldPos();
	if (GetCurCamp() == 1) then
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>�η�<color=yellow>"..GetName().."<color=0x00FFFF>��<color=yellow>"..floor(X1/8).."��"..floor(Y1/16).."<color=0x00FFFF>λ�ö�ȡ˧�죬Ŀǰ��ǰ��<color=yellow>"..floor(x/(32*8)).."��"..floor(y/(32*16)))
		AddSkillState(460, 1, 0, 1000000 ) --��ɫ�⻷���ֱ����
		AddSkillState(656,30,0,100000) --����ҵ��ٶ�
		ST_SyncMiniMapObj(x, y);
		sf_setflagplayer(1, PlayerIndex)
	else
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>��<color=yellow>"..GetName().."<color=0x9BFF9B>��<color=yellow>"..floor(X1/8).."��"..floor(Y1/16).."<color=0x9BFF9B>λ�ö�ȡ˧�죬Ŀǰ��ǰ��<color=yellow>"..floor(x/(32*8)).."��"..floor(y/(32*16)))
		AddSkillState(461, 1, 0, 1000000 ) --��ɫ�⻷���ֱ����
		AddSkillState(656,30,0,100000) --����ҵ��ٶ�
		ST_SyncMiniMapObj(x, y);
		sf_setflagplayer(2, PlayerIndex)
	end
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx);
end;