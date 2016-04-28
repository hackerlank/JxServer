--洗技能点的叛僧
-- By: Dan_Deng(2003-08-29)
-- Update: Dan_Deng(2004-02-04) 洗点修改为可以洗255次
-- Update: Dan_Deng(2004-05-27) 小儿失踪任务 (Uworld42 = GetTask(42))
-- 临时变量设定: 初次技能(1),初次水晶(257),多次水晶(10),免费(1024)
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_event\\tochieukynang150\\head.lua")


function main()
--	Uworld137 = GetTask(137)
--	UTask_world13 = GetTask(13)
	Uworld42 = GetTask(42)
	tbTrainSkill150:ResetDailyTask()
--	SetTaskTemp(1,0)		-- 复位，避免任何干扰
	if (Uworld42 == 40) then					-- 小儿失踪任务
		Talk(12,"","V?danh i s? Ta n t譵 a b?m蕋 t輈h ?Чi L? B?Чo Nh﹏ gi韎 thi謚 ta n! ","A di  ph藅! L穙 T筽 Mao n祔 l?ngi trong s筩h. Kh玭g bi誸! Kh玭g bi誸. ","Mong i s?t?bi b?qua, n鉯 cho t筰 h?bi誸!","N╩ x璦 l穙 n筽 b?tr鬰 xu蕋 kh醝 s?m玭,Phng Trng H?t╪g c?t?bi kh玭g","Kh玭g bi誸 i s?b?tr鬰 xu蕋 v?l?do g? ","Th藅 k?l? Ngi h醝 nhi襲 l祄 gi?Ha! Ha! L穙 n筽 kh玭g nh鱪g n鉯 cho ngi bi誸 l?do tr鬰 xu蕋, m?c遪 s?ti誸 l?v?chuy謓 m蕋 t輈h c馻 a b?","Ha! Ha! Th?ra h遖 thng  ph筸 gi韎","N鉯 nh?th玦! A di  ph藅! Thi謓 tai thi謓 tai!","Ru th辴  n誱 qua, t﹎ kh玭g hng Ph藅 t?n鱝. Tham m閠 ch髏 kh玭g ph秈 l?c竔 sai qu?l韓. ","Ha! Ha! T鑤! Ngi h頿 v韎 ta y! Ta n鉯 cho ngi bi誸! K?th鵦 a b?╪ c緋  kh玭g ph秈 l?ngi x蕌 g? ch糿g qua n?mu鑞 l祄 m閠 vi謈 r蕋 quan tr鋘g, ch?mn m閠 ch髏 sau  s?tr?","Чi s? Mi m筺g ngi kh玭g ph秈 l? v藅, n鉯 mn l?sao?","Л頲! Ngi 甶 t譵 m閠 ngi t猲 l?Long Truy V? N╩ x璦 h緉, ta, Ph?T筽 Mao, th籲g b?╪ c緋 h頿 l筰 th祅h 'V?L﹎ T?K?. Ch?c?h緉 m韎 bi誸 ngi kia hi謓 th阨 ?u")
		SetTask(42,50)
		AddNote("Nhi謒 v?a b?m蕋 t輈h:  t譵 Long Truy v?h醝 tin t鴆 v?a b?m蕋 t輈h. ")
		Msg2Player("Nhi謒 v?a b?m蕋 t輈h:  t譵 Long Truy v?h醝 tin t鴆 v?a b?m蕋 t輈h. ")
