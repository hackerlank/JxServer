Include( "\\script\\missions\\leaguematch\\head.lua" )


function OnDeath( Launcher )
	local org_player = PlayerIndex
	local org_name = GetName() --死者名字
	PlayerIndex = NpcIdx2PIdx( Launcher )
	Msg2Player("B筺  nh b筰 <color=yellow>"..org_name.."<color>")
	PlayerIndex = org_player
	
	DelMSPlayer(WLLS_MSID_COMBAT, 0)	--强制该玩家离开Mission
	SetLogoutRV(0);
	NewWorld(wlls_get_mapid(1), WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])	--将尸体拖到报名场=.=
	if (GetTask(WLLS_TASKID_ORGCAMP) > 0) then
		Msg2Player("<color=yellow>Ch� � !<color> Nh鉳 c馻 b筺 kh玭g ph秈 l� k誸 th骳, h穣 ch� i h誸 gi� s� tr� v� u trng. Trong th阨 gian n祔, n誹 b筺 ch誸 s� ko nh薾 thng")
	end
end
