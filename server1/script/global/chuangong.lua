Include([[\script\global\特殊用地\梦境\npc\路人_叛僧.lua]])
Include("\\script\\item\\levelup_item.lua")
Include("\\script\\global\\head_qianzhuang.lua")
Include("\\script\\global\\systemconfig.lua")
IncludeLib("SETTING")

TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr> c c� ki誱 :<link>"
function cg_getnextdate(oldday, num) --获得oldday的第num ng祔 的 ng祔 期，比如060227的第5 ng祔 为060304
	local nDay = tonumber(oldday)
	local nYear = floor(nDay / 10000)
	local nMonth = floor((nDay - nYear * 10000) / 100)
	nDay = nDay - nYear * 10000 - nMonth * 100 
	nDay = nDay + num
	
	while (nDay > TBMONTH[nMonth]) do
		nDay = nDay - TBMONTH[nMonth]
		if (nMonth == 12) then
			nMonth = 1
			nYear = nYear + 1
		else
			nMonth = nMonth + 1
		end
	end
	return (nYear * 10000 + nMonth * 100 + nDay)
end

function chuangong_main()
	-- VN_MODIFY_20060427
	if (1) then
		Say("S� li謚 sai l莔 .", 0)
		return
	end
	
	if (gb_GetModule("Truy襫 c玭g ") ~= 1) then
		Say("对不起，Truy襫 c玭g 功能暂时关闭，再次开放时间就关注官方公告!", 0)
		return 
	end
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		Say("чc c� ki誱 "..GetName().."  l﹗ kh玭g g苝 , h玬 nay t譵 ta c� chuy謓 g� ? ",3, "我想打听关于Truy襫 c玭g 的事情。/chuangong_info", "我想取消上次的Truy襫 c玭g 申请!/cg_undo", "Ta ch糿g qua l� t韎 b竔 ph醤g m閠 c竔 minh ch� ngi m� th玦 . /OnCancel")
	else
		Say("чc c� ki誱 "..GetName().."  l﹗ kh玭g g苝 , h玬 nay t譵 ta c� chuy謓 g� ? ",2, "我想打听关于Truy襫 c玭g 的事情。/chuangong_info", "Ta ch糿g qua l� t韎 b竔 ph醤g m閠 c竔 minh ch� ngi m� th玦 . /OnCancel")
	end
end

function chuangong_info()
	if (gb_GetModule("Truy襫 c玭g ") ~= 1) then
		Say("对不起，Truy襫 c玭g 功能暂时关闭，再次开放时间就关注官方公告!", 0)
		return 
	end
	local nowday = tonumber(date("%y%m%d"))
	local applytime = GetTask(TV_LAST_APPLY_TIME)
	if (applytime == 0) then
		Describe(strimg.."凡是游历江湖已久，等级从100级到160级的人，我都可以帮他把一身的功力转成一颗'元神丹'，一个10级以下没入门派又没拜过师的人只要吃了这颗'元神丹'便能获得Truy襫 c玭g 人的一身功力，当然一个传完功的人武功也不至于全废，不过也就剩下80级的水平了。而且我能力有限，等级越高的人越难将其武功转化为'元神丹'，比如一个100~120的人物Truy襫 c玭g 时经验会损耗5%，121~150级会损耗10%，而150级以上会损耗20%，<color=yellow>打听这些难道兄弟你想Truy襫 c玭g ？<color>", 2, "ng v藋 , ta  du l辌h giang h�  l﹗ , g莕 nh蕋 mu鑞 tho竔 萵 . /chuangong_do", "D� nhi猲 kh玭g ph秈 , ch糿g qua l� t韎 h醝 th╩ m閠 ch髏 m� th玦 . /OnCancel");
	elseif (nowday >= applytime ) then
		Describe(strimg.."Truy襫 c玭g 的准备已经好了."..itemstr..".\n 你确定要Truy襫 c玭g 吗？这一传可就不能回头了啊！<enter>6 th竛g 20 ng祔 后将暂时关闭Truy襫 c玭g 申请，6 th竛g 29 ng祔 24：00后将暂时关闭Truy襫 c玭g 功能。", 3, "ng v藋 , l遪g ta �  quy誸 . /chuangong_dosure","不，我想取消Truy襫 c玭g ！/cg_undo", "Ch� ta suy ngh� th猰 m閠 畂筺 ng祔 甶 . /OnCancel");
	else
		Describe(strimg.."我正在准备Truy襫 c玭g 所需要的材料，我要到 "..(num2datestr(applytime)).." sau m韎 c� th� chu萵 b� xong ,", 2, "Th藅 l� phi襫 to竔 minh ch� li評 , v穘 b鑙 � ch� n祔 c竚 琻 /OnCancel", "不，我想取消Truy襫 c玭g ！/cg_undo");
	end
