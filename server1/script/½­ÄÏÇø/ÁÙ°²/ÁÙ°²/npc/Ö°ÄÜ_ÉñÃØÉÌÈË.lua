-- 临安　职能　神秘商人
-- By Li_Xin (2004-07-20)

Include("\\script\\global\\shenmi_chapman.lua") 
Include("\\script\\lib\\gb_taskfuncs.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\act2years_yn\\baibaoxiang.lua") 
Include("\\script\\event\\leize_upplatina\\platina_upgrade.lua")--白金装备
Include("\\script\\event\\leize_upplatina\\recoin_platinaequip.lua")--重铸白金装备
function main()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end
	
	local tbDecOpp =
	{
		"<dec><npc>Ta t� T﹜ V鵦 xa x玦 n Trung Nguy猲  thu th藀 Th駓 Tinh, Kim Nguy猲 B秓 v� Ng﹏ phi誹. Ta s絥 s祅g i c竎 b秓 v藅  頲 nh鱪g th� ! Kh竎h quan c� g� i kh玭g?",
		
		--Change request 04/06/2011,关闭铸造白金装备 - Modified by DinhHQ - 20110605
		--"Ta mu鑞 th╪g c蕄 cho trang b� B筩h Kim n祔/upgrade_paltinaequip",
		--"Ta mu鑞 ch� t筼 trang b� Ho祅g Kim th祅h trang b� B筩h Kim/upgrade_goldformplatina",
		
		--"Ta mu鑞 m阨/xin ngi c l筰 b筩h kim trang b�/recoin_platina_main",
		--"Trao i у ph� v� kh�/get1",
		--"Mua K� tr﹏ d� b秓/get2",
		--"X� l� <trang b� t鎛 h筰>/deal_brokenequip",
		--"Ta mu鑞 hi觰 r� b筩h kim trang b� h鉧 gi秈/unweave_paltinaequip",
		--"Ta mu鑞 i b秓 rng/BaiBaoXiang_Give_UI",
		"Ta xem th� trc !/no",
		
	};
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	
	--Say(str[1],5,str[6],str[2],str[3],str[4], str[5])
	CreateTaskSay(tbDecOpp);
end;

function no()
end;