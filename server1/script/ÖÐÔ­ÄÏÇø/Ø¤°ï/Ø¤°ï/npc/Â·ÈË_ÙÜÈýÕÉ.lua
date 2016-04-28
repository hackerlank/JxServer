-- 丐帮 掌砵长老佘三丈 入门任务、出师任务
-- by：Dan_Deng(2003-07-28)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(209) == 1 then
		allbrother_0801_FindNpcTaskDialog(209)
		return 0;
	end
	UTask_gb = GetTask(8)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 60*256+10) then		-- 出师任务中
			if (HaveItem(211)==1) and (HaveItem(201)==1) and (HaveItem(208)==1) and (HaveItem(209)==1) and (HaveItem(210)==1) and (HaveItem(206)==1) and (HaveItem(207)==1) and (HaveItem(200)==1) and (HaveItem(205)==1) then
				L60_prise()
			else
				Talk(1,"","Ch� c莕 l蕐 頲 9 t骾 v秈, ngi c� th� thu薾 l頸 xu蕋 s�. C� g緉g l猲! ")
			end
		elseif (UTask_gb == 60*256) and (GetLevel() >= 50) then		--出师任务启动
			Say("е t� b鎛 bang mu鑞 xu蕋 s� u ph秈 甶 v祇 trong m藅 ng t譵 頲 9 c竔 t骾 v秈. Ngi c� gan 甶 v祇 trong m藅 ng  kh玭g? ",2,"Л琻g nhi猲 d竚. /L60_get_yes","е t� v蒼 ch璦 mu鑞 xu蕋 s� /no")
		else
			Talk(1,"","B鎛 bang ai c騨g c鵦 kh�, ha ha! M鋓 ngi 畂祅 k誸 l筰 c� th� gi髉 b鎛 bang ph竧 dng quang i.")
		end
	elseif (Uworld30 == 10) then		--入门任务进行中
		if (HaveItem(72) == 1) and (HaveItem(73) == 1) and (HaveItem(74) == 1) and (HaveItem(75) ==1) then
			Talk(1,"enroll_prise","X� Trng l穙! е t�  t譵 頲 4 m鉵 ngi c莕: r﹗ c籱, Phi課 qu箃, Th� ph竎h, Ban ch� ")
		else
			Talk(1,""," 4 m鉵 ta c莕 ngi v蒼 ch璦 c�. Ngi k衜 c鈏 qu�!")
		end
	elseif (Uworld30 == 0) and (GetLevel() >=10) and (GetFaction() ~= "gaibang") then		--入门任务启动
		Say("ng xem thng Khi誹 h鉧 t� n祔! Tuy xin ╪  s鑞g nh璶g c騨g c� ch髏 ki課 th鴆! C� mu鑞 th� kh玭g?",2,"Л頲. в ta th� l筰. /enroll_get_yes","Kh玭g, ta ch� n tham quan. /enroll_get_no")
	else
		Talk(1,"","Huynh  trong bang tuy b譶h thng c� h琲 kh� m閠 ch髏 nh璶g m鋓 ngi u r蕋 畂祅 k誸 v韎 nhau. C� c琺 c飊g ╪, c� ru c飊g u鑞g! Ngi ngo礽 kh玭g th� n祇 hi觰 頲 c竔 kho竔 l筩 c馻 ch髇g ta!")
	end
end;

function enroll_get_yes()
	Talk(1, "", "Л頲 r錳! Ta  cho ngi t� th� xem! Ngi h穣 n th祅h Dng Ch﹗  l蕐 b鑞 m鉵: r﹗ c籱, Phi課 qu箃, Th� ph竎h, Ban ch� v� y")
	Uworld30 = SetByte(GetTask(30),2,10)
	SetTask(30,Uworld30)
	AddNote("Nh薾 nhi謒 v� ti誴 theo:  Dng Ch﹗ th祅h l蕐 4 m鉵 v藅: H� Tu, Phi課 T�, Th� Ph竎h, B秐 Ch� ")
	Msg2Player("Nh薾 nhi謒 v� ti誴 theo:  Dng Ch﹗ th祅h l蕐 4 m鉵 v藅: H� Tu, Phi課 T�, Th� Ph竎h, B秐 Ch� ")
end;

function enroll_prise()
	Talk(1,"","Ha ha ha! Ngi ng l� c� khi誹 ╪ xin! T鑤! Ta s� nh薾 ngi l祄  t� k� danh! ")
	DelItem(72)
	DelItem(73)
	DelItem(74)
	DelItem(75)
	i = ReturnRepute(15,29,2)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)
	Uworld30 = SetByte(GetTask(30),2,127)
	SetTask(30,Uworld30)
	AddNote("Ho祅 th祅h nhi謒 v�, tr� th祅h  t� ch輓h th鴆 <color=Red>c馻 C竔 Bang<color>. ")
	Msg2Player("Ho祅 th祅h nhi謒 v�, tr� th祅h  t� ch輓h th鴆 c馻 C竔 Bang ")
end;

function L60_get_yes()
	SetTask(8,60*256+10)
	AddNote("Nh薾 nhi謒 v� xu蕋 s�:  v祇 trong m藅 ng, t譵 頲 9 c竔 t骾 v秈 ")
	Msg2Player("Nh薾 nhi謒 v� xu蕋 s�:  v祇 trong m藅 ng, t譵 頲 9 c竔 t骾 v秈 ")
end;

function L60_prise()
	DelItem(211)
	DelItem(201)
	DelItem(208)
	DelItem(209)
	DelItem(210)
	DelItem(206)
	DelItem(207)
	DelItem(200)
	DelItem(205)
	SetRank(68)
	SetTask(8, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Mang 5 c竔 t骾 v秈 tr� v� C竔 Bang, ho祅 th祅h nhi謒 v� xu蕋 s�, 頲 phong Ti猽 Di猽 th莕 c竔. ")
	Msg2Player("Ch骳 m鮪g B筺! Х thu薾 l頸 xu蕋 s�. Л頲 phong l� Ti猽 di猽 th莕 c竔 ")
end;

function no()
end;
