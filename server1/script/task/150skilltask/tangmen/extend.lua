Include("\\script\\task\\150skilltask\\tangmen\\register.lua")

local tbFactSkill = {
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710},},
}

function pTask:CheckMissionCondition()
	if GetLevel() < 150 then
		return
	end
	---调整接150技能任务需要重生2次以上  - Modified By NgaVN - 20121207
	local nTransLife = ST_GetTransLifeCount()	
	if nTransLife < 2  then
		return
	end
	local nFact = GetLastFactionNumber()
	if nFact == nil then
		return
	end
	local tbFact = %tbFactSkill[nFact]
	if tbFact == nil then
		return
	end
	local nFlag = 0
	for i = 1, getn(tbFact[90]) do
		if HaveMagic(tbFact[90][i]) >= 0 then
			nFlag = 1
			break
		end
	end
	if nFlag == 0 then
		return
	end
	if HaveMagic(tbFact[120][1]) < 0 then
		return
	end
	return 1
end