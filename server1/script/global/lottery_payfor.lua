TEMP_QID = 122;
TEMP_QCHOOSE = 123;
GOLD_TIMESTEMP = 4001;
GOLD_SERIES = 4000;
GOLD_COUNT = 4002;
FIRSTDAY = 816;

GLBID_GOLD_LOTTERY_COUNT = 6;	--全局变量ID of 服务器上已发出的黄金彩票数
-- 七大城市地图
-- 1-凤翔, 2-成都, 3-大理, 4-汴京, 5-襄阳, 6-扬州, 7-临安
arynCityMapID = { 1, 11, 162, 37, 78, 80, 176 }
nMaxGoldLottery = 100000;		--每台GameServer上可发出的最多黄金彩票数

function onPayTicket()
if (IsCharged() ~= 1 ) then
	 Say("Th藅 xin l鏸 , ng礽 ch璦 sung tr� gi� , cho n猲 kh玭g c竎h n祇 tham gia nh� 甶觧 th辬h h閕 v� s� ho箃 ng . ", 0)
	return
end
nCount = GetPayTicketCount();

if (nCount == 0 ) then
	Say("Th藅 xin l鏸 , b﹜ gi� kh玭g t韎 i v� s� ch th阨 gian , xin/m阨 ng礽 � B綾 Kinh th阨 gian s竛g s韒 9 甶觤 n ng祔  bu鎖 t鑙 22 甶觤 t韎 i 甶 , c竚 琻 . ", 0) 
	return
end;

Tab = {};

for i = 1, nCount + 1 do 
	Tab[i] = GetQuestionTip(GetPayTicket(i)).."/OPAsk";
end;

Tab[nCount + 1] = "Kh玭g/Cancel";
Say("Mu鑞 i g� ?", nCount + 1, Tab)
end;

function OPAsk(nSel)
	nQuestion, nBonus = GetPayTicket(nSel + 1);
	if (nQuestion > 0 ) then 
		nAnswer = GetQAnswer(nQuestion)
		if (nAnswer > 0) then 
			if (nQuestion ~= 1000) then 
				str = format("C筺h 畂竛 :%s , k誸 qu� :%s , ti襫 thng :%d . ng礽 mu鑞 i tng sao ?", GetQuestion(nQuestion), GetChoose(nQuestion, nAnswer), nBonus )
			else
				lGold = GetByte(nAnswer, 1);
				lYing = GetByte(nAnswer,2);
				lTong = GetByte(nAnswer,3);
				str = format("C筺h 畂竛 :%s, k誸 qu� : kim b礽 %d kh鑙  ng﹏ b礽 %d kh鑙  ng b礽 %d kh鑙 , ti襫 thng :%d . ngi mu鑞 i tng sao ?", GetQuestion(nQuestionI), lGold, lYing, lTong,nBonus)
			end
			Say(str, 2, "фi tng /OPOnPayFor", "Kh玭g i tng /Cancel");
			SetTaskTemp(TEMP_QID, nQuestion)
		end
	end
end;


