
---------------------------------------------------------------------------------
--  严重声明：此文件不抽字符串
---------------------------------------------------------------------------------

-- 礼官脚本
-- Li_Xin 2004-8-17
--Include( "\\script\\global\\中秋活动.lua" )

--TASKID_HOLIDAY_GIFT_DATE = 160;				-- 任务变量ID of 玩家最后一次领取节日礼物时间
--TASKTMPID_HOLIDAY_GIFT_DATE = 160;			-- 临时任务变量ID of 玩家最后一次领取节日礼物时间
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")	-- 主城奖励
Include("\\script\\event\\superplayeract2007\\event.lua")----超级玩家活动
Include("\\script\\event\\great_night\\event.lua")	-- Huy ho祅g chi m 
Include("\\script\\misc\\ex_goldequp_coin.lua");	-- 兑换黄金装备金牌
Include("\\script\\event\\jiefang_jieri\\201004\\main.lua");
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\Npc.lua") -- 炼金活动


-- 越南0904解放活动
--Include("\\script\\event\\jiefang_jieri\\200904\\zhanshenzhujiu\\jiu_hecheng.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\jinnangshijian\\jinnangshijian.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\denggao.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

Include("\\script\\event\\guoqing_jieri\\200908\\compose.lua")
Include("\\script\\event\\other\\jilixinwanjia\\200908\\npcdailog.lua")

-- 越南0905生日活动
--Include("\\script\\event\\birthday_jieri\\200905\\npc\\npc_liguan_dailog.lua");
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_npc.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\activitysys\\npcfunlib.lua")

Include("\\script\\task\\killmonster\\killmonster.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")
Include("\\script\\bonus_onlinetime\\func_onlineaward.lua")
Include("\\script\\vonghoa\\exchangitem\\exchangeitem.lua")
Include("\\script\\vonghoa\\item\\head.lua")
Include("\\script\\traogiaithdnb\\thdnb7.lua");--20100908 haint code function trao giai thdnb
Include("\\script\\baoruongthanbi\\dialogmain.lua")
Include("\\script\\vlkh\\vlkh1.lua")

--tinhpn 20101022: Event Thang 10
Include("\\script\\vng_event\\201010\\head.lua")
Include("\\script\\vng_event\\compensate.lua")
Include("\\script\\vng_event\\traogiai\\vldnb2010\\vlbnb.lua")

--[DinhHQ]
	--[20110107]:trao giai Phuong Anh Hao thang 12 2010
	Include("\\script\\vng_event\\traogiai\\pah_12_2010\\head.lua")
	--[20110124]:Vip account 2011
	Include("\\script\\vng_event\\vip_account_2011\\npc\\lequan.lua")
	--[20110216]:THDNB8
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_thdnb8_award.lua")
	--[20110225]: 8/3/2011
	Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\lequan.lua")
	--[20110311]: NPAH thang 02 2011
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_npah0211.lua")
	
	Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\vng_event\\traogiai\\vlmc2011\\vlmc2011_main.lua")

function main()
	

	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
--[DinhHQ]
	--[20110107]:领奖方英豪奖励
	--	tbPAH122010_Head:addDialog(tbDailog)
	--[20110124]:Vip account 2011
	tbVNG_VipAcc2011_LeQuan:addDialog(tbDailog)
	--[20110216]:THDNB8
	tbVNG_THDNB8:AddDialog(tbDailog)
	--[20110225]: 8/3/2011
	tbVNGWD2011_LeQuan:AddDialog(tbDailog)
	--[20110311]: NPAH thang 02 2011
	tbVNG_NPAH0211:AddDialog(tbDailog)
	--交光环VLMC2011 - Modified by DinhHQ - 20110523
	tbVLMC2011_Tittle:AddDialog(tbDailog)
	tbVngToolAward:AddDialog(tbDailog)	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--弹出对话框
	tbDailog:AddOptEntry("Huy ho祅g chi m ", onGreat_Night)
--	tbDailog:AddOptEntry("Tham gia th莕 b� b秓 rng ho箃 ng ", BRTB_Dialog_main)
--	tbDailog:AddOptEntry("D蒼 v� l﹎  nh蕋 bang chung k誸 tng ", GetBonusVLDNB2010_main)
--	tbDailog:AddOptEntry("Nh薾 l蕐 ng ti襫 ", Compensate_main)
--	if (VH_ActiveDay()==1) then
--		tbDailog:AddOptEntry("Ta  i 8 th竛g ch event v藅 ph萴 ", ExChangeItem_main)
--	end
	tbDailog:AddOptEntry("Khai Pass rng ", ResetBox.ShowDialog, {ResetBox})
	
	--tinhpn 20101022: Event Thang 10
--	if (Event201010:IsActive() == 1) then
--		tbDailog:AddOptEntry("фi 10 th竛g ch ho箃 ng ph莕 thng ", Event201010.ShowDialog, {Event201010}) 	
--	end
	
	if IsIPBonus() then
		tbDailog:AddOptEntry("C� kh� s� d鬾g CSM tr� gi髉 ", IpBonus)
	end
	
	--tinhpn 20100817: Online Award
--	if (OnlineAward_StartDate() ~= 0 and OnlineAward_Check_TransferLife() ~= 0) then
--		tbDailog:AddOptEntry("Tham gia online d蒼 tng ", OnlineAward); 
--	end
	
	local ncity = gb_GetTask("MAINCITYCFG", 1);
	local nCurMapID = SubWorldIdx2ID(SubWorld);
	if (ncity >= 1 and ncity <= 7 and nCurMapID == TB_MAINCITY_CITYWAR_T[ncity][2]) then
		tbDailog:AddOptEntry("Nh薾 l蕐 Th竔 th� ph莕 thng ", maincity_award_entry)	
	end
	if tbJILIWanJia0908:IsActDate() then
		tbDailog:AddOptEntry("K輈h tay m韎 ho箃 ng ", tbJILIWanJia0908.DailogMain, {tbJILIWanJia0908} )
	end
		
		
	if FreedomEvent2010:IsActive1() == 1 then
		tbDailog:AddOptEntry("Chi課 s� d飊g/u鑞g o c� ", FreedomEvent2010.LiGuanEventItemDlg, {FreedomEvent2010}) 	
	end
	
	if tbRefiningIron:CheckCondition() == 1 then
		tbDailog:AddOptEntry("R蘮 luy謓 thi誸 ho箃 ng ", tbRefiningIron.NpcTalk, {tbRefiningIron}) 	
	end
	
	tbDailog:Show()
end

function jiefang0904_act()
	Say(" l� quan : b﹜ gi� l� ╪ m鮪g gi秈 ph鉵g ng祔 ho箃 ng trong l骳 , i nh﹏ a tr� c騨g h璶g cao th秈 li謙 a ╪ m鮪g th緉g l頸 , i hi謕 mu鑞 tham gia sao ?", 6, 
			" ta t韎 nh薾 l蕐 c萴 nang s� ki謓 /jf0904_getjinnangshijian",
			format("Th緉g l頸 ru ho箃 ng /tbJiefang0904_jiu:OnDailogMain()"),
			" l猲 nh FanXiPan ho箃 ng /about_denggao",
			" oanh li謙 thi猲 thu ho箃 ng /about_shuizei",
			" ti猽 di謙 nc t芻 nhi謒 v� /about_shuizei",
			" ta ch糿g qua l� xem m閠 ch髏 !/OnCancel");
end

Include([[\script\event\menglan_2006\menglan_2006.lua]]);
function v_menglanjie()
	Say("Ta i bi觰 Thi誹 L﹎ phng trng c秏 t� c騨g ch骳 ph骳 ngi !", 7, 
		" ta 甧m kim li猲 x礽 h誸 ho祅 d﹏g t苙g cho ngi /v_mljaward(1)",
		" ta 甧m m閏 hoa sen h祇 quang d﹏g t苙g cho ngi /v_mljaward(2)",
		" ta 甧m nc hoa sen h祇 quang d﹏g t苙g cho ngi /v_mljaward(3)",
		" ta c﹜ 畊鑓 hoa sen h祇 quang d﹏g t苙g cho ngi /v_mljaward(4)",
		" ta 甧m t hoa sen h祇 quang d﹏g t苙g cho ngi /v_mljaward(5)",
		" ta 甧m hoa sen h祇 quang d﹏g t苙g cho ngi , m鏸 h� m閠 ./v_mljaward_all",
		" ta ch糿g qua l� t� m� 甶 ngang qua xem m閠 ch髏 m� th玦 !/OnCancel"
	);
end;

function v_mljaward(nIdx)
	if (CalcEquiproomItemCount(6,1,tab_NPCIdx[nIdx][1] + 5,-1) < 1) then
		Say("Ngi kh玭g mu鑞 d﹏g t苙g "..tab_NPCIdx[nIdx][2].." sao ? ngi th藅 gi鑞g nh� kh玭g c� mang "..tab_NPCIdx[nIdx][2].."!", 1, "Ta 甶 trc chu萵 b� !/OnCancel")
		return
	end;
	
	local nCount = GetTask(tab_NPCIdx[nIdx][3]);
	if (nCount >= SIMGER_LIMIT) then
		Say("Ngi  d﹏g t苙g  "..tab_NPCIdx[nIdx][2].." li評  d﹏g t苙g 甶觤 kh竎 ch 甶 !", 0);
		return
	end;
	
	ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[nIdx][1] + 5, -1);
	SetTask(tab_NPCIdx[nIdx][3], nCount + 1);
	AddOwnExp(500000);
	Say("Qu� tr﹏ qu�  y l� Thi誹 L﹎ phng trng c飊g Nga Mi chng m玭 a cho ngi m閠 ch髏 t﹎ � .", 1, "Ti誴 nh薾 l� v藅 ./OnCancel");
	Msg2Player("Ngi l蕐 頲 <color=yellow>500000<color> ch髏 kinh nghi謒 .");
