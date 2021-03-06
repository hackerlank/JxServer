Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\missions\\battle\\battle.lua")
Include("\\script\\lib\\file.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")

FRAME2TIME = 18
PREPARE_TIME = 5 * 60
RUNNING_TIME = 60 * 60
MINUTE_TIME = 60
TEMPLATE_MAP_ID = {970,971}

CAMP2AREA = 
{
	[CAMP_SONG] = 1,
	[CAMP_KIM] = 2
}

NPC_INFO = 
{
	{1, "doctornpc", 55, "军需官(宋)", "\\script\\missions\\battle\\npc\\doctor.lua"},
	{2, "doctornpc", 49, "金国军需官", "\\script\\missions\\battle\\npc\\doctor.lua"},
	{1, "symbolnpc", 629, "", "", 1},
	{2, "symbolnpc", 630, "", "", 1},
	{1, "depositobj", 625, "储物箱", "\\script\\battles\\openbox.lua"},
	{2, "depositobj", 625, "储物箱", "\\script\\battles\\openbox.lua"},
}

local Rule = Dungeon:new_type("T鑞g Kim li猲 server")

function Rule:new_rule(pBattle)
	
	local nTemplateMapId = %TEMPLATE_MAP_ID[random(1, getn(%TEMPLATE_MAP_ID))]
	return self:new_dungeon(nTemplateMapId, {pBattle})
end



function Rule:_init(pBattle)
	self.pBattle = pBattle
	self:AddTimer(PREPARE_TIME * FRAME2TIME, self.NextState, {self})
	self.nRestTime = (PREPARE_TIME + RUNNING_TIME)
	self:AddTimer(MINUTE_TIME * FRAME2TIME, self.Report, {self})
	
	for i=1, getn(NPC_INFO) do
		self:AddNpc(unpack(NPC_INFO[i]))
	end
	
	ClearMapTrap(self.nMapId)
	for nAreaId=1, 2 do
		self:AddMapTrap(nAreaId, "hometrap")
		self:AddMapTrap(nAreaId, "centertohometrap")
		self:AddMapTrap(nAreaId, "centertrap")
	end
	pBattle.Data:InitData(self.nMapId)
	pBattle.Data:SetRestTime(self.nRestTime)
	
	local tbInfo = 
	{
		szBattleName = "T鑞g Kim li猲 server",
		szMissionName = "D筺g th鴆 C鮱 s竧",
		szMissionDesc = "B鑙 c秐h: n╩ 1160 C玭g Nguy猲, Kim ch� Ho祅g Nhan Lng v� mu鑞 th鵦 hi謓 m璾  gi謙 T鑞g, t藀 trung i qu﹏, ti課 v� ph輆 Nam, qu﹏ Kim d莕 x﹎ chi誱 mi襫 Nam, chi誱 l躰h th祅h Tng Dng, m� ra m閠 cu閏 chi課 tranh t祅 kh鑓, b秓 v� th祅h Tng Dng v� c飊g gian kh�. <enter><enter><color=yellow>. Phng th鴆 chi課 u: Trong chi課 trng, ngi ch琲 h� 頲 nhi襲 k� d辌h s� ghi di觤 cho b猲 .B猲 n祇 甶觤 cao h琻 l� th緉g. <enter> trong chi課 trng kh玭g c� NPC chi課 u.",
		szMiniMap = format("Tr薾 th� %d", pBattle.nId),
	}	
	pBattle.Data:SetGameInfo(tbInfo)
	return 1
end
function Rule:Report()
	self.nRestTime = self.nRestTime - MINUTE_TIME
	self.pBattle.Data:SetRestTime(self.nRestTime)
	if self.pBattle.nState == RUN_STATE then
		local nSongPoint = self.pBattle.Data:GetCampPoint(CAMP_SONG)
		local nKimPoint = self.pBattle.Data:GetCampPoint(CAMP_KIM)
		Msg2Map(self.nMapId, format("觤 s� hi謓 t筰 c馻 b猲 T鑞g: %d, 觤 s� b猲 Kim: %d", nSongPoint, nKimPoint))
	end
	
	if self.nRestTime == 0 then
		return 0
	else
		return MINUTE_TIME * FRAME2TIME
	end
end

local str2point = function(str)
	local m = strfind(str,",")
	local x = tonumber(strsub(str,0,m-1))
	local y = tonumber(strsub(str,m+1))
	return x,y
end
function Rule:AddNpc(nAreaId, szKey, nNpcId, szNpcName, szLuaFile, bFile)
	if bFile ~= 1 then
		local szPoint = self:GetMapData(nAreaId, szKey)
		local nX, nY = %str2point(szPoint)
		NpcFunLib:AddObjNpc(szNpcName, nNpcId, {{self.nMapId, nX ,nY}}, szLuaFile )
	else
		local szFile = self:GetMapData(nAreaId, szKey)
		local nCount = GetTabFileHeight(szFile)
		for nRow=1, nCount do 
			local nX = tonumber(GetTabFileData(szFile, nRow + 1, 1))
			local nY = tonumber(GetTabFileData(szFile, nRow + 1, 2))
			NpcFunLib:AddObjNpc(szNpcName, nNpcId, {{self.nMapId, nX/32 ,nY/32}}, szLuaFile)
		end	
	end
