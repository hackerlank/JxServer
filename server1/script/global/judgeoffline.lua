--�û�ѡ�������й�ʱ�Ľű�
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua");
Include("\\script\\global\\judgeoffline_limit.lua");		-- 2006��10��30�ռ������������г��г����Ժ��������йܵĽű�  by peres
Include("\\script\\item\\ib\\zimudai.lua");
Include("\\script\\lib\\player.lua")
Include("\\script\\trip\\define.lua")

arraymap = 
	{
		["1"] = "����",
		["11"] = "�ɶ�",
		["37"] = "�꾩",
		["80"] = "����",
		["78"] = "����",
		["162"] = "����",
		["176"] = "�ٰ�",
		["20"] = "�����",
		["53"] = "������",
		["54"] = "������",
		["99"] = "������",
		["100"] = "������",
		["101"] = "�����",
		["121"] = "������",
		["153"] = "ʯ����",
		["174"] = "��Ȫ��",
		["13"] = "����",
		["25"] = "����",
		["49"] = "����",
--		["59"] = "����",
		["81"] = "�䵱",
		["103"] = "����",
		["115"] = "ؤ��",
		["131"] = "����",
		["154"] = "����",
		["183"] = "�嶾",
--		["208"]	= "����",	--by �ӷ��� 2007/11/13 ��ֹ�����й�
		["235"] = "�һ�����һ��",
		["236"] = "�һ���������",
		["237"] = "�һ���������",
		["238"] = "�һ������ģ�",
		["239"] = "�һ������壩",
		["240"] = "�һ���������",
		["241"] = "�һ������ߣ�",
		["835"] = "������(һ)",
		["836"] = "������(��)",
		["837"] = "������(��)",
		["838"] = "������(��)",
		["839"] = "������(��)",
		["840"] = "������(��)",
		["586"] = "��������ͼ",
		["587"] = "�ɶ�����ͼ",
		["588"] = "��������ͼ",
		["589"] = "�������ͼ",
		["590"] = "�ٰ�����ͼ",
		["591"] = "��������ͼ",
		["593"] = "���ݰ���ͼ",
		["594"] = "�꾩����ͼ",
		["595"] = "��������ͼ",
		["596"] = "��������ͼ",
		["597"] = "��������ͼ",
	};

function judgeoffline(player_count, offline_count)
		
	-- szHour = date("%H");
	-- nHour = tonumber(szHour);
	
	-- sparetime = GetTask(AEXP_TASKID);	
	-- if (nHour >= AEXP_INVALIDTIMEBEGIN and nHour < AEXP_INVALIDTIMEEND) then 
	-- 		Say("<#>����<color=red>"..AEXP_INVALIDTIMEBEGIN..":00<color>-<color=red>"..AEXP_INVALIDTIMEEND..":00<color>ʱ�����ѡ�������йܣ����Լ�����̯���ף����ǲ����þ���ֵ�������Զ���ȡ��Ե�����ʱ���ϵͳ����۳���������й�ʱ�䣬����Ŀɽ�����Ϸʱ�����������㡣", 2, "��ȷ��Ҫ���������й���?/judgecontion", "��ʱ��Ҫ�ˡ�/donothing");
	-- 		return 5
	-- else
	--     judgecontion();
	-- end 	
	judgecontion();
	
	return 0
end

