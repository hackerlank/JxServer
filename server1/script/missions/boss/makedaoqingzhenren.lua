--Чo Thanh Ch﹏ Nh﹏(562)，生于每天20：05，在224,1596,2978
function main()
	mapindex = SubWorldID2Idx(224)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 562
	bosslvl = 95
	posx = 1596*32
	posy = 2978*32
	AddNpcEx(bossid,bosslvl,4,mapindex,posx,posy,1, "Чo Thanh Ch﹏ Nh﹏", 1)
	AddGlobalNews("Nghe n鉯 Чo Thanh Ch﹏ Nh﹏ � Йn Ho祅g sa m筩 l� ngi (199, 186) tr� gian di謙 竎 ")
end; 