end
function Rule:AddMapTrap(nAreaId, szKey)
	local szFile = self:GetMapData(nAreaId, szKey)
	local nCount = GetTabFileHeight(szFile)
	local szLuaFile = format("\\script\\missions\\battle\\trap\\%s.lua", szKey)
	for nRow=1, nCount do 
		local nX = tonumber(GetTabFileData(szFile, nRow + 1, 1))
		local nY = tonumber(GetTabFileData(szFile, nRow + 1, 2))
		AddMapTrap(self.nMapId, nX, nY, szLuaFile, nAreaId)	
	end
end

function Rule:GetRandomAPos(nAreaId, szKey)
	local nPak = usepack(self.nPak)
	local szPosFile = self:GetMapData(nAreaId, szKey)
	local nX, nY = GetRandomAData(szPosFile)
	usepack(nPak)
	return nX, nY
end

function Rule:GetMapData(nAreaId, szKey)
	local szMapFile = GetMapInfoFile(self.nMapId)
	local szData = GetIniFileData(szMapFile, "Area_"..nAreaId, szKey);
	return szData
end

function Rule:NextState()
	if not self.pBattle then
		return 0
	end
	if self.pBattle.nState == PREPARE_STATE then
		self.pBattle.nState = RUN_STATE
		Msg2Map(self.nMapId, "Cu閏 chi課 b総 u")
		return RUNNING_TIME * FRAME2TIME
	elseif self.pBattle.nState == RUN_STATE then
		self.pBattle.nState = OVER_STATE
		self:close()
		return 0
	else
		self:close()
		return 0
	end
end


function Rule:OnEnterMap()
	local szName = GetName()
	if self.pBattle then
		if self.pBattle:JoinPlaying(szName) then
			local nCamp = self.pBattle:GetPlayerCamp(szName)
			SetCurCamp(nCamp)
			SetTmpCamp(nCamp)
			local nMapId, nX, nY = self:GetEnterPos(nCamp)
			SetTempRevPos(nMapId, nX * 32, nY * 32)
		else
			return self.pBattle:LeaveMap(szName)
		end
	end
	ForbidEnmity(1)
	SetPKFlag(1)
	SetFightState(0)
	SetTaskTemp(200, 1)
	SetPunish(0)
	DisabledStall(1)
	LeaveTeam()
	SetCreateTeam(0)
	DisabledUseTownP(1)
	ForbidChangePK(1)
	SetDeathScript("\\script\\missions\\battle\\playerdeath.lua")
end
function Rule:OnLeaveMap()
	local szName = GetName()
	if self.pBattle then
		local nCamp = self.pBattle:GetPlayerCamp(szName)
		if nCamp then
			LeaveChannel(PlayerIndex, format("%s tr薾 th� %d", CAMP_NAME[nCamp], self.pBattle.nId))
		end
		self.pBattle:QuitPlaying(szName)
		local nMapId, nX, nY = unpack(self.pBattle.pManager.tbSignUpPos)
		SetTempRevPos(nMapId, nX, nY)
	end
	ForbidEnmity(0)
	SetPKFlag(0)
	SetFightState(0)
	SetCurCamp(GetCamp())
	SetTmpCamp(0)
	SetTaskTemp(200, 0)
	SetPunish(1)
	DisabledStall(0)
	SetCreateTeam(1)
	DisabledUseTownP(0)
	ForbidChangePK(0)
	SetDeathScript("")
end

function Rule:close()
	ClearMapTrap(self.nMapId)
	DeleteChannel(format("%s tr薾 th� %d", CAMP_NAME[CAMP_SONG], self.pBattle.nId))
	DeleteChannel(format("%s tr薾 th� %d", CAMP_NAME[CAMP_KIM], self.pBattle.nId))
	if self.pBattle then
		self.pBattle:OnClose()
	end
	self:free()
end

function Rule:GetEnterPos(nCamp)
	local nPak = usepack(self.nPak)
	local nX, nY = self:GetRandomAPos(CAMP2AREA[nCamp], "homepos")
	usepack(nPak)
	return self.nMapId, nX/32,nY/32
end

function Rule:PreApplyMap()
	for i=1, getn(TEMPLATE_MAP_ID) do
		PreApplyDungeonMap(TEMPLATE_MAP_ID[i], 0, 0)
	end
end


local nTripMode = GetTripMode()
if nTripMode == 2 then
	
AutoFunctions:Add(Rule.PreApplyMap, Rule)

end


