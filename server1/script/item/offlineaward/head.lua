--风云令牌-对各新手调整重生时间- Modified By DinhHQ - 20110926
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
BOX_SIHAIXIAOYAO = {
	ID = {6, 1, 2398, 1},
	Name = "T� H秈 Ti猽 Di猽 Кn L� H閜",
	Pill = {
		Name = "T� H秈 Ti猽 Di猽 Кn",
		ID = {6, 1, 2378, 1},
		Count = 10,
		},
}

BOX_WUZHOULINGKONG = {
	ID = {6, 1, 2399, 1},
	Name = "Ng� Ch﹗ L╪g Kh玭g Кn L� H閜",
	Pill = {
		Name = "Ng� Ch﹗ L╪g Kh玭g Кn",
		ID = {6, 1, 2397, 1},
		Count = 10,
		},
}

BOX_JIUTIANYUNYOU = {
	ID = {6, 1, 2400, 1},
	Name = "C鰑 Thi猲 V﹏ Du Кn L� H閜",
	Pill = {
		Name = "C鰑 Thi猲 V﹏ Du Кn",
		ID = {6, 1, 2379, 1},
		Count = 10,
		},
}

function use(box)
	if (not box) then
		return 1
	end
	local pill = box.Pill
	if (CalcFreeItemCellCount() < 10) then
		Say(format("C莕 輙 nh蕋 10 � tr鑞g  ch鴄 <color=red>%s<color>.", pill.Name))
		return 1
	end
	--风云令牌-新手使用出物品锁- Modified By DinhHQ - 20110926
	if tbPVLB_Check:IsNewPlayer() == 1 and tbPVLB_Check:CheckTime() == 1 then
		for i = 1, pill.Count do		
			local nidx = AddItem(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4], 0, 0)
			SetItemBindState(nidx, -2)
		end
	else
		for i = 1, pill.Count do		
			AddItem(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4], 0, 0)
		end
	end
	
	Msg2Player(format("B筺 nh薾 頲 %d %s", pill.Count, pill.Name))
	return 0
end