end



function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.." n╩ "..month.." th竛g "..day.." ng祔 "
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.." ta n "..num2datestr(nowday).."就可以准备好帮你Truy襫 c玭g 了，你真的不想传吗？<enter>6 th竛g 20 ng祔 后将暂时关闭Truy襫 c玭g 申请，6 th竛g 29 ng祔 24：00后将暂时关闭Truy襫 c玭g 功能。",2,"是的，我不想Truy襫 c玭g 了！/cg_undo_sure", "Kh玭g , ta c遪 l� mu鑞 truy謓 , m韎 v鮝 r錳 nh蕋 th阨 kh萵 trng n鉯 sai r錳 m� th玦 . /OnCancel")
	else
		Describe(strimg.."你没有跟我说过要Truy襫 c玭g 啊。没说过又怎么取消呢？",1,"K誸 th骳 i tho筰 /OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.." 頲 r錳 , v藋 nh鱪g th� n祔 t礽 li謚 ta trc thu l筰 , n誹 nh� l莕 sau mu鑞 truy謓 l阨 c馻 n鱝 chu萵 b� 甶 ",1,"C竚 琻 minh ch� /OnCancel")
end

function chuangong_do()
	local nEndLevel = GetLevel()
	local nRestExp = GetExp()
	if (nEndLevel < 100) then
		Describe(strimg.."呵呵，这位小兄弟，以你现在的功力似乎还不足以传给别人呢。Truy襫 c玭g 需要<color=yellow>100级<color>以上，你还是去多磨练磨练吧。",1,"H秓 ta bi誸 /OnCancel")
		return
	end
	if (nEndLevel >= 160) then
		Describe(strimg.."呵呵，这位兄弟，超过160级以上是不能Truy襫 c玭g 的。",1,"H秓 ta bi誸 /OnCancel")
		return
	end
	
	local nLevelFullExp = tonumber(GetTabFileData(FILE_LEVEL, nEndLevel+ 1, 2))
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp))
	
	local str = strimg.."以你现在的武功修为,如果Truy襫 c玭g 的话将转化为一个<color=yellow>等级:"..fPerc.."<color> ch nguy猲 th莕 產n "
	str = str..client_main(nEndLevel, nRestExp)
	Describe(str..",不过我需要准备一个星期,你在这段期间随时可以来取消Truy襫 c玭g ，毕竟一个人练武到这个程度不容易，请你在这段时间好好考虑考虑吧",2,"Minh ch� , ta  quy誸 t﹎ quy 萵 , ng礽 c� th� b総 u chu萵 b� /chuangong_doprepair1","Nh� v藋 a , v藋 ta suy ngh� m閠 ch髏 n鱝 tr� l筰 甶 . /OnCancel")
end

