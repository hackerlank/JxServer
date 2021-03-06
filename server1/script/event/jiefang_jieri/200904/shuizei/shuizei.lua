Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\lib\\awardtemplet.lua")
--风云令牌 - 完成1次搜集功勋令的任务 - Modified by DinhHQ - 20110920
Include("\\script\\activitysys\\g_activity.lua")
tbjf0904_shuizei_exp =
{
	[1]	= {nExp = 10, 	nRate = 0.3},
	[2]	= {nExp = 15, 	nRate = 0.4},
	[3]	= {nExp = 20, 	nRate = 0.2},
	[4]	= {nExp = 25, 	nRate = 0.05},
	[5]	= {nExp = 30, 	nRate = 0.05},
};


function join_shuizei_act()
	if (0 == jf0904_shuizei_IsActtime()) then
		Say("Kh玭g ph秈 l� trong th阨 gian ho箃 ng.", 0);
		return
	end
	
	jf0904_InitTaskctrl();
	
	if(GetTask(jf0904_TSK_shuizei_GetTask) ~= 0) then
		Say("Ngi  nh薾 nhi謒 v� ti猽 di謙 th駓 t芻 r錳.", 0);
		return
	end
	
	Say("Thuy襫 phu b� B綾: D筼 n祔 Th駓 T芻 thng ho祅h h祅h b� o, cp b鉩 nhi襲 chi誧 thuy襫 qua l筰 2 b� Phong L╪g ч. Ngi c� mu鑞 th� thi猲 h祅h o, ti猽 di謙 nh鱪g t猲 cp n祔 kh玭g?",2,"Ta  cho ch髇g 1 b礽 h鋍 ch ng./join_shuizei_act_cf", "Ta 產ng r蕋 b薾, khi kh竎 s� quay l筰./OnCancel");
end

function join_shuizei_act_cf()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("Чi hi謕 v蒼 ch璦  c蕄 50 ho芻 v蒼 ch璦 n閜 th�, v� v藋 kh玭g th� tham gia ho箃 ng", 0);
		return
	end

	if (GetTask(jf0904_TSK_shuizei_FulfilTaskTime) <= 0) then
		Say("H玬 nay kh玭g th� nh薾 th猰 nhi謒 v� Ti猽 di謙 th駓 t芻 n鱝.", 0);
		return
	end
	
	Say("Nh薾 nhi謒 v� ti猽 di謙 th駓 t芻 th祅h c玭g!", 0);
	SetTask(jf0904_TSK_shuizei_FulfilTaskTime, GetTask(jf0904_TSK_shuizei_FulfilTaskTime) - 1);
	SetTask(jf0904_TSK_shuizei_GetTask, 1);
end

function fullfill_shuizei_act()
	if (0 == jf0904_shuizei_IsActtime()) then
		Say("Kh玭g ph秈 l� trong th阨 gian ho箃 ng.", 0);
		return
	end
	
	if (GetTask(jf0904_TSK_shuizei_GetTask) ~= 1) then
		Say("V蒼 ch璦 nh薾 nhi謒 v� th駓 t芻, v� v藋 kh玭g th� tr� nhi謒 v� 頲!", 0);
		return
	end
	
	give_shuizei_award_lingpai();
end


function give_shuizei_award_lingpai()
	GiveItemUI("Giao truy c玭g l謓h", "Xin m阨 b� truy c玭g l謓h v祇 � b猲 di, m鏸 l莕 ch� 頲 b� 1 c竔.", "submit_zhuigongling", "no")
end

function submit_zhuigongling(nCount)
	if (nCount ~= 1) then
		Say("B� v祇 s� lng kh玭g ng!", 2, "Xin l鏸! Ta s� b� l筰./give_shuizei_award_lingpai", "Ta s� quay l筰 sau/no")
		return 
	end
	local nItemIdx = GetGiveItemUnit(1);
	local ng, nd, np = GetItemProp(nItemIdx);
	if (ng == 6 and nd == 1 and np == 2015) then
		RemoveItemByIndex(nItemIdx);
		SetTask(jf0904_TSK_shuizei_GetTask, 0);
		Say("Thuy襫 phu: Ch骳 m鮪g i hi謕! Зy l� ph莕 thng x鴑g ng d祅h cho v� anh h飊g.", 0);
		--风云令牌 - 完成1次搜集功勋令的任务 - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FLD_Collect_Item_VNG");
		give_shuizei_award_exp();
	else
		Say("V藅 ph萴 b筺  v祇 kh玭g ch輓h x竎!", 2, "Xin l鏸! Ta s� b� l筰./give_shuizei_award_lingpai", "Ta s� quay l筰 sau/no");
	end
end


function give_shuizei_award_exp()
	local nstep = random(1, 100000);
	local ncurstep 	= 0;
	local naddedexp = 0;
	for i = 1, getn(tbjf0904_shuizei_exp) do
		if (ncurstep + tbjf0904_shuizei_exp[i].nRate * 100000 >= nstep) then
			naddedexp = tbjf0904_shuizei_exp[i].nExp;
			break;
		end
		ncurstep = ncurstep + tbjf0904_shuizei_exp[i].nRate * 100000;
	end
	
	AddOwnExp(naddedexp * 1000000);
	
end

function jf0904_shuizei_IsActtime()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	return (nDate >= jf0904_act_dateS);
end

function about_shuizei()
	Say("L� quan: Ho箃 ng ti猽 di謙 th駓 t芻 b総 u t� ng祔 28/04/2009. Trong th阨 gian ho箃 ng i hi謕 c� th� n 6 甶觤 c馻 b� b綾 nam Phong L╪g ч  l躰h thng.", 0);
end