end;

function v_mljaward_all()
	for i = 1, getn(tab_NPCIdx) do
		if (CalcEquiproomItemCount(6,1,tab_NPCIdx[i][1] + 5,-1) < 1) then
			Say("Ngi kh玭g mu鑞 d﹏g t苙g "..tab_NPCIdx[i][2].." sao ? ngi th藅 gi鑞g nh� kh玭g c� mang "..tab_NPCIdx[i][2].."!", 1, "Ta 甶 trc chu萵 b� !/OnCancel")
			return
		end;
	end;
	
	local nCount = GetTask(TK_LOTUS_ALL);
	if (nCount >= TOGETHER_LIMIT) then
		Say("Th藅 l� c竚 琻 ngi  nh璶g l� 12 c� bao ti襫 l� x�  a ho祅 cho ngi ta li評 .", 0);
		return
	end;
	
	for i = 1, getn(tab_NPCIdx) do
		ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[i][1] + 5, -1);
	end;
	SetTask(TK_LOTUS_ALL, nCount + 1);
	
	AddOwnExp(1000000);
	AddItem(6, 1, 1136, 1, 0, 0, 0); --加一个大风包；
	Say("Qu� tr﹏ qu�  y l� Thi誹 L﹎ phng trng c飊g Nga Mi chng m玭 a cho ngi m閠 ch髏 t﹎ � .", 1, "Ti誴 nh薾 l� v藅 ./OnCancel");
	Msg2Player("Ngi l蕐 頲 <color=yellow>1000000<color> ch髏 kinh nghi謒 c飊g 1 c� <color=yellow> bao ti襫 l� x� <color>");
