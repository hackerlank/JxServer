--罚恶使
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")
--定义全局变量记录玩家要惩罚那个城市
nGlobalCityIndex = 0

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("S� li謚 sai l莔 . ", 0)
		return
	end
	--读取存盘文件，保证只读取一次
	loadsavevalue()
	
	local aryszContent = 
	{
		"<> Ph箃 竎 khi課 cho : Ta l� tr鮪g ph箃 ngi x蕌 ch s� gi� , ta c� th� gi髉 ngi c竔 g� ?",
		"<> Tu莕 tra c竎 Th祅h th� chi課 c玭g /onchecknum",
		"<> Tr鮪g ph箃 chi誱 l躰h phng tng bang h閕 /onpunish_fengxiang",
		"<> Tr鮪g ph箃 chi誱 l躰h th祅h  bang h閕 /onpunish_chengdu",
		"<> Tr鮪g ph箃 chi誱 l躰h Чi L� bang h閕 /onpunish_dali",
		"<> Tr鮪g ph箃 chi誱 l躰h bi謓 kinh bang h閕 /onpunish_bianjing",
		"<> Tr鮪g ph箃 chi誱 l躰h tng dng bang h閕 /onpunish_xiangyang",	
		"<> Tr鮪g ph箃 chi誱 l躰h Dng Ch﹗ bang h閕 /onpunish_yangzhou",
		"<> Tr鮪g ph箃 chi誱 l躰h trc khi an bang h閕 /onpunish_linan",		
		"<> Ta ch糿g qua l� t韎 甶 d筼 m閠 ch髏 /oncancel",
	}
	
	--可以不可以用数组来实现
	local aryCallBackFun = {
		"/onpunish_fengxiang",
		"/onpunish_chengdu",
		"/onpunish_dali",
		"/onpunish_bianjing",
		"/onpunish_xiangyang",
		"/onpunish_yangzhou",
		"/onpunish_linan"
	}
	local nNum
	for nCityIndex=1, 7 do
		strTongName = GetCityOwner(nCityIndex)
		if (strTongName == nil or strTongName == "") then
			aryszContent[nCityIndex + 2] = "<>"..arraycityindextoname[nCityIndex].."Х v� bang, kh玭g th� ti課 h祅h/oncancel"
		else
			nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
			aryszContent[nCityIndex + 2] = "<>惩罚帮会"..strTongName.."chi誱 Th祅h"..arraycityindextoname[nCityIndex].."(Chi課 c玭g:"..nNum..")"..aryCallBackFun[nCityIndex]
		end
	end	
	
	Say(aryszContent[1], 9,	aryszContent[2],aryszContent[3],aryszContent[4],aryszContent[5],aryszContent[6],aryszContent[7],aryszContent[8],aryszContent[9], aryszContent[10]);
end 

