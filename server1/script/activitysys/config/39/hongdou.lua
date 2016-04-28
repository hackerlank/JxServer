Include("\\script\\activitysys\\config\\39\\extend.lua")
Include("\\script\\activitysys\\config\\39\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\39\\seed.lua")

function main()
	if tbValenTree:IsDuring() ~= 1 then
		return 1
	end
	if PlayerFunLib:CheckTotalLevel(120,"default",">=") ~= 1 then
		return 1
	end
	if PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1 then
		return 1
	end 
--By: NgaVN -- 在整个活动期间，使用异香花和红豆最多使用30物品		
	if pActivity:CheckTaskDaily(TSK_AWARD_USE_TIME, 30, "S� d鬾g D� Hng Hoa H錸g v� u H錸g  t n gi阨 h筺","<") ~= 1 then
		return 1
	end
	pActivity:AddTaskDaily(TSK_AWARD_USE_TIME, 1)
--By: NgaVN - 2.000.000 经验值
	local tbAward = {
		--{szName="Huy襫 tinh",tbProp={6,1,147,1,0,0},nExpiredTime=20120301,},
		--{nJxb = 1},
		{szName = "觤 kinh nghi謒", nExp=2000000};
		}
	
	tbAwardTemplet:Give(tbAward, 1, {EVENT_LOG_TITLE, "use hongdouguo"})
end