--	elseif (GetLevel() >= 50) then				-- and (GetCamp() == 4) then		-- 允许洗点（不再限制红名洗点）
--		if (Uworld137 > 20) and (Uworld137 <= 30) then			-- 2004-06-11技能更新给一次免费洗点（不包括白名）
--			Say("释明：看在你也是老江湖的份上，没有水晶我也给你重设技能1次，要不要把握这个机会？",2,"好，我要重设技能/rollback_0611","我还是迟点再来吧/no")
--		elseif (UTask_world13 == 0) then				-- 未洗过点（允许用技能或宝石洗）
--			Talk(1,"rollback_get","释明：接受<color=red>易筋洗髓<color>对你的根骨会造成一定的损伤，你仍然想要我替你洗髓？")
--		elseif (UTask_world13 == 511) then		-- 洗点已达上限，不可再作任何洗点操作
--			Talk(1,"","释明：你洗髓的次数实在太多，不可再做了。如果还要强行再洗髓的话，恐怕会经脉尽断，成为废人！")
--		elseif (UTask_world13 == 255) then	-- 洗点已达上限，但尚未用宝石换回技能点
--			Say("释明：你洗髓的次数实在太多，不可再做了。另外你如果能找到三颗聚天地万物之元气水晶的话，还能利用它修补一下你在第一次洗髓时受损的经脉。",2,"我已经带了三颗水晶来了/found_jewel_yes","那就算了/no")
--		elseif (UTask_world13 >= 257) and (UTask_world13 < 511) then		-- 多次洗点（无宝石换回技能功能）
--			Say("释明：还想洗髓的话，除了十万两银子还必须要有水晶护住你的心脉，否则以你那已有损伤的经脉实在太过凶险。",2,"诸般事物已准备妥当/NEWpay_yes","那就算了/rollback_no")
--		elseif (UTask_world13 >= 1) and (UTask_world13 < 256) then		-- 多次洗点（并且可用宝石换回技能点）
--			Say("释明：还想洗髓的话，除了十万两银子还必须要有水晶护住你的心脉，否则以你那已有损伤的经脉实在太过凶险。另外，如果你有了三颗水晶，最好还是先把一次洗髓时经脉中留下的损伤先给修补了，长则不利。",3,"请帮我修补上次受损的经脉/found_jewel_yes","我想先再洗一次髓/NEWpay_yes","那就算了/rollback_no")
--		else
--			Talk(1,"","开发者：洗点状态出现了错误，请与游戏管理员(GM)联系。")
--		end
	else		
		-- 缺省对话（解释洗点改变）
		local szTitle = " th輈h minh  b﹜ gi� ch� c莕 t譵 t飝 ti謓 th祅h th� n祇 ch phu xe , c騨g c� th� a ngi 甶 � t葃 t駓 o � , so b莕 t╪g t葃 t駓 c祅g th猰 phng ti謓 . "
		szTitle = szTitle .. " b蕋 qu� ta b猲 n祔 c� th� a c竎 ngi 甶 <color=yellow> v� danh b� k輓h <color> , � n琲 n祇 c� th� d飊g kinh nghi謒  i l蕐 m閠 輙 k� n╪g ch  thu莕 th鬰 . "
		
		local tbOpt = {}
		--- 增加物品送150修炼值 -- Modified By NgaVN - 20121207
		tinsert(tbOpt, {"N閜 v藅 ph萴 Tu ch﹏ y誹 quy誸", tbTrainSkill150.LoadItem, {tbTrainSkill150}})
		-- 进去之前需要判断 是否具有150级技能，否则不送
		
		-- 送我去无名秘境- - Modified By NgaVN - 20121207
		tinsert(tbOpt, {"Лa ta 甶 v� danh b� k輓h ", toWumingmijin})	
		tinsert(tbOpt, {"Ta suy ngh� th猰 h� ", no})
		
		CreateNewSayEx(szTitle, tbOpt)
		
				
--		i = random(0,2)
--		if (i == 0) then
--			Talk(1,"","释明：自从有了更好的洗髓去处，我这里立刻就变得门可罗雀了。")
----			Talk(1,"","释明：易筋洗髓的功夫出自易筋经，但是想修炼这门功夫的人自身却必须散尽全身功力，完全是为人作嫁。可恨我为少林而修习这门功夫，到头来却被逐出少林！")
----		elseif (i == 1) then
----			Talk(1,"","释明：贪点财又有什么不对了，难道出家人就必须餐风饮露了吗？居然为了这就把我逐出少林。不过也好，现在我这样反而更逍遥自在！")
--		else
--			Talk(2,"","释明：你是来找我洗髓的吗？贫僧我虽然贫财，不过也不忍骗你。","释明：现在你只要找随便哪个城市的车夫，都可以送你去“洗髓岛”，比贫僧洗髓更加方便。")
----			Talk(1,"","释明：易筋洗髓虽然神妙，但被洗髓之人根骨却仍然有一定损伤，因此想要洗髓的话一定要考虑清楚。")
--		end
	end
end;

function toWumingmijin()
	local tbSkill_150 = {1055,1056,1057,1059,1060,1058,1066,1067,1069,1070,1071,1061,1062,1114,1063,1065,1075,1076,1074,1073,1079,1078,1080,1081,}
	local bResult = 0
	for i=1, getn(tbSkill_150) do
		if HaveMagic(tbSkill_150[i]) ~= -1 then
			bResult = 1
			break
		end
	end

	if bResult == 1 then
		NewWorld(967,1634, 3231)
	else
		Talk(1,"","ьi sau khi h鋍 頲 k?n╪g 150 r遡 h穣 甶 V?Danh M藅 C秐h!")
	end
end

function rollback_0611()		-- 为(2004-06-11)设计的免费洗点
	if (GetCash() >= 100000) then
		SetTaskTemp(1,1024)		-- 此次洗点增量为1024
		rollback_prise()
	else
		Talk(1,"","Ngi h祅h t萿 giang h?l﹗ nh?v藋, ch?100000 ng﹏ lng c騨g kh玭g c?sao?")
	end
end

