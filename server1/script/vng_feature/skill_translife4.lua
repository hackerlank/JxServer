IncludeLib("SETTING")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\lib\\log.lua")
TSK_WEEKLY_SJ = 2716 --本周宋金场数
TSK_WEEKLY_COT = 2717 --本周闯关场数
WEEKLY_SJ_REQUIRE = 10
WEEKLY_COT_REQUIRE = 6
function main(nItemIdx)
	if ST_GetTransLifeCount() ~= 4 then
		Talk(1, "", "Ch� nh鱪g nh﹏ v藅 tr飊g sinh 4 m韎 s� d鬾g 頲 v藅 ph萴 n祔!")
		return 1
	end
	local nSJ_count = VngTaskWeekly:GetWeeklyCount(TSK_WEEKLY_SJ)
	local nCOT_count = VngTaskWeekly:GetWeeklyCount(TSK_WEEKLY_COT)
	if nSJ_count < WEEKLY_SJ_REQUIRE or nCOT_count < WEEKLY_COT_REQUIRE then
		Talk(1, "", format("M鏸 tu莕 ph秈 tham gia 輙 nh蕋 10 tr薾 T鑞g Kim v� 6 l莕 Vt 秈 m韎 頲 s� d鬾g v藅 ph萴 n祔. S� l莕 tham gia c馻 c竎 h�: T鑞g Kim: <color=yellow>%d<color> - Vt 秈: <color=yellow>%d<color>", nSJ_count, nCOT_count))
		return 1
	end
	if tbVnTL4Skill:GetSkill() == 1 then
		return 0
	else
		return 1
	end
end

tbVnTL4Skill = {}
tbVnTL4Skill.tbSkill = {{1123, 10, "V� Uy Thu藅"},{1124, 10, "Nhc Th駓 Thu藅"},{1125, 10, "Tr蕁 Nh筩 Thu藅"},{1126, 10, "Y猲 Ba Thu藅"},{1127, 0, "Trng Sinh Thu藅"},{1128, 20, "B閠 H秈 Thu藅"},{1129, 20, "Th莕 Tu� Thu藅"},{1130, 20, "Truy 秐h Thu藅"}}
function tbVnTL4Skill:GetSkill()
	local nRand = tbVnTL4Skill:RandomSkill()
	if nRand <= 0 or nRand > 8 then
		return 0
	end
	local tbSkill = self.tbSkill[nRand]
	if HaveMagic(tbSkill[1]) < 0 then
		local nUsedSkillPoint = GetTask(2899)
		if nUsedSkillPoint > 0 then
			Talk(1, "", "C莕 ph秈 t葃 甶觤 k� n╪g tr飊g sinh 4 trc r錳 m韎 h鋍 k� n╪g m韎! H穣 n g苝 B綾 u L穙 Nh﹏  頲 gi髉 .")
			return 0
		end
		--remove skill c?
		for i = 1, getn(self.tbSkill) do
			if HaveMagic(self.tbSkill[i][1]) >= 0 then
				DelMagic(self.tbSkill[i][1])
			end
		end
		AddMagic(tbSkill[1], 0)
		if HaveMagic(tbSkill[1]) < 0 then
			return 0
		end
	end
	Msg2Player(format("Ch骳 m鮪g b筺  l躰h h閕 頲 v� c玭g <color=green>%s<color>", tbSkill[3]))
	tbLog:PlayerActionLog("SuDungBatThuatChanKinh", tbSkill[3])
	return 1
end

function tbVnTL4Skill:RandomSkill()
	local nTotal = 10000000
	local nCur = random(1, nTotal)
	local nStep = 0
	for i = 1, getn(self.tbSkill) do
		nStep = nStep + floor(self.tbSkill[i][2]*nTotal/100)
		if nCur < nStep then
			return i
		end
	end
end