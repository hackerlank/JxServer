---- 文件名　：suxiaobaijuwan_150.lua
---- 创建者　：wangjingjun
---- 内容　　：150级技能的速效白驹丸
---- 创建时间：2011-07-28 10:57:36
--
--
--Include("\\script\\global\\baijuwanhead.lua")
--Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_event\\tochieukynang150\\head.lua")
--
--
--tbFastSpeedSkill_Banjuwan_150 = {}
--
--tbFastSpeedSkill_Banjuwan_150.nTargetExp = 1540
--
--function tbFastSpeedSkill_Banjuwan_150:AddSkillStatckExp(nSkillId, nExp)
--	local nTotleExp = nExp
--	local nNextExp = GetSkillNextExp(nSkillId) - GetSkillExp(nSkillId)
--	local nNeedAddExp = 0
--	local szSkillName = GetSkillName(nSkillId)
--	while nExp > nNextExp do
--		if GetCurrentMagicLevel(nSkillId, 0) >= GetSkillMaxLevel(nSkillId) then
--			Msg2Player(format("S� d鬾g B筩h C﹗ Ho祅 c Bi謙 th祅h c玭g, <color=yellow> %s <color>  tu luy謓 n﹏g cao <color=yellow> %d <color>", szSkillName, nTotleExp))
--			return
--		end
--		nNeedAddExp = nNextExp
--		nExp = nExp - nNeedAddExp
--		AddSkillExp(nSkillId, nNeedAddExp, 1)		
--		nNextExp = GetSkillNextExp(nSkillId)
--	end
--	AddSkillExp(nSkillId, nExp, 1)
--	Msg2Player(format("S� d鬾g B筩h C﹗ Ho祅 c Bi謙 th祅h c玭g, <color=yellow> %s <color>  tu luy謓 n﹏g cao <color=yellow> %d <color>", szSkillName, nTotleExp))
--end
--
--function tbFastSpeedSkill_Banjuwan_150:CheckSkill(nSkillId)
--	local nCurSkillLevel = GetCurrentMagicLevel(nSkillId, 0);
--	local nSkillExp = GetSkillExp(nSkillId)
--	
--	if HaveMagic(nSkillId) == -1 then
--		return 0
--	end
----	print("学习了当前的技能, nSkillId = " .. nSkillId)
----	print(nSkillExp .. "\t" .. nCurSkillLevel)
--	if nSkillExp ~= -1 and nCurSkillLevel >= 1 and nCurSkillLevel < GetSkillMaxLevel(nSkillId) then
--		return 1
--	end
--end
--
--function tbFastSpeedSkill_Banjuwan_150:AddSkillToList(tbDec, tbSrc)
--	for i = 1, getn(tbSrc) do
--		local nSkillId = tbSrc[i]
--		if self:CheckSkill(nSkillId) == 1 then
--			tinsert(tbDec , nSkillId)
--		end
--	end
--end
--
--function tbFastSpeedSkill_Banjuwan_150:GetCanUpdateSkill()
--	local tbSkill = {};
--	
--	self:AddSkillToList(tbSkill, ARY_UPGRADE_SKILL_150)
--	return tbSkill;
--end
--
--function tbFastSpeedSkill_Banjuwan_150:ShowMenu(nItemIndex)
--	local tbSkill = self:GetCanUpdateSkill()
--	
--	local szTitle = "Xin h穣 l鵤 ch鋘 k� n╪g m� ngi mu鑞 t╪g:"
--	
--	tbOpt = {}
--	for i=1, getn(tbSkill) do
--		local nSkillId = tbSkill[i]
--		local szSkillName = GetSkillName(nSkillId)
--		tinsert(tbOpt, 	{szSkillName, self.UseItem, {self, nItemIndex, nSkillId}}	)
--	end
--	tinsert(tbOpt , {"H駓 b� "})
--	CreateNewSayEx(szTitle, tbOpt)
--end
--
--function tbFastSpeedSkill_Banjuwan_150:UseItem(nItemIndex, nSkillId)
--	if not self:CheckSkill(nSkillId) then
--		return
--	end
--	if IsMyItem(nItemIndex) == 1 then
--	
--		self:AddSkillStatckExp(nSkillId, self.nTargetExp)
--		RemoveItemByIndex(nItemIndex)
--	end
--end
--
function main(nItemIndex)
--	tbFastSpeedSkill_Banjuwan_150:ShowMenu(nItemIndex)
--	return 1
	tbTrainSkill150:ResetDailyTask()
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbTrainSkill150.tbBIT_BCH_USE, 20, "M鏸 nh﹏ v藅 ch� 頲 s� d鬾g t鑙 產 20 l莕", "~=") ~= 1 then
		return 1
	end
	tbVNG_BitTask_Lib:addTask(tbTrainSkill150.tbBIT_BCH_USE, 1);
	Msg2Player("Ch骳 m鮪g Чi Hi謕 nh薾 th祅h c玭g 1 l莕 i 甶觤 tu luy謓 k� n╪g 150.");
end
