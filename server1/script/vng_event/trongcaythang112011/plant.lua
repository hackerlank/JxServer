--Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\global\\judgeoffline_limit.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\vngtranslog.lua")
IncludeLib("SETTINGS")
SCRIPT_TREE = "\\script\\vng_event\\trongcaythang112011\\tree.lua"
LOG_HEAD = "Event_TrongCay"
tbTaskInfo = {
	[1] = 
	{
		nTaskID = 2914,
		nStartBit = 1,
		nBitCount = 12,
		nMaxValue = 900,
	},
	[2] = 
	{
		nTaskID = 2914,
		nStartBit = 13,
		nBitCount = 12,
		nMaxValue = 1501,
	},
}
tbKimLangXuanUseCount = {
	nTaskID = 2914,
	nStartBit = 25,
	nBitCount = 6,
	nMaxValue = 20,
}

tbTreeMap = {
	20,		
	53,		
	174,
	121,
	153,
	101,
	99,
	100,
	1,		
	11,	
	37,	
	78,	
	80,
	162,
	176,
}

tbTreeName = {
	[1] = "C�y Hoa H�ng",
	[2] = "C�y �a",
--	[3] = "Thi�n Tu� Th�nh V��ng",
--	[4] = "Thi�n Tu� T�i L�c",
--	[5] = "Thi�n Tu� Ng�n N�m",
--	[6] = "Thi�n Tu� May M�n",
--	[7] = "Thi�n Tu� Nguy�t Th�n",
--	[8] = "Thi�n Tu� B�t T�",
--	[9] = "Thi�n Tu� Ho�ng Kim",
--	[10] = "Thi�n Tu� B�ch Kim",
}
--tbTreeRate = {
--	[1] = 50,
--	[2] = 30,
--	[3] = 13.09,
--	[4] = 3,
--	[5] = 2,
--	[6] = 1,
--	[7] = 0.5,
--	[8] = 0.14,
--	[9] = 0.07,
--	[10] = 0.2,
--}

tbMaterial_ = {
[1] = {tbProp = {4,417,1,1,0,0},nCount=67},
[2] = {tbProp = {6,1,2255,1,0,0},nCount=1},
[3] = {tbProp = {0,6,1,3,3,0},nCount=1},
[4] = {tbProp = {1,4,0,2,0,0},nCount=1},
[5] = {tbProp = {6,1,2255,1,0,0},nCount=1},
[6] = {tbProp = {0,7,6,2,1,0},nCount=1},
[7] = {tbProp = {1,4,0,2,0,0},nCount=1},
[8] = {tbProp = {6,1,2255,1,0,0},nCount=1},
}


_Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Ng��i ch�i <color=yellow>%s<color=green> tr�ng C�y �a v� nh�n ���c ph�n th��ng <color=yellow><%s><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbAwardList = 
{
	[1] = {
		{szName = "�i�m Kinh Nghi�m", nExp=2000000, nRate = 59},
		{szName = "�i�m Kinh Nghi�m", nExp=4000000, nRate = 20},
		{szName = "�i�m Kinh Nghi�m", nExp=6000000, nRate = 15},
		{szName = "�i�m Kinh Nghi�m", nExp=10000000, nRate = 5},
		{szName = "�i�m Kinh Nghi�m", nExp=20000000, nRate = 1},
	},
	[2] = {
		[1] =	{szName = "�i�m Kinh Nghi�m", nExp = 6000000},
		[2] = {
			{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.05, CallBack = _Message},
			{szName="Kim � Kim B�i",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
			{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
			{szName="Kim Hoa Chi B�o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.2, CallBack = _Message},
			{szName="Ph� Th�y Chi B�o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.1, CallBack = _Message},
			{szName="Thanh C�u Th�ch",tbProp={6,1,2710,1,0,0},nCount=2,nRate=0.2},
			{szName="V�n L�c Th�ch",tbProp={6,1,2711,1,0,0},nCount=2,nRate=0.1},
			{szName="Th��ng Lang Th�ch",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.2},
			{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=25},
			{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1},
			{szName="Thi�n Long L�nh",tbProp={6,1,2256,1,0,0},nCount=1,nRate=1, nExpiredTime = 20111208},
			{szName="Huy�t Chi�n L�nh K� L� H�p",tbProp={6,1,2401,1,0,0},nCount=1,nRate=1},
			{szName="Vi�m �� L�nh",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5, nExpiredTime = 20111208},
			{szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1.5},
			{szName="Ti�u Di�u T�n",tbProp={6,1,2831,1,0,0},nCount=1,nRate=1, nExpiredTime = 20111208},
			{szName="C�u Ch�u L�nh",tbProp={6,1,30117,1,0,0},nCount=1,nRate=1},
			{szName="Ch�a Kh�a Nh� �",tbProp={6,1,2744,1,0,0},nCount=2,nRate=1, nExpiredTime = 20111208},
			{szName="Ho�n H�n ��n",tbProp={6,1,2837,1,0,0},nCount=1,nRate=5, nExpiredTime = 20111208},
			{szName="H�i long ch�u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=1, nExpiredTime = 20111208},
			{szName = "�i�m Kinh Nghi�m", nExp=5000000,nRate=35},
			{szName = "�i�m Kinh Nghi�m", nExp=7000000,nRate=16},
			{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=6},
			{szName = "�i�m Kinh Nghi�m", nExp=15000000,nRate=1.5},
			{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=0.5},
		},
	},
}

tbTreeList = {}
tbSeed = {}
tbTree = {}
tbTeam = {}
tbMaintainState = {}
tbAwardState = {}
tbShowState = {}

function clone(obj)
	local otype = type(obj)
	if (otype == "number") then
		return obj
	elseif (otype == "string") then
		local ret = obj
		return ret
	elseif (otype == "nil") then
		return obj
	elseif (otype == "table") then
		local ret = {}
		for key, val in obj do
			ret[clone(key)] = clone(val)
		end
		return ret
	else
		return obj
	end
end

function dialog_tree()
	local npc = GetLastDialogNpc()
	local tree = tbTreeList[npc]
	if (tree) then
		tree:Dialog()
	end
end

function select_tree()
	local npc = GetLastDlgNpc()
	if (npc > 0) then
		local tree = tbTreeList[npc]
		if (tree) then
			tree:Select()
		end
	end
end

function ontime(npcidx)
	local tree = tbTreeList[npcidx]
	if (tree) then
		return tree:Upgrade()
	else
		return 0, 0
	end
end

function tbSeed:InMapList(MapList)
	local MapId, _, _ = GetWorldPos()
	for i = 1, getn(MapList) do
		if (MapId == MapList[i]) then
			return 1
		end
	end
	return 0
end

-- DEBUG
function getplantcount()
	return tbSeed:GetPlantCount()
end

function setplantcount(Count)
	tbSeed:SetPlantCount(Count)
end

function addplantcount()
	tbSeed:AddPlantCount()
end
--�������ʹ��C�y �a������
function tbSeed:GetPlantCount(kind)
	return  tbVNG_BitTask_Lib:getBitTask(tbTaskInfo[kind])
end

function tbSeed:AddPlantCount(kind)
	tbVNG_BitTask_Lib:addTask(tbTaskInfo[kind], 1)
	if kind == 1 then
		local tbLogTittle = {
			[500] = "SuDungHatGiongHoaHong500Lan",
			[900] = "SuDungHatGiongHoaHong900Lan",
		}
		local nUsedCount = self:GetPlantCount(kind)
		if tbLogTittle[nUsedCount] then
			tbLog:PlayerActionLog(LOG_HEAD,tbLogTittle[nUsedCount])
			tbVngTransLog:Write("201111_EventTrongCay/", 19, tbLogTittle[nUsedCount], "N/A", 1)
		end
	elseif kind == 2 then
		local tbLogTittle = {
			[50] = "SuDung50LanHatGiongCayDa",
			[100] = "SuDung100LanHatGiongCayDa",
			[200] = "SuDung200LanHatGiongCayDa",
			[300] = "SuDung300LanHatGiongCayDa",
			[400] = "SuDung400LanHatGiongCayDa",
			[500] = "SuDung500LanHatGiongCayDa",
			[600] = "SuDung600LanHatGiongCayDa",
			[700] = "SuDung700LanHatGiongCayDa",
			[800] = "SuDung800LanHatGiongCayDa",
			[900] = "SuDung900LanHatGiongCayDa",
			[1000] = "SuDung1000LanHatGiongCayDa",
			[1100] = "SuDung1100LanHatGiongCayDa",
			[1200] = "SuDung1200LanHatGiongCayDa",
			[1300] = "SuDung1300LanHatGiongCayDa",
			[1400] = "SuDung1400LanHatGiongCayDa",
			[1501] = "SuDung1500LanHatGiongCayDa",
		}
		local nUsedCount = self:GetPlantCount(kind)
		if tbLogTittle[nUsedCount] then
			tbLog:PlayerActionLog(LOG_HEAD,tbLogTittle[nUsedCount])
			tbVngTransLog:Write("201111_EventTrongCay/", 19, tbLogTittle[nUsedCount], "N/A", 1)
		end
	end
	--print(tbVNG_BitTask_Lib:getBitTask(tbTaskInfo[kind]))
end

---- DEBUG
--function tbSeed:SetPlantCount(Count)
--	local curr_date = tonumber(GetLocalDate("%y%m%d"))
--	TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE, curr_date)
--	TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT, Count)
--end

function tbSeed:Check(kind)
	if (tbSeed:InMapList(tbTreeMap) == 0 or GetFightState() == 1) then
		Say("Ch� ���c tr�ng c�y t�i n�i phi chi�n ��u th�nh th�, t�n th� th�n!")
		return 0
	end

	if (offlineCheckPermitRegion() == 0) then
		Say("Kh�ng ���c tr�ng c�y t�i nh�ng n�i g�n xa phu ho�c xung quanh nh�ng n�i ��ng ng��i")
		return 0
	end
	local mate_name = GetName()
	if ST_GetTransLifeCount() < 1 and (GetLevel() < 50) then
		Say(format("Nh�n v�t %s ch�a �� c�p 50!", mate_name))
		return 0
	end		
	local nCount = tbVNG_BitTask_Lib:getBitTask(tbTaskInfo[kind])
	local nMaxCount = 0
	if kind == 1 then		
		nMaxCount = 500 + tbVNG_BitTask_Lib:getBitTask(tbKimLangXuanUseCount)*20
	else
		nMaxCount = tbTaskInfo[kind].nMaxValue
	end
	if nCount >= nMaxCount  then
		Talk(1, "", "Tr�ng c�y �� ��t gi�i h�n, kh�ng th� tr�ng th�m")
		return 0
	end
	return 1
end

function tbSeed:RandomKind()
	local num = floor(random(1, 10000))
	local sum = 0
	local count = getn(tbTreeRate)
	for i = 1, count do
		sum = floor(sum + tbTreeRate[i]*100)
		if (num <= sum) then
			return i
		end
	end	
	return count
end

function tbSeed:Grow(Kind)
	local self_name = GetName()
	local members = {self_name}
	local tree = tbTree:New(Kind, members)
	if (not tree) then
		tbLog:PlayerActionLog(LOG_HEAD,"TrongCayThatBai")
		return 0
	end	
	tbSeed:AddPlantCount(Kind)
	if Kind == 2 and tbVNG_BitTask_Lib:getBitTask(tbTaskInfo[Kind]) == 1501 then
		local tbAward = {szName="R��ng Th�n B�",tbProp={6,1,30158,1,0,0},nCount=1, nExpiredTime = 20111201}
		local tbTranslog = {strFolder ="201111_EventTrongCay/", nPromID = 19, nResult = 1}	
		tbAwardTemplet:Give(tbAward, 1, {"Event_TrongCay", "SuDung1501LanHatGiongCayDaNhanRuongThanBi", tbTranslog})
	end
	if (Kind == 7 or Kind == 8 or Kind == 9 or Kind == 10) then
		local handle = OB_Create()
		local msg = format("Ch�c m�ng cao th� <color=yellow>%s<color> �� tr�ng th�nh c�ng <color=yellow>%s<color>!", GetName(), tbTreeName[Kind])
		local _, nTongID = GetTongName()
		Msg2Tong(nTongID, msg)
		ObjBuffer:PushObject(handle, msg)
		RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
		OB_Release(handle)
	end
	tbLog:PlayerActionLog(LOG_HEAD,"TrongCayThanhCong", tree.Name)
	return 1
end

function tbTeam:New(Members)
	local tb = clone(tbTeam)
	tb.MemberList = Members
	tb.Score = 0
	return tb
end

function tbTeam:FindMember(Name)
	for i = 1, getn(self.MemberList) do
		if (self.MemberList[i] == Name) then
			return 1
		end
	end
	return 0
end

function tbTeam:BroadCast(Msg)
	local player = PlayerIndex
	for i = 1, getn(self.MemberList) do
		local member = SearchPlayer(self.MemberList[i])
		if (member > 0) then
			PlayerIndex = member
			Msg2Player(Msg)
		end
	end
	PlayerIndex = player
end

function tbTree:New(Kind, Members)
	local tb = clone(tbTree)
	tb.Team = tbTeam:New(Members)
	local pos = {}
	pos[1] = SubWorld
	_, pos[2], pos[3] = GetWorldPos()
	pos[2] = pos[2] * 32
	pos[3] = pos[3] * 32
	tb.Pos = pos
	tb.Kind = Kind
	tb.Name = format("%s[%s]", tbTreeName[Kind], GetName())
	tb.Npc = AddNpc(tbMaintainInfo[1].Npc[Kind], 1, pos[1], pos[2], pos[3], 1, tb.Name)
	if (tb.Npc > 0) then
		SetNpcScript(tb.Npc, SCRIPT_TREE)
		tbLog:PlayerActionLog(LOG_HEAD, "TrongCayThanhCong", tb.Name, pos[1]..", "..pos[2]..", "..pos[3])	
	else
		tbLog:PlayerActionLog(LOG_HEAD, "TrongCayThatBai", tb.Name)
		return nil
	end

	local state = tbMaintainState:New(tb)
	--state:NotifyTeam(tb.Team)
	tb.State = state

	tbTreeList[tb.Npc] = tb
	-- ���붨ʱ��
	AddTimer(state.Timeout * 18, "ontime", tb.Npc)
	return tb
end

function tbTree:Dialog()
	local name = GetName()
	if (self.Team:FindMember(name) == 0) then
		Say("��y kh�ng ph�i l� c�y tr�ng c�a c�c h�.")
	else
		self.State:Dialog()
	end
end

function tbTree:Select()
	local name = GetName()
	if (self.Team:FindMember(name) == 1) then
		self.State:Process(self, self.Team, name)
	end
end
tbFicusSeed={}
function tbFicusSeed:CheckMaterials()
	tbRoomItems = GetRoomItems(0)
	for i=1,getn(tbRoomItems)do
		if not tbMaterial_[i] then
			return 0
		end
		local nG,nD,nP,nG1,nG2,nG3=GetItemProp(tbRoomItems[i])
		if nG ~= tbMaterial_[i].tbProp[1] or nD ~= tbMaterial_[i].tbProp[2] or nP ~= tbMaterial_[i].tbProp[3] or nG1 ~= tbMaterial_[i].tbProp[4] or nG2 ~= tbMaterial_[i].tbProp[5] or nG3 ~= tbMaterial_[i].tbProp[6] or tbMaterial_[i].nCount ~= GetItemStackCount(tbRoomItems[i]) then
			return 0
		end		
	end
	return 1
end

function tbTree:Upgrade()
	local oldnpc = self.Npc	
	local state = self.State:NextState(self, self.Team)
	if (not state) then
		DelNpc(self.Npc)		
		if self.State.nDidGetAward == 1 then --���콱
		WriteLog(format("%s\t%s\tCayBienMatDaNhanThuong\t%s\t%s",			
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			LOG_HEAD,
			self.Name,
			self.State.strName))
		else			
			WriteLog(format("%s\t%s\tCayBienMatChuaNhanThuong\t%s\t%s",			
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			LOG_HEAD,
			self.Name,
			self.State.strName))
		end
		tbTreeList[self.Npc] = nil
		return 0, 0
	else
		state:NotifyTeam(self.Team, self.Kind)
		self.State = state
		local newnpc = self.Npc
		if (oldnpc ~= newnpc) then
			tbTreeList[oldnpc] = nil
			tbTreeList[newnpc] = self
		end
		return state.Timeout * 18, self.Npc
	end
end

tbMaintainInfo = {
	[1] = {
		Dlg = "B�n ph�n cho c�y thi�n tu�",
		Msg = "H�y ti�n h�nh b�n ph�n cho c�y thi�n tu�",
		Err = "��i hi�p �� b�n ph�n cho c�y r�i",
		Npc = {1253, 1530},
		},
	[2] = {
		Dlg = "T��i n��c cho c�y thi�n tu�",
		Msg = "H�y ti�n h�nh t��i n��c cho c�y thi�n tu�",
		Err = "��i hi�p �� t��i n��c cho c�y r�i.",
		Npc = {1254, 1531},
		},
	[3] = {
		Dlg = "Di�t c� d�i cho c�y",
		Msg = "H�y ti�n h�nh di�t c� d�i cho c�y",
		Err = "��i hi�p �� di�t c� cho c�y r�i",
		Npc = {1255, 1453},
		},
--	[4] = {
--		Dlg = "B�t s�u cho c�y",
--		Msg = "H�y ti�n h�nh b�t s�u cho c�y",
--		Err = "��i hi�p �� b�t s�u cho c�y r�i",
--		Npc = 1532,
--		},
	[4] = {
		Dlg = "Tr�y l� cho c�y",
		Msg = "H�y ti�n h�nh tr�y l� cho c�y",
		Err = "��i hi�p �� tr�y l� r�i",
		Npc = {1255, 1453},
		}
}

function tbMaintainState:New(Tree)
	local tb = clone(tbMaintainState)
	tb.Turn = 1
	tb.Step = 1
	tb.OpFlag = {}
	tb.Time = tbMaintainState:Now()
	tb.Timeout = 30
	--print(format("[%s]Tree[%d] begin to maintain",
--		GetLocalDate("%Y-%m-%d %H:%M:%S"),
--		Tree.Npc))
	return tb
end

function tbMaintainState:Dialog()
	Say("B� c�ng s�c tr�ng c�y �t c� ng�y ���c h��ng hoa th�m, tr�i ng�t!",
		1,
--		format("%s/select_tree", tbMaintainInfo[self.Step].Dlg),
		"Ta ch� ��n ch�i/Cancel")
end

function tbMaintainState:NotifyTeam(Team)
--	local msg = tbMaintainInfo[self.Step].Msg
--	Team:BroadCast(msg)
end

function tbMaintainState:Now()
	return GetLocalTime()
end

function tbMaintainState:CaculateScore(Seconds)
	if (Seconds >= 46) then
		return 2
	elseif (Seconds >= 36) then
		return 4
	elseif (Seconds >= 26) then
		return 5
	elseif (Seconds >= 16) then
		return 3
	else
		return 1
	end
end

function tbMaintainState:Process(Tree, Team, Name)
--	if (PlayerFunLib:CheckItemInBag({tbProp={6,1,2348,1,-1,0}},1,"C�n %d Huy�n Thi�n Ch�y, c�c h� �em kh�ng �� s� l��ng!") ~= 1) then
--		return
--	end
	
	if (Team.MemberList[self.Turn] ~= Name) then
		Say("V�n ch�a ��n l��t, xin ��i m�t l�c n�a")
		return
	elseif (self.OpFlag[Name] == 1) then
		Say(tbMaintainInfo[self.Step].Err)
		return
	end
	self.OpFlag[Name] = 1
	local current = tbMaintainState:Now()
	
--	PlayerFunLib:ConsumeEquiproomItem({tbProp={6,1,2348,1,-1,0},},1)
	-- LOG
	WriteLog(format("[%s %s]%s maintain Tree[%d]",
		LOG_HEAD,
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Name,
		Tree.Npc))
	-- ������ӷ�
	local add = tbMaintainState:CaculateScore(current - self.Time)
	Team.Score = Team.Score + add
	local msg = format("Nh�n ���c %d �i�m, hi�n t�i t�ng �i�m l� %d!", add, Team.Score)
	Team:BroadCast(msg)
	-- LOG
	WriteLog(format("[%s %s]Tree[%d] add score(%d), total(%d)",
		LOG_HEAD,
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Tree.Npc,
		add,
		Team.Score))
end

function tbMaintainState:NextState(Tree, Team)
	if (self.Step >= getn(tbMaintainInfo)) then
		return tbAwardState:New()
	else
		self.OpFlag = {}
		self.Time = tbMaintainState:Now()
		self.Step = self.Step + 1
		local count = getn(Team.MemberList)
		self.Turn = mod(self.Turn, count) + 1
		DelNpc(Tree.Npc)
		local nNpcID = tbMaintainInfo[self.Step].Npc[Tree.Kind]		
		local npc = AddNpc(nNpcID, 1, Tree.Pos[1], Tree.Pos[2], Tree.Pos[3], 1, Tree.Name)
		if (npc > 0) then
			WriteLog(format("[%s %s]Tree[%d] upgrade to Tree[%d]",
				LOG_HEAD,
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				Tree.Npc,
				npc))
			SetNpcScript(npc, SCRIPT_TREE)
			Tree.Npc = npc
		end
		return self
	end
end

function tbAwardState:New()
	local tb = clone(tbAwardState)
	tb.AwardFlag = {}
	tb.Timeout = 120
	return tb
end

function tbAwardState:Dialog()
--	Say("��y l� 1 c�y thi�n tu� th�t ��p",
--		2,
--		"Ta mu�n nh�n th��ng/select_tree",
--		"Ta ch� ��n ch�i/Cancel")
	if CalcFreeItemCellCount() <= 10 then
		Talk(1, "", "Xin h�y ch�a �t nh�t 10 � tr�ng trong h�nh trang r�i m�i nh�n th��ng")
		return
	end
	select_tree()
end

function tbAwardState:Process(Tree, Team, Name)
	if (self.AwardFlag[Name] == 1) then
		Say("��i hi�p �� nh�n th��ng r�i")
		return
	end
	
	local tbAward = tbAwardState:GetAward(Tree.Kind)	
	if tbAward then
		self.AwardFlag[Name] = 1
		local tbTranslog = {strFolder ="201111_EventTrongCay/", nPromID = 19, nResult = 1}
		tbAwardTemplet:Give(tbAward, 1, {"Event_TrongCay", "NhanPhanThuong["..tbTreeName[Tree.Kind].."]", tbTranslog})
	end
--	if (exp > 0) then
--		AddOwnExp(exp)
--		Team:BroadCast(format("%s �� nh�n ���c ph�n th��ng kinh nghi�m l� %d!", Name, exp))
--	else
--		Say("Th�nh th�t ��ng ti�c, ��i hi�p kh�ng c� ph�n th��ng n�o. Xin h�y n� l�c l�n t�i!")
--	end
--	self.AwardFlag[Name] = 1
end

function tbAwardState:GetAward(kind)
	return tbAwardList[kind]
end

function tbAwardState:NotifyTeam(Team, Kind)
	Team:BroadCast(format("<color=green>Ch�c m�ng ��i hi�p �� tr�ng ���c %s th�t ��p, h�y nhanh ch�n ��n �� nh�n th��ng.<color>", tbTreeName[Kind]))
end

function tbAwardState:NextState(Tree, Team)
	local tb = tbShowState:New()
	local strName = Team.MemberList[1]
	tb.strName = strName
	if self.AwardFlag and self.AwardFlag[strName] then
		tb.nDidGetAward = self.AwardFlag[strName]
	else 
		tb.nDidGetAward = 0
	end
	return tb
end

function tbShowState:New()
	local tb = clone(tbShowState)
	tb.Timeout = 3
	return tb
end

function tbShowState:Dialog()
	Say("B� c�ng s�c tr�ng c�y �t c� ng�y ���c h��ng hoa th�m, tr�i ng�t!")
end

function tbShowState:Process(Tree, Team, Name)
	-- Do nothing
end

function tbShowState:NotifyTeam(Team)
	Team:BroadCast("Th�i gian nh�n th��ng k�t th�c")
end

function tbShowState:NextState(Tree, Team)
	return nil
end