function judgecontion()
	--nmapsize = getn(arraymap);
	--blnin = 0;
	--for i=1,nmapsize do
		--if(arraymap[i] == mapid) then
			--blnin = 1;
			--break;
		--end
	--end

	--���������һ����ô�ɹ���ʼ�����й�
	local tbSpareTime = {};
										--��Ч��׾���	��ͨ��׾���	�׾���
	local tbAexpTask = {AEXP_TIANXING_TIME_TASKID,AEXP_SPECIAL_TIME_TASKID,AEXP_TASKID, AEXP_SMALL_TIME_TASKID,
											--��Ч���ܴ�׾���	���ܴ�׾���	���ܰ׾���
												AEXP_SPECIAL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SMALL_SKILL_TASKID};
	local btime = 0;
	for i = 1, getn(tbAexpTask) do
		tbSpareTime[i] = {};
		tbSpareTime[i][1] = GetTask(tbAexpTask[i]);
		tbSpareTime[i][2], tbSpareTime[i][3] = getFrame2MinAndSec(tbSpareTime[i][1]);	--���û���ʾ��ʾ������
		if (tbSpareTime[i][1] >= FRAME2TIME * 60 and btime ~= 1) then
			btime = 1;
		end;
	end;
	
	
	if (btime == 1 and IsCharged() == 1) then
		local nSkillExpID = GetTask(AEXP_SKILL_ID_TASKID);
		local szSkillExpName = "";
		if (nSkillExpID ~= 0) then
			szSkillExpName = "<color=yellow>"..GetSkillName(nSkillExpID).."<color>";
		else
			szSkillExpName = "<color=blue>δѡ����<color>";
		end
		
		local szmsg = format("����ί��ʱ�仹ʣ���쾫�׾���<color=red>%d<color>Сʱ <color=red>%d<color> ����"..
	"<enter>�ر��׾���<color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>ί�д�׾���<color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>ί�а׾���<color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>���ܴ����(%s): ��Ч���ܴ�׾���<color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>���ܰ׾���<color=red>%d<color>gi?<color=red>%d<color>����"..
	"<enter>���ܰ׾���<color=red>%d<color>Сʱ<color=red>%d<color>����"..
	"<enter>����ί��������쾫�׾���Ч�������ȸ��ְ׾��貢���۳���ӦЧ��.", 
					tbSpareTime[1][2],tbSpareTime[1][3],
					tbSpareTime[2][2],tbSpareTime[2][3],
					tbSpareTime[3][2],tbSpareTime[3][3],
					tbSpareTime[4][2],tbSpareTime[4][3],
					szSkillExpName, tbSpareTime[5][2],tbSpareTime[5][3],
					tbSpareTime[6][2],tbSpareTime[6][3],
					tbSpareTime[7][2],tbSpareTime[7][3]);
		local szSay =
		{	"��ʼ�����й�/beginoffline",
			"ѡ�������йܼ���/#selectofflineskill('judgecontion')",
			"��ʼ����ί��/begin_onlinecommission",
			"ֹͣ����ί��/end_onlinecommission",
			"�����콱/offlineaward",
			"���ٿ��ǿ���/donothing"
		};
		Describe(szmsg, getn(szSay), szSay[1], szSay[2], szSay[3], szSay[4], szSay[5], szSay[6]);
	else
		if (IsCharged() ~= 1) then
			Talk(1, "", "<#>��Ϊ�㲻�ǳ����˺ţ����Բ���ʹ������ί�����ܣ����ֵȻ��ʹ�ø�����.");
			return
		end;
		--beginoffline();
		--�û�ʣ���ʱ��
		Say("<#>���İ׾��辭��ί��ʱ�仹ʣ<color=red>0<color>���ӣ������ʹ���ر��׾�����ߴ�׾����������Լ���ί��ʱ��. <enter>������ѡ��<color=yellow> �������ί��<color>,���ֻ�ܻ��һ�㾭��.",
			3,
			"���ί��/beginoffline",
			"�����콱/offlineaward",
			"��������/donothing");
	end
end

-- ��ʼ�����й�
function begin_onlinecommission()
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	
	--�ж��û�ʣ���ʱ��
	local sparetime = getsparetime();
	if (sparetime <= 0) then
		Say("<#>��ʣ��������йܾ���ʱ��Ϊ0���ӣ����߲�δѡ�������йܵļ��ܣ�������ȷ�Ϻ���ʹ�øù��ܡ�", 0);
		return 3
	end

	if (GetOnlineCommissionStatus() ~= 0) then
		Msg2Player("<#>�������Ѿ��������й���")
	else
		Msg2Player("������������ί��״̬")
		SetOnlineCommissionStatus(1)
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tbegin_onlinecommission, last online time:%s",
						GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
		--EnableClientInput(0)
	end
end

-- ���������й�
function end_onlinecommission()
	if (GetOnlineCommissionStatus() == 0) then
		Msg2Player("<#>Ŀǰ��û������ί��")
	else
		SetOnlineCommissionStatus(0)
		--EnableClientInput(1)
		Msg2Player("<#>����ȡ������ί��")
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tend_onlinecommission, last online time:%s",
							GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
	end
end

