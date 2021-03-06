Include( "\\script\\missions\\leaguematch\\head.lua" )

function main(sel)
--	DisabledUseTownP(0)	--恢复其使用回城符
	Say("<#> Xa Phu: Hoan ngh猲h tham gia li猲 u, ngi mu鑞 甶 u ?",
		8, "Phng Tng Ph�/#wlls_want2go(1)", "Th祅h Й Ph�/#wlls_want2go(11)", "Чi L�/#wlls_want2go(162)", "Bi謓 Kinh Ph�/#wlls_want2go(37)", "Tng Dng Ph�/#wlls_want2go(78)", "Dng Ch﹗/#wlls_want2go(80)", "L﹎ An/#wlls_want2go(176)", "в khi kh竎!/OnCancel")
end;

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "Phng Tng" },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "Th祅h Й" },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "Чi L�" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "Bi謓 Kinh" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "Tng Dng" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "Dng Ch﹗" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "L﹎ An" }
}

function wlls_want2go(stationname)
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("<#> Nh鉳 c馻 b筺 產ng trong giai 畂筺 b竜 danh, n誹 甶 s� ko th� thi u?",
			2, "Ta 甶!/#cp_station("..stationname..")", "Th玦 v藋!/OnCancel")
	else
		cp_station(stationname)
	end
end

function cp_station(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	local count = getn(tbCP_STATION[stationname]) - 1
	local randnum = random(count)
	Msg2Player("Ng錳 y猲! Ch髇g ta 甶 "..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
end
