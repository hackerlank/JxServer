Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\star_head.lua")

tbNSKT_star_white = {}

function main(itemidx)
	--检查使用物品条件
	if(tbNSKT_Item_Star:checkCondition() == 0)then
		Talk(1, "", "B筺 kh玭g  甶襲 ki謓 s� d鬾g v藅 ph萴! Y猽 c莡 c蕄  tr猲 50 v�   n筽 th�.")
		return 1
	end
	-- het event, 物品使用到期
	if (tbNSKT_Item_Star:isExpired(itemidx) == 1) then
		Msg2Player("V藅 ph萴 qu� h筺 s� d鬾g, t� ng m蕋 甶.")
		return 0; -- delete item
	end
	-- 使用物品成功，删除item
	if (tbNSKT_star_happiness:UseItem() == 1)then
		return 0;	
	else
		Talk(1, "", "Чi hi謕   t t鑙 產 s� d鬾g v藅 ph萴 n祔!")
		return 1 -- 不删除 item	
	end
end

function tbNSKT_star_white:UseItem()
	if (tbNSKT_Item_Star and tbNSKT_Item_Star:isMaxItemUse() == 0 ) then
		--不能设置task, 不奖励, 删除物品
		if (tbNSKT_Item_Star:setUseCount() ~= 1)then
			return 1;
		end
		local tbAwardExp = {nExp = 50e6} --50 trieu exp
		tbNSKT_Item_Star:giveAward(tbAwardExp, "Ph莕 thng EXP ng玦 sao tr緉g");
		return 1;
	end
	return 0; --使用 max, 不能使用, 不能删除
end