function onpunish()
	--根据地图索引惩罚
	if (nGlobalCityIndex < 1) then
		Say("<>没有要惩罚的城市", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<>城市<color=red>"..arraycityindextoname[nIndex].."<color> kh玭g ngi chi誱 l躰h , kh玭g c竎h n祇 ti課 h祅h tr鮪g ph箃 ", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--打开给与界面
	GiveItemUI( "б giao ph箃 竎 l祄 ", "Tr鮪g ph箃 Th祅h th� "..arraycityindextoname[nGlobalCityIndex]..", Th祅h th� chi誱 l躰h bang h閕 "..strCityTongName..", trc m総 n猲 th祅h ch chi課 c玭g v� :"..nNum, "onsubmitconfirm", "oncancel" )
end

function onconfirm(nIndex)
	local strCityTongName = GetCityOwner(nIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<>城市<color=red>"..arraycityindextoname[nIndex].."<color> kh玭g ngi chi誱 l躰h , kh玭g c竎h n祇 ti課 h祅h tr鮪g ph箃 ", 0)
		return
	end

	--给全局变量赋值
	nGlobalCityIndex = nIndex	
	strMsg={	
		"<>占领<color=red>"..arraycityindextoname[nIndex].."<color> Th祅h th� ch bang h閕 l� :<color=red>"..strCityTongName.."<color>, ngi nh蕋 nh ph秈 s� d鬾g ph箃 竎 l祄 sao ? ",
		"<>确定/onpunish",
		"<>我再考虑考虑/oncancel"		
	};
	
	Say(strMsg[1], 2, strMsg[2], strMsg[3]);
end

function onpunish_fengxiang()
	onconfirm(1)
end

function onpunish_chengdu()
	onconfirm(2)
end

function onpunish_dali()
	onconfirm(3)
end

function onpunish_bianjing()
	onconfirm(4)
end

function onpunish_xiangyang()
	onconfirm(5)
end

function onpunish_yangzhou()
	onconfirm(6)
end

function onpunish_linan()
	onconfirm(7)
end
		
function oncancel()
	return
end

function onchecknum()
	--查询各帮会赏善令的数量
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo1 = ""
	local strInfo2 = ""
	for nCityIndex=1, 4 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<><color=red>"..arraycityindextoname[nCityIndex].."<color> kh玭g ngi chi誱 l躰h , chi課 c玭g v� :<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<>占领<color=red>"..arraycityindextoname[nCityIndex].."<color> ch bang h閕 l� :<color=red>"..strTongName.."<color>, Th祅h th� chi課 c玭g v� :<color=red>"..nNum.."<color>"
		end
		if (nCityIndex == 1) then
		    strInfo = arr[nCityIndex]
		elseif (nCityIndex == 2) then
		    strInfo = strInfo.."<enter>"..arr[nCityIndex]
		elseif (nCityIndex == 3) then
		    strInfo1 = arr[nCityIndex]
		elseif (nCityIndex == 4) then
		    strInfo1 = strInfo1.."<enter>"..arr[nCityIndex]
		end
	end
	
	--Talk(4, "onchecknum1", arr[1], arr[2], arr[3], arr[4])
	Talk(2, "onchecknum1", strInfo, strInfo1)
end

function onchecknum1()
	--查询各帮会赏善令的数量
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo = ""
	local strInfo1 = ""
	for nCityIndex=5, 7 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<><color=red>"..arraycityindextoname[nCityIndex].."<color> kh玭g ngi chi誱 l躰h , Th祅h th� chi課 c玭g v� :<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<>占领<color=red>"..arraycityindextoname[nCityIndex].."<color> ch bang h閕 l� :<color=red>"..strTongName.."<color>, Th祅h th� chi課 c玭g v� :<color=red>"..nNum.."<color>"
		end
		if (nCityIndex == 5) then
		    strInfo = arr[nCityIndex]
		elseif (nCityIndex == 6) then
		    strInfo = strInfo.."<enter>"..arr[nCityIndex]
		else
		    strInfo1 = arr[nCityIndex]
		end
	end
	
	--Talk(3, "", arr[5], arr[6], arr[7])
	Talk(2, "", strInfo, strInfo1)
end

function onsubmitconfirm(nCount)
	if (nCount < 1) then
		Msg2Player("你没有б giao ph箃 竎 l祄 ")
		return
	end
	
	--判断物品是否为罚恶令
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit( i )
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_PUNISHMEDIAL_NGENTYPE or
			DetailType ~= AEXP_PUNISHMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_PUNISHMEDIAL_PARTYPE) then
				Msg2Player("<>你好像有东西不是罚恶令哟！")
				return 0			
		end
	end
	
	local nTotalNum = 0
	for i = 1, nCount do
		nItemIndex = GetGiveItemUnit( i )
		nTotalNum = nTotalNum + GetItemStackCount(nItemIndex)
		RemoveItemByIndex( nItemIndex )
	end
	
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--if (nNum < 0) then
	--	nNum = 0
	--end
	
	local nSpareNum = nNum - nTotalNum
	--if (nSpareNum < 0) then
	--	nSpareNum = 0
	--end
	
	SetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex], nSpareNum)
	local strCityTongName = GetCityOwner(nGlobalCityIndex);	
	--对tab文件进行写
	CityData[nGlobalCityIndex] = CityData[nGlobalCityIndex] + nTotalNum
	if (CityData[nGlobalCityIndex] > AEXP_REDUCEMAX_SAVE) then
		CityData[nGlobalCityIndex] = 0		
		WriteLog("["..date("%Y-%m-%d %X").."] bang h閕 :"..strCityTongName.." Th祅h th� :"..arraycityindextoname[nGlobalCityIndex].." b雐 v� "..GetAccount().."("..GetName()..")  giao li評 "..nTotalNum.." c� ph箃 竎 l祄 , vt qua m謙 m醝 k� t錸 m﹎ s� lng . trc m苩 thng thi謓 l祄 s� lng v� :"..nSpareNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
		savevalue()
	end	
	
	Say("<>城市<color=red>"..arraycityindextoname[nGlobalCityIndex].."<color>, chi誱 l躰h bang h閕 :<color=red>"..strCityTongName.."<color>, ngi  giao li評 "..nTotalNum.." c� ph箃 竎 l祄 i v韎 n� tr鮪g ph箃 , trc m総 n猲 Th祅h th� chi課 c玭g v� :<color=red>"..nSpareNum.."<color>",0)
end