function rollback_1212()		-- 为(2003-12-12)设计的免费洗点（已取消）
	if (GetCash() >= 100000) then
		SetTaskTemp(1,1)		-- 此次洗点增量为1
		rollback_prise()
	else
		Talk(1,"","T?ti襫  c騨g kh玭g c? l祄 sao b玭 ba giang h?")
	end
end

function found_jewel_yes()		-- 找到宝石，换回技能点
	if (GetCash() >= 100000) then
		j238 = GetItemCountEx(238)
		j239 = GetItemCountEx(239)
		j240 = GetItemCountEx(240)
		if (j238+j239+j240 == 3) then
			Pay(100000)
			SetTask(13,GetTask(13) + 256)	-- 把变量改成用过宝石的状态
			for i = 1,j238 do DelItemEx(238) end
			for i = 1,j239 do DelItemEx(239) end
			for i = 1,j240 do DelItemEx(240) end
			AddMagicPoint(3)		-- 补回洗点扣除的3点。
			Talk(1,"KickOutSelf","Xong r錳! Trc m総 ngi n猲 ng錳 t辬h dng m閠 ch髏 l蕐 l筰 s鴆!")
		elseif (j238+j239+j240 > 3) then
			Say("Ngi h穣 a ta 3 vi猲 Th駓 tinh trc, ta m韎 c?th?gi髉 ngi 頲!",1,"V藋  ta 甶 c蕋 b韙 , r錳 quay l筰 g苝 i s? /rollback_no")
		else
			Talk(1,"","Ngi r?r祅g kh玭g c? 3 vi猲 Th駓 tinh")
		end
	else
		Talk(1,"","Xong r錳! Trc m総 ngi n猲 ng錳 t辬h dng m閠 ch髏 l蕐 l筰 s鴆!")
	end
end

function rollback_get()
	Say("Xong r錳! Ta m謙 qu? Ngi m l璶g cho ta ch髏 甶!",2,"Зy l?10 v筺 lng, xin i s?nh薾 cho. /pay_yes","V藋 th玦 甶/rollback_no")
end;

function rollback_no()
	Talk(1,"","ng mong ch?i gi?quang l﹎, th?頲 10 v筺 lng, Ha! Ha! Ha!. ")
end;

function pay_yes()					-- 初次洗点，是用的宝石（不扣技能）
	if (GetCash() >= 100000) then
		if (GetByte(GetTask(13),2) == 0) then		-- 若用过水晶就不再允许用水晶洗点
			Say("Ngi h穣 a ta 3 vi猲 Th駓 tinh trc, ta m韎 c?th?gi髉 ngi 頲!",3,"Ta c?ba h箃 /pay_jewel","Ta kh玭g vi猲  qu?, kinh m筩h b?thng c騨g kh玭g ch辵 n鏸 n鱝 r錳. /jewel_none","V藋 th?ta s?thay g﹏ i c鑤 mu閚 m閠 ch髏 /rollback_no")
		else
			jewel_none()
		end
	else
		Talk(1,"","Зy l?th祅h ?c馻 ngi sao?Nh?th?th?ngi quay v?甶! ")
	end
end

function pay_jewel()
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	if (j238+j239+j240 == 3) then
		SetTaskTemp(1,257)		-- 记住是用宝石洗的点（洗点变量值为257，非1）
		Talk(2,"rollback_prise","Xong r錳! Trc m総 ngi n猲 ng錳 t辬h dng m閠 ch髏 l蕐 l筰 s鴆!","B﹜ gi?h穣 ng錳 trc m苩 ta")
	elseif (j238 + j239 + j240 > 3) then
		Say("Ngi h穣 a ta 3 vi猲 Th駓 tinh trc, ta m韎 c?th?gi髉 ngi 頲!",1,"V藋  ta 甶 c蕋 b韙 , r錳 quay l筰 g苝 i s? /rollback_no")
	else
		Talk(1,"","Ngi r?r祅g kh玭g c? 3 vi猲 Th駓 tinh")
	end
end

function NEWpay_yes()		-- 第二次（及以后）洗点时调用，直接检查钱和宝石，不再记录是否宝石洗
	if (GetCash() >= 100000) then
		j238 = GetItemCountEx(238)
		j239 = GetItemCountEx(239)
		j240 = GetItemCountEx(240)
		if (j238+j239+j240 == 3) then
			SetTaskTemp(1,10)		-- 已经开始洗点流程
			Talk(2,"rollback_prise","Xong r錳! Trc m総 ngi n猲 ng錳 t辬h dng m閠 ch髏 l蕐 l筰 s鴆!","B﹜ gi?h穣 ng錳 trc m苩 ta")
		elseif (j238 + j239 + j240 > 3) then
			Say("Ngi h穣 a ta 3 vi猲 Th駓 tinh trc, ta m韎 c?th?gi髉 ngi 頲!",1,"V藋  ta 甶 c蕋 b韙 , r錳 quay l筰 g苝 i s? /rollback_no")
		else
			Talk(1,"","Ngi r?r祅g kh玭g c? 3 vi猲 Th駓 tinh")
		end
	else
		Talk(1,"","Ch?100000 ng﹏ lng c騨g kh玭g c? l祄 sao ta gi髉 ngi 頲?")
	end
