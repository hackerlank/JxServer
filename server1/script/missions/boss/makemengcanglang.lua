--M筺h Thng Lng(583)，生于每天22：31，在204,1626,3379
function main()
	mapindex = SubWorldID2Idx(204)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 583
	bosslvl = 95
	posx = 1626*32
	posy = 3379*32
	AddNpc(bossid,bosslvl,mapindex,posx,posy,1, "M筺h Thng Lng", 1)
	AddGlobalNews("C� ngi nh譶 th蕐 C竔 bang Ch蕄 ph竝 chng l穙 M筺h Thng Lng t筰 Phi thi猲 ng (202, 210) 產ng truy s竧 ph秐  M筺h Vi詎 T礽 ")
end; 