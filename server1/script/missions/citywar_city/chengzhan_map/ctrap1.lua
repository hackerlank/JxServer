--����ս ��ת��ͼto��ս��ͼ���سǷ���
--Trap ID������ս

Include("\\script\\missions\\citywar_city\\head.lua")

function main()
	ft = GetFightState();
	if (ft == 0) then 
		SetPos(1571,3263)
		SetFightState(1)
		bt_RankEffect(BT_GetData(PL_CURRANK))
	else
		if (GetCurCamp() ~= 1) then 
			Msg2Player("ȥ���ˣ�Ҫȥ�Ļ���Ҫ���о��ķ�����. ");
			SetPos(1571,3263)
		else
			SetPos(1565,3246)
			SetFightState(0)
		end;
	end;
end;