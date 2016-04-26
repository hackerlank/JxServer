--��������
--1��������ڵ�Npc�Ի���ѡ�����ڼ���ս��
--2��������ϲ������������ս���ڣ���һ�ŵ�ͼ��������0��Ӫģʽ����
--3����������ߵ�Npc�Ի�������ѡ��������Ӫ��
--4�����Pk�������Զ����Գ����⣬���ڱ���ͼ��
--5�����������ʱ�����Զ���ͬ��ͼ��������ҹ�����ǰ��ս����
--6��������ԣ����Դ�Npc�Ի����˽⵱ǰ��������
--7���������԰��յȼ��ֳɸ�������
--��ս����Npc��ѡ����Ӫ��Npc
Include("\\script\\missions\\csbattlelib\\csbattlehead.lua");
Include("\\script\\missions\\hsbattle\\hshead.lua");
MapTab = {};
MapCount = 1;
MapTab[1]= {212, 1577, 3288};

function main()
	--���÷��ص�
	SetTask(300, 2);
	SetTask(301, 2605);
	SetTask(302, 3592);
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		Say("Ŀǰ��û���˱�����̨��������ʿ��������?",0)
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	if (GetMissionV(1) ~= 1) then 
		Say("Ŀǰ��û���˱�����̨��������ʿ��������?",0)
		return
	end;
	
	SubWorld = OldSubWorld;

	Say("Ŀǰ��û���˱�����̨������ֻ��Ҫ60�����ϣ���10000 �������þͿ�������!", 2, "�ã��������Ը�λ���ܵĲ���. /JoinHS", "���μ�/OnCancel");
end;

function JoinHS()
	LeaveTeam();
	if (CheckCondition() == 0) then
		Say("�㲻��ȼ����ߴ���Ǯ���������߲��ǽ������ˣ������ϻ�ɽ����", 0);
		return
	end;
	
	if (PrePay(MS_SIGN_MONEY) == 1) then
		NewWorld(MapTab[1][1], MapTab[1][2], MapTab[1][3]);
		idx = SubWorldID2Idx(MapTab[1][1]);
		if (idx == -1) then 
			return
		end;
		SubWorld = idx;
		JoinCamp(4);
		return
	end;
end;


function CheckCondition()
	if ( GetLevel() >= 60 and GetCamp() ~= 0 ) then
		if (GetCash() >= MS_SIGN_MONEY) then
			return 1;
		end;
 	end;
 	return 0;
end;

function OnCancel()
end;