function OPOnPayFor()
	nQuestion = GetTaskTemp(TEMP_QID)
	nTotal, nRight, nBonus = CheckTicket(75, nQuestion);
	
	if (nTotal == 0) then
		Say("Th藅 xin l鏸 , ng礽 mua v� s� kh玭g c� p i v韎 , n th猰 n鱝 l� , kh玭g mu鑞 bu玭g tha cho nga , c� l� i tng 產ng � ch� ng礽 , ho祅g kim trang b� y ", 0)
	else
		nTotalBonus = nBonus * nRight
		local str = "";
		if (nQuestion ~= 1000) then 
			str = format("Ng礽 t鎛g c閚g c� %d t� c竔 n祔 lo筰 tng phi誹 , trong  trung tng ch c� %d t� , l蕐 頲 t鎛g ti襫 thng v� %d, ch骳 m鮪g ng礽 ! n誹 nh� ng礽 trung tng , ch髇g ta c遪 ngh� t苙g cho ng礽 ho祅g kim v� s� , b籲g n祔 v� s� c� th� s� t 頲 m閠 m鉵 ho祅g kim trang b� nga . ho祅g kim v� s� ch khai tng nh藅 k� 產ng � t鑙 nay ch 22 甶觤 30 n 24 甶觤 . ", nTotal,nRight, nTotalBonus);
		else
			str = format("Ng礽 t鎛g c閚g c� %d t� c竔 n祔 lo筰 tng phi誹 , trong  trung tng ch c� %d t� , l蕐 頲 t鎛g ti襫 thng v� %d, ch骳 m鮪g ng礽 ! n誹 nh� ng礽 trung tng , ch髇g ta c遪 ngh� t苙g cho ng礽 ho祅g kim v� s� , b籲g n祔 v� s� c� th� s� t 頲 m閠 m鉵 l莕 n祔 nh� 甶觧 th辬h h閕 ch ho祅g kim trang b� i tng  khai tng nh藅 k� � 9 th竛g 1 ng祔 9 th竛g 2 ng祔 v穘 22 甶觤 30 n 24 甶觤 . ", nTotal,nRight, nTotalBonus);
		end
		
		local logstr = format("[Lottery] Acc:%s Role:%s Q:%d QSum:%d QWin:%d Bonus:%d", GetAccount(), GetName(), nQuestion, nTotal, nRight, nTotalBonus )
		WriteLog(logstr);	
		Earn(nTotalBonus);
		Say(str,0)
		
		for i = 1, nRight do 
			item = AddItem(6,1,76, 1,0,0);
			LotteryId = getGoldLotteryID();
			LotteryTime = getCurrTime();
			SetSpecItemParam(item , 1, LotteryId)
			SetSpecItemParam(item , 2, LotteryTime)
			P3 = SetByte(GetByte(LotteryId, 3), 2, GetByte(LotteryId,4))
			P4 = SetByte(GetByte(LotteryTime, 3), 2, GetByte(LotteryTime,4))
			SetSpecItemParam(item , 3, P3)
			SetSpecItemParam(item , 4, P4)
			SetSpecItemParam(item, 5, nQuestion)
			if (nQuestion == 1000) then 
				SetSpecItemParam(item, 5, 1000)
				UpdateSDBRecord("GoldLottery0901", LotteryId, LotteryTime, 0) --黄金大奖记录为9 th竛g 1日的彩票
			else
				UpdateSDBRecord("GoldLottery"..date("%m%d"),LotteryId, LotteryTime, 0)
			end
			SyncItem(item)
		end;
	end;
end;

function Cancel()

end;

function onPayforGoldLottery()
	local PayTab={};
	if (tonumber(date("%m%d")) > 831 ) then 
		Say("Th藅 xin l鏸 , l莕 n祔 nh� 甶觧 th辬h h閕 ch b譶h thng ho祅g kim v� s� ch i tng ho箃 ng  k誸 th骳 . ",0)
		return
	end
	
	nIntervalDay = tonumber(date("%m%d")) - FIRSTDAY + 1;
	
	if (nIntervalDay <=0) then 
		return
	end

	for i = 1, nIntervalDay do 
		nMonth = floor((FIRSTDAY + nIntervalDay - i) / 100)
		nDay = mod(FIRSTDAY + nIntervalDay - i , 100)
		PayTab[i] = nMonth.." th竛g "..nDay.." ng祔 ho祅g kim v� s� /doPayforGold"
	end;
	PayTab[nIntervalDay + 1] = "不用兑奖了/Cancel";
	Say("Ngi mu鑞 i m閠 ng祔 kia ch ho祅g kim v� s� i tng ? ", getn(PayTab), PayTab);
--	Say("V鑞 ng祔 trung tng ch ho祅g kim v� s� s� v� ["..GetGlbValue(GOLD_TIMESTEMP).."-"..GetGlbValue(GOLD_SERIES).."], l蕐 頲 tng ngi c� th� ph秈 n ng蓇 nhi猲 l蕐 頲 ho祅g kim trang b� m閠 m鉵  ngi mu鑞 i tng sao ? ", 2, "T鑤 /doPayforGold", "Kh玭g c莕 /Cancel")
end

