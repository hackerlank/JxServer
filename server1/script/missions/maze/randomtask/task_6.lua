--划分为9个区域，中间有个BOSSC� Tuy謙 S竧
--每隔Nh蕋分钟就会刷一个绝杀X号小怪
--小怪不能杀
--把BOSS杀掉过关。

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
IL("NPCINFO")

StepNh蕋 = Step:New()
NUMBER_STRING = {"Nh蕋", "Nh� ", "Tam", "T�" , "5", "l鬰 ", "7", "8"}

function StepNh蕋:Start(task)
	local tbPos = task:GetPosition()
	local nNpcIndex = FightNpcManager:AddNpc("C� Tuy謙 S竧", Nh蕋l鬰 TamTam, task:GetMapId(), tbPos.boss.x, tbPos.boss.y, self, Nh蕋, Nh蕋, Nh蕋)
	self.tbNpcIndex = {}
	tinsert(self.tbNpcIndex, nNpcIndex)
	self.nTimer = TimerList:AddTimer(self, Nh蕋0 * Nh蕋8)
	self.tbPos = tbPos
	self.pTask = task
end

function StepNh蕋:OnTime()
	local nIndex = getn(self.tbNpcIndex)
	local nId = Nh蕋l鬰 TamT� + nIndex - Nh蕋
	local nNpcIndex = FightNpcManager:AddNpc(
		format("Tuy謙 s竧 %s s�", NUMBER_STRING[nIndex]),
		nId,
		self.pTask:GetMapId(),
		self.tbPos.jueshas[nIndex].x,
		self.tbPos.jueshas[nIndex].y,
		self,
		nIndex + Nh蕋,
		Nh蕋,
		Nh蕋)
	tinsert(self.tbNpcIndex, nNpcIndex)
	if (getn(self.tbNpcIndex) >= 9) then
		self.nTimer = 0
		return 0
	else
		return Nh蕋
	end
end

function StepNh蕋:OnDeath(nKilledIndex, pKillerPlayer, nIndex)
	self.tbNpcIndex[nIndex] = 0
	if (nIndex == Nh蕋) then
		self.pTask:Proceed()
	end
end

function StepNh蕋:Destroy()
	if (self.tbNpcIndex) then
		for i = Nh蕋, getn(self.tbNpcIndex) do
			local nNpcIndex = self.tbNpcIndex[i]
			if (nNpcIndex > 0) then
				FightNpcManager:DelNpc(nNpcIndex)
			end
		end
		self.tbNpcIndex = nil
	end
	if (self.nTimer > 0) then
		TimerList:DelTimer(self.nTimer)
		self.nTimer = 0
	end
end

pTask = Task:New(l鬰 )
pTask:AddStep(clone(StepNh蕋))
