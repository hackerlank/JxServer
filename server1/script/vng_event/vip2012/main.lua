Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

if (not tbVipAcc2012) then
	tbVipAcc2012 = {};
end

tbVipAcc2012.nStartDate = 20120123;
tbVipAcc2012.nEndDate = 20120220;
tbVipAcc2012.nExtpointID  = 4;
tbVipAcc2012.nBit1   = 9;--acc 在名单内
tbVipAcc2012.nBit2   = 10;--acc  已领奖


function tbVipAcc2012:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate >= self.nStartDate) and (nCurDate < self.nEndDate) then
		return 1;
	end
	return 0;
end

function tbVipAcc2012:main()
	local tbOpt = {}
	tinsert(tbOpt, {"Nh薾", tbVipAcc2012.GetAward, {tbVipAcc2012}})
	tinsert(tbOpt, {"сng"})	
	CreateNewSayEx("Ph莕 thng d祅h cho VIP l� 600 tri謚 甶觤 kinh nghi謒 kh玭g c閚g d錸, i hi謕 c� mu鑞 nh薾 ng祔 kh玭g?", tbOpt)
end

function tbVipAcc2012:GetAward()
		if( self:IsActive() ~= 1) then
			Talk(1,"","Hi謓 t筰 kh玭g ph秈 th阨 gian nh薾 thng, xin h穣 gh� th╩ trang ch�  bi誸 th猰 th玭g tin.!")
			return
		end
		if (tbExtPointLib:GetBitValue(self.nExtpointID, self.nBit1) ~= 1 ) then
 			Talk(1,"","Xin th� l鏸, i hi謕 kh玭g c� trong danh s竎h nh薾 thng.")
 			return
 		end
		if (tbExtPointLib:GetBitValue(self.nExtpointID, self.nBit2) ~= 0 ) then
 			Talk(1,"","Чi hi謕  nh薾 thng, kh玭g th� nh薾 th猰.")
 			return
 		end
 		
 		 if (tbExtPointLib:SetBitValue(self.nExtpointID, self.nBit2, 1) ~= 1) then
	 		return
	 	end
	 	
		 local tbAward = {szName = "觤 Kinh Nghi謒", nExp=600e6};
		 	
 		tbAwardTemplet:Give(tbAward, 1,{"VipAcc2012","NhanPhanThuongDiemKinhNghiem"})
end

local pEventType = EventSys:GetType("AddNpcOption")
if (tbVipAcc2012:IsActive() ~= 0) then
	nId = pEventType:Reg("Nguy謙 Nhi", tbVipAcc2012.main,{tbVipAcc2012})
end	