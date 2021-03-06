Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\crystal_head.lua")

tbNSKT_Crystal3Col = {}

function main(itemidx)
	--检查使用物品条件
	if(tbNSKT_Crystal:checkCondition() == 0)then
		Talk(1, "", "B筺 kh玭g  甶襲 ki謓 s� d鬾g v藅 ph萴! Y猽 c莡 c蕄  tr猲 50 v�   n筽 th�.")
		return 1
	end
	-- het event, 物品使用到期
	if (tbNSKT_Crystal:isExpired(itemidx) == 1) then
		Msg2Player("V藅 ph萴 qu� h筺 s� d鬾g, t� ng m蕋 甶.")
		return 0; -- delete item
	end
	-- su dung vat pham thanh cong, xoa item
	if (tbNSKT_Crystal3Col:UseItem() == 1)then
		return 0;	
	else
		Talk(1, "", "Чi hi謕   t t鑙 產 s� d鬾g v藅 ph萴 n祔!")
		return 1 -- 不删除item	
	end
end

function tbNSKT_Crystal3Col:UseItem()
	if (tbNSKT_Crystal and tbNSKT_Crystal:isMaxItemUse() == 0 ) then
		local tbExp = {
								{n_Exp =30e5, n_Rate = 10},
								{n_Exp =25e5, n_Rate = 20},
								{n_Exp =20e5, n_Rate = 70}								
							};
							
		local nTaskValue = GetBitTask(tbNSKT_Crystal.nTaskID, tbNSKT_Crystal.nStartBit, tbNSKT_Crystal.nEndBit)
		local nTemp = (tbNSKT_Crystal.nMaxExp  - nTaskValue) * tbNSKT_Crystal.nScaleFactor
		--neu tbExp = nil, 不发奖，返回1删除物品
		if (not tbExp) then
			return 1;
		end
		-- 经验不能超过8ti界限
		for i = 1, getn(tbExp) do
			if (nTemp < tbExp[i].n_Exp) then
				tbExp[i].n_Exp = nTemp
			end
		end		
		
		local tbAward = {}
		for i = 1, getn(tbExp) do
			tbAward[i] = {
									[1] = {nExp = tbExp[i].n_Exp},
									[2] = 
											{
												pFun = function (tbItem, nItemCount, szLogTitle)
													%tbNSKT_Crystal:addTask(%tbExp[%i].n_Exp)
												end
											},
									nRate = tbExp[i].n_Rate,
								};
		end
		--如果物品榜不能建立或者物品榜不对要求，返回1删除物品
		if (not tbAward or getn(tbAward) ~= getn(tbExp)) then
			return 1;
		end
		
		tbNSKT_Crystal:giveAward(tbAward, "Ph莕 thng EXP k誸 tinh tam s綾");		
		return 1;
	end
	return 0; --使用max，不能使用，不能删除
end