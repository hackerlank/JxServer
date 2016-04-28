-- Vi猰 д у Щng碎片
-- by 小浪多多
-- 2008.02.25
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..

Include("\\script\\lib\\composeclass.lua");

function YDBZ_tradeYandiTuTeng()
	local nCount = CalcEquiproomItemCount(6,1,1685,-1);
	local tbarytalk = {
		format("<npc>Gom  9 m秐h r錳 a ta, ta s� gi髉 ngi gh衟 th祅h 1  ng to竔 phi課. Ngi mu鑞 gh衟 b﹜ gi�?\nH祅h trang c� <color=yellow>%s<color>  ng to竔 phi課",nCount),
		"Ta mu鑞 i Vi猰 д  ng/YDBZ_SureDoTrade",
		"Ta ch� gh� ngang/NoChoice",
	}
	CreateTaskSay(tbarytalk);
end

function YDBZ_SureDoTrade()
	local tbarytalk = {
		format("<npc>Gom  9 m秐h r錳 a cho ta, ta s� gi髉 ngi gh衟 th祅h 1 Vi猰 д  ng. Ngi x竎 nh薾 mu鑞 gh衟?",nCount),
		"ng r錳, 產 t� c� nng/YDBZ_DoTrade",
		"Ta ch� gh� ngang/NoChoice",
	}
	CreateTaskSay(tbarytalk);	
end
function YDBZ_DoTrade()
	local nCount = CalcEquiproomItemCount(6,1,1685,-1);
	if nCount < 9 then
		Say("Tr猲 h祅h trang kh玭g  9  ng to竔 phi課!!!",0);
		return 0;
	end
	ConsumeEquiproomItem(9,6,1,1685,-1);
	AddItem(6,1,1606,1,0,0);
	Msg2Player("Ch骳 m鮪g i hi謕 nh薾 頲 1<color=yellow> Vi猰 д  ng<color>");
end

function YDBZ_tradeYandiLingQi()
	
	local tbarytalk = {
		"<dec>Xin h穣 ch鋘 c竎h i:",
		"2 Vi猰 д  ng/#YDBZ_SureDoTradeLingQi(1)",
		"2 Vi猰 д  ng + 1 xu/#YDBZ_SureDoTradeLingQi(2)",
		"Ta ch� gh� ngang/NoChoice",
	}
	CreateTaskSay(tbarytalk);
end

function YDBZ_SureDoTradeLingQi(n_sel)
	local tbFormula = {
			[1] = {
						tbMaterial = {{tbProp = {6,1,1606, -1}, szName = "Vi猰 д у Щng", nCount = 2}},
						tbProduct = {tbProp = {6,1,2532,1,0,0}, szName = "Vi猰 д L謓h K�"},
			},
			[2] = {
						tbMaterial = {
							{tbProp = {6,1,1606, -1}, szName = "Vi猰 д у Щng", nCount = 2},
							{tbProp = {4,417,1, -1}, szName = "Ti襫 ng", nCount = 1},
						},
						tbProduct = {tbProp = {6,1,2532,1,0,0}, szName = "Vi猰 д L謓h K�"},
			},
	};
	
	--如果输入为空，使用默认值
	local szLogTitle	= "yandi_tradeLingQi";
	
	local tbMaterial	= tbFormula[n_sel].tbMaterial
	local tbProduct		= tbFormula[n_sel].tbProduct
	
	local nComposeCount = 1
	
	local nFreeItemCellLimit = 1
	
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("в b秓 m an to祅 t礽 s秐, xin h穣 m b秓 h祅h trang c遪 th鮝 %d � tr鑞g.", nFreeItemCellLimit))
		return 0
	end
	
	if tbComposeClass:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = tbFormula.szFailMsg or "<color=red>Чi hi謕 mang nguy猲 li謚 kh玭g  r錳!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if tbComposeClass:ConsumeMaterial(tbMaterial, nComposeCount, szLogTitle) ~= 1 then
		Msg2Player("Ch� t筼 th蕋 b筰, m蕋 甶 m閠 s� nguy猲 li謚.")
		return 0;
	end
	local n_ran = random(100);
	if (n_sel == 1 and n_ran > 60) then
		Msg2Player("Ch� t筼 th蕋 b筰 ng th阨 m蕋 nguy猲 li謚 ch� t筼.");
		return
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, szLogTitle, nComposeCount)
	end
	
end


function YDBZ_tradeXuanYuanLing()
	local n_count = CalcItemCount(3, 6, 1, 2532, -1);
	if (n_count >= 100) then
		ConsumeItem(3, 100, 6,1,2532, -1);
		tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2351,1,0,0}, szName = "Huy襫 Vi猲 L謓h"}, "yandi_tradeXuanyuan");
	else
		CreateTaskSay({format("<dec>%s c莕: <enter>%s", "фi Huy襫 Vi猲 l謓h" ,format("%d %s", 100, "Vi猰 д L謓h K�")), "Ta bi誸 r錳!/NoChoice"});
	end
end
