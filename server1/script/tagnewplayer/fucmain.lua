Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\func_itembonusweekly.lua");
Include("\\script\\tagnewplayer\\func_itemtim.lua");
Include("\\script\\tagnewplayer\\func_itemanbang.lua");
Include("\\script\\tagnewplayer\\bonusEXP.lua");
Include("\\script\\tagnewplayer\\func_bonusthanhtich.lua");
Include("\\script\\tagnewplayer\\func_quest180.lua");



function NWP_main()
do return end
	if (IsCode()~=1) then
		Talk(1, "", "Чi hi謕 kh玭g thu閏 i tng tham gia An Bang Ho祅g Kim L謓h b礽 ! .");
		return
	end
	local tbOpp = {}
	--local nDay = tonumber(GetLocalDate("%Y%m%d"))
	local str = "<#> Чi hi謕 xin h穣 ch鋘 ph莕 thng";
	if (CheckObject() == 1) then
		if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120) == 1) then
			tinsert(tbOpp,"Ta mu鑞 nh薾 ph莕 thng th╪g ng c蕄 120 sau khi  tr飊g sinh/GetLevel120"); -- 已重生一次, 升级为120级
		end
	end
	if (CheckObject() == 2) then
		local IsQ, IsFQ = GetCurQuest()
		if(IsQ == 0) then
			tinsert(tbOpp,"Ta mu鑞 nh薾 nhi謒 v� li猲 ho祅 th� nh蕋/AcceptFirstQuest");
		end
		
		if (IsQ == 1) then
			if (IsFQ == 0) then
				tinsert(tbOpp,"Ta mu鑞 xem nhi謒 v�  nh薾/ReviewCurQuest");
				tinsert(tbOpp,"Ta  ho祅 th祅h nhi謒 v� li猲 ho祅 th� nh蕋/FinishFirstQuest");
			elseif (IsFQ == 1) then
				tinsert(tbOpp,"Ta mu鑞 nh薾 nhi謒 v� li猲 ho祅 th� hai/GetSecondQuest");
			end		
		end
		
		if (IsQ == 2) then
			if (IsFQ == 1) then
				tinsert(tbOpp,"Ta mu鑞 xem nhi謒 v�  nh薾/ReviewCurQuest");
				tinsert(tbOpp,"Ta  ho祅 th祅h nhi謒 v� li猲 ho祅 th� hai/FinishSecondQuest");
			elseif (IsFQ == 2) then
				tinsert(tbOpp,"Ta mu鑞 nh薾 nhi謒 v� li猲 ho祅 th� ba/GetThirdQuest");
			end	
		end
		
		if (IsQ == 3) then
			if (IsFQ == 2) then
				tinsert(tbOpp,"Ta mu鑞 xem nhi謒 v�  nh薾/ReviewCurQuest");
				tinsert(tbOpp,"Ta  ho祅 th祅h nhi謒 v� li猲 ho祅 th� ba/FinishThirdQuest");
			end	
		end
		
	end
	if (CheckObject() == 3 and CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165) == 1) then
		tinsert(tbOpp,"Ta mu鑞 nh薾 ph莕 thng th╪g ng c蕄 165/GetLevel165");--未重生，升级165级
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim) == 1) then
			tinsert(tbOpp,"Ta mu鑞 nh薾 ph莕 thng trang b� T輒/GetItemTim");
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang) == 1) then
			tinsert(tbOpp,"Ta mu鑞 nh薾 ph莕 thng trang b� An Bang/GetItemAnBang");
	end
	tinsert(tbOpp,"Ta mu鑞 nh薾 ph莕 thng th祅h t輈h/GetBonusThanhTich_main");
	tinsert(tbOpp,"Ta mu鑞 nh薾 ph莕 thng h籲g ng祔/BonusEveryDay");
	tinsert(tbOpp, "<#>Tho竧/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end
function OnCancel()
end 