function doPayforGold(nDay)

	ldate = tonumber(date("%m%d"))
	
	if (ldate > 831) then 
		return 
	end
	
	nIntervalDay = ldate - FIRSTDAY + 1;

	if (nIntervalDay <= 0) then
		return
	end

	nSel =  nIntervalDay - nDay - 1;
	dayGOLD_SERIES = GOLD_SERIES + nSel * 2;
	dayGOLD_TIMESTEMP = GOLD_TIMESTEMP + nSel * 2;

	if ( GetGlbValue(dayGOLD_TIMESTEMP) == 0 ) then 
		Say("Th藅 xin l鏸 , trc m総 n猲 nh藅 k� ch ho祅g kim v� s� c� th� ch璦 l竔/m� ra , xin sau n鱝 i tng , c竚 琻 . ", 0)
		return
	end;

	 nItem = FindSpecItemParam2(1, 76, GetGlbValue(dayGOLD_SERIES), GetGlbValue(dayGOLD_TIMESTEMP));
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) > 0) then 
			Say("Ch骳 m鮪g ngi , ngi ho祅g kim v� s� trung tng li評 , t 頲 ho祅g kim trang b� m閠 m鉵 ", 0)
			
			nMonth = floor((FIRSTDAY + nSel)/100);
			nDay = mod( (FIRSTDAY + nSel) , 100)

			AddGoldItem(0, random(159,167))
			Msg2Player("Ch骳 m鮪g ngi t 頲 ho祅g kim trang b� m閠 m鉵 ")
			WriteLog(GetAccount()..","..GetName().."中了"..FIRSTDAY+nSel.."黄金彩票大奖，获得黄金装备一件。彩票ID"..GetGlbValue(dayGOLD_TIMESTEMP).."-".. GetGlbValue(dayGOLD_SERIES))
			msg = " ch骳 m鮪g : nh� ch琲 "..GetName().." trung li評 "..nMonth.." th竛g "..nDay.." ng祔 ch ho祅g kim v� s� i tng , t 頲 ho祅g kim trang b� m閠 m鉵 ";
			AddGlobalCountNews(msg, 1);
		end
	else
		Say("Th藅 xin l鏸 , trung tng s� v� "..GetGlbValue(dayGOLD_TIMESTEMP).."-"..GetGlbValue(dayGOLD_SERIES).." , tr猲 ngi ngi khai tng ch ho祅g kim v� s� trung kh玭g c� th蕋 x鴑g ch trung tng d穣 s� . ", 0)
	end
end;



function doPayforGreateGold()

	nIntervalDay = 901 - FIRSTDAY;
	
	dayGOLD_SERIES = GOLD_SERIES + nIntervalDay * 2;
	dayGOLD_TIMESTEMP = GOLD_TIMESTEMP + nIntervalDay * 2;

	if ( GetGlbValue(dayGOLD_TIMESTEMP) == 0 ) then 
		Say("Th藅 xin l鏸 , trc m総 nh� 甶觧 th辬h h閕 c筺h 畂竛 tr髇g nc tng b礽 m ch ho祅g kim v� s� trung tng s� c� th� ch璦 l竔/m� ra , xin sau n鱝 i tng , c竚 琻 . ", 0)
		return
	end;

	
	nItem = FindSpecItemParam2(1, 76, GetGlbValue(dayGOLD_SERIES), GetGlbValue(dayGOLD_TIMESTEMP));
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) > 0) then 
			Say("Nhi謙 li謙 a ch骳 m鮪g ng礽 , ng礽 ch ho祅g kim v� s� trung tng li評 , trung li評 竜 v薾 h� li謙 ho箃 ng ch l韓 nh蕋 tng  t 頲 nh� 甶觧 chi h錸  B綾 Kinh chi m閚g cao c蕄 ho祅g kim chi誧 nh蒼 m閠 i ", 0)
			AddGoldItem(0, 141)
			AddGoldItem(0, 142)
			Msg2Player("Ng礽 t 頲 nh� 甶觧 chi h錸  B綾 Kinh chi m閚g m閠 i ho祅g kim chi誧 nh蒼 ")
			WriteLog(GetAccount()..","..GetName().." trung li評 竜 v薾 Trung qu鑓 i tng b礽 m ch ho祅g kim v� s� i tng , t 頲 竜 v薾 chi誧 nh蒼 trang b� m閠 b� . v� s� ID"..GetGlbValue(dayGOLD_TIMESTEMP).."-".. GetGlbValue(dayGOLD_SERIES))
			msg = "热烈 ch骳 m鮪g : nh� ch琲 "..GetName().." trung li評 雅典盛会中国队奖牌数竞猜的黄金大奖，获得雅典之魂、北京之梦高级黄金戒指一对！";
			AddGlobalNews(msg);
		end
	else
		Say("Th藅 xin l鏸 , trung tng s� v� "..GetGlbValue(dayGOLD_TIMESTEMP).."-"..GetGlbValue(dayGOLD_SERIES).." , tr猲 ngi ngi khai tng ch ho祅g kim v� s� trung kh玭g c� th蕋 x鴑g ch trung tng d穣 s� . ", 0)
	end
end;



function getGoldLotteryID()
	local nMapCount = getn( arynCityMapID );
	local nCurrServerID = nMapCount + 1;
	for i = 1, nMapCount do
		if( SubWorldID2Idx( arynCityMapID[i] ) >= 0 ) then	--利用地图是否存在来判断当前是在哪一台服务器上
			nCurrServerID = i;
			break;
		end
	end
	local nLotteryCount = GetGlbValue( GLBID_GOLD_LOTTERY_COUNT );
	SetGlbValue( GLBID_GOLD_LOTTERY_COUNT, nLotteryCount + 1 );
	return nMaxGoldLottery * ( nCurrServerID - 1 ) + nLotteryCount;
end

function getCurrTime()
	return tonumber( date( "%m%d%H%M%S" ) );
end