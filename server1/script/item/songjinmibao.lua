-- 随机宝箱物品（随机获得一样物品）
-- By: Wangjingjun(2011-02-17)

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>恭喜高手<color=yellow>%s<color=green> 获得<color=yellow><%s><color=green> 从<color=yellow><宋金秘宝><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbSJ_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbSJNewAward = 
{	
	["chiakhoanhuy"] = 
	{
		{szName="经验值 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "宋金秘宝")
					end,
					nRate = 52,
		},
		{szName="经验值  2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "宋金秘宝")
					end,
					nRate = 30,
		},
		{szName="经验值  3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "宋金秘宝")
					end,
					nRate = 10,
		},
		{szName="经验值 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "宋金秘宝")
					end,
					nRate = 5,
		},
		{szName="经验值  5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "宋金秘宝")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
		{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.08},
		{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.08},
		{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.05},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},

		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=5},
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=2},
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},
		{szName="小包玉罐",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="小包玉罐",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="小包玉罐",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="小包玉罐",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="大包玉罐",tbProp={6,1,2801,1,0,0},nCount=1, nRate=0.04},		
		{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=5},
		{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=5},
		{szName="回天再造礼包",tbProp={6,1,2527,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},
		{szName="特别仙草露",tbProp={6,1,1181,1,0,0},nCount=1,nRate=15,nExpiredTime=43200},
		{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=5},
		{szName="逍遥散",tbProp={6,1,2831,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
		{szName="经验值1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "宋金秘宝")
					end,
					nRate = 33,
		},
		{szName="经验值2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "宋金秘宝")
					end,
					nRate = 25,
		},
		{szName="经验值3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(8000000, "宋金秘宝")
					end,
					nRate = 10,
		},
		{szName="经验值4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(10000000, "宋金秘宝")
					end,
					nRate = 5,
		},
		{szName="经验值 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(15000000, "宋金秘宝")
					end,
					nRate = 3,
		},
		{szName="经验值 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "宋金秘宝")
					end,
					nRate = 2,
		},
		{szName="经验值 7", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "宋金秘宝")
					end,
					nRate = 1,
		},
		{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},		
		{szName="飞风惊雷 (及时转移)",tbProp={0,3470},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
		{szName="飞风惊雷 (概率化解杀枪)",tbProp={0,3471},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
		{szName="飞风惊雷 ( 重击)",tbProp={0,3472},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
		{szName="黄金之果",tbProp={6,1,907,1,0,0},nCount=1,nRate=3.35,nExpiredTime=43200},
	},	
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)
	local tbKey1 = tbSJ_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbSJ_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("需要有金钥匙或者如意钥匙才能打开宋金秘宝", 1, "关闭/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("为确保大侠的财产，请留下%d %dx%d 装备空位", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("使用如意钥匙/#VnSJBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("使用金钥匙/#VnSJBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "关闭/Oncancel")
		Say("使用钥匙开箱:", getn(tbOpt), tbOpt)
	end
	return 1	
end
function Oncancel()end

function VnSJBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbSJ_Key_Require[strKeyType]
	local tbAward = tbSJNewAward[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("需要金钥匙或者如意钥匙才能打开宋金秘宝", 1, "关闭/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2741, -1) ~= 1 then
		Say("未找到宋金秘宝", 1, "关闭/no")
		return
	end
	tbAwardTemplet:Give(tbAward, 1, {"SongJin", "use songjingmibao"})	
	AddStatData("baoxiangxiaohao_kaisongjinmibao", 1)	
end