function check_if_can_offline()
	
	local nTripMode = GetTripMode()
	if nTripMode == TRIP_MODE_SERVER then
		Talk(1, "", "������½⣬�����ڹ���������ʹ��ί������")
		return 1
	end
	--�����ж��û����ڵ�����
	mapid = SubWorldIdx2MapCopy(SubWorld);
	strmapid = ""..mapid.."";
	--û���ڵ�ǰ��ͼ��
	if (arraymap[strmapid] == nil) then
		Say("<#>�㲻�����������ʹ�������йܹ��ܣ����㵽��Ӧ���ض����򣨰������г��򡢴�ׯ�Լ�ʮ�������ڣ�ʹ�������йܡ�", 0);
		return 1
	end
	
	-- �ж��Ƿ���ĳЩ�������򣬱���˵�����������
	if offlineCheckPermitRegion()~=1 then
		Say("<#>�㲻�����������ʹ�������йܹ��ܣ����㵽��Ӧ���ض����򣨰������г��򡢴�ׯ�Լ�ʮ�������ڣ�ʹ�������йܡ�", 0);
		return 1;
	end;
	
	--�ж��û���ս��״̬
	if (GetFightState() ~= 0) then 
		Say("<#>��Ŀǰ����ս��״̬�У��޷����������й�״̬����������ս��״̬����ʹ�������йܡ�", 0);
		return 2
	end
	
	--�ж��û�ʣ���ʱ��
--	local sparetime = getsparetime();
--	if (sparetime <= 0) then
--		Say("<#>��ʣ��������йܾ���ʱ��Ϊ0���ӣ����߲�δѡ�������йܵļ��ܣ�������ȷ�Ϻ���ʹ�øù��ܡ�", 0);
--		return 3
--	end
	
	-- ��һ̨����������������800�ˣ��������������̨�������ڽ��������й�
	player_count = GetPlayerCount();
	local nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_LIMIT;
	if (mapid >= 835 and mapid <= 840) then
		nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_SPECIAL;--750
	end;
	if (player_count > nmax_count_limit) then
		Say("<#>��������ط��������ɽ�˺����㻹�ǵ������ĳ��򡢴�ׯ���������ٽ��������йܰɡ�",0);
		return 4
	end
	
	
end

function beginoffline()	
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	-- �ж��Ƿ��������й�
	if (GetOnlineCommissionStatus() ~= 0) then
		Say("<#>����ͣ����ί�У�Ȼ���������ί��.", 0)
		return 1
	end
	-- ��ʼ���߹һ�
	OfflineLive(PlayerIndex);
end

--ʲô�������ĺ��������ܶ���ط����õ����޸ĵ�ʱ����ע��
function donothing()
	
end

TASKID_OFFLINELIVE_EXP = {
	AEXP_SMALL_TIME_TASKID,
	AEXP_TASKID,
	AEXP_SPECIAL_TIME_TASKID,
	AEXP_TIANXING_TIME_TASKID
}

TASKID_OFFLINELIVE_SKILL = {
	AEXP_SMALL_SKILL_TASKID,
	AEXP_SKILL_TIME_TASKID,
	AEXP_SPECIAL_SKILL_TASKID
}

function getsparetime()
	--�ж��û�ʣ���ʱ��
	local nLeftTime = 0
	for i = 1, getn(TASKID_OFFLINELIVE_EXP) do
		nLeftTime = nLeftTime + GetTask(TASKID_OFFLINELIVE_EXP[i])
	end
	if (GetTask(AEXP_SKILL_ID_TASKID) ~= 0) then
		local nTime = 0
		for i = 1, getn(TASKID_OFFLINELIVE_SKILL) do
			nTime = nTime + GetTask(TASKID_OFFLINELIVE_SKILL[i])
		end
		if (nLeftTime < nTime) then
			nLeftTime = nTime
		end
	end
	return nLeftTime
end

-- ѡ�������йܼ���
function selectofflineskill()
	local aryExpSkill = getexpskill();
	local nExpSkillCount = getn(aryExpSkill);
	local aryszExpSkill = {};
	local szSayCmd = "��ѡ��ί��ְ��:";
	for i = 1, nExpSkillCount do
		aryszExpSkill[i] = format("%s/#onSetUpgradeSkill(%d)",aryExpSkill[i][2],aryExpSkill[i][1]);
	end
	tinsert(aryszExpSkill, "Tr? l�i/judgecontion")
	Say(szSayCmd, getn(aryszExpSkill), aryszExpSkill);
end

-- ���������йܼ���
function onSetUpgradeSkill(nUpgradeSkillID)
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
	judgecontion();
end

function offlineaward()
	local player = Player:New(PlayerIndex)
	DynamicExecute(
		"\\script\\global\\offlineaward.lua",
		"dlg_offlineaward",
		player)
end