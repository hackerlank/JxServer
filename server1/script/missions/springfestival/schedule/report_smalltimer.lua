Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\schedule\report_smalltimer.lua]]);

function ontimer_add(nNewsValue)
	local i;
	for i = 1, CO_SMALLMAPCOUNT do
		if (nNewsValue >= 18) then
			report(i + CO_SMALLMAPCOUNT, 1);
			report(i, 1);
		else
			report(i + CO_SMALLMAPCOUNT, 0);
			report(i, 0);
		end;
	end;
end;


function report_add(tabPlayer, nGroupId)
	local szMsg = ""
	local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1]
			if (nGroupId > CO_SMALLMAPCOUNT) then
		    	szMsg = szMsg.."<enter> <color=orange>"..i.." "..GetName()..", t譵 頲"..CO_MOUSENAME..tabPlayer[i][2].."l莕";
		    else
		    	szMsg = szMsg.."<enter> <color=orange>"..i.." "..GetName()..", 畊鎖 g ba mi"..tabPlayer[i][2].."l莕";
		    end;
		end
	end
	--排序后从前到后就是名l莕的先后
	for i = 1, getn(tabPlayer) do
		PlayerIndex = tabPlayer[i][1];
		if (bSave == 1) then
			SetTask(TK_CO_RANK, i);
		end;
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		if (nGroupId > CO_SMALLMAPCOUNT) then
		    Msg2Player("Hi謓 b筺 t譵 頲 <color=yellow>"..CO_MOUSENAME..GetTask(TK_CO_COUNT_ONETIME).."<color>l莕"..", hi謓 產ng x誴 th� <color=yellow>"..i.."<color>.");
		else
			Msg2Player("Х 畊鎖 <color=yellow>g ba mi"..GetTask(TK_CO_COUNT_ONETIME).."<color>l莕"..", hi謓 產ng x誴 th� <color=yellow>"..i.."<color>.");
		end;
	end;
end;