function chuangong_doprepair1()
	local nowday = tonumber(date("%y%m%d"))
	local nextday = cg_getnextdate(nowday, 7)
	SetTask(TV_LAST_APPLY_TIME , nextday);
	WriteLog("[Truy襫 c玭g ]："..nowday.." Acc:"..GetAccount().."Role:"..GetName().." 提出Truy襫 c玭g 申请！")
	Describe(strimg.."好！那我即刻准备你的Truy襫 c玭g 事宜，一个星期后<color=yellow>"..num2datestr(nextday).."<color>你再来，我给你正式Truy襫 c玭g ！当然你也随时可以来我这里取消Truy襫 c玭g 。", 1,"C竚 琻 minh ch� , v藋 ta m閠 tu莕 l� sau tr� l筰 /OnCancel")
	Msg2Player("你已成功申请Truy襫 c玭g ，一周后再来找独孤剑可以正式进行Truy襫 c玭g ，并获得元神丹！也可随时找独孤剑取消Truy襫 c玭g 申请！")
end

function chuangong_dosure()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("你的等级小于100级或超过160级不能Truy襫 c玭g ！",0)
		return
	end
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		Say("对不起，Truy襫 c玭g 时，身上不能装任何的装备，请脱下装备再Truy襫 c玭g 吧！",0)
		return
	end
	Describe(strimg.."Truy襫 c玭g 需要支付2张银票，你是否已经放入背包？这回真得要Truy襫 c玭g 了，你确定要Truy襫 c玭g 吗？",2, "2 t蕀 ng﹏ phi誹  chu萵 b� xong , x竎 nh /chuangong_doit1", "Ta suy ngh� th猰 m閠 ch髏 /OnCancel")
end

function chuangong_doit1()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("你的等级小于100级或超过160级不能Truy襫 c玭g ！",0)
		return
	end
	Describe(strimg.."再确定一次！注意：Truy襫 c玭g 完成后，你的角色将会自动断线。重新登入后，在背包中即会存在元神丹一枚。",2, "X竎 nh /chuangong_doit", "Ta suy ngh� th猰 m閠 ch髏 /OnCancel")
end

function chuangong_doit()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("你的等级小于100级或超过160级不能Truy襫 c玭g ！",0)
		return
	end
	local result = qz_use_silver(2, "［Truy襫 c玭g ］")
	if ( result == 0) then
		Describe(strimg.."你的背包中没有2张银票，我不能给你Truy襫 c玭g ！", 1, "Oh , th藅 xin l鏸 , ta tr� v� chu萵 b� /OnCancel")	
		return
	elseif (result ~= 1) then
		return 
	end
	SetTask(TV_LAST_APPLY_TIME, 0)
	
	local nowday = tonumber(date("%y%m%d"))
	
	local logstr = "[Truy襫 c玭g ]："..nowday.." Acc:"..GetAccount().."Role:"..GetName().." Truy襫 c玭g 成功！Level:"..GetLevel().." Exp:"..GetExp();
	
	
	DoClearSkillCore()
	DoClearPropCore()
	UpdateSkill()
	local endlevel = GetLevel()
	local restexp = GetExp()
	
	ST_LevelUp(80 - endlevel)
	local param5 = chuangong_item(endlevel, restexp)
	logstr = logstr.." ItemParam5:"..param5
	WriteLog(logstr)
end

function chuangong_item(level,restexp)
	if (restexp <0) then
		restexp = 0
	end
	
	nIt = AddItem(6,1,1061,1,0,0,0)
	SetItemMagicLevel(nIt, 1, level)
	SetItemMagicLevel(nIt, 2, restexp)

	m1 = GetByte(restexp, 3)
	m2 = GetByte(restexp, 4)
	m = m1
	m = SetByte(m1, 2, m2)
	
	n1 = SetByte(restexp, 3,0)
	n =  SetByte(n1, 4, 0)

	SetItemMagicLevel(nIt, 3, m)
	SetItemMagicLevel(nIt, 4, n)
	SetItemMagicLevel(nIt, 5, FileName2Id(GetName()))
	SyncItem(nIt)
	return GetItemParam(nIt, 5)
end

function OnCancel()
end