end;

-- 节日列表
aryHoliday = {	-- 节日时间, 符合节日时间所调函数名, 重复领礼品的提示文本 
				{ 20040822, onHoliday_QiXi, "Kh� tr阨 t鑤 nh� v藋  c竎 ngi 2 v� t筰 sao kh玭g 甶 du vn y , v蒼 c遪 � c竔 n祔 l祄 g� ?" }
				-- 其它节日
			 };
	
function valentineGift()
	if (GetBit(GetTask(67),24) == 1) then
		if (GetBit(GetTask(1313),1) ~= 1) then
			SetTask(1313, SetBit(GetTask(1313), 1, 1))
			Talk(1, "", "<> h玬 nay l� nh鱪g th� n祔 h� k誸 lng duy課 ngi c馻 ch ng祔 th藅 t鑤  ta c� l� v藅 mu鑞 t苙g cho k誸 h玭 ngi c馻  ch骳 c竎 v� b筩 u giai l穙 ")
			-- 送2个“心心相印符”
			for i = 1, 2 do
				AddItem( 6, 1, 18, 1, 0, 0 ,0);
			end
			Msg2Player( "<> ngi l蕐 頲 hai t﹎ t﹎ tng 蕁 ph� " );
			-- 送9朵“玫瑰花”
			for i = 1, 9 do
				AddItem( 6, 0, 20, 1, 0, 0 ,0);
			end	
			Msg2Player( "<> ngi l蕐 頲 9 a hoa h錸g !" );
			-- 50级以上玩家加送1个“天山玉露”
			if( GetLevel() >= 50 ) then
				AddItem(6, 1, 72, 1, 0, 0, 0);
				Msg2Player( "<> ngi l蕐 頲 m閠 chai Thi猲 S琻 b秓 l� " );
			end
		else
			Talk(1, "", "<> ngi kh玭g ph秈 l�  nh薾 l蕐 qua sao ?  cho ngi kh竎 n y 甶 ")
		end
	else
		Talk(1, "", "<> ngi c遪 ch璦 c� k誸 h玭 , kh玭g th� d蒼 l� v藅 ")
	end
end		 	
---------------- 取消 ----------------------------------------
function OnCancel()
end

function LiguanLog(object)
	WriteLog(date("%H%M%S") .. ": trng m鬰 :" .. GetAccount() .. ", nh﹏ v藅 :" .. GetName() .. "," .. object);
end
