Include("\\script\\task\\newtask\\newtask_head.lua")

function main(nItemIdx)
	local _,_,detail = GetItemProp(nItemIdx)
	local nWorldMaps = nt_getTask(1027) -- 看看玩家身上有多少个山河社稷图
	if (detail == 440) then
		-- 给玩家增加100个山河社稷图残片
		nWorldMaps = nWorldMaps + 100;
		nt_setTask(1027,nWorldMaps);
	Msg2Player("B筺 nh薾 頲 100 m秐h b秐  S琻 H� X� T綾! Hi謓 t筰 b筺 c� t鎛g c閚g"..nWorldMaps.." m秐h b秐  S琻 H� X� T綾.");
	elseif (detail == 2514) then
		-- 给玩家增加1000个山河社稷图残片
		nWorldMaps = nWorldMaps + 1000;
		nt_setTask(1027,nWorldMaps);
	Msg2Player("Чi hi謕 nh薾 頲 1000 m秐h b秐  s琻 h� x� t綾! T鎛g c閚g c� "..nWorldMaps.." m秐h b秐  S琻 H� X� T綾.");
	end
end
