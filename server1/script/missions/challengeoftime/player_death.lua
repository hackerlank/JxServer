-- description	: �������
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\challengeoftime\\include.lua")

function OnDeath(index)
	-- �޸��������
	local count = GetMSPlayerCount(MISSION_MATCH) - 1;
	if (count < 0) then
		count = 0;
	end
	SetMissionV(VARV_PLAYER_COUNT, count);

	if (GetMissionV(VARV_NPC_COUNT) ~= 0) then
		-- �Ƿ�ӳ�����
		local name = GetMissionS(VARS_TEAM_NAME);
		if (name == GetName()) then
			broadcast(name .. "����ӳ�����!");
		end
		
		-- �Ƿ�ȫ������
		if (count == 0) then
			broadcast(name .. "ȫ������!");
		end
	end
	DelMSPlayer(MISSION_MATCH, 1);
	-- ��mission��ͨ���������
	Msg2MSAll(MISSION_MATCH, GetName() .. "��������!");	
	SetLogoutRV(0)	
	NewWorld(11,3207,4978)
	-- ���ͻر����ص�
	-- local world = GetMissionV(VARV_SIGNUP_WORLD);
	-- local pos_x = GetMissionV(VARV_SIGNUP_POSX);
	-- local pos_y = GetMissionV(VARV_SIGNUP_POSY); 
	-- NewWorld(world, pos_x, pos_y);
	-- -- DEBUG
	-- print(format("%s�����۱��������������߻�(%d,%d,%d)λ��", GetName(), world, pos_x, pos_y));
end