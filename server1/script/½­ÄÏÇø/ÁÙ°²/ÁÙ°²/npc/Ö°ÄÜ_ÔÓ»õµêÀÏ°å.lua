-- 临安　职能　杂货店老板
-- by：Dan_Deng(2003-09-16)

--========脚本修改==================================--
--修改者：yfeng
--修改日期：2005-1-28
--修改原因：春节市场活动
--
--
--==================================================--
Include "/script/event/chinesenewyear/eventhead.lua"
Include("\\script\\global\\global_zahuodian.lua");


--if CHINESENEWYEAR then
--	tinsert(Buttons,1,"购买节日道具/BuyNewyearItem")
--end 
	
function main()
local Buttons = store_sel_extend();
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2006122200 and nDate <= 2007011424) then
		tinsert(Buttons,1,"Mua th� /BuyVnXasCard")
	end;
	Say("B� ti謒 x璶g danh l� t筽 h鉧 Nam B綾. H祅g h鉧 ng t﹜ 甶襲 c�  c�. S琻 h� � ng h秈, m� l筩  � gobi.... B蕋 k� ngi  nh譶 th蕐 hay ch璦, � y ta 甶襲 c� c�..",
			getn(Buttons),
			Buttons)
end;

function yes()
	Sale(2);  				--弹出交易框
end;

function no()
end;

function BuyNewyearItem()
	Sale(101)
	return
end

function BuyChristmasCard()
	Sale(97);
end

function BuyVnXasCard()
	Sale(147)
end;