end

function jewel_none()
--	SetTask(13,GetTask(13) + 1)
	SetTaskTemp(1,1)		-- 记住是用技能点数洗的点（洗点变量值为1，非257）
	Talk(2,"rollback_prise","Xong r錳! Trc m総 ngi n猲 ng錳 t辬h dng m閠 ch髏 l蕐 l筰 s鴆!","B﹜ gi?h穣 ng錳 trc m苩 ta")
end

function rollback_cancel()		-- 已放弃的无用函数
	i = GetTaskTemp(1)
	if (i > 0) then		-- 如果已经开始流程，返还10W两银子
		Talk(1,"","Ta tr?l筰 ti襫 cho ngi y!")
		Msg2Player("Th輈h Minh tr?l筰 10 v筺 lng cho b筺. ")
	end
end

function rollback_prise()
--- 先扣钱和宝石、置变量
	UTask13 = GetTask(13)
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	addon = GetTaskTemp(1)
	if (addon == 1024) then			-- 是免费特殊洗点
		Uworld137 = GetTask(137) + 40
		SetTask(137,Uworld137)
		AddMagicPoint(3)
	elseif (addon == 257) then		-- 是初次洗点，并且是用宝石洗的
		for i = 1,j238 do DelItem(238) end
		for i = 1,j239 do DelItem(239) end
		for i = 1,j240 do DelItem(240) end
		AddMagicPoint(3)		-- 加3点技能，抵销洗点扣除的3点正好对上。
		SetTask(13,UTask13 + 257)	-- 洗点变量的改变为原本值加上此次增加值（免费特殊洗点的+0）
	elseif (addon == 10) then		-- 不是初次洗点，必有宝石。也加3点技能
		for i = 1,j238 do DelItem(238) end
		for i = 1,j239 do DelItem(239) end
		for i = 1,j240 do DelItem(240) end
		AddMagicPoint(3)
		SetTask(13,UTask13 + 1)	-- 洗点变量的改变为原本值加上此次增加值
	elseif (addon == 1) then		-- 初次洗点，用的是技能
		SetTask(13,1)	-- 洗点变量的改变为原本值加上此次增加值
	else
		Talk(1,"","T譶h tr筺g T葃 t駓 c?ch髏 sai s鉻! Xin l藀 t鴆 li猲 h?v韎 GM  頲 x?l?")
		return 0
	end
	Pay(100000)
--- 然后开始洗点
	i = HaveMagic(210)		-- 轻功另外操作
	j = HaveMagic(400)		-- “劫富济贫”另外操作
	n = RollbackSkill()		-- 清除技能并返回所有技能点（包括轻功等特殊技能）
	x = 0
	if (i ~= -1) then x = x + i end		-- 这两句判断是排除从未学过轻功的人返回-1从而导致点数计算错误情况
	if (j ~= -1) then x = x + j end
	rollback_point = n - x - 3			-- 把技能点当做空闲点数返还，但先扣除轻功等
	if (rollback_point + GetMagicPoint() < 0) then		-- 如果洗成了负数，则当作0（为以后多次洗点保留）
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
--	AddMagic(53,1)				-- 隐藏的基础技能（长兵、短兵、远程）不必处理
--	AddMagic(1,1)
--	AddMagic(2,1)
	if (i ~= -1) then AddMagic(210,i) end			-- 如果学过轻功则加回原有等级
	if (j ~= -1) then AddMagic(400,j) end			-- 如果学过“劫富济贫”同样处理
	if (UTask13 == 254) or (UTask_13 == 510) then		-- 已经没有洗点机会了，提醒一下玩家
		Msg2Player("D飊g 3 vi猲 Th駓 Tinh ti課 h祅h t葃 甶觤 k?n╪g. B筺 n猲 v?nh?ngh?m閠 l竧!")
		Say("Ngi  T葃 t駓 qu?nhi襲 l莕, kinh m筩h lo筺 h誸. B﹜ gi?<color=red>kh玭g th?t葃 t駓<color> 頲 n鱝!",1,"Ta bi誸 r錳!, ta s?ch?? /KickOutSelf")
	else
		Msg2Player("Х t葃 xong 甶觤 k?n╪g! B筺 c?th?ti課 h祅h ph﹏ ph鑙 l筰!")
		Say("Х t葃 xong 甶觤 k?n╪g! B筺 c?th?ti課 h祅h ph﹏ ph鑙 l筰!",1,"Л頲. /KickOutSelf")
	end
--	KickOutSelf()
end;

function no()
end
