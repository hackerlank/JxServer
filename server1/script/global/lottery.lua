TASKTMPID_MEDAL_RANK = 153;			--临时任务变量ID of 当前会话所进行到的奖牌等级 （1，2，3）
TASKTMPID_MEDAL_RANGE = 154;		--临时任务变量ID of 当前会话所进行到的奖牌数范围 （0，1，...，9）
TASKTMPID_MEDAL_ANSWER = 155;		--临时任务变量ID of 当前会话玩家所选奖牌数目结果 （DWORD）
--TASKID_MEDAL_ANSWER = 2004;			--任务变量ID of 。。。 (test)
METALCHOOSE_ID = 1000;

aryszMedalRank = { " kim b礽 ", "Ng﹏ b礽 ", "уng b礽 " };

function onMedalmain()	
	SetTaskTemp( TASKTMPID_MEDAL_ANSWER, 0 );
	SetTaskTemp( TASKTMPID_MEDAL_RANK, 1 );
	showMedalRange();	
end

function showMedalRange()
	local aryszRange = {};
	local nRangeCount = 8;
	local szMedalRank = aryszMedalRank[ GetTaskTemp( TASKTMPID_MEDAL_RANK ) ];
		
	for i = 1, nRangeCount do
		aryszRange[ i ] = ( i - 1 ) * 10 .. "-".. ( i - 1 ) * 10 + 9 .. "mai/onRangeSelect";
	end
	aryszRange[ nRangeCount + 1 ] = "H駓/onCancel";	
	
	Say( szMedalRank.."дn:", nRangeCount + 1, aryszRange );
end

function onRangeSelect( nSel )
	local aryszNumber = {};
	local nMedalRank = GetTaskTemp( TASKTMPID_MEDAL_RANK );
	
	for i = 1, 10 do
		aryszNumber[i] = ( nSel * 10 + i - 1 ).."mai/onNumberSelect";
	end
	aryszNumber[ 11 ] = " tr� v� /showMedalRange";
	
	SetTaskTemp( TASKTMPID_MEDAL_RANGE, nSel );
	Say( aryszMedalRank[ nMedalRank ].." m :", 11, aryszNumber );
end

function onNumberSelect( nSel )
	local nMedalRank = GetTaskTemp( TASKTMPID_MEDAL_RANK );
	local nMedalRange = GetTaskTemp( TASKTMPID_MEDAL_RANGE );
	local nMedalAnswer = GetTaskTemp( TASKTMPID_MEDAL_ANSWER );	
	local nMedalNumber = nMedalRange * 10 + nSel;
	nMedalAnswer = SetByte( nMedalAnswer, nMedalRank, nMedalNumber );
	SetTaskTemp( TASKTMPID_MEDAL_ANSWER, nMedalAnswer );
	if( nMedalRank < getn( aryszMedalRank ) ) then
		SetTaskTemp( TASKTMPID_MEDAL_RANK, nMedalRank + 1 );
		showMedalRange();
	else
		confirm();
	end
end

function confirm()
	local nRankCount = getn( aryszMedalRank );
	local szConfirmInfo = " ngi l鵤 ch鋘 ";
	local nMedalAnswer = GetTaskTemp( TASKTMPID_MEDAL_ANSWER );
	
	for i = 1, nRankCount do
		szConfirmInfo = szConfirmInfo..GetByte( nMedalAnswer, i ).." mai "..aryszMedalRank[i];
	end
	szConfirmInfo = szConfirmInfo..", mua v� s� ? ";
	
	Say( szConfirmInfo, 2, "X竎 nh /onSubmit", "H駓 b� /onCancel" );
end

function onSubmit()
	local nMedalAnswer = GetTaskTemp( TASKTMPID_MEDAL_ANSWER );	
	if (Pay(5000) > 0) then
		if (AddTicket(METALCHOOSE_ID , nMedalAnswer) == 1) then
			nItem = AddItem(6,1,75,1,0,0)
			SetSpecItemParam(nItem, 1, METALCHOOSE_ID )
			SetSpecItemParam(nItem, 2, nMedalAnswer);
			SetSpecItemParam(nItem, 3, GetByte(nMedalAnswer, 3))	
			SyncItem(nItem)
		else
			Earn(5000);
			Say("Th藅 xin l鏸 , n猲 lo筰 v� s� trc m総  m蕋 ph竝 n鱝 mua . ", 0)
		end;
	else
		Say("Th藅 xin l鏸 , ngi nh蕋 nh ph秈 tr� 5000 hai mua v� s� ", 0)
	end
end

function onCancel()
end
