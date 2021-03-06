Include("\\script\\vng_event\\20110215_THDNB8\\npah0211_acclist.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbVNG_NPAH0211 ={}
tbVNG_NPAH0211.nStartDay = 20110317
tbVNG_NPAH0211.nEndDay = 20110324
tbVNG_NPAH0211.nExtPointID = 3
tbVNG_NPAH0211.nBit_Energy = 9
tbVNG_NPAH0211.nBit_ClubBag = 10

function tbVNG_NPAH0211:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	local strAccount = GetAccount()
	if not tbNPAH022011[strAccount] then
		return 0
	end
	
	return 1;
end

function tbVNG_NPAH0211:AddDialog(tbDialog)
	if self:isActive() ~= 1 then
		return
	end
	tbDialog:AddOptEntry("Nh薾 ph莕 thng Nh蕋 Phng Anh H祇",tbVNG_NPAH0211.main,{tbVNG_NPAH0211})
end

function tbVNG_NPAH0211:main()
	local tbAccount = tbNPAH022011[GetAccount()]
	if not tbAccount then
		return
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)

	--精炼石值
	if tbAccount.nEnergy and tbAccount.nEnergy > 0 then
		if tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_Energy) == 0 then
			tbMainDialog:AddOptEntry("Ph莕 thng 甶觤 tinh l鵦",tbVNG_NPAH0211.GetEnergyAward,{tbVNG_NPAH0211, tbAccount.nEnergy})
		end
	end
	--红包俱乐部
	if tbAccount.nClubBag and tbAccount.nClubBag > 0 then		
		if tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_ClubBag) == 0 then
			tbMainDialog:AddOptEntry("Ph莕 thng H錸g Bao C﹗ L筩 B�",tbVNG_NPAH0211.GetAward,{tbVNG_NPAH0211, tbAccount.nClubBag})
		end
	end
	
	tbMainDialog:Show()
end

function tbVNG_NPAH0211:GetAward(nCount)
	if (CalcFreeItemCellCount() < nCount) then
		Talk(1, "", format("в b秓 v� t礽 s秐, xin vui l遪g ch鮝 <color=red>%d<color> � tr鑞g trong h祅h trang r錳 m韎 nh薾 thng!", nCount))
		return
	end
	local tbAward = {szName="H錸g Bao C﹗ L筩 B�",tbProp={6,1,30032,1,0,0},nCount=nCount,nExpiredTime=43200},

	tbExtPointLib:SetBitValue(self.nExtPointID, self.nBit_ClubBag, 1)
	local strLog = format("[VNG][PAH022011][Ph莕 thng %s]", tbAward.szName)
	tbAwardTemplet:GiveAwardByList(tbAward, strLog)
end

function tbVNG_NPAH0211:GetEnergyAward(nCount)
	tbExtPointLib:SetBitValue(self.nExtPointID, self.nBit_Energy, 1)
	AddEnergy(nCount)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."[VNG][PAH022011][Ph莕 thng 甶觤 tinh l鵦]\t"..GetAccount().."\t"..GetName().."\t".."nh薾 %d 甶觤 tinh l鵦"..nCount)
end
